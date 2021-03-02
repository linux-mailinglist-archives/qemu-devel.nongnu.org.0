Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FBE32ABE7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 21:56:52 +0100 (CET)
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHC4Z-0001x3-Np
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 15:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwh-0001Ye-0V
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:43 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46076
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwe-000874-MJ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:42 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122Kiv0r019672; Tue, 2 Mar 2021 15:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=14BKeqquuNbtx2IcmuWrKO9c62dlnNtxt5S70nonB2Q=;
 b=p9rDjJ4LIeHlC5gaiGZY12lY4oIn+bsMtUQi3bVbkbEoKcfJ1xzZl41fUrhSMfB+BUlX
 dJqoEc/otTqGppCWwT/v95qRah4QpOTfTZfJNfVMAcMaKmom9GI9771CtT2K2reSKiIL
 YwO+v8qL9cSJ6IpRJ8uF3oRJTzjuLHf5HTiuJxCEtlg8mAtdAsVTnr7p4RtC1mgxWZca
 /uwDsOPM1gM86BSiTauEV5BtjO6FrVrpi5rlOXLQgofx5kwXG3XmLsYdLClTrmQT0uY8
 DETyDIhTsJmim7IkBCsNq31LDmyODtzibqTg++Vscs3xePOq4zi/wXuJWI0hf3CnLzh0 oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371vnsr4sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:37 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122Kir2j019571;
 Tue, 2 Mar 2021 15:48:37 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371vnsr4s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:37 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122Km7iv013967;
 Tue, 2 Mar 2021 20:48:36 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 37103w5sgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:36 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmZGX26280300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:35 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C5D628058;
 Tue,  2 Mar 2021 20:48:35 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3FC528060;
 Tue,  2 Mar 2021 20:48:34 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:34 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 25/26] target/i386: SEV: Allow migration unless there are
 no aux vcpus
Date: Tue,  2 Mar 2021 15:48:21 -0500
Message-Id: <20210302204822.81901-26-dovmurik@linux.vnet.ibm.com>
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
 malwarescore=0
 mlxlogscore=997 clxscore=1015 mlxscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 James Bottomley <jejb@linux.ibm.com>, Jon Grimm <jon.grimm@amd.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Memory-encrypted guests require a migration helper running on an
auxiliary vcpu inside the guest in order to migrate RAM to the target.
When there are no auxiliary vcpus, block migration attempts.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 target/i386/sev.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index da2d0cc699..f22f9b29ea 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -32,6 +32,7 @@
 #include "qom/object.h"
 #include "exec/address-spaces.h"
 #include "monitor/monitor.h"
+#include "hw/boards.h"
 #include "exec/confidential-guest-support.h"
 #include "migration/confidential-ram.h"
 #include "hw/i386/pc.h"
@@ -669,6 +670,7 @@ sev_launch_finish(SevGuestState *sev)
 {
     int ret, error;
     Error *local_err = NULL;
+    MachineState *ms = MACHINE(qdev_get_machine());
 
     trace_kvm_sev_launch_finish();
     ret = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_FINISH, 0, &error);
@@ -680,14 +682,19 @@ sev_launch_finish(SevGuestState *sev)
 
     sev_set_guest_state(sev, SEV_STATE_RUNNING);
 
-    /* add migration blocker */
-    error_setg(&sev_mig_blocker,
-               "SEV: Migration is not implemented");
-    ret = migrate_add_blocker(sev_mig_blocker, &local_err);
-    if (local_err) {
-        error_report_err(local_err);
-        error_free(sev_mig_blocker);
-        exit(1);
+    /*
+     * SEV migration is not supported unless there's an auxiliary CPU running
+     * the guest-assisted migration helper.
+     */
+    if (ms->smp.aux_cpus == 0) {
+        error_setg(&sev_mig_blocker,
+                   "SEV: Migration is not implemented");
+        ret = migrate_add_blocker(sev_mig_blocker, &local_err);
+        if (local_err) {
+            error_report_err(local_err);
+            error_free(sev_mig_blocker);
+            exit(1);
+        }
     }
 }
 
-- 
2.20.1


