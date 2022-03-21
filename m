Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B42C4E2E7A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:47:43 +0100 (CET)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLC2-0004nJ-M7
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:47:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL9Y-0002PJ-8t
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:45:08 -0400
Received: from [2a00:1450:4864:20::52c] (port=35614
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL9W-00081N-FU
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:45:07 -0400
Received: by mail-ed1-x52c.google.com with SMTP id k10so4841634edj.2
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=efi8DSRTf2i20NY52YUXz0KrEVCIILq2P4XhBCv2IZg=;
 b=Z7heLaZ7whcQFy5E86/fOscN6/fuPsbg5WOJ2eeXLP3ADu5hYFoTL2M5uSD99EjKpr
 iFYNVeY0rh1AfJyyLFB+8XqZKyAOZU7oPO9N9WpXcZWoR+fbOAfMdrY07i5CMi0UJdeb
 OgRiFoMMeDpfM6oY52ik48xVBxAPeZBd+j90v7SgExOzOtWRPD+Cnnbi1E7VOsxiAsgP
 DOZBmX4YO7fFu2z7sUc4P3lvNmrxiFGVyFpKRQCQvDLM7Vq0enRURQDXdkH/Vl42rWQW
 gdCN9sImFyhhgDX2uhMcJY98Yu4V6Amv8HGv5eq8TyA8TUbLUxbryQNz2x51dwNs+PKP
 vyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=efi8DSRTf2i20NY52YUXz0KrEVCIILq2P4XhBCv2IZg=;
 b=VgbbKgAvBIxR3Gm2C1CateHo7Oi08JVH+e+b0BTF/SEMCZ0mlSnkIcS1T74jxl1qrl
 TmK4MuQYoJA5nz0aDfeT0T3mHoyVOFBbtvTVXrwE4VwntkhydeLO4chet3IC8x4gUsL6
 qRd2G1sNc97E3Iv7rk8yOMwxmI9v2oPV+t/rvPRt0x4KcVn6fe7L5hEdHW01XofpxgFt
 VI4dUi+rq0Pngy/lKYbrUIJ3y9UFvFxpId48xU6ScNyZh1cWQf5SoHeOmYDbGyajB44t
 cjhN5hDYJ7R9/+DUbMbSmNoGLlcxHU0zneUYxSBUF+UStzj9mV/uaAitkGHbCaBfdhVT
 Yovw==
X-Gm-Message-State: AOAM530BDyQXnpCMgq91aufDGeo3p7DFqr2HBPQ5ugeUXUOc8HxZvr0z
 63MmxaueefVuME+S253TDfyz3c0Q+qc=
X-Google-Smtp-Source: ABdhPJwWKREyySZf771JABKj0wk//ydliDWWNVluKijobp/S/9c2c4u1su8j9NsaVq0BJ9+M8hrHrg==
X-Received: by 2002:a05:6402:17dc:b0:418:efa5:f445 with SMTP id
 s28-20020a05640217dc00b00418efa5f445mr23805286edy.125.1647881105154; 
 Mon, 21 Mar 2022 09:45:05 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 a102-20020a509eef000000b0041614c8f79asm7949352edf.88.2022.03.21.09.45.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 09:45:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] target/i386: kvm: do not access uninitialized variable on
 older kernels
Date: Mon, 21 Mar 2022 17:45:01 +0100
Message-Id: <20220321164502.201160-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321164502.201160-1-pbonzini@redhat.com>
References: <20220321164502.201160-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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



