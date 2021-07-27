Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653343D7B5A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:49:53 +0200 (CEST)
Received: from localhost ([::1]:49032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QHA-0001uj-FP
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8QFe-0008FF-Iu; Tue, 27 Jul 2021 12:48:19 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:53292 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8QFb-0004HS-Et; Tue, 27 Jul 2021 12:48:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiwVHs72NxMdVXXFLVAqzpMUNt6Vyh75l7UWMP8uPtN8gXuGnK5p67pgIjAxkN/6IaU3Az+2XwlPdxpYtvppB4FA8zdj9DKsy4Gub6SGbnh9yzGONTZCSWFV9kPoYZHwZH+HtATcTKrXNnNA3XVejl75z5ncWAl0KmZePsn59UuCZrJkr9qI7+iTo0jzOpDmxyqTHaq6qf00yFMnkS0hyr9NauPRDBTj1yLceCI56DUALcVbUNQ39c3jTj1D+BivWMSI/YX3/rDXqcf9bZETCVsq/mL7fYGHiAbRryaCnwvudSc9EWo/c3ExbLusq1N7OIHwhCCERD8Y2c3VTmTtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hccyghunwXeKLsTqrPQD83MZ83aNlVkUBI1HD/pccM=;
 b=C8PBrd1V2Bj2RrLPM4u+9sSC5m+xxjM74Huxac2VqvHFZvydrymZzfQT0/GoJKOZC02KZ8FzE6HVTCbTelSbRydVPgGMKZNawZPCCq2id+7bPD7xee5ApoE0iYuIctI/x2VZfa2WHnTOnkFW8rOTLTx7UxUO71/Kxt8q1vySjOv6zaxJ4vFp2OIs56dsVPCTh8RlqZ6/DcX2m1xbnGMx9LIuaKP/Z5rf34lC5PSvCCxc2AKyOwzjuUpfTISWMRIPKGlXNTN7LVjGzaTVX81lpuduYgZVj464agz1QLailHZYHqAxC1kBSi+kkMepghDih4eVlsoCwd/6mE1E5JTkwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hccyghunwXeKLsTqrPQD83MZ83aNlVkUBI1HD/pccM=;
 b=ab/3gzHwcwG1lAyat2y4mQkOUlZLXe4AYuqxUXGxJG+AJVqj+3ewGKsgafplctGo1NptQycm33+/GcIyMyAgXBdUuXI8NLliFPcHiBVEPgubE65lqovoJsCjY1+4G+xkWU7I8DObGZcdZTwCopQF/u8ox6yYVan2izZOFI3p9Io=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1841.eurprd08.prod.outlook.com (2603:10a6:203:2e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 16:48:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 16:48:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH RFC 0/3] mirror: rework soft-cancelling READY mirror
Date: Tue, 27 Jul 2021 19:47:51 +0300
Message-Id: <20210727164754.62895-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0501CA0024.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0024.eurprd05.prod.outlook.com (2603:10a6:3:1a::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Tue, 27 Jul 2021 16:48:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a4a5775-2c1a-4c24-9a45-08d9511e50ef
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1841F2D79FF171E4552D649AC1E99@AM5PR0801MB1841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OWdaqGIGmQhwIUDxDVPeAhQ6Ibr2TGrjZdL0EF4WKU8UfF47POx3Q7Vt9pLcFTn7sk3v8yAF50Luow7mLlacYQWQNe7Qcjf5gGyQGGK9GGrHw8y77//2SqqFJl34soC/kaCyPWU+AmJE8hHijMnARwSab1XMaD20ReL1Wp+H6LYg+MD1drkkQ8bKakk5K4utWTyRL8/83DWz8DDQ60EAZYrnvk9Mg0yaxTbG9ZqpSGVzjnFBqU54xyDyx638p747UeIVAWKsSGK+He4ON1RNwkz9EwIe4xvGqSRna/KKBn0VRqOBcmXbXDzg8nfZa56A3h60bre4ANk+ao10uyAoy9pMz9Y0/GxFr2MdXTAQHSq8EITXqpCOEDQJokq8394fNBhMatFvCiCCorPXbjKcWabWBHta43qGmR4jWSsz0+lObC4BW/vLc04GHyI1v7EM8oqCTb95cKbBQSPeuIFdRhX/MFtWGFJEytkmvJp17njO62nWtuIk/v5gelw8V5lpWYjqFne3d/arWQA5IrCXG5oXOrnL2eQhR9LviinjL/FngwMXugtXLP4ImnUhJ/5yilVDJa5gh0sMxbQUUOIQWGgipRhbLXvWtebMr4o5FU/rrpwXnqTbcU6ux7OfQyKcMLEZyJWQf0aDtP/7I1nuHT1SSUNdlovqYe+qOEMclQKQCxEdsEPVAMJGkzaUYtE4NDNLmcsW/3dOK+Jdx8Kujw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(39830400003)(376002)(2616005)(186003)(8936002)(6512007)(5660300002)(36756003)(4326008)(38100700002)(478600001)(52116002)(6506007)(2906002)(83380400001)(4744005)(6916009)(86362001)(6666004)(316002)(6486002)(66946007)(8676002)(26005)(38350700002)(956004)(1076003)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?45yM/TQHAZ7oApJ3dhvmL1PQ7+XhYlXtYJI773qHpxpPKBkOyuyE65uT+97d?=
 =?us-ascii?Q?0Crlkbc4hUmEu3q2J1m5RxGeXvUfFtwAYIoigLP37szSpnAySaEO77QptENM?=
 =?us-ascii?Q?LmppNJDPE22a8nbwGbCg9C8j230jBZ2cXKIR2yMpInGobDHkwo+FbbAkB1ZJ?=
 =?us-ascii?Q?MPqSg1pJmwms3uULBOzcD8zC0QPBzV7AEdehaoHE+WF28zFng8ng7xhQfOqh?=
 =?us-ascii?Q?6TFWkLnkJopCtKiUhLL3/fQd7Oc2R9kMzdez+2qv+67QcU/NzAydY3PS32GI?=
 =?us-ascii?Q?EG0oR7GvlMYhH6dAzFWvwDSFLoZP+QhD2yJx1mSL4k3tTLXqwYxNX22AEuBx?=
 =?us-ascii?Q?wJqlf59DqaYAc8GJdUpXNzJMzwq6/09tmyhqZhTUqxAEonVyxrrgKmYPk/lw?=
 =?us-ascii?Q?nzPA9WY6o6An+KWbuC9sI/f1svPwXOOjfPMJfX/AtKp/3C9s3E+Y92axPqxy?=
 =?us-ascii?Q?loxHLgamsgG8eT3ICX3fUVnSeOBFLLGIQVOPRbifUoOMZf05p07eTsfPPOBj?=
 =?us-ascii?Q?FXFCtz+9mscg1nfrbARWsmxv+7AJXTjNye1cxTDRRX4D2j+NM19AtMkcMKep?=
 =?us-ascii?Q?XKmUm+SnujxiBapTgEaVaopSBvVFiSsC3KIn9hm7THeSdlMDszxMvQnYJVs+?=
 =?us-ascii?Q?3jZnVYMlfuunO/PaA4jSHQoU6TBAHZ/6x37qYi5wZ0cfsbydccypbemdzwe/?=
 =?us-ascii?Q?NLW34hvSSuJLGoAB9JbXfXkOvyeus7wK39NkvR7DBiBLpj9bv/g7mLwuRtXF?=
 =?us-ascii?Q?8PcESHVqimalxcJImj1nF+XxZ5+yv3TGdSMI4C6ubzLJ3Q8pdE/LHg5y/RgD?=
 =?us-ascii?Q?MF//JifBLoLXbZ8cdEbf5ctIX9KMhyu05pnLfLmkO1STNwJnsO+TiDCSOIVt?=
 =?us-ascii?Q?zlmTbWgcq2/+w8MJcy6RdTp8t6N4yHEDG/1QKz+LjK71MyOOYpmpCu15dIY0?=
 =?us-ascii?Q?RCewwduDGdZss+UyB/iQE2zJ5eWak+9Hg4vrZGcRgK6Gp+Por+F30g+ZwgVA?=
 =?us-ascii?Q?x391ZsTLddqq71pbgutY06p+m8yQanIxTuEU41WXSFCMRhYZ8R5Mrm13x1AJ?=
 =?us-ascii?Q?BGMiwFguUTF2VzIUrV9BmoH1VmPEYp2xNnK0lzflAOx5lkT+utOjRfP1xeYP?=
 =?us-ascii?Q?FqfRIt688juPImWXr6FnxUXaRW5fnc3NOv+Le88TK7f/O48h3GxwYoI1OJSq?=
 =?us-ascii?Q?SHq1hS5gh2Lo0OeyTqO42CZSzOdZp78VkAHBpeTxtX5LWOm8G99ZVEOTVCmT?=
 =?us-ascii?Q?nsILy6LjpVm2ww3JnPjTviM0of56rI+5psh2eaAz1dQ6kQnGl7e+YjSn1mMp?=
 =?us-ascii?Q?l6tuchEykpqHanIbv1luHqAd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4a5775-2c1a-4c24-9a45-08d9511e50ef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 16:48:10.0375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpAPqldlrLRZ9tchu7IAP6tAYuu3APgk4deHGPmsKe61vdvIBl5CmtUIci+24Rk5kM+JPRJz/h5Xg4fFoON4v2sIMvfS6vFg+oRbI2EvY84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1841
Received-SPF: pass client-ip=40.107.8.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Hi all!

That's an alternative to (part of) Max's
"[PATCH for-6.1? v2 0/7] mirror: Handle errors after READY cancel"
and shows' my idea of handling soft-cancelling READY mirror case
directly in qmp_block_job_cancel. And cleanup all other job cancelling
functions.

That's untested draft, don't take it to heart :)

Vladimir Sementsov-Ogievskiy (3):
  job: add job_complete_ex with do_graph_change argument
  job: use complete(do_graph_change=false) to handle soft cancel
  job: drop force argument of *job*cancel

 include/qemu/job.h               | 19 ++++++++----------
 block/backup.c                   |  2 +-
 block/mirror.c                   | 33 +++++++++++++++++---------------
 blockdev.c                       | 13 +++++++++++--
 job-qmp.c                        |  2 +-
 job.c                            | 27 ++++++++++++++------------
 tests/unit/test-bdrv-drain.c     |  2 +-
 tests/unit/test-block-iothread.c |  2 +-
 tests/unit/test-blockjob-txn.c   |  8 ++++----
 tests/unit/test-blockjob.c       |  4 ++--
 10 files changed, 62 insertions(+), 50 deletions(-)

-- 
2.29.2


