Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12CC4E6EB6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 08:17:08 +0100 (CET)
Received: from localhost ([::1]:48006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXeC3-0008KC-LX
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 03:17:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2V-00081A-Qw
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:16 -0400
Received: from [2a00:1450:4864:20::636] (port=37559
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2U-0000YK-AF
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:15 -0400
Received: by mail-ej1-x636.google.com with SMTP id bg10so13556126ejb.4
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUbR9AcG19kIN8ZsGbwDkz1U6dA2t1qr2XCcLZ2Dh6E=;
 b=PQtyxmdjGXN2Eofrbso5AhtOszMwBXDUiM3SHyN9ZEL71AGZtGDq70uYF3QKuIHzUA
 xZ3INqWQVfx7RGURN4S3ihLdfxqRmUk2Zu+bmtf+565t9tlkQF5wQBeVUWbr4jY1NY7K
 8k7U5QpOpuY934dgk53idUInyyr8hb6S2vWnHNsGpXUKe2iw/inZNUKHeHr2Ir2U0IXo
 kg5lYUSb/kfdBRa9G7fJ8hkwiuAabkJFwdqFkjh9XaXkGlyZ1RtPGz3MnHSVH3Z5Wekp
 ZfD9F2320LymtgeiH0snJSX/I6drSsyLsdRMPHYJq+ZpFHfIn8lLdjB4NiiNh4im67oo
 rZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CUbR9AcG19kIN8ZsGbwDkz1U6dA2t1qr2XCcLZ2Dh6E=;
 b=ZQL3xHlWBv6zezm+7xdbWUh6G8VUAQ7/zgkUZUHSYyH3BvH3V7HO445vHRHHKPjDBo
 1hxWy//Xy1EWAmY8se3/WoEb/M7bHzxRQPzk0PK4Hd5ozVG1hBj629nwn+10xE1EPub7
 xps7mdbRno4HQpkPWw09cY6dOK2qlUWipxof3RIFLrVeU9182SNv/CMfqnKu7ioOnrYD
 XvykOtX2QR28cuNfpnMbCg5HuyYG/dNVaFDyrnwIGI6l6VjK5s56xats4fZk07RAv0ZJ
 YTLAry7zjoxD+khvRPNjP2JK2ZYPuSPXTB0wuO/IO5PlnxMwh2mMHz7zKlXqb0gFf9tD
 4dtQ==
X-Gm-Message-State: AOAM533dWpdDQZ1TnYtq1aYfQJVN9FJtMUC+zmd+ntrm1B8/jS2sInB2
 4hHm95d67DSfwTa/mr7zLSy7F9Mz7uY=
X-Google-Smtp-Source: ABdhPJxPW3dIf2NGU22+FWJJk4wOqxq8I77gKN+zIE5OsbwHZpcxrJch02Fim0cUWqWY1QJQmBdEQg==
X-Received: by 2002:a17:906:5d08:b0:6db:7291:df22 with SMTP id
 g8-20020a1709065d0800b006db7291df22mr9390212ejt.178.1648192032978; 
 Fri, 25 Mar 2022 00:07:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm2011497ejc.161.2022.03.25.00.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 00:07:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] target/i386: properly reset TSC on reset
Date: Fri, 25 Mar 2022 08:07:05 +0100
Message-Id: <20220325070706.271291-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325070706.271291-1-pbonzini@redhat.com>
References: <20220325070706.271291-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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



