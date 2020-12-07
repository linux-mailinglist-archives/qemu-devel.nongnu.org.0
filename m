Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35702D1866
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:21:29 +0100 (CET)
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmL8a-0005FI-TX
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmL4h-0003pk-7T
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:17:27 -0500
Received: from mx2.suse.de ([195.135.220.15]:59768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmL4e-0006is-Il
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:17:25 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0C44AD63;
 Mon,  7 Dec 2020 18:17:22 +0000 (UTC)
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <e770b13a-7ac7-00b6-99d1-0be24426ea8b@suse.de>
 <CAFEAcA_eRWndnSmQTnBWG=sopcqVs7SEA4LYkLURn9KNAuRynw@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <662d3dba-7603-34f5-bcaa-0bcccb831fb6@suse.de>
Date: Mon, 7 Dec 2020 19:17:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_eRWndnSmQTnBWG=sopcqVs7SEA4LYkLURn9KNAuRynw@mail.gmail.com>
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Dongjiu Geng <gengdongjiu@huawei.com>,
 Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 7:14 PM, Peter Maydell wrote:
> On Mon, 7 Dec 2020 at 18:08, Claudio Fontana <cfontana@suse.de> wrote:
>> what about also the existing code with qemu-arm (user mode)?
>>
>> In that case do_interrupt is not set at all in target/arm/cpu.c, since it's protected by #ifndef CONFIG_USER_ONLY
>>
>> Did we have a potential NULL pointer trying to be dereferenced there?
> 
> No, because in user-mode there are never any interrupts or
> exceptions invoked this way. The code in these methods is
> strictly system-emulation only.
> 
>> Commit 0adf7d3cc3f724e1e9ce5aaa008bd9daeb90f19 says:
>>
>>  target-arm: do not set do_interrupt handlers for ARM and AArch64 user modes
>>
>>  User mode emulation should never get interrupts and thus should not
>>  use the system emulation exception handler function.
>>
>> --
>>
>> But this was 2014. Is the comment above true today?
> 
> Yes.
> 
>> Looking at this commit in 2017, it does not seem to me to be the case:
>>
>> commit 17b50b0c299f1266578b01f7134810362418ac2e
>> Author: Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
>> Date:   Tue Nov 14 11:18:18 2017 +0300
>>
>>     cpu-exec: avoid cpu_exec_nocache infinite loop with record/replay
>>
>>     This patch
>>     [...]
>>     Second, try to cause the exception at the beginning of
>>     cpu_handle_exception, and exit immediately if the TB cannot
>>     execute.  With this change, interrupts are processed and
>>     cpu_exec_nocache can make process.
> 
> This code only invokes cc->do_interrupt() in CONFIG_USER_ONLY
> if TARGET_I386 is true. i386 does this stuff in a weird way
> that's different to all the other target architectures.
> (One day we should fix this inconsistency I suppose.)
> 
>> Is cc->do_interrupt supposed to be !CONFIG_USER_ONLY or not?
> 
> It's !CONFIG_USER_ONLY.
> 
> thanks
> -- PMM
> 

Ah right, I somehow missed the #if defined(TARGET_I386),

thanks!

