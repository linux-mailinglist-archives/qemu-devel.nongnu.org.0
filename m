Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E171F4D45F4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:42:02 +0100 (CET)
Received: from localhost ([::1]:54986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHBB-0005uc-Vm
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:42:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGw6-00043y-Je; Thu, 10 Mar 2022 06:26:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGw4-0007dZ-Jv; Thu, 10 Mar 2022 06:26:26 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AA2f8u011779; 
 Thu, 10 Mar 2022 11:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tSSKVu/XjzXvz6Mb7DTwxwOn0iUuY88l8THC2mJUq60=;
 b=dx9zl6W6iKSdPbF+S0Qli3UAXlSaobGBQyIPrFTR/jxiG8cXLUnCoAj9pHk6vLHxSFz0
 G3MYNDNWmPKqwcLKQfKTL8Cbmcolu2O7Twm7ff8SQLj4dlSBDlnXRdGWNwbhlqEOsGF/
 eIBZWWUYS1ka2yMIoYBQsfJKEHzLIf6I3XQtSTbND3GTSc/TRvtTkiEMdH+igJz1bEaJ
 Q9g7jahcXQ/ks3HaocrwH8Thj+GhNeDSAOPCq1Z0YAfuVREVL6l0lWk6dpcbq1ChQuc1
 kxFne3hElQWFsECiW2JveeYfj9ffryHjye0NWJK2TgkRy+mn6mPHXb1FkKr10xGZpgVt ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqctrcneq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:26:22 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ABLUxm009445;
 Thu, 10 Mar 2022 11:26:22 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqctrcne1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:26:21 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ABC1cM024037;
 Thu, 10 Mar 2022 11:26:19 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3enqgnq2kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:26:19 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22ABQGbE21627236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:26:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F0E642049;
 Thu, 10 Mar 2022 11:26:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 637DF42041;
 Thu, 10 Mar 2022 11:26:15 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:26:15 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] s390x: Introduce PV query interface
Date: Thu, 10 Mar 2022 11:25:45 +0000
Message-Id: <20220310112547.3823-4-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310112547.3823-1-frankja@linux.ibm.com>
References: <20220310112547.3823-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: brn2MYQvC03iozF1OTHKT7sx60fQDCn6
X-Proofpoint-ORIG-GUID: qIYZKjBB_Yz5Z-tR0w3O7FXbyjv-6juN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100059
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, borntraeger@linux.ibm.com, cohuck@redhat.com,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, mhartmay@linux.ibm.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce an interface over which we can get information about UV data.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 hw/s390x/pv.c              | 61 ++++++++++++++++++++++++++++++++++++++
 hw/s390x/s390-virtio-ccw.c |  5 ++++
 include/hw/s390x/pv.h      | 10 +++++++
 3 files changed, 76 insertions(+)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 401b63d6cb..a5af4ddf46 100644
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
+                     info.header.id, strerror(rc));
+        return rc;
+    }
+    memcpy(&info_vm, &info.vm, sizeof(info.vm));
+
+    info.header.id = KVM_PV_INFO_DUMP;
+    info.header.len_max = sizeof(info.header) + sizeof(info.dump);
+    rc = s390_pv_cmd(KVM_PV_INFO, &info);
+    if (rc) {
+        error_report("KVM PV INFO cmd %x failed: %s",
+                     info.header.id, strerror(rc));
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
+uint64_t kvm_s390_pv_dmp_get_size_complete(void)
+{
+    return info_dump.dump_config_finalize_len;
+}
+
+uint64_t kvm_s390_pv_dmp_get_size_mem(void)
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
index 84e3e63c43..abb165031e 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -365,6 +365,11 @@ static int s390_machine_protect(S390CcwMachineState *ms)
 
     ms->pv = true;
 
+    rc = s390_pv_query_info();
+    if (rc) {
+        goto out_err;
+    }
+
     /* Set SE header and unpack */
     rc = s390_ipl_prepare_pv_header();
     if (rc) {
diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 1f1f545bfc..6fa55bf70e 100644
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
+uint64_t kvm_s390_pv_dmp_get_size_mem(void);
+uint64_t kvm_s390_pv_dmp_get_size_complete(void);
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
+static inline uint64_t kvm_s390_pv_dmp_get_size_mem(void) { return 0; }
+static inline uint64_t kvm_s390_pv_dmp_get_size_complete(void) { return 0; }
+static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }
 #endif /* CONFIG_KVM */
 
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
-- 
2.32.0


