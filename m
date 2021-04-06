Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F75354C60
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 07:42:42 +0200 (CEST)
Received: from localhost ([::1]:52078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTeU5-0003R0-37
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 01:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ravi.bangoria@linux.ibm.com>)
 id 1lTeR4-0000p1-Ee; Tue, 06 Apr 2021 01:39:34 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36612
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ravi.bangoria@linux.ibm.com>)
 id 1lTeR1-0002wj-Ij; Tue, 06 Apr 2021 01:39:34 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1365YuOY057709; Tue, 6 Apr 2021 01:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YbhVLhB/fTHiNuq6es7ZeDfxBnJVH+H/SDt1CN+GezM=;
 b=cQaBwx4x1Zxac3DKWaFXFG2y7SIu7gXNfvfVxuh8pqv5DtrbccJcsZ2TrcaUrJRXKqrV
 eaXhL07ZAtSbcThLQm6InSOd5KPzuKIM9HKfAPKMzHZ/gDjshd4S8wYi+gVUrPHYXhIf
 MdQqW46xBlsEUw5PxQB1FKWPOw1eI5yIfXUjzk1d3eibx20n+jYQKdTyjJ1XIy1dzUpT
 CIhgoJuQ3Zb+RuK2+ka/GjWDXEYruGL+QVU2oKGDMQC7dW6+InNRleu05CrrEIvDkPBv
 lc5ZSDmxhfNW0dPcT5UHmYba+8N5JnHi2nqAyjoZWuXwNZFcHHmaJSF22VacZwYLdpnf 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37q5wae7r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 01:39:19 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1365ZZHT060150;
 Tue, 6 Apr 2021 01:39:19 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37q5wae7qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 01:39:19 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1365bNSG030269;
 Tue, 6 Apr 2021 05:39:17 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 37q2nr8ya7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 05:39:17 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1365dFfU47514044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 05:39:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D22D5204E;
 Tue,  6 Apr 2021 05:39:15 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.40.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1BA7252050;
 Tue,  6 Apr 2021 05:39:11 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: paulus@samba.org, david@gibson.dropbear.id.au
Subject: [PATCH v4 2/3] ppc: Rename current DAWR macros and variables
Date: Tue,  6 Apr 2021 11:08:32 +0530
Message-Id: <20210406053833.282907-3-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406053833.282907-1-ravi.bangoria@linux.ibm.com>
References: <20210406053833.282907-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HkSdCMxibGWe-N_W_LWYgUBoRtGXWveT
X-Proofpoint-ORIG-GUID: -x764EhJAq3aGEScrZhy-pmp1J7KauvV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_01:2021-04-01,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104060037
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=ravi.bangoria@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, kvm@vger.kernel.org,
 mst@redhat.com, mpe@ellerman.id.au, cohuck@redhat.com, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Power10 is introducing second DAWR. Use real register names (with
suffix 0) from ISA for current macros and variables used by Qemu.

One exception to this is KVM_REG_PPC_DAWR[X]. This is from kernel
uapi header and thus not changed in kernel as well as Qemu.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/ppc/spapr.h          | 2 +-
 target/ppc/cpu.h                | 4 ++--
 target/ppc/translate_init.c.inc | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index bf7cab7a2c..5f90bb26d5 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -363,7 +363,7 @@ struct SpaprMachineState {
 
 /* Values for 2nd argument to H_SET_MODE */
 #define H_SET_MODE_RESOURCE_SET_CIABR           1
-#define H_SET_MODE_RESOURCE_SET_DAWR            2
+#define H_SET_MODE_RESOURCE_SET_DAWR0           2
 #define H_SET_MODE_RESOURCE_ADDR_TRANS_MODE     3
 #define H_SET_MODE_RESOURCE_LE                  4
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e73416da68..cd02d65303 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1459,10 +1459,10 @@ typedef PowerPCCPU ArchCPU;
 #define SPR_MPC_BAR           (0x09F)
 #define SPR_PSPB              (0x09F)
 #define SPR_DPDES             (0x0B0)
-#define SPR_DAWR              (0x0B4)
+#define SPR_DAWR0             (0x0B4)
 #define SPR_RPR               (0x0BA)
 #define SPR_CIABR             (0x0BB)
-#define SPR_DAWRX             (0x0BC)
+#define SPR_DAWRX0            (0x0BC)
 #define SPR_HFSCR             (0x0BE)
 #define SPR_VRSAVE            (0x100)
 #define SPR_USPRG0            (0x100)
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index c03a7c4f52..879e6df217 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -7748,12 +7748,12 @@ static void gen_spr_book3s_dbg(CPUPPCState *env)
 
 static void gen_spr_book3s_207_dbg(CPUPPCState *env)
 {
-    spr_register_kvm_hv(env, SPR_DAWR, "DAWR",
+    spr_register_kvm_hv(env, SPR_DAWR0, "DAWR0",
                         SPR_NOACCESS, SPR_NOACCESS,
                         SPR_NOACCESS, SPR_NOACCESS,
                         &spr_read_generic, &spr_write_generic,
                         KVM_REG_PPC_DAWR, 0x00000000);
-    spr_register_kvm_hv(env, SPR_DAWRX, "DAWRX",
+    spr_register_kvm_hv(env, SPR_DAWRX0, "DAWRX0",
                         SPR_NOACCESS, SPR_NOACCESS,
                         SPR_NOACCESS, SPR_NOACCESS,
                         &spr_read_generic, &spr_write_generic,
-- 
2.17.1


