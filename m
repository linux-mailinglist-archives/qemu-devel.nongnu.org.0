Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6090431BA41
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:24:51 +0100 (CET)
Received: from localhost ([::1]:33074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdru-0002D6-EK
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjs-0005Pl-RN
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:32 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjr-0005U6-4g
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:32 -0500
Received: by mail-ed1-x52b.google.com with SMTP id h10so3264269edl.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xYbjOUSvajLSkt/9wJk0yaturey15raJMMrMJiL6dNY=;
 b=OtckRL79ygHk4CiVmQECM/uf215rQmICoKqPBgGEXmSxc2tBcZEgEMEZ/deDQiD2PN
 Cx3Wea4Cd+AsJIcC3jI4wSkDFmRC1oMAEIri9zaFP+8MVPmOztaFybPRIk4mSZjEy0Au
 ARvSjjtzIFQqvfnrDQQbiv6qRTcfXUdFT8MnpUaVUy5EKZPRpMD8xVRmwv5yIKb6xX3m
 +DIkizZCCX+Mf0EPk/zXFF9c6eVFJq+EoUDuL9vvGASAxoWGAvn0XqJAwsrc38WTftgp
 MWv5SEQ3enCMcZZyjYeG97ZyHb4lwhRjiNARMSSjTK0aUMu9RS7qjB5hF4jIQIow9bqO
 s6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xYbjOUSvajLSkt/9wJk0yaturey15raJMMrMJiL6dNY=;
 b=iisCpNZBVhlYMk7tk05RO3vjjeCPAyuBySSH61xNpoBbQstQvsd3Zb0cXXF401fHPY
 NpFthypJHMkbvS/xtlK2Q89IXNqf64ynWfotzhEyIfdIKU0jLwaiTgC/aDtcElmeLXFU
 h2hxLcXwigxdSXRbgNeBwFrjxoEwqdIaQloSvG+DaMUuHTzu4HDhoKafQvqvS0ydcURt
 lqT1fcwQD7WqgeRFKvAS1w30djFw3cua0983J9vXdLSiAHchpDzKAdWlJY8G/GPtcfE4
 VyT7Y7WFcfogDQQnktmct35g6TwzTOhM+ieBPHHmimmRnYs9eawAPAXXZ07JUBeT9kT1
 RjJg==
X-Gm-Message-State: AOAM532JgOG1OQxLsG1YlHf2FoOLtlCJSHcnNDegZBs58i+lGFYyGddJ
 t4+wIsXMeaERFtwLr+TK/QfN49ggqDc=
X-Google-Smtp-Source: ABdhPJyjy0hZhOdDP9ecUZmCRRbZSLyq6MnM4Ll0tOY4pFSJuFldh/hJJCJHlWdrupTxH9kwBqcsOQ==
X-Received: by 2002:a05:6402:278a:: with SMTP id
 b10mr15750415ede.347.1613394989989; 
 Mon, 15 Feb 2021 05:16:29 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/19] sev/i386: Add initial support for SEV-ES
Date: Mon, 15 Feb 2021 14:16:10 +0100
Message-Id: <20210215131626.65640-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Venu Busireddy <venu.busireddy@oracle.com>, Jiri Slaby <jslaby@suse.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

Provide initial support for SEV-ES. This includes creating a function to
indicate the guest is an SEV-ES guest (which will return false until all
support is in place), performing the proper SEV initialization and
ensuring that the guest CPU state is measured as part of the launch.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Co-developed-by: Jiri Slaby <jslaby@suse.cz>
Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Venu Busireddy <venu.busireddy@oracle.com>
Message-Id: <2e6386cbc1ddeaf701547dd5677adf5ddab2b6bd.1611682609.git.thomas.lendacky@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c      |  1 +
 target/i386/sev-stub.c |  6 ++++++
 target/i386/sev.c      | 44 ++++++++++++++++++++++++++++++++++++++++--
 target/i386/sev_i386.h |  1 +
 4 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9c3d2d60b7..20c3a5af3f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5984,6 +5984,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         break;
     case 0x8000001F:
         *eax = sev_enabled() ? 0x2 : 0;
+        *eax |= sev_es_enabled() ? 0x8 : 0;
         *ebx = sev_get_cbit_position();
         *ebx |= sev_get_reduced_phys_bits() << 6;
         *ecx = 0;
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index 1ac1fd5b94..edf6c519d7 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -49,6 +49,7 @@ SevCapability *sev_get_capabilities(Error **errp)
     error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
 }
+
 int sev_inject_launch_secret(const char *hdr, const char *secret,
                              uint64_t gpa, Error **errp)
 {
@@ -59,3 +60,8 @@ int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
 {
     return 0;
 }
+
+bool sev_es_enabled(void)
+{
+    return false;
+}
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 11c9a3cc21..dc0e53019b 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -341,6 +341,12 @@ sev_enabled(void)
     return !!sev_guest;
 }
 
+bool
+sev_es_enabled(void)
+{
+    return false;
+}
+
 uint64_t
 sev_get_me_mask(void)
 {
@@ -561,6 +567,20 @@ sev_launch_update_data(SevGuestState *sev, uint8_t *addr, uint64_t len)
     return ret;
 }
 
+static int
+sev_launch_update_vmsa(SevGuestState *sev)
+{
+    int ret, fw_error;
+
+    ret = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_UPDATE_VMSA, NULL, &fw_error);
+    if (ret) {
+        error_report("%s: LAUNCH_UPDATE_VMSA ret=%d fw_error=%d '%s'",
+                __func__, ret, fw_error, fw_error_to_str(fw_error));
+    }
+
+    return ret;
+}
+
 static void
 sev_launch_get_measure(Notifier *notifier, void *unused)
 {
@@ -573,6 +593,14 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
         return;
     }
 
+    if (sev_es_enabled()) {
+        /* measure all the VM save areas before getting launch_measure */
+        ret = sev_launch_update_vmsa(sev);
+        if (ret) {
+            exit(1);
+        }
+    }
+
     measurement = g_new0(struct kvm_sev_launch_measure, 1);
 
     /* query the measurement blob length */
@@ -667,7 +695,7 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     SevGuestState *sev
         = (SevGuestState *)object_dynamic_cast(OBJECT(cgs), TYPE_SEV_GUEST);
     char *devname;
-    int ret, fw_error;
+    int ret, fw_error, cmd;
     uint32_t ebx;
     uint32_t host_cbitpos;
     struct sev_user_data_status status = {};
@@ -724,8 +752,20 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     sev->api_major = status.api_major;
     sev->api_minor = status.api_minor;
 
+    if (sev_es_enabled()) {
+        if (!(status.flags & SEV_STATUS_FLAGS_CONFIG_ES)) {
+            error_report("%s: guest policy requires SEV-ES, but "
+                         "host SEV-ES support unavailable",
+                         __func__);
+            goto err;
+        }
+        cmd = KVM_SEV_ES_INIT;
+    } else {
+        cmd = KVM_SEV_INIT;
+    }
+
     trace_kvm_sev_init();
-    ret = sev_ioctl(sev->sev_fd, KVM_SEV_INIT, NULL, &fw_error);
+    ret = sev_ioctl(sev->sev_fd, cmd, NULL, &fw_error);
     if (ret) {
         error_setg(errp, "%s: failed to initialize ret=%d fw_error=%d '%s'",
                    __func__, ret, fw_error, fw_error_to_str(fw_error));
diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index bd9f00a908..ae221d4c72 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -28,6 +28,7 @@
 #define SEV_POLICY_DOMAIN       0x10
 #define SEV_POLICY_SEV          0x20
 
+extern bool sev_es_enabled(void);
 extern uint64_t sev_get_me_mask(void);
 extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
-- 
2.29.2



