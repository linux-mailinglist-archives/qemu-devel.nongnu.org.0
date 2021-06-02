Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32347398A3F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:13:41 +0200 (CEST)
Received: from localhost ([::1]:44994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQgm-0003Kn-9B
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQem-0008QZ-8Y; Wed, 02 Jun 2021 09:11:36 -0400
Received: from mail-eopbgr70104.outbound.protection.outlook.com
 ([40.107.7.104]:36580 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQej-00035G-SO; Wed, 02 Jun 2021 09:11:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2ETxMa75/Bf7BhO5IMeTIs/UQ1HziShg9VLLMbMzKkHE9B5Y+j10rX8Dj381EiIl4fUkaa9pXZXoFn5Ocij9U5N7TfgPBnc1EfAIvClx3UX4tg7L+JsJ4wTzj4nkX5yoAeixPt0rgfyiUGK4eN9cKdcq0UGokXm/FwHU8yFbSSkGJnknDtdsVMEqSG8Vm3sd3hv5Uf7NKOip19MxPFpOA8wgh9H8ytFx0ghWdmmjNrEsdbpB23reYYJUn+gG+DYah+s8zLK1FuazIKaUdhBdBieToqIEIQnHsjsnLoRSepreiz8nmTwYzMQFYQv7Nq8ky5zcznp1RXszM9ZwkKTqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjT50Aw6DWlp8So9JgiboauEL1EcinJadqO9w7vuNQM=;
 b=Tj7w+i/ChxFs/rcqsnIs3WVOCNi7EQtAj+UveNB9iqrfmQYr6sbMbdnTaBhSZmWrSpChd21y4XPczuEKvABqWaQm1b3/Pny+JFgNOw00A4Vd2C8Wbehe8xuoniy9l4FydP9H/YRYILIAydTPa6YPckFFnNTtf8x5qxEZvS+zcV/LIm+XNx4RgWY7mn6mu3YimoDfzfnsKJ3dAqkp1dmYAtatZpjDrPFqhQp37H/XZkaDV96HecVVKXzCL7bTowneF4Gj7fs7+SJQM8xrkPb54u9PPGdEKpFN1mGUp514UtmHrU4oAQ9cu6JInkFQqLZxhErtY3oDOHOF6fvj1CTaSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjT50Aw6DWlp8So9JgiboauEL1EcinJadqO9w7vuNQM=;
 b=Qpu2S5zFxIF2FXWMMVLm4Cgmi6EY1xW+L34aOjv3jal7zgsgpTHsD9gWVXJECoqASwhBd23r8qJ9Owumom21i2FS+Z7sF4MJg/wO3U8zqujbCHKisYEBim7S/QRqMTxIOSWziqeUJm/hvvYMZGPRX2DQZNaYntVrWamfNXcUhCE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 13:11:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 01/35] block: rename bdrv_replace_child to
 bdrv_replace_child_tran
Date: Wed,  2 Jun 2021 16:10:34 +0300
Message-Id: <20210602131108.74979-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e594805c-f3b2-4db9-341f-08d925c7edf7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376541C5115927AD7F57474C13D9@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lwuw6IPPHszVVHRPKAMwVKq4PU+MCz3yhqNcVN9xUihaQU8yfR2HvxB8uNuvlRCl6fOqRSfrAoshVcpNC4N/iULxpvh5pW+TCUsS97mlMcSuQ+lD9Q3nRHQuUUeLVTp4jANMzFM0fTjRgG1W2AgcrpeYNx66c9G7wJHD81cwf84oogk10sqN9vNVHdag2ToshkjEc5qiVC703Lt90utonNVuiLBTDodR1c/R4aibf53I0Bl0EoyRSsH1vkZutb6hXbFiSdbbpRxbnE6yaPhIxfV9u9MWOf8rN68Rw83CRit+uGRslL0iUu2Ek/z30WIjI/bNUJ9jO8s21Yx++4Fv/fQhmSxJ49/QpjWpLXF8cA2M7NTvO0U3ivBH2GRcq+pnEMulcr15RViBU8ei1I9E4DE35LQA2C+7xhATsFcnSvrjr+w0oiPVrul80MxB9PpzvjYVCmgfNoVRH14eD/LjcXfY3Fh8XDcIK89kSC71XzXBWYWWLbrrARlOedh3Tr+7Mte7Fk0Ngcv2drxL4d2z55Q3YVRteFJSqBc70MwXSJXfIv6BzaFyZIH8zfIWmA79IzmU5KI8w0O1hcAA91uJcf5jfdfFJc89aahq05KAd0+1Is3BFrHeF9t18qvWedYfArkLG9cs+jtk15/QobTpOvpzMImDZT7pEgkFRRbx+h+cDShVi0J522Jje4BKohNs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(8936002)(66476007)(66946007)(6512007)(86362001)(1076003)(36756003)(6486002)(7416002)(956004)(2616005)(83380400001)(52116002)(38350700002)(6506007)(8676002)(5660300002)(26005)(6916009)(2906002)(16526019)(6666004)(316002)(186003)(38100700002)(478600001)(4326008)(66556008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ypG9x/wFpBffcyVjd/5BDAgtSsRMEwxtTovmbWoF4ChUouHDxh4FX1wf50RD?=
 =?us-ascii?Q?hDPQv+OCwUztEOUKQtPDwoWUOzHvjbxUPvWtc+eenWSrGi/Wgaryl/vABmMa?=
 =?us-ascii?Q?Zo9qlWn8cwu01MYM0wn2wDq33rvCC5ihH0hySKLFyAO12sBeOkv0SX+rx6Yi?=
 =?us-ascii?Q?SJwX6OiQOs8l2y3ZvUHacEvUHbGxt5NDNdt98ADP1gMgyoeiRuJFDFi2NKWv?=
 =?us-ascii?Q?V/H7RRXDTo65c/b38fU7APCBFUy4cVlg69nNE5sSHTbhSKHO7fPMjT50ItIV?=
 =?us-ascii?Q?L4Zk8MOUQ/Ff198f8pIoAfvd1rje3ZAk5ITcHgCwQNl9rSvi6EY3gkmA7tan?=
 =?us-ascii?Q?QIZ+OXCxH2Yt1IK64dW72VIQAdthzzGk+fia506qZKujxIjUT+8wwf9LPA8i?=
 =?us-ascii?Q?ZtFNmr5wbOuniC2lo6Q4HfJj/0trJE1sqMW8SpirUbkQmWhRGB2riKMZMUb1?=
 =?us-ascii?Q?2BPlgO0b61cgsMsVhNjUfs6U0XEUq0PIQHNUieCtpkhyOAMSiz4XkgXfI157?=
 =?us-ascii?Q?hb1HFw23Q82gk80hfq81lPnyeMXF+1BS5ca0VTw4aJmqeWtDmGdHx8z98fyd?=
 =?us-ascii?Q?84dZ5XQ4cOPoGPHvPiF06M98O9TK+jPiAfnmtzghxXTFQqg80v0URCsl6vtb?=
 =?us-ascii?Q?T+sfsILeBRkOADXYc1YHg+cSQZ9zcx7waaR2TEtWMkqCdpK/CkkQHMjOb3NK?=
 =?us-ascii?Q?Su/BuVejahSZHUdpTCQBhFn7M8PHGrZKAFYN0B9R+kw5LJXrD8XvoZi1H/Qx?=
 =?us-ascii?Q?1LSGBycgBxL3YCxV6ukqFvRdfSm17Paqpc3QlG9yh/BOGWvFbd4fBEcHEtXZ?=
 =?us-ascii?Q?CNAPtqDLgKLsPouN7EfiSv5+SQvHlze4Zg/mf+1UDSBoYfUksAUIn9JCmJt7?=
 =?us-ascii?Q?LKojrp95K56r/DUXJWNE1YqKrlWTGslNEmylvP4SGx43ZibqZqPHgEvUEnna?=
 =?us-ascii?Q?9tNJ8buol2QG1t0nrE3pK+DaNhBbINJp9cL6hXKPLkA43f72rZKCr67ybcKS?=
 =?us-ascii?Q?ciybJFbUJwZgSllGz+EEUiQBcyEC4GhOTbbbm9Qo0vXAFK4Ns6rckYdrieln?=
 =?us-ascii?Q?D6ZMRisSXrYDXXxKfFHy56bIPqCCsNdM9JaRVhrLGIvsQkup5AoUIJ9p0puG?=
 =?us-ascii?Q?G2WBzLL+DaODxMZZ29ItG6tcr2C3DTSB4wfHXlChkha8gQ4U/1q8BmhB9Pqv?=
 =?us-ascii?Q?ADGwS5u73v0kbNhl5r78VlCSixTt+UCBWzXRuHoCyLW94xXLXh79iJbMvw9T?=
 =?us-ascii?Q?/LomejimvE+baU7U6KaWH752zZgEbQPoPbZoFm1s+4jCY1USq5QUg2uolGNR?=
 =?us-ascii?Q?9lbDdZgEFMpKJhWS3sdXPI8v?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e594805c-f3b2-4db9-341f-08d925c7edf7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:27.1841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddC1w8ExXBdSaGoaoHiHvXXyWmw2iIES5oappfAULj3sDliEyvB9TOnjWwMqwS/wI7kVRJmS9KIMUqEG27GgeUG90LIguKnjSsYqv9AJCaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.7.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

We have bdrv_replace_child() wrapper on bdrv_replace_child_noperm().
But bdrv_replace_child() doesn't update permissions. It's rather
strange, as normally it's expected that foo() should call foo_noperm()
and update permissions.

Let's rename and add comment.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 3f456892d0..34bfe4ffe8 100644
--- a/block.c
+++ b/block.c
@@ -2249,12 +2249,14 @@ static TransactionActionDrv bdrv_replace_child_drv = {
 };
 
 /*
- * bdrv_replace_child
+ * bdrv_replace_child_tran
  *
  * Note: real unref of old_bs is done only on commit.
+ *
+ * The function doesn't update permissions, caller is responsible for this.
  */
-static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs,
-                               Transaction *tran)
+static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
+                                    Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
@@ -4766,7 +4768,7 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
     }
 
     /*
-     * We don't have to restore child->bs here to undo bdrv_replace_child()
+     * We don't have to restore child->bs here to undo bdrv_replace_child_tran()
      * because that function is transactionable and it registered own completion
      * entries in @tran, so .abort() for bdrv_replace_child_safe() will be
      * called automatically.
@@ -4802,7 +4804,7 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        bdrv_replace_child(child, NULL, tran);
+        bdrv_replace_child_tran(child, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
@@ -4842,7 +4844,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-        bdrv_replace_child(c, to, tran);
+        bdrv_replace_child_tran(c, to, tran);
     }
 
     return 0;
-- 
2.29.2


