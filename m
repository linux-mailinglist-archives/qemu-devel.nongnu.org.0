Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABB34D462C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:45:38 +0100 (CET)
Received: from localhost ([::1]:35520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHEf-0003JB-75
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:45:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGw8-00047k-66; Thu, 10 Mar 2022 06:26:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGw5-0007e1-Ai; Thu, 10 Mar 2022 06:26:27 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22A9rUPh020375; 
 Thu, 10 Mar 2022 11:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5L7chknyGsJC8KJbi6eRkcjnG3uPCY30/xmnW2hFyf0=;
 b=iZ8Ue9mK8fraW5kWI2UTM03SS76S4sk6uzw0KTF3JzVSOKDy4IvGWqcgBtmRtCCMDJ7A
 kc3JT50dzyu4d5wR/Ls1/Xak8iKIYakvg4IR8KvpTrRe5BVn+hU3zwimjbA5M/xWqMpx
 PdK0pS//H9RoIxlcj+3+W2k1JYcY2NSeTlAzwQXi2lrXRBPGKLSKdRL4q5iZCdYuE9ZJ
 mNhBpNxKGZekymCEl0ggNBRKHBu/NbSxhH+jZaz48CYtKS9diqMzRyre74HDTSGHWgA0
 FFpAzhn6js117xe26AXYVn95mQjkdPIUPACW9I3zltJRfMPp84cIuVJLlCKT6Ps3HzAg lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqf3n1r5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:26:23 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AAYRJZ015092;
 Thu, 10 Mar 2022 11:26:23 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqf3n1r4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:26:23 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ABDQig009190;
 Thu, 10 Mar 2022 11:26:20 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3eky4j4jc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:26:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22ABQHZt47907180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:26:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81FDF42049;
 Thu, 10 Mar 2022 11:26:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85B154203F;
 Thu, 10 Mar 2022 11:26:16 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:26:16 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] s390x: Add KVM PV dump interface
Date: Thu, 10 Mar 2022 11:25:46 +0000
Message-Id: <20220310112547.3823-5-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310112547.3823-1-frankja@linux.ibm.com>
References: <20220310112547.3823-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rj1-QWYWwwYATgZC907sV2ekBPpmy7sy
X-Proofpoint-GUID: MB6R0SzZ8dcQblTck1MhNrnae2SomjTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Let's add a few bits of code which hide the new KVM PV dump API from
us via new functions.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 hw/s390x/pv.c         | 52 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/s390x/pv.h |  8 +++++++
 2 files changed, 60 insertions(+)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index a5af4ddf46..d6625fa374 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -175,6 +175,58 @@ bool kvm_s390_pv_info_basic_valid(void)
     return info_valid;
 }
 
+static int s390_pv_dump_cmd(uint64_t subcmd, uint64_t uaddr, uint64_t gaddr,
+                            uint64_t len)
+{
+    struct kvm_s390_pv_dmp dmp = {
+        .subcmd = subcmd,
+        .buff_addr = uaddr,
+        .buff_len = len,
+        .gaddr = gaddr,
+    };
+    int ret;
+
+    ret = s390_pv_cmd(KVM_PV_DUMP, (void *)&dmp);
+    if (ret) {
+        error_report("KVM DUMP command %ld failed", subcmd);
+
+    }
+    return ret;
+}
+
+int kvm_s390_dump_cpu(S390CPU *cpu, void *buff)
+{
+    struct kvm_s390_pv_dmp dmp = {
+        .subcmd = KVM_PV_DUMP_CPU,
+        .buff_addr = (uint64_t)buff,
+        .gaddr = 0,
+        .buff_len = info_dump.dump_cpu_buffer_len,
+    };
+    struct kvm_pv_cmd pv = {
+        .cmd = KVM_PV_DUMP,
+        .data = (uint64_t)&dmp,
+    };
+
+    return kvm_vcpu_ioctl(CPU(cpu), KVM_S390_PV_CPU_COMMAND, &pv);
+}
+
+int kvm_s390_dump_init(void)
+{
+    return s390_pv_dump_cmd(KVM_PV_DUMP_INIT, 0, 0, 0);
+}
+
+int kvm_s390_dump_mem(uint64_t gaddr, size_t len, void *dest)
+{
+    return s390_pv_dump_cmd(KVM_PV_DUMP_CONFIG_STATE, (uint64_t)dest,
+                            gaddr, len);
+}
+
+int kvm_s390_dump_finish(void *buff)
+{
+    return s390_pv_dump_cmd(KVM_PV_DUMP_COMPLETE, (uint64_t)buff, 0,
+                            info_dump.dump_config_finalize_len);
+}
+
 #define TYPE_S390_PV_GUEST "s390-pv-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(S390PVGuest, S390_PV_GUEST)
 
diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 6fa55bf70e..f37021e189 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -51,6 +51,10 @@ uint64_t kvm_s390_pv_dmp_get_size_cpu(void);
 uint64_t kvm_s390_pv_dmp_get_size_mem(void);
 uint64_t kvm_s390_pv_dmp_get_size_complete(void);
 bool kvm_s390_pv_info_basic_valid(void);
+int kvm_s390_dump_init(void);
+int kvm_s390_dump_cpu(S390CPU *cpu, void *buff);
+int kvm_s390_dump_mem(uint64_t addr, size_t len, void *dest);
+int kvm_s390_dump_finish(void *buff);
 #else /* CONFIG_KVM */
 static inline bool s390_is_pv(void) { return false; }
 static inline int s390_pv_query_info(void) { return 0; }
@@ -66,6 +70,10 @@ static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void) { return 0; }
 static inline uint64_t kvm_s390_pv_dmp_get_size_mem(void) { return 0; }
 static inline uint64_t kvm_s390_pv_dmp_get_size_complete(void) { return 0; }
 static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }
+static inline int kvm_s390_dump_init(void) { return 0; }
+static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff, size_t len) { return 0; }
+static inline int kvm_s390_dump_mem(uint64_t addr, size_t len, void *dest) { return 0; }
+static inline int kvm_s390_dump_finish(void *buff) { return 0; }
 #endif /* CONFIG_KVM */
 
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
-- 
2.32.0


