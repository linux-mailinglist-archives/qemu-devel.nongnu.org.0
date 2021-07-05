Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7443BBA1A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:22:09 +0200 (CEST)
Received: from localhost ([::1]:48842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Kno-0004yK-V5
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiE-0002RD-BK; Mon, 05 Jul 2021 05:16:22 -0400
Received: from mail-db8eur05on2138.outbound.protection.outlook.com
 ([40.107.20.138]:40000 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiB-000816-TN; Mon, 05 Jul 2021 05:16:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+jn0dMLbdKzNI67Le2dOrE1WrXBgT9y3rikz3bKfqYHFeib8GmL/qXLyxze11Vm5gfQsDkJU+YlYpCICplrw/EnAyyDJGUb+1NliPkXVtS+B7B9vQDRnc3AGlw1G1G3eTvQJwvCvKWpPuUFM0pM2ACZScwluVY6W0DG+RieZUdsu/puAWe6MVXx4dWcrWETVV/pmXrZXiLIRmiCWGIS19MXHIVGdYmGgI+Aj3SanS/1+owGds7J5B0IV8NC769r+oT5lE8w/omhio+0XrmPqMvXWfqLLhI+zfjHBzFmyb+E2pZmqz52dwxgr0IXlDvnRKgISvXFhpq0VGKMcxSGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fP+7I89alnK5Kwx8oVYd6+FR22Ui4O7pKO03LH90wI=;
 b=STaG60YaDYkAkH8yE6fCfLILLeLYhv3DqlvedpGzSpAm/1evizyu/ebeBvfYyJllUDax0le6tKrZL1iNw962eQS7dj5XOlr8w87PitpaJRgodKth7I4cojWYaHpkMmec8LKE43E61rhdmItcQjvJ6tmkXdTkOOi7gbt813EXzRmdCI4QlyluIC4b75+dZmtGNzYqdqSWPBImj6vchylB34Q5QSbh28QsWAyp8k4/qCdHz4DLDxbFJ8FEEbU0vzpeEjHOOyyn3S2j1D9Grvx7W3YmlGJPvuhz3hAF/qOBN/woUEfn1iktJLG5F7yuNcEWQBFbwoFePuokbotXeFIuMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fP+7I89alnK5Kwx8oVYd6+FR22Ui4O7pKO03LH90wI=;
 b=HKZiemJOHZ9mQUWNINnK3QCXRaDFKrxqBhets+hwqHWIvgXuDL2xyZSC5e8hYBjgUKeRKdbf08ByM8H/2NXIIWqJr8hmjHkRGeGYlWFp0K3LfsH80Jwvf2m6d8zV6IJk3ucPnJLOgSlWdgj75+24YUb0NbJ9cqIG0d1wgpp8sF0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 09:16:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 08/14] iotests/common.rc: _make_test_img(): smarter
 compressiont_type handling
Date: Mon,  5 Jul 2021 12:15:43 +0300
Message-Id: <20210705091549.178335-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0662909d-fbac-4fec-acc3-08d93f9588d4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44707CD44F82E4FD8C4F1EEEC11C9@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lwJjbwrK8L9agSR1N0kffX9D7qeRuHwFFgcyxiD2E+bmVsJ/OIU2HY/V6wH/WeIqQ1+mBTDrzbo0OjvuEMdDg4gQ/ZQO/on62WYd9gkuX/4PRPwqdy3NKUned2phPUs98Pl8VQaNVDsFQBfAwfgNL37UMao2glnvP1KpymXVxRsr0NgEkzY6BoHL+JLnp5RgsdBq/X/zGrNqlcSqDSQD17fgE4ECLLKvCjxDyGvfdIQo/4UE71EX2j3TpSHcNeRhXUFfC6shsQrQpexn9ZTwTZnOi6Vpq/hxv1kgdSEPCVRDkQ7hKEIc0ccwF8SJbwP2GP/iOt9igUqICZh07hLsETLCdcosSbsjVyPWPBQ1KXueubQVUJHcQlL5KvJI2LLbSls3s9rBNGrGDqJ/c8RoKo54iFRSr9zsBoPi7tP/tc2b8ftY3/W2tp7CJCf43yx7Hyd9jBp0L6FjPrN1Qr45mL0p0MU8aL+KbKO4xaIRGzQkyNO5rdRqTg+Y4iY6vel0Ovoz/ppTjGlOCg7hTTQlhVFiNVJQgTrCZlCdc2wd3f9Wc/BbPkJ0zfftLQQrmiAK5n2IYf4sRQnbcpBfMaFJFwBT9x+4v6OOZiPD5q1CrGmK3ImZGMR1NnJkQ4oDdWj97ZDs0Ap8MjeOdTvH51HC/qg7Vy655J2MlLlTNXfa/2mJgUxcX24ny3b8nM8IJCzzd1E6hyMliVrsfNjESDuCTKTT4EhOl1r9WLGNVni/GJc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(376002)(346002)(396003)(478600001)(66946007)(66476007)(66556008)(4326008)(956004)(2616005)(6512007)(2906002)(38350700002)(316002)(38100700002)(6916009)(6506007)(6486002)(1076003)(26005)(186003)(16526019)(5660300002)(36756003)(52116002)(8936002)(6666004)(86362001)(8676002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wBL3rNs1765Rl+QxI36IO1Bzakjbo6cTdqtf42KDH6dfDAF0k9ZnfyLJIYhE?=
 =?us-ascii?Q?sShSUQcd5QAVQ/tIWF1blzsrTBTMC3AIE5Rp/eSA+EGmAtXi3D991K1fRE6C?=
 =?us-ascii?Q?hOfW/brpCaNS7bZAjb8ivptNce+lZUy5R3DBULSOMSdv23RT35BUR5REbqt/?=
 =?us-ascii?Q?qxD996TWD6riT86ay6/IvmGRFIX0deelYhQq4H0WghVLVUb9YoVvYjnq0ATV?=
 =?us-ascii?Q?jpkRDZZtCgpS3WJ51t97Qa05KXTDYC2BxteTNwPS8LwY3U71qcIjSxbNq0bE?=
 =?us-ascii?Q?yHADh5lbodt8b9UxpvMfxqOP2MdUs3zqtx5YJjWnEghQNBwsQchPNzw7R8xN?=
 =?us-ascii?Q?9GtsXw3FcdbThD5ggKQmcLRUplBDBcEjFm21qarqwwX8h3gH313paX4+9Roh?=
 =?us-ascii?Q?wK5RMHCc422emz48pZgl39dZeH7H0Kotpvy01ueM1ZErA3meIsMy0T+Wzu7g?=
 =?us-ascii?Q?wwHXUg13jqN8tT7VgbHVJlIhj7sHoy36WPBn5Wt3iTsjgqqbWlfMahydre6W?=
 =?us-ascii?Q?/wSEPmpDPhT5orTxgvHXINIrZU39bz7/GmXHSfKpAv9QCwN/UgQGSW/u6ngn?=
 =?us-ascii?Q?lutb4WaRsAjgnDjgUKBm3Bz2z0Y4y4cTnDw2sWlSXLRBOnlbJKPznwFGkFBb?=
 =?us-ascii?Q?kW2nJjpoHgjKSMV/YDTRciQ17Ewq8bIjQ9jH2BQ5tmYCyUQ93PuGkWuMmrRi?=
 =?us-ascii?Q?3WG8HkusvgYiAV/39J0bfV2EcnPmAYu7wcwf0ReaimnRBqRs5FD8YTgCUDMP?=
 =?us-ascii?Q?GY5GIth0OSJW2UxDp5A67ru52u66sDiE8Eke5Lc2qHY+OSmGw2E5A1pXPblN?=
 =?us-ascii?Q?1CKCHNUjjL1JBZUcO++CLklds+TSz6goGuPzf6AyhAU+c4PGsvzZqr6vOF25?=
 =?us-ascii?Q?iq8hpmfo/XNsytTghPr7PQCK962+iriIC2bA9u2L0jI4/eYKSPIWMZias2Vz?=
 =?us-ascii?Q?Vo1xqfm5CkbtmKsS3JycuSbrly0n3BnFh2ByA3TJV88jjz0OW/DvSUdZgxV2?=
 =?us-ascii?Q?1QTIQqlKRrlSu8ZdC4F8W8Igr+hKMVH6Q2q1/267a3HI980hO9OMm/CoTTI9?=
 =?us-ascii?Q?f3N2YjDHrSXuwUdClG3hPRs3CoSxGij6ynCQ4uki3mq1f70st0RnWHGNpMdt?=
 =?us-ascii?Q?3puheZR3Sg65U5Ndadfs8nzCbnztGCXdYwvXk8j4e/BB3jnR+dXIaVtNoa20?=
 =?us-ascii?Q?StuY2cfPyTqgjjbTQ36d8yrvS8w/gNP56AfG9ikExPZX4OYJByBBX65xPsuN?=
 =?us-ascii?Q?jIB+Vweb1gYizM3Uof4YjTI8K3WC0w3Hii7eX+uLW57EMbW07owMs+1ETtj1?=
 =?us-ascii?Q?/xjXhIYWe1uUyvyGKfzHzoS4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0662909d-fbac-4fec-acc3-08d93f9588d4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:12.9505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQfINkH1W6sr3oxPEo1M+qE8g6daNqNnykEYL127xegAtHVXgtUeR6kSK/wZqcILnKiwJQV+JJw3f0ll7IMiFGxXpS+KgD2CYAozKAPIduc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.20.138;
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

Like it is done in iotests.py in qemu_img_create_prepare_args(), let's
not follow compression_type=zstd of IMGOPTS if test creates image in
old format.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/common.rc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index cbbf6d7c7f..4cae5b2d70 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -438,6 +438,14 @@ _make_test_img()
             backing_file=$param
             continue
         elif $opts_param; then
+            if [[ "$param" == *"compat=0"* ]]; then
+                # If user specified zstd compression type in IMGOPTS, this will
+                # just not work. So, let's imply forcing zlib compression when
+                # test creates image in old version of the format.
+                # Similarly works qemu_img_create_prepare_args() in iotests.py
+                optstr=$(echo "$optstr" | $SED -e 's/compression_type=\w\+//')
+                optstr=$(_optstr_add "$optstr" "compression_type=zlib")
+            fi
             optstr=$(_optstr_add "$optstr" "$param")
             opts_param=false
             continue
-- 
2.29.2


