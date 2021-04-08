Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B20358131
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 12:57:30 +0200 (CEST)
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUSLp-0002md-Fb
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 06:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lUSKS-0002IM-Em
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:56:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:57394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lUSKQ-0008J6-P7
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 06:56:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13BAEB01E;
 Thu,  8 Apr 2021 10:56:01 +0000 (UTC)
Subject: Re: [RFC v12 31/65] target/arm: move exception code out of
 tcg/helper.c
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-32-cfontana@suse.de>
 <fe889df8-c11a-8e29-0ef5-84a89b449b36@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <2e19f3f4-f8cf-645e-1d9d-13e3b208438d@suse.de>
Date: Thu, 8 Apr 2021 12:56:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fe889df8-c11a-8e29-0ef5-84a89b449b36@linaro.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/21 6:40 PM, Richard Henderson wrote:
> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>> +#ifdef CONFIG_TCG
>> +    arm_rebuild_hflags(env);
>> +#endif /* CONFIG_TCG */
> 
> No functional changes during code movement.
> Really.
> I cannot emphasize this enough.
we are asserting "not reached" for arm_rebuild_hflags in KVM-only, but the KVM-only build is not "active" yet at this point,
so will add separately ok.


> 
> Also, why is this an ifdef and not tcg_enabled()?

right, will change.

> 
>> +    aarch64_restore_sp(env, new_el);
>> +#ifdef CONFIG_TCG
>> +    arm_rebuild_hflags(env);
>> +#endif /* CONFIG_TCG */
> 
> Likewise.

Yes, will change.

> 
>> +#ifdef CONFIG_TCG
>> +    if (tcg_enabled()) {
> 
> Likewise.  And, why in the world do you need both?

Here both are needed because the prototypes of other functions in the block are not visile for non-tcg builds.

It is a struggle to balance making TCG-only symbols "invisible" to kvm-builds, so one developing for KVM only can forget about them,
and keeping TCG things contained,

and on the other side opening up the ability to use tcg_enabled(), which requires those prototypes to be visible.

Where do you see that balance?

Should I make arm_is_psci_call, arm_handle_psci_call, tcg_handle_semihosting visible as well?

Or can we give a meaningful name to this operation:

+    if (tcg_enabled()) {
+        if (arm_is_psci_call(cpu, cs->exception_index)) {
+            arm_handle_psci_call(cpu);
+            qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
+            return;
+        }
+        /*
+         * Semihosting semantics depend on the register width of the code
+         * that caused the exception, not the target exception level, so
+         * must be handled here.
+         */
+        if (cs->exception_index == EXCP_SEMIHOST) {
+            tcg_handle_semihosting(cs);
+            return;
+        }
+    }

and store it in a single tcg-specific function, whole prototype we could make visible?

Thanks,

Claudio



> 
> 
> r~
> 


