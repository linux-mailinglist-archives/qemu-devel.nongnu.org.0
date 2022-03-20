Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE22A4E1D9D
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 20:40:17 +0100 (CET)
Received: from localhost ([::1]:36890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW1PU-0004xF-Oy
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 15:40:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nW1Ob-0004HQ-QW
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 15:39:21 -0400
Received: from [2a00:1450:4864:20::62d] (port=34609
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nW1Oa-0004XA-7Z
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 15:39:21 -0400
Received: by mail-ej1-x62d.google.com with SMTP id o10so7412801ejd.1
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 12:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=meXKtiTj9oVaBUBtAhQzlAyITdYiehVjmV1emt2Kta0=;
 b=aP6DPVVyuNe3pB5LM+VwbmJoLcB7UMOQr+F3mfmDU9woF5C2mJ6IQJc+TeBq1TGKWn
 BRyJsWkq6tA+v+uytk0FpD0PF1usStqFYJwWOepjFeVjf+tiFQyZYsvgAjuSwoMWkhAZ
 rPyf2mXk0dYjjHCthrUb4lYkKInkly7pK2w1s/fFTfNOhQ1ofbV+OI35+ZeP+ZAt3+uj
 O56oV6ACf6SrHay7/OCrtgr1Ueth0aExZGUTqv89guoa6XuZhTjws1zujQoOWzWo7JrB
 gHnJQ8aASX0r2XoKCXYG6qiE2xL2dtbunDCmfKrqomMxoQF7I25+qT6z9EvMiQCyv0AN
 5DiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=meXKtiTj9oVaBUBtAhQzlAyITdYiehVjmV1emt2Kta0=;
 b=rxdhmm0sA7SY4KoRVOrTsPy1AixOrSF7popjwXvbQ45tE17t5f2fBkNAt6k79sL3bM
 Iik5cP8NqCG4rdzzoRgNOZ3dfnGw0oZUk2EYyiX6/yxNpPeuk+BitdswwdA8EOmcp+LY
 /wT7LPC2sXfSSdnauUP0XE/MIidaSFwk9cbt+fFHE7jPg+TwepwLUHqPsP1J7IOr8oX/
 icNgrWPm2tBlAE+DmR+0mq1KMyOYipuEcU4QFJfiQ7UqCjphZJiusTqBRh0icHaFjuS9
 ekoniXug/kX3qT5EvK2PwWQTIpglDZuRrf+MgBtSWO0iHLLgaMJwcLYUMVkv7TJVM7rQ
 QMqw==
X-Gm-Message-State: AOAM532rMYOXltu6UE9HmZCXxfsmQAajJOoHgryuElRCbTPK7r9hSJnJ
 CBL65ARy8upB8we/pRgqvrpzZC0a7qQ=
X-Google-Smtp-Source: ABdhPJx9EsGHCeoDggkD7JO8NrIg0QThpimHMdTIh1t5wh09KRRBLft0RTsO6oa610sWaVR2B2bq8A==
X-Received: by 2002:a17:906:2b93:b0:6cf:bb48:5a80 with SMTP id
 m19-20020a1709062b9300b006cfbb485a80mr17341032ejg.681.1647805158125; 
 Sun, 20 Mar 2022 12:39:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a50fd0b000000b0041936bc0f7esm815116eds.52.2022.03.20.12.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 12:39:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/i386: kvm: do not access uninitialized variable on
 older kernels
Date: Sun, 20 Mar 2022 20:39:14 +0100
Message-Id: <20220320193914.111356-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: pkrempa@redhat.com, vr_qemu@t-online.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM support for AMX includes a new system attribute, KVM_X86_XCOMP_GUEST_SUPP.
Commit 19db68ca68 ("x86: Grant AMX permission for guest", 2022-03-15) however
did not fully consider the behavior on older kernels.  First, it warns
too aggressively.  Second, it invokes the KVM_GET_DEVICE_ATTR ioctl
unconditionally and then uses the "bitmask" variable, which remains
uninitialized if the ioctl fails.  Third, kvm_ioctl returns -errno rather
than -1 on errors.

While at it, explain why the ioctl is needed and KVM_GET_SUPPORTED_CPUID
is not enough.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
        v1->v2: for error condition for kvm_ioctl [Volker]
 target/i386/kvm/kvm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ef2c68a6f4..06901c2a43 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -411,6 +411,12 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
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
@@ -419,13 +425,16 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
 
         bool sys_attr = kvm_check_extension(s, KVM_CAP_SYS_ATTRIBUTES);
         if (!sys_attr) {
-            warn_report("cannot get sys attribute capabilities %d", sys_attr);
+            return ret;
         }
 
         int rc = kvm_ioctl(s, KVM_GET_DEVICE_ATTR, &attr);
-        if (rc == -1 && (errno == ENXIO || errno == EINVAL)) {
-            warn_report("KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) "
-                        "error: %d", rc);
+        if (rc < 0) {
+            if (rc != -ENXIO) {
+                warn_report("KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) "
+                            "error: %d", rc);
+            }
+            return ret;
         }
         ret = (reg == R_EAX) ? bitmask : bitmask >> 32;
     } else if (function == 0x80000001 && reg == R_ECX) {
-- 
2.35.1


