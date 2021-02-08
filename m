Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F34313171
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 12:55:02 +0100 (CET)
Received: from localhost ([::1]:43238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9589-0005NE-SA
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 06:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8ziE-0002Pj-PP; Mon, 08 Feb 2021 01:07:54 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37147 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zi6-0006rS-Vq; Mon, 08 Feb 2021 01:07:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DYwY60RjBz9sVt; Mon,  8 Feb 2021 17:07:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612764458;
 bh=bpg8O2zL5MdjoFw9vYkyKLGdob6Mhf9Zggqku1TuXHY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fbz+gd87f1NdJvmqufBXJEcva6STAq3Nu8B7N51uBRCFNK75xfX3lF9Orq2JkxRZS
 +SSr68oCXVI00dYm8H5RE6dVN3ZUIFEzUaaTgl4dA1E8ZbMaawWDzJ918NKn+kVdZg
 2Dcswfdk2GT9facH7Gs3bVzBdUiut3HC/Dn5TtuQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 dgilbert@redhat.com, brijesh.singh@amd.com, pasic@linux.ibm.com
Subject: [PULL v9 06/13] sev: Add Error ** to sev_kvm_init()
Date: Mon,  8 Feb 2021 17:07:28 +1100
Message-Id: <20210208060735.39838-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208060735.39838-1-david@gibson.dropbear.id.au>
References: <20210208060735.39838-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mtosatti@redhat.com, kvm@vger.kernel.org, david@redhat.com,
 frankja@linux.ibm.com, pragyansri.pathi@intel.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, borntraeger@de.ibm.com, andi.kleen@intel.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, ehabkost@redhat.com,
 richard.henderson@linaro.org, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 David Gibson <david@gibson.dropbear.id.au>, berrange@redhat.com,
 cohuck@redhat.com, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows failures to be reported richly and idiomatically.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 accel/kvm/kvm-all.c  |  4 +++-
 accel/kvm/sev-stub.c |  2 +-
 include/sysemu/sev.h |  2 +-
 target/i386/sev.c    | 31 +++++++++++++++----------------
 4 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 88a6b8c19e..226e1556f9 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2185,9 +2185,11 @@ static int kvm_init(MachineState *ms)
      * encryption context.
      */
     if (ms->cgs) {
+        Error *local_err = NULL;
         /* FIXME handle mechanisms other than SEV */
-        ret = sev_kvm_init(ms->cgs);
+        ret = sev_kvm_init(ms->cgs, &local_err);
         if (ret < 0) {
+            error_report_err(local_err);
             goto err;
         }
     }
diff --git a/accel/kvm/sev-stub.c b/accel/kvm/sev-stub.c
index 3d4787ae4a..512e205f7f 100644
--- a/accel/kvm/sev-stub.c
+++ b/accel/kvm/sev-stub.c
@@ -15,7 +15,7 @@
 #include "qemu-common.h"
 #include "sysemu/sev.h"
 
-int sev_kvm_init(ConfidentialGuestSupport *cgs)
+int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
     /* SEV can't be selected if it's not compiled */
     g_assert_not_reached();
diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 3b5b1aacf1..5c5a13c6ca 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -16,7 +16,7 @@
 
 #include "sysemu/kvm.h"
 
-int sev_kvm_init(ConfidentialGuestSupport *cgs);
+int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
 int sev_inject_launch_secret(const char *hdr, const char *secret,
                              uint64_t gpa, Error **errp);
diff --git a/target/i386/sev.c b/target/i386/sev.c
index fa962d533c..590cb31fa8 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -662,7 +662,7 @@ sev_vm_state_change(void *opaque, int running, RunState state)
     }
 }
 
-int sev_kvm_init(ConfidentialGuestSupport *cgs)
+int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
     SevGuestState *sev = SEV_GUEST(cgs);
     char *devname;
@@ -684,14 +684,14 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs)
     host_cbitpos = ebx & 0x3f;
 
     if (host_cbitpos != sev->cbitpos) {
-        error_report("%s: cbitpos check failed, host '%d' requested '%d'",
-                     __func__, host_cbitpos, sev->cbitpos);
+        error_setg(errp, "%s: cbitpos check failed, host '%d' requested '%d'",
+                   __func__, host_cbitpos, sev->cbitpos);
         goto err;
     }
 
     if (sev->reduced_phys_bits < 1) {
-        error_report("%s: reduced_phys_bits check failed, it should be >=1,"
-                     " requested '%d'", __func__, sev->reduced_phys_bits);
+        error_setg(errp, "%s: reduced_phys_bits check failed, it should be >=1,"
+                   " requested '%d'", __func__, sev->reduced_phys_bits);
         goto err;
     }
 
@@ -700,20 +700,19 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs)
     devname = object_property_get_str(OBJECT(sev), "sev-device", NULL);
     sev->sev_fd = open(devname, O_RDWR);
     if (sev->sev_fd < 0) {
-        error_report("%s: Failed to open %s '%s'", __func__,
-                     devname, strerror(errno));
-    }
-    g_free(devname);
-    if (sev->sev_fd < 0) {
+        error_setg(errp, "%s: Failed to open %s '%s'", __func__,
+                   devname, strerror(errno));
+        g_free(devname);
         goto err;
     }
+    g_free(devname);
 
     ret = sev_platform_ioctl(sev->sev_fd, SEV_PLATFORM_STATUS, &status,
                              &fw_error);
     if (ret) {
-        error_report("%s: failed to get platform status ret=%d "
-                     "fw_error='%d: %s'", __func__, ret, fw_error,
-                     fw_error_to_str(fw_error));
+        error_setg(errp, "%s: failed to get platform status ret=%d "
+                   "fw_error='%d: %s'", __func__, ret, fw_error,
+                   fw_error_to_str(fw_error));
         goto err;
     }
     sev->build_id = status.build;
@@ -723,14 +722,14 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs)
     trace_kvm_sev_init();
     ret = sev_ioctl(sev->sev_fd, KVM_SEV_INIT, NULL, &fw_error);
     if (ret) {
-        error_report("%s: failed to initialize ret=%d fw_error=%d '%s'",
-                     __func__, ret, fw_error, fw_error_to_str(fw_error));
+        error_setg(errp, "%s: failed to initialize ret=%d fw_error=%d '%s'",
+                   __func__, ret, fw_error, fw_error_to_str(fw_error));
         goto err;
     }
 
     ret = sev_launch_start(sev);
     if (ret) {
-        error_report("%s: failed to create encryption context", __func__);
+        error_setg(errp, "%s: failed to create encryption context", __func__);
         goto err;
     }
 
-- 
2.29.2


