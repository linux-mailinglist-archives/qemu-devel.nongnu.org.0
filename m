Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B8030CEB0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:22:50 +0100 (CET)
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l744P-0007lI-3R
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:22:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l743T-0007Kv-V7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:21:52 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:41528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l743Q-00035v-Vt
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:21:51 -0500
Received: by mail-io1-xd2f.google.com with SMTP id e133so12280173iof.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 14:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lDlJyVNq7E1oEfA3HDDyviNKxzBFu/ahbxo1UpWjC9M=;
 b=uIB7Kwok4xymvicjj2+C583WlH10KnpPyLZxP0tRsLujFDO37KTbN2HNF/0vU81C5T
 D6fpZI2f7us8ToIbLfJPkPS6wCApfPf24mGbaYhQ4y/ae4p2Hm9xtw7ceuzQuQMGmL2e
 P7+0nV66TPsLHKmp8s2pkSzNI/KFYcrdJr3g56a3tSotMQvqr/S7Th4Zpm7hfjnhi4+f
 mRVEMFvMwbQmdIV+ZZUGMxcVjohQuC0s1jy8MJ1CiOoKl5RFsywJQ7Af3TlD/zIinscw
 ZJt0j2HfihETrAIPCUqG3Ws3zoRWzGaDaMoIhS86Tr7qLY7TXcRuS4/E3ynxURq/oXtH
 kBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lDlJyVNq7E1oEfA3HDDyviNKxzBFu/ahbxo1UpWjC9M=;
 b=mOj6/a6kymMxzkKKSyyNXhY+vKichOFWzijvpbDK6idMKLzeebhIcP53pcT8s7bhEh
 9skIu7NB76ZeMR9WOLJLs21qzQY5AbjYwFa+fIKUXhidB4jNF+roplVH2S23shrnH/vS
 VFJGW7WS6iIq/aCiPJ+TsDUMSAsCcmwsh4HL9A7L2sTn13tAxPtEGZMCBNpZ7Ur2vJ1U
 5PPZSCdT8+t5DoV6pkjdAEzLd1wkVTBUUiux5in10SHWT9sF+dK/YS5cj6b7ZP1+RVE/
 RGafg+k8yUyLHYtsWPXWnMZ2cSnucd8etugN1JfiW3QdV88LMp4HY299o4X39x8TnRgA
 XWwg==
X-Gm-Message-State: AOAM53149C8o4rYUVau5n/AKym6tltKcdbtthDE64RRj0UYYCiiPofHe
 6nrTHiECuCJVaSIfK9b+nP/eBA==
X-Google-Smtp-Source: ABdhPJzF8fa/R2+n7Jn2U5kz4WKcSlpqZtf28Go0vVlFCwmI1tl6VVLP4bYfN/Pa7k8ZBN2242689A==
X-Received: by 2002:a5d:9c4a:: with SMTP id 10mr99473iof.145.1612304507197;
 Tue, 02 Feb 2021 14:21:47 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id s10sm102213iob.47.2021.02.02.14.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 14:21:46 -0800 (PST)
Subject: Re: [PATCH v3 2/4] target/arm: Add support for FEAT_DIT, Data
 Independent Timing
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210128044529.1403-1-rebecca@nuviainc.com>
 <20210128044529.1403-3-rebecca@nuviainc.com>
 <5ac0bb98-107b-004c-4ef3-b4ee0e15530a@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <621ad496-705e-3fc6-0ff9-f37e1836a267@nuviainc.com>
Date: Tue, 2 Feb 2021 15:21:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <5ac0bb98-107b-004c-4ef3-b4ee0e15530a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 10:06 PM, Richard Henderson wrote:
> On 1/27/21 6:45 PM, Rebecca Cran wrote:
>> Add support for FEAT_DIT. DIT (Data Independent Timing) is a required
>> feature for ARMv8.4. Since virtual machine execution is largely
>> nondeterministic and TCG is outside of the security domain, it's
>> implemented as a NOP.
>>
>> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> This misses the convert from AA32 CPSR to AA64 SPSR on exception entry (and
> vice-versa on return).
> 
> In particular: CPSR.DIT (bit 21) -> SPSR_EL1.DIT (bit 24), and merging
> PSTATE.SS into SPSR_EL1.SS (bit 21).

Thanks. I _think_ I'm understanding it better now. Would the following 
work? I don't see where I need to map PSTATE.SS into SPSR_EL1.SS though, 
because isn't that handled automatically since PSTATE maps onto SPSR?


diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index a6b162049806..c1ff24d42f32 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1003,6 +1003,11 @@ void HELPER(exception_return)(CPUARMState *env, 
uint64_t new_pc)
          if (!arm_singlestep_active(env)) {
              env->pstate &= ~PSTATE_SS;
          }
+
+        if (spsr & PSTATE_DIT) {
+            env->uncached_cpsr |= CPSR_DIT;
+        }
+
          aarch64_sync_64_to_32(env);

          if (spsr & CPSR_T) {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 54ac1f476940..1ecfd63d8f70 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9426,6 +9426,12 @@ static void take_aarch32_exception(CPUARMState 
*env, int new_mode,
       */
      env->pstate &= ~PSTATE_SS;
      env->spsr = cpsr_read(env);
+
+    if (env->uncached_cpsr & CPSR_DIT) {
+        env->spsr |= PSTATE_DIT;
+        env->spsr &= ~PSTATE_SS;
+    }
+
      /* Clear IT bits.  */
      env->condexec_bits = 0;
      /* Switch to the new mode, and to the correct instruction set.  */
@@ -9905,6 +9911,11 @@ static void arm_cpu_do_interrupt_aarch64(CPUState 
*cs)
          old_mode = cpsr_read(env);
          env->elr_el[new_el] = env->regs[15];

+        if (old_mode & CPSR_DIT) {
+            old_mode |= PSTATE_DIT;
+            old_mode &= ~PSTATE_SS;
+        }
+
          aarch64_sync_32_to_64(env);

          env->condexec_bits = 0;

