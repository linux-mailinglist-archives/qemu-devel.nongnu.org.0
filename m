Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96235BF75
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 11:07:15 +0200 (CEST)
Received: from localhost ([::1]:41596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVsXK-0002ip-0y
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 05:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lVsVX-0001wk-Ng
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 05:05:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:39882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lVsVV-0007nq-9F
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 05:05:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50E97AF38;
 Mon, 12 Apr 2021 09:05:17 +0000 (UTC)
Subject: Re: [RFC v12 27/65] target/arm: split a15 cpu model and 32bit class
 functions to cpu32.c
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-28-cfontana@suse.de>
 <e49aa062-0958-1d4e-c682-28d0a2897493@linaro.org>
 <87e94d27-a1ec-cd6a-8079-0f975121d479@suse.de>
 <CAFEAcA-hqUehQ9chX_H4M9karU9XksirqC=daekRk=ymDRvzwQ@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <62c54475-0fe6-042b-cf13-f15490bad525@suse.de>
Date: Mon, 12 Apr 2021 11:05:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-hqUehQ9chX_H4M9karU9XksirqC=daekRk=ymDRvzwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 4/8/21 12:36 PM, Peter Maydell wrote:
> On Thu, 8 Apr 2021 at 11:23, Claudio Fontana <cfontana@suse.de> wrote:
>> Mainly for this code here a question from my side: is the current code actually already "wrong"?
>>
>> I mean, we unconditionally set the aarch64-capable cpu classes to all use aarch64_gdb_arch_name and gdbstub64,
>> but what about an aarch64-capable cpu running in 32bit mode?
> 
> This is somewhere between a bug and a missing feature. The 'bug' part is
> that for running a guest on AArch64 KVM with -cpu aarch64=off' (ie a
> 32-bit guest) we should be presenting an aarch32 gdb stub, and we don't.

Isn't this "easily" solvable? Probably I am missing something obvious..

I mean we could dispatch to the one or to the other according to ->is_aa64()?


> The 'missing feature' part is that in an ideal world we would support
> mixed aarch64-and-aarch32 guest debugging, and we don't. This needs
> support on the gdb side as well as on our side, AIUI.
> 
>> Why don't we have, like tentatively done here for arm_cpu_dump_state,
>>
>> an arm_gdb_arch_name and an arm_cpu_gdb_read_register that check is_a64() and call aaarch32_cpu_gdb_read_register or aarch64_cpu_gdb_read_register accordingly?
> 
> Because the gdb on the other end of the gdbstub does not expect the
> target to suddenly change in the middle of execution like that.


Ok, but given the restriction that we can only support one or the other the whole time,
wouldn't adding this check ensure that at least we would do the right thing with -cpu aarch64=off?

Or is this on the way out, support-wise?

Thanks,

Claudio

> gdb is really a userspace-process debugger at heart, and it only
> negotiates "what are all the register types, what is the debuggee
> architecture, etc" once when it connects. Once we've told gdb
> what the registers are we need to stick to them.
> 
> Properly supporting mixed-mode debugging would require support
> for telling gdb "I support both this set of registers for aarch64
> and this other set for aarch32" and notifying it about which mode
> we were in (and support in gdb for understanding this). I don't
> think anybody's ever seriously tried to work out a design for this.
> 
> thanks
> -- PMM
> 


