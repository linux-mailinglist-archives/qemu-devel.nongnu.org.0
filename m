Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0D432AC06
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:04:54 +0100 (CET)
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCCL-0002OU-Tm
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwf-0001UD-JK
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwd-00086M-1V
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:41 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KhIIu124566; Tue, 2 Mar 2021 15:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=565rVDpXIrueRMe9M5o87ZC7PkPqDvOeL6fY0lx2glQ=;
 b=ViyO6owMuHUY4A5e8fcwqWKMo2y5270Z1L4uxh0mEc2odKZZaYt72NzW6UpONTWEuJm3
 7zSloA06TQKBc/OB0DegD61Z//GwRJPvrODzmQggtO/FNtGPPVl+iFTd5Gh6KPF4wLwf
 uTmx6lyjev1LQUJv5KuUTiWmjSxDgNb/GuLUNbej8pSxcrvTppOwe7D5HytRLW5VVFPJ
 WsmfdPHGIgSzYnhZZNCd1OOoGgwq3IcXO7yzDFA+OXMBuUAhwnDwJbgT636MfhyBxFv/
 tr9CrMeKK5bsthRNiHB+CwfF8BMkO3RNCDs0HJGo2kzxoBqxvajV4gUvFpylY+1MF+6E ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vn7r7e6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:35 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122KhI0H124650;
 Tue, 2 Mar 2021 15:48:34 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vn7r7dd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:34 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122KX0ma018064;
 Tue, 2 Mar 2021 20:48:34 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 3711dwtf74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:34 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmX0X24838436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:33 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29D2B28059;
 Tue,  2 Mar 2021 20:48:33 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2E4928058;
 Tue,  2 Mar 2021 20:48:32 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:32 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 18/26] migration: Stop non-aux vcpus before copying the
 last pages
Date: Tue,  2 Mar 2021 15:48:14 -0500
Message-Id: <20210302204822.81901-19-dovmurik@linux.vnet.ibm.com>
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
 phishscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
 Brijesh Singh <brijesh.singh@amd.com>, Juan Quintela <quintela@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Jon Grimm <jon.grimm@amd.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>

Co-Author: Dov Murik <dovmurik@linux.vnet.ibm.com>
Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
Signed-off-by: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
---
 migration/migration.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index a5ddf43559..7ec25bd006 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -24,6 +24,7 @@
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-throttle.h"
+#include "sysemu/cpus.h"
 #include "rdma.h"
 #include "ram.h"
 #include "migration/global_state.h"
@@ -3156,14 +3157,14 @@ static void migration_completion(MigrationState *s)
         qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
         s->vm_was_running = runstate_is_running();
         ret = global_state_store();
+        pause_all_vcpus_except_aux();
+        qemu_mutex_unlock_iothread();
 
         if (!ret) {
             bool inactivate = !migrate_colo_enabled();
-            ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
-            if (ret >= 0) {
-                ret = migration_maybe_pause(s, &current_active_state,
-                                            MIGRATION_STATUS_DEVICE);
-            }
+            ret = migration_maybe_pause(s, &current_active_state,
+                                        MIGRATION_STATUS_DEVICE);
+
             if (ret >= 0) {
                 qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
                 ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
@@ -3173,7 +3174,7 @@ static void migration_completion(MigrationState *s)
                 s->block_inactive = true;
             }
         }
-        qemu_mutex_unlock_iothread();
+        runstate_set(RUN_STATE_FINISH_MIGRATE);
 
         if (ret < 0) {
             goto fail;
-- 
2.20.1


