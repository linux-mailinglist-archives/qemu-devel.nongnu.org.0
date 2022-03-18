Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C424DDD28
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 16:41:18 +0100 (CET)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVEj7-00013T-EY
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 11:41:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nVEUq-0007e3-Uz
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:26:32 -0400
Received: from [2a00:1450:4864:20::532] (port=42703
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nVEUp-0006JA-7v
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:26:32 -0400
Received: by mail-ed1-x532.google.com with SMTP id a17so9634261edm.9
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5jfDVQHwgo4EPYTqpsajJCrkiZ7vbTgW4mqRzuRwUJo=;
 b=Z02NNApgeP06w0uqfjN4qedDFAA3Q0MYdrR40VNVhQTJJ4D8Tai1X70u86McrGTXOy
 EPR4aETXt7CiqJCAF7LClZZ+Xl8/AGpbQXTLDQKKd1WZuTsx7xC9XoOtkemBUvnJDM2R
 3HuyKKuX+KSAlaHlpGaj9ks+dBNea+1oG7b1hocEbimMN84C5vUjGLoeLe3XgZjwhBnd
 4JlDN99J5PvhKLvbA/A//qVHXjrb1gi0uOQYodeZvrFpi8aSOGSLnGOhMZE42jQ5GeLO
 QQ6k+sA7hhFpg5gMaHrxvwIS0PpCYY/XLLcsVLP2sx1XLllJD1XNW4RKNzvFLwzjuUpb
 U2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5jfDVQHwgo4EPYTqpsajJCrkiZ7vbTgW4mqRzuRwUJo=;
 b=Bdp0jCavWhpxlekxwaj+JAp3LJg1C+RZvSArhLlJI2+Iv+LeGTkrKL3Q/tV/QtEJj0
 lZ53j4M++TwaGDOoE89hzkDDnWgYqHaJ/YSyQRKOsuWZnZH1kwmcWHxSAiYbmt95LTFy
 FWbnAlkKQKM0/IaKUgNsqrC7WR4sRy2szM2koUetplxdmSx17qMC94KG5D4dY+4mAKF2
 1hMf/mPPaSbJJCkkEpFafUHC3JLjTNb18H5OE5HS7AaVfWmSgaFe8Sk3yAar0qoknQLC
 epz3f5Frzj5eXh7BvFy1tl2oxIQadXX2f8U/HvWPFjDmc28LeNy+bQQHAR/8/P8If7lr
 zXNA==
X-Gm-Message-State: AOAM5331Ld+JsFXucbHu85uYS6xYOGAELHVd5Q5BIypvyTcryc86w1ym
 /XZZktGhkIfX/+GN6p0H1FD03SGuV1s=
X-Google-Smtp-Source: ABdhPJyqp+l5gN7Os6F7cWYCh0rKL3hxfXVOyUVmKTjhxmyPH4IbCXWetMmKBS/ZEWZQovtr+1LS8g==
X-Received: by 2002:a05:6402:4386:b0:416:9ea3:5ee2 with SMTP id
 o6-20020a056402438600b004169ea35ee2mr10036089edc.298.1647617188859; 
 Fri, 18 Mar 2022 08:26:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a170906a18400b006db0a78bde8sm3837539ejy.87.2022.03.18.08.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 08:26:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: kvm: do not access uninitialized variable on
 older kernels
Date: Fri, 18 Mar 2022 16:26:26 +0100
Message-Id: <20220318152626.165431-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: pkrempa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM support for AMX includes a new system attribute, KVM_X86_XCOMP_GUEST_SUPP.
Commit 19db68ca68 ("x86: Grant AMX permission for guest", 2022-03-15) however
did not fully consider the behavior on older kernels.  First, it warns
too aggressively.  Second, it invokes the KVM_GET_DEVICE_ATTR ioctl
unconditionally and then uses the "bitmask" variable, which remains
uninitialized if the ioctl fails.

While at it, explain why the ioctl is needed and KVM_GET_SUPPORTED_CPUID
is not enough.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ce0e8a4042..f2c9f7b5ca 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -412,6 +412,12 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
         }
     } else if (function == 0xd && index == 0 &&
                (reg == R_EAX || reg == R_EDX)) {
+        /*
+         * The value returned by KVM_GET_SUPPORTED_CPUID does not include
+         * features that still have to be enabled with the arch_prctl
+         * system call.  QEMU needs the full value, which is retrieved
+         * with KVM_GET_DEVICE_ATTR.
+         */
         struct kvm_device_attr attr = {
             .group = 0,
             .attr = KVM_X86_XCOMP_GUEST_SUPP,
@@ -420,13 +426,16 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
 
         bool sys_attr = kvm_check_extension(s, KVM_CAP_SYS_ATTRIBUTES);
         if (!sys_attr) {
-            warn_report("cannot get sys attribute capabilities %d", sys_attr);
+            return ret;
         }
 
         int rc = kvm_ioctl(s, KVM_GET_DEVICE_ATTR, &attr);
-        if (rc == -1 && (errno == ENXIO || errno == EINVAL)) {
-            warn_report("KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) "
-                        "error: %d", rc);
+        if (rc == -1) {
+            if (errno != ENXIO) {
+                warn_report("KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) "
+                            "error: %d", rc);
+            }
+            return ret;
         }
         ret = (reg == R_EAX) ? bitmask : bitmask >> 32;
     } else if (function == 0x80000001 && reg == R_ECX) {
-- 
2.35.1


