Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024163296C7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:08:42 +0100 (CET)
Received: from localhost ([::1]:40792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH056-0000RP-Qu
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH037-0007eO-Lx
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:06:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:46450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH035-0004hN-Sy
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:06:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5920EAC24;
 Tue,  2 Mar 2021 08:06:30 +0000 (UTC)
Subject: Re: [RFC v2 06/24] target/arm: split off cpu-sysemu.c
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-7-cfontana@suse.de>
 <4b776b96-7d5c-da73-9372-2b657a43f4e7@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b86c8fbd-1953-ef9c-7c54-696617040c40@suse.de>
Date: Tue, 2 Mar 2021 09:06:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4b776b96-7d5c-da73-9372-2b657a43f4e7@linaro.org>
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 7:17 AM, Richard Henderson wrote:
> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> ---
>>   target/arm/internals.h  |   8 ++-
>>   target/arm/cpu-sysemu.c | 105 ++++++++++++++++++++++++++++++++++++++++
>>   target/arm/cpu.c        |  83 -------------------------------
>>   target/arm/meson.build  |   1 +
>>   4 files changed, 113 insertions(+), 84 deletions(-)
>>   create mode 100644 target/arm/cpu-sysemu.c
> 
> It'd be nice to rearrange this into tcg/ and kvm/.

Yes.

This would be the objective of the next series,

basically the objective of this series is to make the kvm-only build succeed after moving helpers to tcg/ and picking stuff we need from helper.c .

configure --enable-kvm --disable-tcg

The objective of the next one would be to properly place the code in kvm-only and tcg-only sections,
and then add the classes that specialize the cpu, just like for i386.

But I can continue this series as a whole if preferrable.

> 
> I think we could do with some macros like
> 
> #ifndef CONFIG_KVM
> #define KVM_ERROR  QEMU_ERROR("kvm is disabled")
> #endif
> #ifndef CONFIG_TCG
> #define TCG_ERROR  QEMU_ERROR("tcg is disabled")
> #endif
> 
> Not sure where to put these, but certainly not arm specific.
> 
> Then,
> 
> void arm_cpu_tcg_set_irq(void *opaque, int irq, int level)
>      TCG_ERROR;
> void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
>      KVM_ERROR;
> 
>      if (kvm_enabled()) {
>          qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 4);
>      } else if (tcg_enabled()) {
>          qdev_init_gpio_in(DEVICE(cpu), arm_cpu_tcg_set_irq, 4);
>      } else {
>          g_assert_not_reached();
>      }
> 
> So arm_cpu_kvm_set_irq can go in kvm/ and needs no ifdef.
> 
> I'll let folks interested in xen and hvf figure our what needs doing with the 
> above.
> 
> 
> r~
> 

Thanks,

Claudio

