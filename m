Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC4957CC10
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 15:37:10 +0200 (CEST)
Received: from localhost ([::1]:52376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEWMX-0001yI-OJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 09:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9f-0000jm-BQ; Thu, 21 Jul 2022 09:23:51 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9d-0006Ye-JA; Thu, 21 Jul 2022 09:23:51 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LDDCos024190;
 Thu, 21 Jul 2022 13:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=x2KIVRm57N9iE8lz93uS2+n+9pi6rYjnxmQ80l5Ez54=;
 b=AcncBP8iETTMGFuU3lDxsunvmadYvqbYl1bgx8MpzWA+GNm6Aft8WTetlIwlngXiTK/Y
 1dWX9MPtHuqRUEv3LY9lWtWzEFDwaAl9EygAZll9i8wVv5SYkMeZw0g7mMx+UOpU6Gtr
 Bsmecm4UVrsi0D86aPC93OKd54ekD6AuDU17AE4P/79DzNwKZCgQUTcooopp1kV16de2
 mUb7C3Vilhy5kaUvhFsUJ8Xr66qT5bv0GFsB6mt9wJNG6bwJddHfUYmNhvxKjhojCzkH
 cJMt9W1ZwJ8yII/HF32viC2hZcV1rgGnVAw6KLVr17FA31ysZgxyzbG0o1jEjAN65o97 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf61g3gw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:47 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LDDK5K026009;
 Thu, 21 Jul 2022 13:23:47 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf61g3gv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:46 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LDNjQW029805;
 Thu, 21 Jul 2022 13:23:45 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3hbmkj70kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26LDNfJf22020398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 13:23:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B68894C04E;
 Thu, 21 Jul 2022 13:23:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8B344C040;
 Thu, 21 Jul 2022 13:23:40 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 13:23:40 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Subject: [PATCH v3 12/14] s390x: Introduce PV query interface
Date: Thu, 21 Jul 2022 13:22:54 +0000
Message-Id: <20220721132256.2171-13-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721132256.2171-1-frankja@linux.ibm.com>
References: <20220721132256.2171-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4U_ZzXB37o9UjlJ62_fxeJ6etPHbnm10
X-Proofpoint-GUID: koW0VTz2X3LuEofizR9Q7B0ggU9cgBym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_17,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207210053
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
index cc3097bfee..f9401e392b 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -366,6 +366,11 @@ static int s390_machine_protect(S390CcwMachineState *ms)
 
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
2.34.1


