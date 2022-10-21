Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C3960780E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 15:15:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrrd-0004CJ-C9
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:15:05 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olrji-0005ai-Kj
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1olrjN-0005TK-Fv
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:06:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1olrjJ-00086P-8B
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:06:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666357588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p1EGsGNJqZR2tziqXLokPkR5z2ueiD1sLUFLeVnCqPg=;
 b=PKqhsaPdS4yI8NLzPXxxOYs5E457rZ0n2EFStekvq/C8MNUcZiwYTfb6bI96HUvVLRFOP5
 SvD2ufBbn7035WusvBMK+jOClFOK1JkE4CV3R5Hxc+D+rk9cnehir/FFu59OEGwka4wn/E
 fhobOWGDJtIR79jenQM5nbGBYGO2RMI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-gwDX8YEwOhaQCke6kgwM7w-1; Fri, 21 Oct 2022 09:06:25 -0400
X-MC-Unique: gwDX8YEwOhaQCke6kgwM7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2A68811E84;
 Fri, 21 Oct 2022 13:06:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 626F11401CC5;
 Fri, 21 Oct 2022 13:06:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PULL 07/11] s390x: Introduce PV query interface
Date: Fri, 21 Oct 2022 17:05:45 +0400
Message-Id: <20221021130549.111864-8-marcandre.lureau@redhat.com>
In-Reply-To: <20221021130549.111864-1-marcandre.lureau@redhat.com>
References: <20221021130549.111864-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Janosch Frank <frankja@linux.ibm.com>

Introduce an interface over which we can get information about UV data.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221017083822.43118-8-frankja@linux.ibm.com>
---
 include/hw/s390x/pv.h      | 10 +++++++
 hw/s390x/pv.c              | 61 ++++++++++++++++++++++++++++++++++++++
 hw/s390x/s390-virtio-ccw.c |  6 ++++
 3 files changed, 77 insertions(+)

diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 1f1f545bfc..e5ea0eca16 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -38,6 +38,7 @@ static inline bool s390_is_pv(void)
     return ccw->pv;
 }
 
+int s390_pv_query_info(void);
 int s390_pv_vm_enable(void);
 void s390_pv_vm_disable(void);
 int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);
@@ -46,8 +47,13 @@ void s390_pv_prep_reset(void);
 int s390_pv_verify(void);
 void s390_pv_unshare(void);
 void s390_pv_inject_reset_error(CPUState *cs);
+uint64_t kvm_s390_pv_dmp_get_size_cpu(void);
+uint64_t kvm_s390_pv_dmp_get_size_mem_state(void);
+uint64_t kvm_s390_pv_dmp_get_size_completion_data(void);
+bool kvm_s390_pv_info_basic_valid(void);
 #else /* CONFIG_KVM */
 static inline bool s390_is_pv(void) { return false; }
+static inline int s390_pv_query_info(void) { return 0; }
 static inline int s390_pv_vm_enable(void) { return 0; }
 static inline void s390_pv_vm_disable(void) {}
 static inline int s390_pv_set_sec_parms(uint64_t origin, uint64_t length) { return 0; }
@@ -56,6 +62,10 @@ static inline void s390_pv_prep_reset(void) {}
 static inline int s390_pv_verify(void) { return 0; }
 static inline void s390_pv_unshare(void) {}
 static inline void s390_pv_inject_reset_error(CPUState *cs) {};
+static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void) { return 0; }
+static inline uint64_t kvm_s390_pv_dmp_get_size_mem_state(void) { return 0; }
+static inline uint64_t kvm_s390_pv_dmp_get_size_completion_data(void) { return 0; }
+static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }
 #endif /* CONFIG_KVM */
 
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 401b63d6cb..4c012f2eeb 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -20,6 +20,11 @@
 #include "exec/confidential-guest-support.h"
 #include "hw/s390x/ipl.h"
 #include "hw/s390x/pv.h"
+#include "target/s390x/kvm/kvm_s390x.h"
+
+static bool info_valid;
+static struct kvm_s390_pv_info_vm info_vm;
+static struct kvm_s390_pv_info_dump info_dump;
 
 static int __s390_pv_cmd(uint32_t cmd, const char *cmdname, void *data)
 {
@@ -56,6 +61,42 @@ static int __s390_pv_cmd(uint32_t cmd, const char *cmdname, void *data)
     }                                  \
 }
 
+int s390_pv_query_info(void)
+{
+    struct kvm_s390_pv_info info = {
+        .header.id = KVM_PV_INFO_VM,
+        .header.len_max = sizeof(info.header) + sizeof(info.vm),
+    };
+    int rc;
+
+    /* Info API's first user is dump so they are bundled */
+    if (!kvm_s390_get_protected_dump()) {
+        return 0;
+    }
+
+    rc = s390_pv_cmd(KVM_PV_INFO, &info);
+    if (rc) {
+        error_report("KVM PV INFO cmd %x failed: %s",
+                     info.header.id, strerror(-rc));
+        return rc;
+    }
+    memcpy(&info_vm, &info.vm, sizeof(info.vm));
+
+    info.header.id = KVM_PV_INFO_DUMP;
+    info.header.len_max = sizeof(info.header) + sizeof(info.dump);
+    rc = s390_pv_cmd(KVM_PV_INFO, &info);
+    if (rc) {
+        error_report("KVM PV INFO cmd %x failed: %s",
+                     info.header.id, strerror(-rc));
+        return rc;
+    }
+
+    memcpy(&info_dump, &info.dump, sizeof(info.dump));
+    info_valid = true;
+
+    return rc;
+}
+
 int s390_pv_vm_enable(void)
 {
     return s390_pv_cmd(KVM_PV_ENABLE, NULL);
@@ -114,6 +155,26 @@ void s390_pv_inject_reset_error(CPUState *cs)
     env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;
 }
 
+uint64_t kvm_s390_pv_dmp_get_size_cpu(void)
+{
+    return info_dump.dump_cpu_buffer_len;
+}
+
+uint64_t kvm_s390_pv_dmp_get_size_completion_data(void)
+{
+    return info_dump.dump_config_finalize_len;
+}
+
+uint64_t kvm_s390_pv_dmp_get_size_mem_state(void)
+{
+    return info_dump.dump_config_mem_buffer_per_1m;
+}
+
+bool kvm_s390_pv_info_basic_valid(void)
+{
+    return info_valid;
+}
+
 #define TYPE_S390_PV_GUEST "s390-pv-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(S390PVGuest, S390_PV_GUEST)
 
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 03855c7231..1cc20d8717 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -366,6 +366,12 @@ static int s390_machine_protect(S390CcwMachineState *ms)
 
     ms->pv = true;
 
+    /* Will return 0 if API is not available since it's not vital */
+    rc = s390_pv_query_info();
+    if (rc) {
+        goto out_err;
+    }
+
     /* Set SE header and unpack */
     rc = s390_ipl_prepare_pv_header();
     if (rc) {
-- 
2.37.3


