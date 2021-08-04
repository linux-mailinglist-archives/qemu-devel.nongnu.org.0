Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8343E01E5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:27:07 +0200 (CEST)
Received: from localhost ([::1]:45718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGvK-0004vL-FY
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmo-0002Ha-5l; Wed, 04 Aug 2021 09:18:18 -0400
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122]:6733 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmm-0005TW-GH; Wed, 04 Aug 2021 09:18:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBddILfSY7tQpu9wwFzwl2peHtg/CSGyXwKEqzzffHSIc70ICYR/ZOs3QHxx6VuBiSLHJ2V2mngo2tlHyWV4tsiovtM7/kcaAyDZvrjcPBMesRaiKs46FpUiHtpBDID1h3Ay/mmYta0rxAINrPZeMDeR9f1MYN9OFsBUyIGO8GMcqrk9MdJuXWrGaHzI03AeEryOdWHZwjLfWw5rzRJ5pbWwgmX74Oc2exis/1Oqo1upiZCOZtzzi7MrJ9EcOuMTtagPhs1YntN0Vc1b1oE1uQqxwGjRWLbeAZzw4lIzxWnqBvmc99c5WadUf6SVxgYKu4VLVgx+T10yWjwPB07awQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FZJsA4Awg0mnxeOqB7GYbcLhHiqfNrCZfCTVL5HXjY=;
 b=fqVLIXhkydGZw1mUdfocFL9kZ0kqmZ8t2cRaf9n6/w5XYWTB/OenvS/4CRATlhs867LAtmTxFR8z7x7x6ea9C3yjaajOu04Q6q3klH9hj2XhhDFjd5A51ogB70yMX4wTBw7dVCS1fAdrIzpp5TaEYkjNHknuNglqEg1DlTqgFR8hmdxlMxXodJ/A43cPDakVirw9W3ILPiQrpDyEst4AmJgHVdS3qlDKOHCol9ORpIeJaV2gkFMWETLkFE4Z20u5cmGHOFpnN4LJ0rpi/lEDlkAhjTisSCcVsZNn8/D0GoKS2VW+FkWNsogO9ZFKgN4QUwbvTNFL73odAMNbN9KsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FZJsA4Awg0mnxeOqB7GYbcLhHiqfNrCZfCTVL5HXjY=;
 b=fVbMDpQQatdyJufq+/nAEwik62jo0LF5aw0yCEpBZLWi+uhIi/E5lkjJdZ4fbZXaNVZeMIqfl5xljV1f4SLFrM0gWlNKqK3idkis3S9htyTsdD1nPFLnmxAC7toM8DU5UqTV8YElQ1D/oWZluSOdDNwqfT0ZlYcKygrMqgJ7Kl8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 13:18:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 13:18:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, kwolf@redhat.com
Subject: [PATCH 08/11] block/reqlist: add reqlist_wait_all()
Date: Wed,  4 Aug 2021 16:17:47 +0300
Message-Id: <20210804131750.127574-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804131750.127574-1-vsementsov@virtuozzo.com>
References: <20210804131750.127574-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 13:18:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc9fed34-2e4f-47d6-1e1b-08d9574a4f9d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6216998C21CF08F59137E370C1F19@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:224;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mqIm0/Z/kc4M0uOzOz/N+RZ6g5KG9Fo7cKJlx99AAVYbDV8GyW6mj90F3RlZ+GxayXztztcioB48aNu096M6BhSE5kmiMaSoYa3gqxg81w8OKT+zfQ15onx7MmCNCV+gQ84+JcLI+eKMyzw1Wz1aGOUhbb1lDe3FswVzWF/pMOCd+RjlgWMmgmGw1e9kqo6PF+lFg93jkUX90ubVKiQ9Cdc001f+ZovwGQ62ttAH4QE39Q4Cl1/fuOLVp2VC6cIZmLkfCkEw29gbUDXYTbM/d7v96qFpRXdOLnQoieH0L/bUt+rBuCf7MV81ExdDzdn0BjWRHKnmhMycFkS9plDPShH1fnIKmkK51CyFIXlDOCyI7w2xekP5RnzvqIrYum5hytAHaZnkupfH5XsvCOtf0hqtAP2OFEsUlbArXUIDDzzkQBtDWx6k2HY6Ks+I3wYZUbzBimLC0Y316c/BqRGVeZcQmDBq0zPt81AG3eBdH/fAE5kKhylg3NjOmlgme7CZtOYaVhwnfr+NZ50TqB5/QuFgNKg1Cm73I21Fk62OQ+Sqi1FNEPF1JrrAMGvV2vsnLDvh282CFygE9+oNzhx4Dd8DM4MRmKfOPr9JW5I9GdgSFeyc+1P1jEOud/Uc7T+z8dyde4GAHDtD3LC8wR4AEKRPJrI7zTzcJETedkDGqcB1we0a36EQrGA1xNUzmUxMnpZl4vXNe+xWrvs2J7Br0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39830400003)(396003)(136003)(478600001)(1076003)(8936002)(6666004)(36756003)(66476007)(86362001)(316002)(4326008)(6916009)(6512007)(52116002)(2906002)(38100700002)(5660300002)(186003)(26005)(38350700002)(2616005)(956004)(66556008)(6486002)(6506007)(83380400001)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0CeZePWpfjNGENBFIBqirqaCTtl+/x5HHrhJ7Lp8LOKEjFYpJNGdxxcZ91It?=
 =?us-ascii?Q?28HadU5T67bwApkclbLjOPbqkcholthl3+1IqYTJM8S3SvZjeq7SRFbG2LdZ?=
 =?us-ascii?Q?eatS5ch4tdmT4nvipGKRnopna29XNlvLVtH3oaFuJLpGZWh9hF+oXY6Qod1F?=
 =?us-ascii?Q?XbeNNkjpgoNV4PBmtUnc3sYANhKHHtDYSMNqLeR6tvlIrMpgyrshbgPJgWBu?=
 =?us-ascii?Q?XbykfrN6PFgv4dRmFGaH/91P8f9RyirWF0ZIDCuZLgvUxh2KpexvBstRruA1?=
 =?us-ascii?Q?J0TSu8UYntPsKyBCyVp9SZI5pBy4euPWRfHCwz9dbhaxSZjk36zSMQmF3rar?=
 =?us-ascii?Q?nHP/Vu57HXf0nE3NHG+Yb+EWWh8hZLdD+6Xlz6BdhJs/e6s6C4A1PbD8/qC3?=
 =?us-ascii?Q?p0Kgz7tRr7ho80QJFLIUUAWDeUxWSmTLNAa1MITKWRzd4onHpiejkg3TOJD7?=
 =?us-ascii?Q?RuQ15sUK0XQqtDBTx0UMLd6EddGUJyzOsIRcs1uucyrwt8oQk0QUGz/SsAq3?=
 =?us-ascii?Q?TxsDy99MBLFVUnrKn0WJ1BelHISMEqPNjcCnUz0QbCYBS3dzOGm4iEaGSCDr?=
 =?us-ascii?Q?UPI1PHa1vXSPVbsrB1WhK9MLXFmnTN1+u2Z1gHZtAl5QTljvgXIHjvl9F5WS?=
 =?us-ascii?Q?YvNl8EdJKTFy185cb9UZg/65Lx1ehYMn9lBkgkbjxh9BGkivY6BktbQfZJ8F?=
 =?us-ascii?Q?90jWTl0zPdrvJsVjmCQx0onLOvF37TZDoND3uQtqM88mnVCqPaPCBQDpw9NM?=
 =?us-ascii?Q?r0fstx39z8uLN7EnPXCPHnyPeRPO8BQPX1qji7x0s8t/bp4yICRjrC31bjRR?=
 =?us-ascii?Q?qwpDlkQwx+fKpT1REEbbhAiQCRnsxFmyezKGei+PwgsBhhJIt74C+KfROttD?=
 =?us-ascii?Q?jT5P9b2XPu0Uq1yeVNgN8lCpX4ccc+c+uc0mg6/3RI2mIRmyuVPII0PvX2b/?=
 =?us-ascii?Q?pZemsgHIYbqySblcAyuCZp7jUPAfGNBCfJoTq632d69/XV4hTSQqQFvQauqN?=
 =?us-ascii?Q?O8FF+5iPJx8BVMs52N9RXp+/2okI8FrhN7/QUiOnkRSBBUMlFGlAXVYCxtpX?=
 =?us-ascii?Q?kjG8aZGl6n8BpskRU79mqgZ5KKY9PXjlG1Kgv7SRGNJYAw/ytTIl6kJbU7HJ?=
 =?us-ascii?Q?PG3klkS654XhevIVtCf6tOMVTi58SloxP/6aDlTyOcIlJpLb10HBRhksglPY?=
 =?us-ascii?Q?MvqVZN3W8At8ayBOGhG0Xmv9vUKwT/+kgnMc56zUuosi/iJriiIGRrCM495L?=
 =?us-ascii?Q?kQs9IwnY6TyFXvOUCGO1rVVcEDQepifPTVtHtEnP1X88zoLMA5TVuJdkn07z?=
 =?us-ascii?Q?2/beu2O+A613+bJPvsRngNPr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9fed34-2e4f-47d6-1e1b-08d9574a4f9d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:18:12.6321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWFznOrvJpfQDfg1JEfKh7i3Oywb+V0c9H7IEvdCP24ujIjqfFgvPiI3KGWWyIbeuxQGt4NOrZSi05g+9URvWbsMTbdUWLbOwktomZ//OUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.6.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be used in the next commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/reqlist.h | 2 ++
 block/reqlist.c         | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/include/block/reqlist.h b/include/block/reqlist.h
index 2de86be300..59d5c24cda 100644
--- a/include/block/reqlist.h
+++ b/include/block/reqlist.h
@@ -39,6 +39,8 @@ BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
                                 int64_t bytes);
 bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
                                    int64_t bytes, CoMutex *lock);
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock);
 void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes);
 void coroutine_fn reqlist_remove_req(BlockReq *req);
 
diff --git a/block/reqlist.c b/block/reqlist.c
index c41415c16a..939437621d 100644
--- a/block/reqlist.c
+++ b/block/reqlist.c
@@ -68,6 +68,12 @@ bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
     return true;
 }
 
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock)
+{
+    while (reqlist_wait_one(reqs, offset, bytes, lock)) { }
+}
+
 /*
  * Shrink request and wake all waiting coroutines (may be some of them are not
  * intersecting with shrunk request).
-- 
2.29.2


