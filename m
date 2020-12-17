Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC9D2DDB94
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 23:46:52 +0100 (CET)
Received: from localhost ([::1]:40140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq22t-0005dI-9R
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 17:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kq21o-00055r-TI
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:45:44 -0500
Received: from mx2.suse.de ([195.135.220.15]:51898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kq21n-00062s-7h
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:45:44 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 890B0AC7B;
 Thu, 17 Dec 2020 22:45:41 +0000 (UTC)
Subject: Re: dangers of current NEED_CPU_H, CONFIG_SOFTMMU, CONFIG_USER_ONLY
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201211100908.19696-1-cfontana@suse.de>
 <20201211100908.19696-8-cfontana@suse.de>
 <e47ef5e5-2053-d98d-9cd5-f6d96c423c82@suse.de>
 <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ceb9f00e-2fdf-7534-b811-aa6cbd771b4e@suse.de>
Date: Thu, 17 Dec 2020 23:45:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 9:15 PM, Peter Maydell wrote:
> On Thu, 17 Dec 2020 at 19:46, Claudio Fontana <cfontana@suse.de> wrote:
>>
>> Hi,
>>
>> I would like to highlight the current dangerous state of NEED_CPU_H / CONFIG_SOFTMMU / CONFIG_USER_ONLY.
> 
>> So our struct TcgCpuOperations in include/hw/core/cpu.h,
>> which contains after this series:
>>
>> #ifndef CONFIG_USER_ONLY
>>     /**
>>      * @do_transaction_failed: Callback for handling failed memory transactions
>>      * (ie bus faults or external aborts; not MMU faults)
>>      */
>>     void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
>>                                   unsigned size, MMUAccessType access_type,
>>                                   int mmu_idx, MemTxAttrs attrs,
>>                                   MemTxResult response, uintptr_t retaddr);
>>     /**
>>      * @do_unaligned_access: Callback for unaligned access handling
>>      */
>>     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>>                                 MMUAccessType access_type,
>>                                 int mmu_idx, uintptr_t retaddr);
>> #endif /* !CONFIG_USER_ONLY */
> 
> Yeah, don't try to ifdef out struct fields in common-compiled code...

or should I? Using

#ifdef NEED_CPU_H
#ifdef CONFIG_SOFTMMU

seems to do what I expect. Is it wrong?

Thanks,

Claudio

> 
>> Note that include/hw/core/cpu.h already uses CONFIG_USER_ONLY in other parts of the header file, and we might have hidden problems as a result we (or at least I) don't know about,
>> because code is being compiled in for linux-user which explicitly should not be compiled there.
> 
> The other CONFIG_USER_ONLY checks in that file are only
> ifdeffing out prototypes for functions that exist only in
> the softmmu build, or providing do-nothing stubs for functions
> that are softmmu only. I think they're safe.
> 
>> There are multiple workarounds / fixes possible for my short term problem,
>> but would it not be a good idea to fix this problem at its root once and for all?
> 
> What's your proposal for fixing things ?
> 
> Incidentally, this should not be a problem for CONFIG_SOFTMMU,
> because that is listed in include/exec/poison.h so trying to
> use it in a common (not compiled-per-target) file will give you
> a compile error. (So in theory we could make CONFIG_USER_ONLY
> a poisoned identifier but that will require some work to
> adjust places where we currently use it in "safe" ways...)
> 
> thanks
> -- PMM
> 


