Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D160232AC27
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:18:44 +0100 (CET)
Received: from localhost ([::1]:49562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCPj-0000eC-TX
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBx3-00020b-Ue
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:49:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwo-00086s-Hx
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:49:04 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122Khgbm168482; Tue, 2 Mar 2021 15:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VupSK9vxmDvSP6JLi0c6Yu9Pi+xtlZZyF6WflQwMfxs=;
 b=mik5DVqt6+15FtUzTJh+B8IMxC6Erkzl5npE8GplPfggh2RLXfnv16DFu1fQp+hYNVNT
 +trSzluFO8Eqxn/FNXjvQa12o0FQJuDUP+k9u3ZF8MN72U/OTlHuALvbTLMhK+hvSrIs
 3hqNj+aYs5kU6SEvhql+ZLcVpktT4cZUat/u80LNhPOPH17eGGSaUxe32R7AfFYjHQBF
 +Md4CxwNtGV+bZ/yz5mdlobfK8pwFOPLcfva/f/ihurKyEuPzxQa0AmMdOcmbdleFKAW
 zCyuZ5FBTNBrITa+mWkkhLCVYnsUBwGlB/vCAz0NaD6dOH/i/w402oU1G1b0IwP/QKKz ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vnd05jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:36 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122KhnZW168816;
 Tue, 2 Mar 2021 15:48:33 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vnd05hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:33 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122KkqnI028108;
 Tue, 2 Mar 2021 20:48:32 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 371qmuagu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:32 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmVDV25887066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:31 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04D9028058;
 Tue,  2 Mar 2021 20:48:31 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCD072805E;
 Tue,  2 Mar 2021 20:48:30 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:30 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/26] softmmu: Add cpu_synchronize_without_aux_post_init
Date: Tue,  2 Mar 2021 15:48:06 -0500
Message-Id: <20210302204822.81901-11-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
References: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 James Bottomley <jejb@linux.ibm.com>, Jon Grimm <jon.grimm@amd.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be used during migration on the target.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 include/sysemu/cpus.h |  1 +
 softmmu/cpus.c        | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index 868f1192de..dc24e38254 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -46,6 +46,7 @@ bool cpus_are_resettable(void);
 void cpu_synchronize_all_states(void);
 void cpu_synchronize_all_post_reset(void);
 void cpu_synchronize_all_post_init(void);
+void cpu_synchronize_without_aux_post_init(void);
 void cpu_synchronize_all_pre_loadvm(void);
 
 #ifndef CONFIG_USER_ONLY
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 878cf2a421..68fa4639a7 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -157,6 +157,17 @@ void cpu_synchronize_all_post_init(void)
     }
 }
 
+void cpu_synchronize_without_aux_post_init(void)
+{
+    CPUState *cpu;
+
+    CPU_FOREACH(cpu) {
+        if (!cpu->aux) {
+            cpu_synchronize_post_init(cpu);
+        }
+    }
+}
+
 void cpu_synchronize_all_pre_loadvm(void)
 {
     CPUState *cpu;
-- 
2.20.1


