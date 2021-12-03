Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2893467EDB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:34:46 +0100 (CET)
Received: from localhost ([::1]:48390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFGX-0007nM-Rc
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:34:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8o-0000pC-PO; Fri, 03 Dec 2021 15:26:46 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:14661 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8j-0001cv-L6; Fri, 03 Dec 2021 15:26:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+oqbECkkfhD5HGhzwvMn48SU8tM/anaUSEzCmymXOnhNSJ9Jf1yHKC5Y8LnN0JuMWtbgZjgX5m/gUcADfyrhlapIqwmD3J2mshf6m3n1F2mG125lzHHY8nkr9EwflrTrowT+cQl341OqAkOiAM5Gp3CWuLrxdnF/TvC7LaApIsRSMNb2fV51VWiIiCqOiTI0bqxYhas3lNWqrDAPOa/bzsvcJMBpQbNoDUFZLoM/P1SJN4xm5kDZ/iphw+TF4L6LcSI/zp5tXXhbH94rh4Bpa72euBl04eceAkozbdFCpMaC2lRqfhWGI0qSb0TjclZWqfxr7+/a8H2jRs4nleArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZPWIGAerzxn5KHBLmT+bIVXzg7sxl6k7Hk+9IS1jo8=;
 b=WXQxWj7gypxA54ZBqtZxT8yIXQgpCQmgt81wXMtRPx1xuRGWqYWrlOVI2CGwPcZ6U8z01ig+R0UuTN2uDsEHUzmW3kxSbsOlj11mmdEHs1TZiGTsXosxN9HZ8SF8VQtFVges5oZsR4P3sqgJBmsxSIFGClPPJ1PW6gE+rUfqemm/2OzOFvb2BFdY49DGFiharQLDEnSjKaMYnzlUyKkQiFuPdiWgSfgMktOxRv47wG24nNjYSmwbZe2lkqJKg0mCCqu1fAdi2jyVrnTCKLGfBeFAm4LYqm4jmd9AE2hKk582hLvlszY6W0wVZIetkdBm6XTrAS5Qzc13D2eAOmHlSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZPWIGAerzxn5KHBLmT+bIVXzg7sxl6k7Hk+9IS1jo8=;
 b=NfzhPlA4BVkcaHDELG+8AKGek1+XLeX6RO6nN+X/BRmSlBIIyg66etVUSTRBY4PxVbBAv0rPnTDBoXSy8k6wamPsfRPPuHpGKcw1AEK+ebNkNJBtoe9EvYHw09BUxuFokSzZC4r1TPNQ0lVEiva26RV3P2BNcwF0txRLNCRISdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3841.eurprd08.prod.outlook.com (2603:10a6:208:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 20:26:18 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH 02/14] block: introduce bdrv_open_file_child() helper
Date: Fri,  3 Dec 2021 21:25:41 +0100
Message-Id: <20211203202553.3231580-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8722c69-829a-45a8-85d7-08d9b69b294d
X-MS-TrafficTypeDiagnostic: AM0PR08MB3841:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3841BA129398E622D61D29BDC16A9@AM0PR08MB3841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kmdXILhK/TK+mMU7NOx//SNONXzdQzqSqLLgBp+m3VfbpHUOMU4o4ynQHH3Ja+q7rEKwLmp/aMPwnNoYW6wtrmaJvi3af0T6k/68m62G8TvaG8k05RKIUAm/e5sZmsuxTTTBDmimvHRElus/swcuiJQ6xwGFY4ah0HI5yhwOIfx9yiVTzAPLKjnb/C+fGrFECcEGSpRVXQ6UPDqknZzPbzZ3zJlCVz/dxH5itB1g7tvk5sZWK5xtsuPXkVEyjImeVarLICSCbxkN2oB9bDFu80+FYvimM63LmMgQctia+5VFtbAtcv5ZeAvjE2KCOCM5ejQjsCzHzh7ekRHT7VD8awDwG81+iU8pjM31I0bqomGRU5en6XEXbAdHNxSfxekUn0YEBlItFd+32tH8UbRGJ1ZPc02lpiyrByza65ZP5RN3GB1hTzhvohmrU04XIAL2nxw2bxe0gr+5yrWTSBbGglnx1qE0ON0KqBASD7iEEUZ/sz4NPNO8GsMHNZUxu/wI8jz4jYs5StJeTQG37aZLF3CpOZtCjTjZHn/7Arkk8FIcDm2N5h+FEdjttiuGVxtw8RPFl/Wt+Ra4VLMrxtIe6cP9sbZXXxf7uNU3JzXXgV6mQOLIBrT+odTjPX4sm28fE0uOJFI/FBS9cJTGUd1Tnp1oT2wmJNSh78ugao7kKB89R3R6J/4i1eJSbnXfapTOyVaNU7EgubwNNYxRDntxvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(86362001)(2906002)(2616005)(7416002)(54906003)(6506007)(6916009)(1076003)(66946007)(26005)(30864003)(36756003)(6666004)(66556008)(6512007)(52116002)(38100700002)(83380400001)(38350700002)(8936002)(8676002)(5660300002)(508600001)(4326008)(6486002)(316002)(956004)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tgurNpzvOgZ+O4hl5u9TfaPcfusaOidpvKpc8JbTzN+iN6Z+q94d9GR7nyOJ?=
 =?us-ascii?Q?EpmwV2hhN4ikE19N/zvDjk8LyNG825GiYnltEOxEYc3fDBCW1EZNYUGC7CON?=
 =?us-ascii?Q?w9D01pbORBdIoQbW+uSt3gWklEu9mr0UPQC8204gB99o563gWQOGE9iJLvcJ?=
 =?us-ascii?Q?uCGMoK8V/Wx/b0VoRvaKzpc67QVgKWqZQN+ONjjRtTCg3NNThtvrN6r1N2Gd?=
 =?us-ascii?Q?gBshYpGUJuZmc/1blZjCaLEpHCBBTA6erDMpDAqFAz6nF6Mcp/mD5pQvpFWq?=
 =?us-ascii?Q?s7IfCyNPslG/O75BCPTQ9Ey/QOx0JiiIliN+ku2Gd5NbfT7L/NIUJQlQaTrT?=
 =?us-ascii?Q?MVjeFTAyIATBwjtczArTF/Gss1zqzYhuuANoZjgvGULPYC51io+BHay5hSSo?=
 =?us-ascii?Q?SCRsygxe3NkWshx3VGTCjd1/DAxu2FD7SZjI78+AIiTZ/qcIjr32vQFOGEoB?=
 =?us-ascii?Q?Sq41l7kS+NpQiJGRnJbaak62dyTAl055gl9dmRQRbez21E6V8A6ikXHmmZBG?=
 =?us-ascii?Q?kZEL3ccPJT8d2pEj5eL36Wb+OfKwWZf+ulIK3KfxA3BJ5QlfXnk6UCd6RVq6?=
 =?us-ascii?Q?5E8szMY6NL01mMZ0DU2DiZrCkPnQ4JTb44jo8z6shJ2nnubuL1N+9nlStAqF?=
 =?us-ascii?Q?3apRf9Vmkhnh5ge1bF2hT3Bg31fjYDWMeRs+4X1qhgcnH3Izem72laBCPa9/?=
 =?us-ascii?Q?UcvX2Q3xfuA7CpLnzPwlf5E956Q8zcD/kz4s3l3ii/36eoP7IgZjkFPokiKJ?=
 =?us-ascii?Q?1aiwoNXrsZZkqKWzDFtv/5XRsVvFkpASaUcT8A8SCLjzrfaHSce5KXRY8fOO?=
 =?us-ascii?Q?fvbM+Ujxn+mqqZKK9yw5qs9G3okPZ+Il+/sAsnjw9vw1H6VVDcVnC1Ay5tfr?=
 =?us-ascii?Q?sk6POlykvm62/J2IT7m4IzzFL2Upc3M8rxq9YkhO/Gd/KdO8NE+haW+9XaYu?=
 =?us-ascii?Q?qDY8WPHndQG4LqIDxPmFl9UrLRQFA8FN2ldbrBnJJ2ZpvncxeRV4eWCQVA0O?=
 =?us-ascii?Q?PemHZJBEisxtFDLnYUeFxOoP21LwCNggxGuBtpRiluJ9Z6AKwcQqjBfWZXOy?=
 =?us-ascii?Q?xPlKOX5BeBmwamkFK/zVVyQQf0InppLjBOtKKmuVCXNPY4tOCieLvbxfHtJR?=
 =?us-ascii?Q?Kqy2ttnrUEI3wqg3Vc+dAKuwnEJK53EFct3241YcSAYeJMCbPMT+4iXw3zAM?=
 =?us-ascii?Q?YAehcqBkFyLzqn+wpwe9uEVuuD87MU3TohubkumDJI2m/02QriosclmhGwMg?=
 =?us-ascii?Q?aCuPAkR/FrTxtajoyHnB5v+Eh3DJD+f7S5jZ5IyVQNB0fahVocNv2GFeQqvr?=
 =?us-ascii?Q?5XcI6xVAso48Gf72cc+ybMxEkD87QNPTsCFB89iWpgMpr4zA4niJDR2z4yfU?=
 =?us-ascii?Q?kT8uOnB0YFFaJfOoEy8hjmejWF2g8vR4zPMghQHOqO7Bs1ZR5acpj8MgG3kG?=
 =?us-ascii?Q?JedA6AGzvE8tFtRhkI3N4UynXNvT9eQU1rNBLIAub98R/UX3YOYcTc1Hlr46?=
 =?us-ascii?Q?0ct6ZSTP5hqFkCXE3GAdjjtgJbKk4zN2nW3D/ZE/3FVSZw+Yk9qUESy2WYVY?=
 =?us-ascii?Q?je0bHA4MSd/WrjDlpvo/I6eyodQ36Fa7X7LLczSbvFxbFgGD+2vQIquIPCsm?=
 =?us-ascii?Q?5+CkWseLMvri9mE7pGWTehlugaW8dsh9dEqP3ZNN1erIJNJ/aMYvC1bJbmCa?=
 =?us-ascii?Q?6NEbiA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8722c69-829a-45a8-85d7-08d9b69b294d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:18.0490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEqcsms+5C6GSikMPE+kCfCOnoVibulYwdgb8oj6H0IBFCdeRfT23jqYCtZnOYk3deOHFpr9Xxa/uEm3ep8ywGnGvsGLQYtLxhOIX9V5H1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3841
Received-SPF: pass client-ip=40.107.15.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
X-Mailman-Version: 2.1.29
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

Almost all drivers call bdrv_open_child() similarly. Let's create a
helper for this.

The only not updated driver that call bdrv_open_child() to set
bs->file is raw-format, as it sometimes want to have filtered child but
don't set drv->is_filter to true.

Possibly we should implement drv->is_filter_func() handler, to consider
raw-format as filter when it works as filter.. But it's another story.

Note also, that we decrease assignments to bs->file in code: it helps
us restrict modifying this field in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h     |  3 +++
 block.c                   | 21 +++++++++++++++++++++
 block/blkdebug.c          |  9 +++------
 block/blklogwrites.c      |  7 ++-----
 block/blkreplay.c         |  7 ++-----
 block/blkverify.c         |  9 +++------
 block/bochs.c             |  7 +++----
 block/cloop.c             |  7 +++----
 block/copy-before-write.c |  9 ++++-----
 block/copy-on-read.c      |  9 ++++-----
 block/crypto.c            | 11 ++++++-----
 block/dmg.c               |  7 +++----
 block/filter-compress.c   |  6 ++----
 block/parallels.c         |  7 +++----
 block/preallocate.c       |  9 ++++-----
 block/qcow.c              |  6 ++----
 block/qcow2.c             |  8 ++++----
 block/qed.c               |  8 ++++----
 block/replication.c       |  8 +++-----
 block/throttle.c          |  8 +++-----
 block/vdi.c               |  7 +++----
 block/vhdx.c              |  7 +++----
 block/vmdk.c              |  7 +++----
 block/vpc.c               |  7 +++----
 24 files changed, 94 insertions(+), 100 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index e5dd22b034..f885f113ef 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -376,6 +376,9 @@ BdrvChild *bdrv_open_child(const char *filename,
                            const BdrvChildClass *child_class,
                            BdrvChildRole child_role,
                            bool allow_none, Error **errp);
+int bdrv_open_file_child(const char *filename,
+                         QDict *options, const char *bdref_key,
+                         BlockDriverState *parent, Error **errp);
 BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp);
 int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
                         Error **errp);
diff --git a/block.c b/block.c
index 0ac5b163d2..a97720c5eb 100644
--- a/block.c
+++ b/block.c
@@ -3546,6 +3546,27 @@ BdrvChild *bdrv_open_child(const char *filename,
                              errp);
 }
 
+/*
+ * Wrapper on bdrv_open_child() for most popular case: open primary child of bs.
+ */
+int bdrv_open_file_child(const char *filename,
+                         QDict *options, const char *bdref_key,
+                         BlockDriverState *parent, Error **errp)
+{
+    BdrvChildRole role;
+
+    /* commit_top and mirror_top don't use this function */
+    assert(!parent->drv->filtered_child_is_backing);
+
+    role = parent->drv->is_filter ?
+        (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY) : BDRV_CHILD_IMAGE;
+
+    parent->file = bdrv_open_child(filename, options, bdref_key, parent,
+                                   &child_of_bds, role, false, errp);
+
+    return parent->file ? 0 : -EINVAL;
+}
+
 /*
  * TODO Future callers may need to specify parent/child_class in order for
  * option inheritance to work. Existing callers use it for the root node.
diff --git a/block/blkdebug.c b/block/blkdebug.c
index bbf2948703..5fcfc8ac6f 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -503,12 +503,9 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     /* Open the image file */
-    bs->file = bdrv_open_child(qemu_opt_get(opts, "x-image"), options, "image",
-                               bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(qemu_opt_get(opts, "x-image"), options, "image",
+                               bs, errp);
+    if (ret < 0) {
         goto out;
     }
 
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index f7a251e91f..f66a617eb3 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -155,11 +155,8 @@ static int blk_log_writes_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     /* Open the file */
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, false,
-                               errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
         goto fail;
     }
 
diff --git a/block/blkreplay.c b/block/blkreplay.c
index dcbe780ddb..76a0b8d12a 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -26,11 +26,8 @@ static int blkreplay_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
 
     /* Open the image file */
-    bs->file = bdrv_open_child(NULL, options, "image", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "image", bs, errp);
+    if (ret < 0) {
         goto fail;
     }
 
diff --git a/block/blkverify.c b/block/blkverify.c
index d1facf5ba9..920e891684 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -121,12 +121,9 @@ static int blkverify_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     /* Open the raw file */
-    bs->file = bdrv_open_child(qemu_opt_get(opts, "x-raw"), options, "raw",
-                               bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(qemu_opt_get(opts, "x-raw"), options, "raw",
+                               bs, errp);
+    if (ret < 0) {
         goto fail;
     }
 
diff --git a/block/bochs.c b/block/bochs.c
index 4d68658087..b2dc06bbfd 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -110,10 +110,9 @@ static int bochs_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     ret = bdrv_pread(bs->file, 0, &bochs, sizeof(bochs));
diff --git a/block/cloop.c b/block/cloop.c
index b8c6d0eccd..bee87da173 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -71,10 +71,9 @@ static int cloop_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     /* read header */
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c30a5ff8de..8aa2cb6a85 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -150,12 +150,11 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *copy_bitmap;
+    int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 1fc7fb3333..815ac1d835 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -41,12 +41,11 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVStateCOR *state = bs->opaque;
     /* Find a bottom node name, if any */
     const char *bottom_node = qdict_get_try_str(options, "bottom");
+    int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     bs->supported_read_flags = BDRV_REQ_PREFETCH;
diff --git a/block/crypto.c b/block/crypto.c
index c8ba4681e2..abfce39230 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -260,15 +260,14 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
 {
     BlockCrypto *crypto = bs->opaque;
     QemuOpts *opts = NULL;
-    int ret = -EINVAL;
+    int ret;
     QCryptoBlockOpenOptions *open_opts = NULL;
     unsigned int cflags = 0;
     QDict *cryptoopts = NULL;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     bs->supported_write_flags = BDRV_REQ_FUA &
@@ -276,6 +275,7 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
 
     opts = qemu_opts_create(opts_spec, NULL, 0, &error_abort);
     if (!qemu_opts_absorb_qdict(opts, options, errp)) {
+        ret = -EINVAL;
         goto cleanup;
     }
 
@@ -284,6 +284,7 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
 
     open_opts = block_crypto_open_opts_init(cryptoopts, errp);
     if (!open_opts) {
+        ret = -EINVAL;
         goto cleanup;
     }
 
diff --git a/block/dmg.c b/block/dmg.c
index 447901fbb8..38c363dd39 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -439,10 +439,9 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     block_module_load_one("dmg-bz2");
diff --git a/block/filter-compress.c b/block/filter-compress.c
index d5be538619..b2cfa9a9a5 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -30,10 +30,8 @@
 static int compress_open(BlockDriverState *bs, QDict *options, int flags,
                          Error **errp)
 {
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
+    int ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
         return -EINVAL;
     }
 
diff --git a/block/parallels.c b/block/parallels.c
index 6ebad2a2bb..ed4debd899 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -735,10 +735,9 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     Error *local_err = NULL;
     char *buf;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     ret = bdrv_pread(bs->file, 0, &ph, sizeof(ph));
diff --git a/block/preallocate.c b/block/preallocate.c
index 1d4233f730..332408bdc9 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -134,6 +134,7 @@ static int preallocate_open(BlockDriverState *bs, QDict *options, int flags,
                             Error **errp)
 {
     BDRVPreallocateState *s = bs->opaque;
+    int ret;
 
     /*
      * s->data_end and friends should be initialized on permission update.
@@ -141,11 +142,9 @@ static int preallocate_open(BlockDriverState *bs, QDict *options, int flags,
      */
     s->file_end = s->zero_start = s->data_end = -EINVAL;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     if (!preallocate_absorb_opts(&s->opts, options, bs->file->bs, errp)) {
diff --git a/block/qcow.c b/block/qcow.c
index c39940f33e..544a17261f 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -120,10 +120,8 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
     qdict_extract_subqdict(options, &encryptopts, "encrypt.");
     encryptfmt = qdict_get_try_str(encryptopts, "format");
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
         goto fail;
     }
 
diff --git a/block/qcow2.c b/block/qcow2.c
index d509016756..99715c498a 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1890,11 +1890,11 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
         .errp = errp,
         .ret = -EINPROGRESS
     };
+    int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     /* Initialise locks */
diff --git a/block/qed.c b/block/qed.c
index 558d3646c4..e3b06a3d00 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -558,11 +558,11 @@ static int bdrv_qed_open(BlockDriverState *bs, QDict *options, int flags,
         .errp = errp,
         .ret = -EINPROGRESS
     };
+    int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     bdrv_qed_init_state(bs);
diff --git a/block/replication.c b/block/replication.c
index 55c8f894aa..2f17397764 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -88,11 +88,9 @@ static int replication_open(BlockDriverState *bs, QDict *options,
     const char *mode;
     const char *top_id;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     ret = -EINVAL;
diff --git a/block/throttle.c b/block/throttle.c
index 6e8d52fa24..4fb5798c27 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -78,11 +78,9 @@ static int throttle_open(BlockDriverState *bs, QDict *options,
     char *group;
     int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
     bs->supported_write_flags = bs->file->bs->supported_write_flags |
                                 BDRV_REQ_WRITE_UNCHANGED;
diff --git a/block/vdi.c b/block/vdi.c
index bdc58d726e..c50c0ed61f 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -376,10 +376,9 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     QemuUUID uuid_link, uuid_parent;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     logout("\n");
diff --git a/block/vhdx.c b/block/vhdx.c
index 356ec4c455..e7d6d7509a 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -996,10 +996,9 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
     uint64_t signature;
     Error *local_err = NULL;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     s->bat = NULL;
diff --git a/block/vmdk.c b/block/vmdk.c
index 0dfab6e941..7d7e56b36c 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1262,10 +1262,9 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVVmdkState *s = bs->opaque;
     uint32_t magic;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     buf = vmdk_read_desc(bs->file, 0, errp);
diff --git a/block/vpc.c b/block/vpc.c
index 297a26262a..430cab1cbb 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -232,10 +232,9 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     int64_t bs_size;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     opts = qemu_opts_create(&vpc_runtime_opts, NULL, 0, &error_abort);
-- 
2.31.1


