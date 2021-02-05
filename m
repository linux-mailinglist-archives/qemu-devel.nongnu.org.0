Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC0B310E17
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:45:52 +0100 (CET)
Received: from localhost ([::1]:55272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84Ew-00081g-W3
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847C-0008Ra-HQ; Fri, 05 Feb 2021 11:37:50 -0500
Received: from mail-eopbgr00136.outbound.protection.outlook.com
 ([40.107.0.136]:22969 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847A-0002Zv-RC; Fri, 05 Feb 2021 11:37:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hC3jw1Fcqa4zf9+sZ0U8A0bqp9wa4OVAQBuNhavyiHKR/FvgMP3lIzSNTZ1nha46pELxdO1nXla+4anu4bneNu1Kso8mHcvNjZIG2MAOlvXt9OR7mwngBOOLft6hBQtYphPzpCmq0FbhKHHyMuAywqH3DLaHTZmZCJXJTCpjgqn1O/wZhky2ubBML7MpA+MKLPpSrAyfQfmY4bkfwP7eOfJ+YvMb6rBF+6jiGY8Fi3gazGoRua2B0zztqgZpx3PqLjj3MKMlG9dxRdbK3GPUVG7OOs1ValuYcEsC2DV6uQ5X+VHImFytCa/j/AqzH+/8AAhmBIVHdgIRhOl7CrSv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBX/uK5jDaZQzZxHWLvdh1PEJg0iAHMjVI2T+IhFxM8=;
 b=fthlLMWnGdBQmMHZxBhriTzwWimMAQ/2tKh307T590BIx23fN0sFyyNHDigU+CCr89eJKvJF7cpBwi74EYrlj7qaIOzGmnf7PYgQUWtodwJxbVGqn1EoyN2h6/FsZMIn/UYC+QcVK21LSagf/px2dAYXB9v6yElznJ7Zuk6qkplWeodkRKmLeaC7DfZrH62NWoR6VRiO/on/e+9L7wkZhzUA7E9J476zQwVqm4ExFVoPGF28TTtb+biyRXyWcl8OcbZR05jWn0DmeaEUIYdHQlQjFKOsvIRX/VgBQ5UU9fbnIhCSuNm/NKudln6dxjY8i+myrU/2S2tC969cayz21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBX/uK5jDaZQzZxHWLvdh1PEJg0iAHMjVI2T+IhFxM8=;
 b=Iazt/FTOPJ9lHPqKuZ0fhPhTswsjdqYb2rXSZHsdTGHcM/wbGOgiRqtxC+eGFSBVLYfplAP17FKf/x3nwubkz5hYmaNXC5O/04JGbu7BDVHWNsr0wlMf8HT78tyqxnD1QWn7IafFx1Uu/tHEO5CBLnG4lfhnDoQCPW2ae+YmYg0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 16:37:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:37:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, den@openvz.org
Subject: [PATCH v2 03/10] block/raw-format: implement .bdrv_cancel_in_flight
 handler
Date: Fri,  5 Feb 2021 19:37:13 +0300
Message-Id: <20210205163720.887197-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205163720.887197-1-vsementsov@virtuozzo.com>
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.213) by
 AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 16:37:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 273ca9fe-fa35-4798-599a-08d8c9f45807
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44707D252EE46E4DF4973B82C1B29@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jWt/1ozbl0dld9wvAQ3BCTWwBcOFD0U5CNrAcaGgFJyrTRHuPdpJw/lMCJktQlAPuNXTcg03JtqarucHqtwgUTBmk+R+bUbswxDck8Ip6zCMmIOm33BeOVCG3KaiRkgrjzspEt8PwKjId6Lsd4GG8ZG0X1RC4ddDYEXPaekK2CcKtRewKlge3kJjQJdjGnHzNeFz8VBh11nYF7ihPbEodPCvkAbl8pM3IXeUxtJkfa6/cuLl4IR3ULKmG/pS6l6ypFMXcj1h6e1VHEvtutQKvHX3d4Kuqv6XiVRK6CWd3Q2kuVJCVHooryy322IZnsBzgk+NuBHeDfpegXqJzUfeIupAlRnTWb5p8TJTKvRzn9fCm339vv/EU3b8w4IHBIxj2wFbGPRJxjVHQP+bUllmJfMDKTFRxigPko5s5Vgz/+hh41HQTjs7vgzVWjuRRUPWaUZbc/jpAulbj9OHQfV3wmo2nOm1MGFWYVxIynrBy7hLyIGVCGFrORcHOStgU9e+5Hr0Kz701T4dp0haihcHBEvVa43ItZqrjJdzq8yZoTs+pauF/5Z+OzmgncPV3xaRusbIe5r6JCOmR5mTAFTzQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39840400004)(6916009)(4326008)(6506007)(478600001)(86362001)(66556008)(66476007)(8676002)(316002)(66946007)(107886003)(6486002)(83380400001)(36756003)(6512007)(956004)(2616005)(8936002)(26005)(5660300002)(52116002)(6666004)(186003)(2906002)(16526019)(1076003)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WjxvGy31qx/7c6KAZ0JoXEF3ZjMW+bCWfcHemItPVXZyEBrdjQTtVZJX3ATM?=
 =?us-ascii?Q?C+b2fmkHTj4LtVcnw1WHH6Pe8147RqsDPmLwIrGm9aok7MGw+RagdwCSvsBB?=
 =?us-ascii?Q?DwH2I2sXin4QIDgRDDQx0w6e5xAs1/EbQzee73k3D/jy+2KrJpykq4bhsPDq?=
 =?us-ascii?Q?2gUkOu3FwXo0cz4/wrwk5Kwp7XYGYKSCRbO2mGV8hLO9+EwB56jzTW+obJVB?=
 =?us-ascii?Q?Wgomf7El3yNPDN4AlnUs7ySdzeJvthLe+A2UNVt/TP8k7A47ifWp7opXkGI3?=
 =?us-ascii?Q?sCfxjoyRJXCs9wikyYKVSAnTPUhaqS/sTBkV2Sl9chdOd6XAD/smS/zoP2yW?=
 =?us-ascii?Q?RPCOR0AluO3EmWaVoO48CTwIbDqvaQqDFHziq5/NLt+MPH6BQjTdNUSIa6jN?=
 =?us-ascii?Q?SOGX3++cX+eLCrXVRJwuR+ztcEnZ0Bm8MTjN2ocxtMxge2K1ONGqszm4VpYX?=
 =?us-ascii?Q?GnlOBuQOfEM6WPYJGzSNAwEZD1Y24yqp40AB5GRT3lqiZmI/Cxl5fT7+lax5?=
 =?us-ascii?Q?NWOyYZILINibO70Og+CVkOBmKh81j86tf1os6g8fJHZ53IhklHdYDZU0xY+B?=
 =?us-ascii?Q?3h1Pv+pffkg2mLuhPN6x5DyHvUBj6kdnfBlttAg32Ko/M5c3HzfqVlfwME+h?=
 =?us-ascii?Q?MKsopxZ5fuk7nKiyhqB8ami7Lchruiv5DH/PNJQgpf0hqm9tNbtMFRjbEzaB?=
 =?us-ascii?Q?fzJRnfFhPA6yzDtHRAXQ+GqaFuh6RfejkSI7QhGIK5KUImG/CtATSSh2zkp4?=
 =?us-ascii?Q?jY2LohwNvo30W9wlZdYqZBwOn3DdOs+uZtmrontWRmK+bwxpgavelZNqpTh5?=
 =?us-ascii?Q?fma+YaGNefS7blrtC45EVZLExHH/c2deo3MfhRhO6yabDTYh6TlgF2q8PgDH?=
 =?us-ascii?Q?F+y/UxLOTP10qqatbQxb2cKSVLBh+OYd/5gqO9PK5bECyTN7uUSX7d/Uw2Xg?=
 =?us-ascii?Q?sdGbPAniYqvm+Q315x5RTQmwoirsQIwd4FflR4L/OExH5A5BCHozGGlPhhSO?=
 =?us-ascii?Q?ec7dImVZ5LM5GLloRZPzwjbZmv7xCG6FsGnTA973VR6zdA49zkivd8Py8Awf?=
 =?us-ascii?Q?4OdP3oPU2O9clJWQEscqEenbxAxfnvZyKJAltuYokmIP5+HEIvwAXDm/6C5L?=
 =?us-ascii?Q?dhdp39yMIW2NklINg1bMQa6dRLRDX/RKn8KC68bZXBcNfu7Bfnf+jibiv1Kd?=
 =?us-ascii?Q?XymlUGc6bBlFjzh97El6grw0BqDqQtUUrqR/PwTgw4bbLyA3tfx9+VmRHlhN?=
 =?us-ascii?Q?dsoP/Wd0jk8+V05InexjYI5axlC4llpcBGBwVgWw+INnxmU0+YXIMFbLTdae?=
 =?us-ascii?Q?gYkIJqQTEHXI0Kn1p6pwMdfD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273ca9fe-fa35-4798-599a-08d8c9f45807
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:37:36.0538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVbTcVKaa+NaLtGk4Rxvh5POl435U8uFQBKtdkQ9CV/gYxTMZfwQpPGwPxuOc06LyiIieHcFdgbAUOAYZHsandabFBPGQe8vZmaXRZXwW6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.0.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

We are going to cancel in-flight requests on mirror nbd target on job
cancel. Still nbd is often used not directly but as raw-format child.
So, add pass-through handler here.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/raw-format.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/raw-format.c b/block/raw-format.c
index 42ec50802b..7717578ed6 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -575,6 +575,11 @@ static const char *const raw_strong_runtime_opts[] = {
     NULL
 };
 
+static void raw_cancel_in_flight(BlockDriverState *bs)
+{
+    bdrv_cancel_in_flight(bs->file->bs);
+}
+
 BlockDriver bdrv_raw = {
     .format_name          = "raw",
     .instance_size        = sizeof(BDRVRawState),
@@ -608,6 +613,7 @@ BlockDriver bdrv_raw = {
     .bdrv_has_zero_init   = &raw_has_zero_init,
     .strong_runtime_opts  = raw_strong_runtime_opts,
     .mutable_opts         = mutable_opts,
+    .bdrv_cancel_in_flight = raw_cancel_in_flight,
 };
 
 static void bdrv_raw_init(void)
-- 
2.29.2


