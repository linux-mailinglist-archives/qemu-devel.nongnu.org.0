Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2AF3F4C35
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 16:19:02 +0200 (CEST)
Received: from localhost ([::1]:43610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIAmz-0000uj-48
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 10:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAl1-0006k5-JQ
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:16:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36407
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAky-0000v6-7c
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:16:59 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NEBxjt147206; Mon, 23 Aug 2021 10:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WZAqgdalblGZs59iyVHmRv3UBNpHs+vOrmPdnc1cRQw=;
 b=n02YSaZVkLPPvic2vdV66tCkjxgUaMpKOP5lOdswapDSaTLe3n+mqiWmwt1rRD5GT6Cw
 UyLFvOVDXwUag8JgCXf1UMoAj73AaAixwNyQaDx6HzVuhKhJIvi+TlexwSCc4gLcQPSv
 Xib04Z3Fqsy/LhsjYPQcZKU088bTz9uYnfNL9Jfk4bha+RAJZkJ6FNC8JmzOIJOPnA3X
 Q6gICr2CIqakcslyUkjIM7ATKHEu8eOdEI18LHcHMFnDTQm/efhHmtdyTJqlvpiQs6qA
 AgLUDn16o1z8H4KWISnFdNUIUB50IEwWX9ZeOcFKIJ1yLAeY98qZ3XVGpwHofld4RJOT Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3akexysrur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:49 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NE4bP1105622;
 Mon, 23 Aug 2021 10:16:49 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3akexysru3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:49 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NEDD3A021205;
 Mon, 23 Aug 2021 14:16:48 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3ajs4bknsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:16:48 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17NEGlHM17236318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 14:16:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4442C112066;
 Mon, 23 Aug 2021 14:16:47 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A612112069;
 Mon, 23 Aug 2021 14:16:47 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 14:16:46 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 03/12] migration: Introduce
 gpa_inside_migration_helper_shared_area
Date: Mon, 23 Aug 2021 10:16:27 -0400
Message-Id: <20210823141636.65975-4-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210823141636.65975-1-dovmurik@linux.ibm.com>
References: <20210823141636.65975-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2Bv8RuuXr51BjuvFT3rLmzWGDpGkNg28
X-Proofpoint-ORIG-GUID: 6JNsZZH2OU5I9YZRA3d1lslV4kdGNFMy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_03:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108230098
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Steve Rutherford <srutherford@google.com>,
 James Bottomley <jejb@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gpa_inside_migration_helper_shared_area will be used to skip
migrating RAM pages that are used by the migration helper at the target.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 migration/confidential-ram.h | 2 ++
 migration/confidential-ram.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/migration/confidential-ram.h b/migration/confidential-ram.h
index ebe4073bce..9a1027bdaf 100644
--- a/migration/confidential-ram.h
+++ b/migration/confidential-ram.h
@@ -8,6 +8,8 @@
 #include "exec/cpu-common.h"
 #include "qemu-file.h"
 
+bool gpa_inside_migration_helper_shared_area(ram_addr_t gpa);
+
 void cgs_mh_init(void);
 void cgs_mh_cleanup(void);
 
diff --git a/migration/confidential-ram.c b/migration/confidential-ram.c
index 053ecea1d4..30002448b9 100644
--- a/migration/confidential-ram.c
+++ b/migration/confidential-ram.c
@@ -68,6 +68,12 @@ static CGSMigHelperState cmhs = {0};
 #define MH_SHARED_CMD_PARAMS_ADDR    0x820000
 #define MH_SHARED_IO_PAGE_HDR_ADDR   (MH_SHARED_CMD_PARAMS_ADDR + 0x800)
 #define MH_SHARED_IO_PAGE_ADDR       (MH_SHARED_CMD_PARAMS_ADDR + 0x1000)
+#define MH_SHARED_LAST_BYTE          (MH_SHARED_CMD_PARAMS_ADDR + 0x1fff)
+
+bool gpa_inside_migration_helper_shared_area(ram_addr_t gpa)
+{
+    return gpa >= MH_SHARED_CMD_PARAMS_ADDR && gpa <= MH_SHARED_LAST_BYTE;
+}
 
 void cgs_mh_init(void)
 {
-- 
2.20.1


