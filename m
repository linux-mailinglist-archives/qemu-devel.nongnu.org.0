Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29229600987
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:57:26 +0200 (CEST)
Received: from localhost ([::1]:53614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLw5-0006V9-9g
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLf2-0007yc-65; Mon, 17 Oct 2022 04:39:48 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLf0-0003gP-FG; Mon, 17 Oct 2022 04:39:47 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H7oQwV016588;
 Mon, 17 Oct 2022 08:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=42tAQUP85Z8fwbCa6bQy5Dxe9ZyGCzu20YSf8Mu3uSA=;
 b=M5sVe0/GtxM5OzoOVbr74w//OYXNsPjHSlJtA4zwdhbvUxhtXX5EyzjCJZdhEYhLTtoo
 CeEAfOUc1zNMYEeRgkT3mYQeQ8IWeANte1bCR5h6Q6eoqD3smuTFvfKwwpk0GWe0V0r2
 HCofDWLMrDZp7MjpBJSX7c7H7AjG1TSKuO3fFolN6rPoIAvg4HxBgqELFinzTCNGK48B
 WNqBfFV6D9EOno42BQGzIx/f+icv4PFaxlkOgLtTcKyx+YJLtpAzhnTMrxDta2Ar4Epl
 b/D4pynoMIe3vjHjg7yB11s2oJKhseDywIkiwlcxaaJubXkD4aOAK4lVEhvxO7FPkNLF 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86hk98pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:42 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29H8bmdX000618;
 Mon, 17 Oct 2022 08:39:42 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86hk98p1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:42 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29H8bdf0003448;
 Mon, 17 Oct 2022 08:39:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3k7m4ja19n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29H8dbwb262666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 08:39:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DFC0A4040;
 Mon, 17 Oct 2022 08:39:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BC01A404D;
 Mon, 17 Oct 2022 08:39:36 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Oct 2022 08:39:36 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v6 09/10] s390x: Add KVM PV dump interface
Date: Mon, 17 Oct 2022 08:38:21 +0000
Message-Id: <20221017083822.43118-10-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017083822.43118-1-frankja@linux.ibm.com>
References: <20221017083822.43118-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TOauBdeJxuI0l-RVfA_y2jErYOFlkHow
X-Proofpoint-ORIG-GUID: lS0GgEpEGp_8p1FDtNjflVVpIMH_Y8Wn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_06,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 spamscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170046
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Let's add a few bits of code which hide the new KVM PV dump API from
us via new functions.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
---
 hw/s390x/pv.c         | 51 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/s390x/pv.h |  9 ++++++++
 2 files changed, 60 insertions(+)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 4c012f2eeb..728ba24547 100644
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
+int kvm_s390_dump_mem_state(uint64_t gaddr, size_t len, void *dest)
+{
+    return s390_pv_dump_cmd(KVM_PV_DUMP_CONFIG_STOR_STATE, (uint64_t)dest,
+                            gaddr, len);
+}
+
+int kvm_s390_dump_completion_data(void *buff)
+{
+    return s390_pv_dump_cmd(KVM_PV_DUMP_COMPLETE, (uint64_t)buff, 0,
+                            info_dump.dump_config_finalize_len);
+}
+
 #define TYPE_S390_PV_GUEST "s390-pv-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(S390PVGuest, S390_PV_GUEST)
 
diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index e5ea0eca16..3164006674 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -51,6 +51,10 @@ uint64_t kvm_s390_pv_dmp_get_size_cpu(void);
 uint64_t kvm_s390_pv_dmp_get_size_mem_state(void);
 uint64_t kvm_s390_pv_dmp_get_size_completion_data(void);
 bool kvm_s390_pv_info_basic_valid(void);
+int kvm_s390_dump_init(void);
+int kvm_s390_dump_cpu(S390CPU *cpu, void *buff);
+int kvm_s390_dump_mem_state(uint64_t addr, size_t len, void *dest);
+int kvm_s390_dump_completion_data(void *buff);
 #else /* CONFIG_KVM */
 static inline bool s390_is_pv(void) { return false; }
 static inline int s390_pv_query_info(void) { return 0; }
@@ -66,6 +70,11 @@ static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void) { return 0; }
 static inline uint64_t kvm_s390_pv_dmp_get_size_mem_state(void) { return 0; }
 static inline uint64_t kvm_s390_pv_dmp_get_size_completion_data(void) { return 0; }
 static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }
+static inline int kvm_s390_dump_init(void) { return 0; }
+static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff, size_t len) { return 0; }
+static inline int kvm_s390_dump_mem_state(uint64_t addr, size_t len,
+                                          void *dest) { return 0; }
+static inline int kvm_s390_dump_completion_data(void *buff) { return 0; }
 #endif /* CONFIG_KVM */
 
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
-- 
2.34.1


