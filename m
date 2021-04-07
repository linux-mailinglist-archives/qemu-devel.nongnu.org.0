Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F20356A51
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:52:45 +0200 (CEST)
Received: from localhost ([::1]:60888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5ng-00024N-CE
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iE-0005K9-7L; Wed, 07 Apr 2021 06:47:06 -0400
Received: from mail-vi1eur05on2103.outbound.protection.outlook.com
 ([40.107.21.103]:59841 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iA-0001Lp-Fk; Wed, 07 Apr 2021 06:47:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xu92dROCTrM++YoAzvJ8BzRyh1GoiAHQajmmAc16GIOoMYN111y6lYwx+xtasX1gxOL0aBegIgxDKdWTFtforFTzgxIBzZq9h2ZxuwQu8fNV24uBPW4loitzsIJZx+wZ0EXUb+ojuQTFtBjkRKKBcVpnjXrP7BwuvkRF59m3EElZptZ9UVJBhOzSUBRzuye7SIVVQtXN3RqStmlqFy2IoXAnvt+4pISc3Ucws9IUIFIWU6oRnZna3B1BVVq6/6ywk8wUtkQHQMXeA5BctyAt6vU9eZQTzaj1GIC5qvQy1H1JEwBuidu2LZ+OxqFQqueMFFibRzxsjA+ZJK/tndLr2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoSxa8d6P7dvltNkte57NzMS4nfNANxUMrTAJFypjeU=;
 b=cGtxYiIybT6uhjl/Jo2aPs4Lgz+0suJsLW94knphCgcJtU6XSiTtCFfEzu99BloGktRa93f9hONxy7Js8FiUrepJNFFKohpiRB1oWt16ejJfoPOMfQ4hnZhHU6TnHLr6W0fEkI5u+jkMUbzf9Wh57E8PqigA/ie+FVzJ9dMRx19X6+7n16l8T8eXKMpbrypD5fbdIaEBMV4cGhzgSRlmqgsWCGclu/UdWgCmJMGeCzl7td1pr/iQ5CKc60+wQRMgMfFYiZEbT/XcfSgX3fwq8V5TW1vT2I0ub7lD/GejcSej2TaVcdIPG1fv7Eq8XSuzTWvx262YN21SBdzNOPn8gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoSxa8d6P7dvltNkte57NzMS4nfNANxUMrTAJFypjeU=;
 b=CdidK/fdwyusPToS9F8A3ZUy4x+g6sQp5nI9J/jnZfArGUll48IiS6Ng5QxvmcJiKEJjYGVbTcO9Tvse0G2z2TzWNewQg/UXPG41vjLNYiajFMkfCG6blbS27hHdmZQ6fvCrAON0wSwHb1m1rZvCpK7PXyCPZ3ZRJyqAuFZA1uA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 10:46:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:46:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 01/14] block/nbd: BDRVNBDState: drop unused connect_err
Date: Wed,  7 Apr 2021 13:46:24 +0300
Message-Id: <20210407104637.36033-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407104637.36033-1-vsementsov@virtuozzo.com>
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:3:e5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:46:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d08d382-fdff-4805-50d5-08d8f9b27753
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376D904ACEDDA2AF4068CBFC1759@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:231;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nFqz95XcUH2xzGwwPXsOIAER0UZcLjGgGHhF7hX7odt6WzrsIfpo8nP9z1Pt1xXQMk8j8M39uL9JTb/PU2pIRhZq6IwZohXb48NQwY+e1+/sb6kuCYkT2TB04uDYyx8ccdAxUXy8EA/oj0xOB07JoO+gk1raxsLL3Skx1XyWc+A74iP2VJNzwbNjtsAhtA9+Mc3ccJ+P2K0FxSOfMo6m7ZrnbSqUtOBzZSGhQ3nZFA5bShLDqWnaV9usCFEIeJ73mCaz6U0Q0GOyr9gWXRr7+yMPCBr2xRyrWWr/RXangbghvhcuPEaAXiY9TXwOF8mMZJoxDuSNhPy7L1c96IoLsJj8G7IV/77QcA3H7YmCKxhTjlZtEZE45pow/a6jerscFUpKK7SvINgVN3gy/+DClJsX7RRu/3EdYHTT3zAAnHDs9o2xVdg9b05Ntko1vxArveo7t4wyEgBtsOgs9XWxj1HX2CUqVkacSc92KJnnH6TpgeHEkrv/l4vDjSk6aDE0sj1QQ2pOtBTnlA+qo/V7WTDGKr7gtAXCBCMj9sJbv4Sm52LdPPqQ7XKyigUcbmQ+ysu84T1FQRbNhB1BVImcKCZPD47w8O10OY+uJPaQzbcoY0xxCXDBYlQtHSP1ogbHOQL7cN1adriYaiCiK3HGws8TnGuuc+uFJhhACE2HISotCArFtre0BNkXgd0m2thUi007h7hG5md1Njvc4RszcfBPXwCqahK2UivLy9k41Fw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(376002)(396003)(346002)(107886003)(69590400012)(83380400001)(6506007)(6666004)(66946007)(6512007)(38350700001)(8936002)(6916009)(316002)(16526019)(4326008)(186003)(8676002)(52116002)(956004)(26005)(5660300002)(38100700001)(6486002)(2616005)(36756003)(66556008)(66476007)(86362001)(2906002)(478600001)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?O30ddZEKpLvHXZBqGfb4bMrtaRschQ17tb8Xn63vTy5dZ57Tei53Zxn2akBA?=
 =?us-ascii?Q?AG06h1s9rj1mk/ieD01sOLYvm+gTRJ1g+CLTg5++wdX7IT3z1QKoGYeuGVwk?=
 =?us-ascii?Q?86BMtTAYrNZ0d5t1ixPUxotkp0P4oPwv/kLA3UXHBCvRrmi4krs0MnEsU9ka?=
 =?us-ascii?Q?q5F/A07KptR5FsqxBjh1LNdq7xnvD7Ft6eNUuOZDY3h/Vd31EujD/7P2+gop?=
 =?us-ascii?Q?9owzfK8RiCPqh5YSzk19fM7Wybjd/eNEqKjws8yLfPPLj/u9V3wtHgQKF4lu?=
 =?us-ascii?Q?iyb0tM6NyGBKqrbjxqpObgGEFt/jlTNEwpPc1o63FA/la7e4L3qmeotet183?=
 =?us-ascii?Q?GHX1izMcuinUZzZnXsWtMOZpshR5sOF9kJUcPNl/0f0so9ZTcq/GGPMR6gL1?=
 =?us-ascii?Q?OAH0FLQ+RUozugZr+dbdYv4via2bz0qR2QPw8FDrFagsnIjuKrNxvJ0KXOpz?=
 =?us-ascii?Q?M6+BWbTH/b7A1o6pmt25p9PTyN8jqKfGFqBMVcx7shW7XV3v+NMH+093XuVU?=
 =?us-ascii?Q?2fal7ZI81KxOONUc9JzEzK3RKguJd9w9RlzQlrUE1tEgiALlx8cXtFlN/z6i?=
 =?us-ascii?Q?/rcOP8qr9pZtm9g3HphaPrwg6xD3+5iukLfM8Y/4Mvymy3anAwp5ru9BltT+?=
 =?us-ascii?Q?bbllj1CuFjK5SO/g4y17E9hHlFRnYIQ61shBpJ1ADVD6zg19PI8Zs9Of4M47?=
 =?us-ascii?Q?Bj1OGtDbHcXShK+y58tabkWwDcvgaHK+9F0VQeVQFV+/HcG8iApY6JqsUUuQ?=
 =?us-ascii?Q?0aH3iyBoG109OS67VY3DgZqN3dhCtzY/oUUA6DgpLHFdtlmtodUguU11VfUl?=
 =?us-ascii?Q?EapsnfeOYZaGERBLJnYTTtz6tb97WNzXep8GICSjjUV9CHJ0szvcPEG/6WGB?=
 =?us-ascii?Q?Nb85X+tlrB05cshDRXpNRkal9cpCFy9U8+/YbffUQcu1EudSs5EE0OxwMtaj?=
 =?us-ascii?Q?tJszHdUwyGOZ+aJlrEl9hE81paVTpHzPAYMLOMOZ1ZsPJp1tJeMoae1BVdaH?=
 =?us-ascii?Q?oZRZEW6A1+OgJYqOPTYK+35zPCVSBHQLFlGPKIIThNKY0G9QnkVGUkk6g7Nf?=
 =?us-ascii?Q?zq1kaOU2CdZ6Zw6npV2AP5jHrgY/EQWdzXuZz7aocLeHjVvwm55x/YatMSTa?=
 =?us-ascii?Q?/rp3YFsUTQvqC3eUvLExIVJBfhHk5J6dQOiNoEF62IAc3P/fXt5M7+yWAA2R?=
 =?us-ascii?Q?KK3T5QiCr+3lYCVz3/grncEpyp25uqDE5nTrfcGFnYLaPPGF5xukr0OenOOs?=
 =?us-ascii?Q?4HzOBoMOWNnIfsTckLtJM5S/qy+PtUs6NxaL0S7ZUgymFpfLKL9Yd0xmUO3a?=
 =?us-ascii?Q?tc3EXdLQtQN3RLz+eoUCM+v5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d08d382-fdff-4805-50d5-08d8f9b27753
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:46:57.6151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jh9o5ql+mYniqHxDdFDoI9LcEQBH1lITn5FJlgnkWv0/82jNLXBYjGqt1NsYchyrA5Fx8HdNb04G38uSyNQWQJLtjzBa5cELVNmHptOpu0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.21.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The field is actually unused. Let's make things a bit simpler dropping
it and corresponding logic.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index c26dc5a54f..a47d6cfea3 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -122,7 +122,6 @@ typedef struct BDRVNBDState {
     int in_flight;
     NBDClientState state;
     int connect_status;
-    Error *connect_err;
     bool wait_in_flight;
 
     QEMUTimer *reconnect_delay_timer;
@@ -578,7 +577,6 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     int ret;
-    Error *local_err = NULL;
 
     if (!nbd_client_connecting(s)) {
         return;
@@ -619,14 +617,14 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    if (nbd_co_establish_connection(s->bs, &local_err) < 0) {
+    if (nbd_co_establish_connection(s->bs, NULL) < 0) {
         ret = -ECONNREFUSED;
         goto out;
     }
 
     bdrv_dec_in_flight(s->bs);
 
-    ret = nbd_client_handshake(s->bs, &local_err);
+    ret = nbd_client_handshake(s->bs, NULL);
 
     if (s->drained) {
         s->wait_drained_end = true;
@@ -642,9 +640,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 
 out:
     s->connect_status = ret;
-    error_free(s->connect_err);
-    s->connect_err = NULL;
-    error_propagate(&s->connect_err, local_err);
 
     if (ret >= 0) {
         /* successfully connected */
-- 
2.29.2


