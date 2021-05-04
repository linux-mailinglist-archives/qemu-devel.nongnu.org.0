Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B81D372763
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:41:18 +0200 (CEST)
Received: from localhost ([::1]:51444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqcH-0002bT-JF
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqOB-0008DW-J0; Tue, 04 May 2021 04:26:43 -0400
Received: from mail-db8eur05on2116.outbound.protection.outlook.com
 ([40.107.20.116]:45350 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqO8-0007Kk-Pm; Tue, 04 May 2021 04:26:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijEc9KWH2hPg4caztXgR1cIXwh8XX0S+vikKFOSfVBo4ayJVvQD0HQ9PclLrh6PA+ikBTh3Xrm3+qH0USKYKyVvCl3+JN2JqFsZz+/unrbzHomg+Wb4UEaQrz57KPVwY7wxGBre9LTz9KY8o06xfoVFkHqDCw9K5OPk33Tp1dz5BvkSQxfExKbYgoAyxqKefNs5fWwYB49RGhxODQJTgSodhhpvXcOjzFhdl+vPefnu+ad5RkT3/i4VZmXU0gbighziolj5uF7+n5ECknzs5E2j4cHnbhSuF1qU0L0htDlf8gEf9pjZwP1+oN506mNGjCZU1NIjhWZ9wymHn495FYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFkPfIwD70pGubaPVvOis8g5ycGs36T9b16u+nofoRQ=;
 b=kFXaq6SzcYBm2hhHbJILhemPT4nn3PT5Vbe5wJLvKkMqy89r9hSG1Or8UsK7eA6IFqA0jFxVwo6rsLV5b4yPcnoP2aWvT2F90FZ2gwfNAGsBV9m3IOBrN0kkFDVJHwAXNthyogRp7agO1jgzq2hIHG9D9ME/S3IyS+vpQAs2VewLYJYndqBBQDIrl8n5maRjKyiedz4Pa29OqNgXa4+YJttQq2Hl+61a2EnMMItcVZ6oFtAx9kbe1RldBnEd6KN/o4MygpiR6CRropDuqzdvEBOTZUCiRyep9H9eFEHxPbCDT2gprwbR/2VXnhyXBdzhLoEC32yWvPdL71Lv7nlxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFkPfIwD70pGubaPVvOis8g5ycGs36T9b16u+nofoRQ=;
 b=KnUwSPGjpnA8bv3/e/WfiJOC52rFWMjDaEUvUcXWl9AbXDZ/wkdS40iyKzBb7bfKNGXDx5VlaZDtMI45u4XYhGqjwKK0flAkQSkpd9NpgCBTYKD8X0uYmAZL8GZylbS3nm8S/+LiBn7z3Nf6EWzZU0Tsb07JII5GNEF/KR+CE9g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Tue, 4 May
 2021 08:26:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 08:26:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 8/9] test-write-threshold: drop extra includes
Date: Tue,  4 May 2021 11:25:52 +0300
Message-Id: <20210504082553.20377-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504082553.20377-1-vsementsov@virtuozzo.com>
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 08:26:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02787bab-0da7-4c5f-be5b-08d90ed64989
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB338195DA8A7F63BFB10B12C7C15A9@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ulTaELHZderJTKBIvdM21YPMWldao3y8XvYHWNvN0LO5G0K6AY8+8ZK2UMii45/O2hxaTAhkZaAl9FNrD6u14WKhfz8L6BIseQh5GrW6h/8Y3h1CFoHl5agxASEqATBrbGSLsW9aQkg2lOZT96R2w1E+WYt67RkxvYRXZiTIIHcXeIhSs7K/t99TUMf1gk6mrDwaZsXk9vXYKvTZtT0UvrZrLlUnNARt2haYF2qMcx5Nb3yJHU7hKBaWZCqKHNynO/D18GwDkDe5ZyhBIWNmQ80FVOGn95rif42f/xaKAjUAsOq+OtbZk4ihsR0fSJaF1fSzlxSu7/e4xjepsTzGqNhbQHtDzhl7REkY0JAG3YysUj2xLQ78JNHNhanvtTwEHs6zoARro7FZgiNQZpvk2K1Qe2dnEmnJauL283PzEXUlM1D/4Cm+n+OW5Y6H6ayLRBGIDAaycXY0DVfPEjmotSuYcTEAwv0KZwZFXtQmEIqiaKutMV197OLq1de8R1ASjOJ/HXpVpc3GoWtOjsge2Hi61MCUc8lQKRapiwnNOpt3vJEODtVHeJEqkHwJQNXlLV/g+wdfT33z9aBh6JHnwyWQ3eSC+Su69/3DVmZiXFBH7Pu6IWUIdYVZ+yU93WtTKI4t/VR7NicjBTWMMyzu1FnU9nOic203ONJbPnkZ84ftYMR6mY6Zp8zn7vutWaju
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(346002)(366004)(396003)(6666004)(83380400001)(38350700002)(38100700002)(5660300002)(8676002)(36756003)(16526019)(2616005)(186003)(4744005)(956004)(1076003)(2906002)(316002)(4326008)(6506007)(478600001)(6486002)(26005)(8936002)(6916009)(6512007)(86362001)(66946007)(52116002)(66556008)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MPprQMy6EJ9KKV9c90mX5DdtuxuST2QzaB3lpUbXBFYnIUgnoe76fsEGArAQ?=
 =?us-ascii?Q?jAg0V0IluHSPh0hj4X0irPMEwSNohWb5DGJXFMUlvuPw1si4mGEEZ2FJRa65?=
 =?us-ascii?Q?2XlTa5q18GySsrzpYaT1oVx7YborSPxFe/pCjdxPb2xANsYPhazuHT3Hjt8I?=
 =?us-ascii?Q?g9JmV1wZcEOKwRXIcPf9/TGdzMC88dg9HFeRwsyrg99HlyAsIbS5ub32Zw1F?=
 =?us-ascii?Q?LYBG7iCB+ptKj9DzFvm8rcAP6tugVIvENUzAlA/lCa8n6zI9WDNv4vkTYi3/?=
 =?us-ascii?Q?q0S3re5DojDDjyCofHvsd3LgGGECBybSl1Pyk7vHnzL2d+fdoh6vlyADw24D?=
 =?us-ascii?Q?RctEZTHAaNHiseK1892XQwSsSNF1Bg61rum+o/jUADfrQWgenk5ONXdMrmRZ?=
 =?us-ascii?Q?kv4tDfA/W1A5riHnqSoegLywra8CRtxiiJDs/iiDPGNai4TdUBMs6ISBCFaI?=
 =?us-ascii?Q?ZtKbjQd1Sxmru+JQyYJTidu6sVXOLEvp04Eh9khvNzRroFaJVrVZs4lrnzZG?=
 =?us-ascii?Q?iemf8lVe06T/Tyn4eagKFtb3jaCSOvsXBTuQVRz1KNqxguekZNXGheB9Cc5b?=
 =?us-ascii?Q?iraXI0f3UjXruK9QbopjE97dvtvFnFg+JhFuUnC/5SJTAiq1jUynrPd5VxpF?=
 =?us-ascii?Q?5G0eyD18U9+cozkea+Atk3n88W/khgbJBcFce0v3MK4BlB8Kn/ssIu6QbGHr?=
 =?us-ascii?Q?ZkYHZCj0jKh+Xqg3FqUw7jDz1oZwhsJNc07XTR6fl0HG4Ltn8jm4H45/WJXl?=
 =?us-ascii?Q?0qBnmwOkaqDA0i/YYa+kkPKvuUYwUlejh0DWSqQ/XPAXjVLXuBXZnO99KgtG?=
 =?us-ascii?Q?Dkiw0HmoKHPpKsSZLvh/bIiIBq4RpGdwiuLwBapPutF0YkHv+wNDwEfQGIZo?=
 =?us-ascii?Q?neHlERIqIBGUzXMlCAr5JBi4WH2/70B00xLeH40szUINEizYJCfwZmqOjcEL?=
 =?us-ascii?Q?ZaOQmPlP7RW+oG6bO1lTWpmatjYzZnHm5yWmr3s2clGJI9S9J9F8627F2Dv9?=
 =?us-ascii?Q?9XGwRiOm81Y/1Es7EUuVRXBvM/wYqQ9aFECwNfGOEpgPtJd3YtpJR00MZ6SX?=
 =?us-ascii?Q?Jt+Pd8MjeyF1p8dXzOIFfPQfjyRePTZNKY1PHopU0VKa1likNreqjizk75/H?=
 =?us-ascii?Q?Hq+LRmI/fluRK8z0kEw54d0pzbG52R+fHDswNDHogmvRWFu6ykb9jGGIZ42u?=
 =?us-ascii?Q?gQHLiEbC3r7bDDEudvfMjeIE/sfP2ywcvmSZdvctjMRo65nUHicZyAbtZfqV?=
 =?us-ascii?Q?SzK3vnm3mHeYm1oJHI0AXkcjEHJUNESIKb68/0ldJ1wCJaLmRWg4VCUI0Bm3?=
 =?us-ascii?Q?FVdfsnvntl0g+pnqyhUHwOl9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02787bab-0da7-4c5f-be5b-08d90ed64989
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:26:17.0962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPGs2q2AELcTfKJ1TlrhhF1gqR7hzicq3Njk0UZ2WOBFsk9J/u8/DtXqTivj7SmKLJJVWrrnk8+P7rbGs50KzFSHQ7PAmUFsgNEsNdZSZHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.20.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/unit/test-write-threshold.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index 49b1ef7a20..761054eab2 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -7,8 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "block/block_int.h"
 #include "block/write-threshold.h"
 
 
-- 
2.29.2


