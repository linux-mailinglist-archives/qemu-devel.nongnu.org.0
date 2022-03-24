Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B1A4E67D9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:34:00 +0100 (CET)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRLT-0003ML-Fz
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:33:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXRJG-0001rx-Om
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:31:42 -0400
Received: from [2a00:1450:4864:20::633] (port=45672
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXRJE-0002CL-Fb
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:31:42 -0400
Received: by mail-ej1-x633.google.com with SMTP id qa43so10570648ejc.12
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CUbR9AcG19kIN8ZsGbwDkz1U6dA2t1qr2XCcLZ2Dh6E=;
 b=biWwQv0NFdkNTOZNO7/CKoKLa8MBFRur1VvfD7TsLxe18VV9PcNUIS1N89pL/bIMv2
 vfgnyjG7eO1IdYXTdSKKpcZvNOCsBBC44RS3gbLE/FgUbUZnflwNdoOEam0deejwcNRQ
 WmR0AV+ofCDZzjl1fkt1rkJInI85mvRWbgKCkBO8a6Sh7I77CGbX5Ip15bXHEK4ACVBt
 NkkiBRaK3SmkjC6jWyRp8bWvMUtQSJUSVuqR/rbPbPARcK9ayh/hLHD2vOV3igvsT4i3
 32XdO0D9dAFOiVNkh8NPox02xI5kFTqO67xYJUoojIFuYAUGOAAdG5hD+mDRB11krFSZ
 6eeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CUbR9AcG19kIN8ZsGbwDkz1U6dA2t1qr2XCcLZ2Dh6E=;
 b=CPUrfhLOQc2d1KrUt4hxenrsl45xGT3xOZH/qYr29nkWbz855wjIXOGOnNT9q5f4qg
 hl0/GBTXY1GPO3dWz1Y5slFLTf0ewr4DdZqO0Dcs80+ZmvXmx9TxhRapIYvn34t1BmPN
 0TYpeBnE9RZMwZqacUP0i9U0iBDhNauuS+8Fvx9URNxjNHZaIJEI7BZsTcrTxX9rPb3B
 TrpCCmoAkZi/q+DebLXbP/fh8FDJnpFH0aM33vtJ/MNEzAnUiGj9QP87DzzbAIGsnw8S
 Y+Vb7URODrt//zjVKaeY9xXOlUWIjvJ2RaaHy++TuhYidgkBYM/hVimpgetjUrbfhGD5
 Zflg==
X-Gm-Message-State: AOAM531PdgjxI3XrwnWDoA8BOYtNhtSaZNQ6z+/9WNq08A9UebYTFYyw
 y7xhBr2ba7VFPGSOAAyanzGqaE+4r8A=
X-Google-Smtp-Source: ABdhPJzm2wGAak00yY3piPm8yu4USSGmgltNMPGTxlAt8NSynmYtz0GbqOZtUlcjW1mtm1EVP4YTMA==
X-Received: by 2002:a17:906:30cf:b0:6da:9da6:b360 with SMTP id
 b15-20020a17090630cf00b006da9da6b360mr6599677ejb.743.1648143098513; 
 Thu, 24 Mar 2022 10:31:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a50fe81000000b004197f2ecdc2sm1675456edt.89.2022.03.24.10.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:31:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: properly reset TSC on reset
Date: Thu, 24 Mar 2022 18:31:36 +0100
Message-Id: <20220324173136.222647-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vadim Rozenfeld <vrozenfe@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some versions of Windows hang on reboot if their TSC value is greater
than 2^54.  The calibration of the Hyper-V reference time overflows
and fails; as a result the processors' clock sources are out of sync.

The issue is that the TSC _should_ be reset to 0 on CPU reset and
QEMU tries to do that.  However, KVM special cases writing 0 to the
TSC and thinks that QEMU is trying to hot-plug a CPU, which is
correct the first time through but not later.  Thwart this valiant
effort and reset the TSC to 1 instead, but only if the CPU has been
run once.

For this to work, env->tsc has to be moved to the part of CPUArchState
that is not zeroed at the beginning of x86_cpu_reset.

Reported-by: Vadim Rozenfeld <vrozenfe@redhat.com>
Supersedes: <20220324082346.72180-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 13 +++++++++++++
 target/i386/cpu.h |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ec3b50bf6e..cb6b5467d0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5931,6 +5931,19 @@ static void x86_cpu_reset(DeviceState *dev)
     env->xstate_bv = 0;
 
     env->pat = 0x0007040600070406ULL;
+
+    if (kvm_enabled()) {
+        /*
+         * KVM handles TSC = 0 specially and thinks we are hot-plugging
+         * a new CPU, use 1 instead to force a reset.
+         */
+        if (env->tsc != 0) {
+            env->tsc = 1;
+        }
+    } else {
+        env->tsc = 0;
+    }
+
     env->msr_ia32_misc_enable = MSR_IA32_MISC_ENABLE_DEFAULT;
     if (env->features[FEAT_1_ECX] & CPUID_EXT_MONITOR) {
         env->msr_ia32_misc_enable |= MSR_IA32_MISC_ENABLE_MWAIT;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e31e6bd8b8..982c532353 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1554,7 +1554,6 @@ typedef struct CPUArchState {
     target_ulong kernelgsbase;
 #endif
 
-    uint64_t tsc;
     uint64_t tsc_adjust;
     uint64_t tsc_deadline;
     uint64_t tsc_aux;
@@ -1708,6 +1707,7 @@ typedef struct CPUArchState {
     int64_t tsc_khz;
     int64_t user_tsc_khz; /* for sanity check only */
     uint64_t apic_bus_freq;
+    uint64_t tsc;
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     void *xsave_buf;
     uint32_t xsave_buf_len;
-- 
2.35.1


