Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFAA32ABF5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 21:59:38 +0100 (CET)
Received: from localhost ([::1]:60312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHC7F-0005QU-NU
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 15:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwe-0001ST-S2
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwc-00085u-KF
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:40 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KhB3U154823; Tue, 2 Mar 2021 15:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nuSbDcYNLehDlCmcWpK7iKrZMp6Z9YiK3uABzIiWq18=;
 b=fXYNvf6BcGJwbP7cLZcyGdP0SYM7mVaiJgyDVnpOyhrLYa0BoR96dwUANdqsrm09o4Ed
 LTvED+1vwbgh4RWLFW2UzCPdmwEujB9cLP6YRUgtvOurf7HUd8C62zB9sdlLpNKZGHsg
 5YXIECsDIXMiYqtUXZ8Gbq+o2KEpeKuXaaQy//czUOTvoAwsLhq8HWWjPxGkhKBRD72G
 qY+cPSNJj4PMdeiEX32egap+5w1EraIPgAxAsq2ZnoN4kr7AF3F+JRzITytKEQJKNVVb
 JWTgMdPvWulAKpDoECyw3X15/z6wXzJUgx5k/Cgowf+FtyDcauqXla9riQ9WubufZSpw cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vn4r8vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:34 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122KhcMO161657;
 Tue, 2 Mar 2021 15:48:34 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vn4r8vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:34 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122KmXcE030374;
 Tue, 2 Mar 2021 20:48:33 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3710sqncdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:33 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmWvw26935602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:32 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20C9A28064;
 Tue,  2 Mar 2021 20:48:32 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA7C928058;
 Tue,  2 Mar 2021 20:48:31 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:31 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 14/26] migration: Introduce
 gpa_inside_migration_helper_shared_area
Date: Tue,  2 Mar 2021 15:48:10 -0500
Message-Id: <20210302204822.81901-15-dovmurik@linux.vnet.ibm.com>
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
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 Brijesh Singh <brijesh.singh@amd.com>, Juan Quintela <quintela@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Jon Grimm <jon.grimm@amd.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gpa_inside_migration_helper_shared_area will be used to skip
migrating RAM pages that are used by the migration helper at the target.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
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
index fe317ee74b..0b821af774 100644
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


