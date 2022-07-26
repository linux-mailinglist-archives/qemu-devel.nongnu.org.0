Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431C581046
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:47:15 +0200 (CEST)
Received: from localhost ([::1]:39122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGH9m-0007RH-BB
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGnH-0004fY-Sj; Tue, 26 Jul 2022 05:24:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGnG-0005b0-1e; Tue, 26 Jul 2022 05:23:59 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q8rVrC003302;
 Tue, 26 Jul 2022 09:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9dkoH7yZe5wC+2uqdq25GnS30EFA2vvlokv8l171feU=;
 b=sCCtoaXX/NI1jqlqTyJEycmJ86InGdDJroBfnbw60/2YPkZY+8p1ErU9tqD3KmfcS53F
 HUe1ARjqYq3JpUf3sJTC9DU+X4cQmxotxLPVdagRTMlJObM8J+OSQUFmeHefKb8l0+Jd
 oPKWZEargj6VM+F7UY3RvD39aztClf7nhz9EvbCPfCgJiGm+i3ArYGgxHPRbbTcR8tjC
 FG9TpIGSLYTS8D4RVSiK9nBeftqCmQwDe0YBjEGNcgrjukzs0hQgvW8tj7i8WAanvwoQ
 xqwMO6OKUnOwAu5npoVoG9Do/q6y63USAkhIk0x3KA+XaG/8gLGqIUsts0g7xIfktWof Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjd59gtr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:56 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26Q8rYcj003419;
 Tue, 26 Jul 2022 09:23:55 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjd59gtq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:55 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26Q9LVHO002961;
 Tue, 26 Jul 2022 09:23:53 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3hg946bhyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26Q9NnSZ18678076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 09:23:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A67EFA4060;
 Tue, 26 Jul 2022 09:23:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86191A4054;
 Tue, 26 Jul 2022 09:23:48 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 09:23:48 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v4 16/17] s390x: Add KVM PV dump interface
Date: Tue, 26 Jul 2022 09:22:47 +0000
Message-Id: <20220726092248.128336-17-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726092248.128336-1-frankja@linux.ibm.com>
References: <20220726092248.128336-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iqZIzvW4VpCqej4b2yQte-bnYqFXgIoU
X-Proofpoint-ORIG-GUID: zcYNcKPqYioYkiKYkJrUjYCXgJvSws3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_02,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260033
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

Let's add a few bits of code which hide the new KVM PV dump API from
us via new functions.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 hw/s390x/pv.c         | 51 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/s390x/pv.h |  8 +++++++
 2 files changed, 59 insertions(+)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 2b892b45e8..ce3b6ad3e9 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -175,6 +175,57 @@ bool kvm_s390_pv_info_basic_valid(void)
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
+int kvm_s390_dump_complete(void *buff)
+{
+    return s390_pv_dump_cmd(KVM_PV_DUMP_COMPLETE, (uint64_t)buff, 0,
+                            info_dump.dump_config_finalize_len);
+}
+
 #define TYPE_S390_PV_GUEST "s390-pv-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(S390PVGuest, S390_PV_GUEST)
 
diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 573259cf2b..02a6c06b9f 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -51,6 +51,10 @@ uint64_t kvm_s390_pv_dmp_get_size_cpu(void);
 uint64_t kvm_s390_pv_dmp_get_size_stor_state(void);
 uint64_t kvm_s390_pv_dmp_get_size_complete(void);
 bool kvm_s390_pv_info_basic_valid(void);
+int kvm_s390_dump_init(void);
+int kvm_s390_dump_cpu(S390CPU *cpu, void *buff);
+int kvm_s390_dump_mem(uint64_t addr, size_t len, void *dest);
+int kvm_s390_dump_complete(void *buff);
 #else /* CONFIG_KVM */
 static inline bool s390_is_pv(void) { return false; }
 static inline int s390_pv_query_info(void) { return 0; }
@@ -66,6 +70,10 @@ static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void) { return 0; }
 static inline uint64_t kvm_s390_pv_dmp_get_size_stor_state(void) { return 0; }
 static inline uint64_t kvm_s390_pv_dmp_get_size_complete(void) { return 0; }
 static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }
+static inline int kvm_s390_dump_init(void) { return 0; }
+static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff, size_t len) { return 0; }
+static inline int kvm_s390_dump_mem(uint64_t addr, size_t len, void *dest) { return 0; }
+static inline int kvm_s390_dump_complete(void *buff) { return 0; }
 #endif /* CONFIG_KVM */
 
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
-- 
2.34.1


