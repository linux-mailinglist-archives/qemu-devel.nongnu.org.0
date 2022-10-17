Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24289600971
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:56:07 +0200 (CEST)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLuo-0004QB-6N
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLf0-0007u8-Eu; Mon, 17 Oct 2022 04:39:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40728
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLev-0003fz-S4; Mon, 17 Oct 2022 04:39:45 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H7KSXZ021893;
 Mon, 17 Oct 2022 08:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=a077gisI0PRfl4lHg8aH5+QEZcajBoxLYKvG0LxFS8c=;
 b=ESj/vg7sbbspig+ILdeT0AYcAmvgdYbhxBuo8/L+lFUWwHq7fM9mTUfmlm9dsqVyVpWF
 xTT306suawg7iEuiP38/svjRNc5TBjYay4GFmbyBZjXlFTq2hPN4v/p9jS/+4ZJxXY0t
 M23rLknGsITvLc6+kc/QSwx6Z1IJBj39TGMi0glEJ66QYKT7EtI3tjd/OXJ7m7w102K+
 lGNfWTH/q0pI7T5PsrJR+VqERwFXOjsslPN3lwlBI5WLk4/SI072Ph1CgUkjaZPqgyNy
 GkKmjCeZv3/YZQTumonnfygy9FkUcYLPeT8F3z8Jerk6MJSynvKeT5dRhi/lY6p3urm5 uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86g5sfb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:40 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29H7V08Y003951;
 Mon, 17 Oct 2022 08:39:39 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86g5sfa5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:39 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29H8aiPX009140;
 Mon, 17 Oct 2022 08:39:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3k7mg8t0je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:37 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29H8dYmD43057494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 08:39:34 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C88E1A4051;
 Mon, 17 Oct 2022 08:39:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6360A404D;
 Mon, 17 Oct 2022 08:39:33 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Oct 2022 08:39:33 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v6 07/10] s390x: Introduce PV query interface
Date: Mon, 17 Oct 2022 08:38:19 +0000
Message-Id: <20221017083822.43118-8-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017083822.43118-1-frankja@linux.ibm.com>
References: <20221017083822.43118-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kveSHc-jMFbli8pF-Yyob772Hqg7fQjj
X-Proofpoint-ORIG-GUID: irCJ5F0-qYue1wOEl6QcdHz2ZEnbu5_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_06,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 impostorscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170049
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Introduce an interface over which we can get information about UV data.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/pv.c              | 61 ++++++++++++++++++++++++++++++++++++++
 hw/s390x/s390-virtio-ccw.c |  6 ++++
 include/hw/s390x/pv.h      | 10 +++++++
 3 files changed, 77 insertions(+)

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
-- 
2.34.1


