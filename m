Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAFF397882
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:55:29 +0200 (CEST)
Received: from localhost ([::1]:34642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7fs-0003sD-9t
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bd-0001jq-2K; Tue, 01 Jun 2021 12:51:05 -0400
Received: from mail-eopbgr50117.outbound.protection.outlook.com
 ([40.107.5.117]:4526 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7ba-0001yq-6U; Tue, 01 Jun 2021 12:51:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hM7uBTzaAveZ3eXdE1bUUjf8xQAuWscWDREtAcohvKqYv0yd+4c5vddpxMqAni7BTyQZuR3ivcD3RDRPO1RXJtqt5E+T00buneQ8J/nRjt+SgxgxoRx785oVdRtPi4WaP+Lnj77oDF6FUF3Iyf/LMv1KE7xYceDWKOVJ9J5ZQ3Ll2lzjTiOGPXQHmYlKzjkE0rl//ovGisSyQKXIHFMEkKZbC/+ROqIn0bqWnjAYVpQkM7qBz3odsHvt427Sc8dD7eCo6rVrRvr/+GHf5SlTfUwDDWZMUHfBSoBmXHQvp34m7V6ACIVrhcrObBVa8hnsFJZLRc2SHTODsDC9YgWiCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vjw2x0AL6IcxYWcZQRo8Yg0F/zB3SZ+NFGL+4T8bkhA=;
 b=fVPSGeSvnyP96ZAu3A1WjFCuswvRG9ZnoCPrRWSuwLRZ9E5qwjA6DOTy+I21V2nPQD4oj8D0L3KohPIY5Bsj6uniyMXaUDtDqbTWYqe0PEDTtdybv6us6aua9Z3kGy0u45VfAET7sfTBbamUmZ63XkTqZhI6w+FuF2IOCHfyRMUZr9p/DxPN36zvlcVEtBlwRt5kPFklAkUMWfUZ30AG2dDGlw84Pql2QwomEWmK3h2excEpiyTR6o18yvI+cM1FjsbFdieWgD+a0H9xmC2Q6PWr/WC++Tv/KgsJEGpGZ1vB93jhh9HnSXNgOyeucPEUNXl7uNp/Pg2JhgpQT6IFpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vjw2x0AL6IcxYWcZQRo8Yg0F/zB3SZ+NFGL+4T8bkhA=;
 b=dkm+XLTijY55vjIAZm2Fi7WI55+wd3pz//EndG8QDPyNUFPNU2uLevnji7R464TzvgRUHDKBkPYRL+RooPM6p8VbFVccrcHAi7q/xjOgWD9EE0uWnQal4q/7sUrcE4LjbmFtPmlNyrgkzSiKovlyveAHJCrQpTJrMp4wcinpNzA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 16:50:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 04/35] block: introduce blk_replace_bs
Date: Tue,  1 Jun 2021 19:49:55 +0300
Message-Id: <20210601165026.326877-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23dda300-e831-45a6-170f-08d9251d6833
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4471AC1AE0F4EE4BDA4B4E32C13E9@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +elAQkE4kUFm6O5niv0wNTv650XYYvupvWbG6wzyKAchHvm6UG8SJUZGgAAA+Odfb7xpyjFcVPGuk4YhJklJivKVmhMOeQ8v/MdFnbJJjGI0fUG28c4qL387vf/IzMnJC1lXiyVBxE8Vpe9lzSKkWEBfweX2tQaJyX6M7UAzjr7q/gah4+TEPXG/9W9i6hMqFDa+PY2tu6c2hb2ml8vZuBv1Zj6P7tjEtwPs6Mhoseo65OQQMenyV569skGVkIds7CeSG2T7/Frw06OEWgtiJPPvJC5IZ13/4MSTWdUwVdZKhS/agQpQJ/jijHCboVhobg09n5hEeIF+ZHcC83d6HjVMafToWiL+uvMWySeXi6kzHhIKtG2daExo14aYnfzvg9jnUvLJwRRw20h6tz+c2eKEh6gRWaLHXr+zO+Pvud8H3+a1Vs3FpBlVAH2PmxzJ+s7IxZVY5MHL2fb0q0BIYWHe8/gUJ7kkcSYw5fCXwktQriSfEM/Fx450eGezXzyzIHVo05IWN2F5UsOYCRRcl/eiSyjfj9hbkI/WrViXlEbgATx4sUJjvUdmICyGG4CglFIBngU18ya8+UlEe6JVhMEFRdEajRsEMOrSr3anlLh8KPxaLeaVdJoKvZJba8j4TnyypzQoNg4C7ry5C6sN6B4lppAPLA7wRHEQKoyErS4cZMv8O96Oet8OQTqjxGB1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(83380400001)(186003)(6916009)(16526019)(4326008)(26005)(8676002)(2906002)(8936002)(7416002)(38350700002)(38100700002)(478600001)(36756003)(6486002)(316002)(5660300002)(6666004)(6512007)(52116002)(66946007)(6506007)(2616005)(956004)(66556008)(86362001)(1076003)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lABXUp++FYSnGkEPzyygWYHWRELseyg7ETLU+woA0F2TRVYPT2RhWpCOwcpH?=
 =?us-ascii?Q?ssyJ0CR10Tly9Idzk1IwS+HbSpZPhn9pwUPEbS9KUDPwe09I23TVjUTNR0tk?=
 =?us-ascii?Q?niYuQAoZbwQcHrM4dVVpAZ2I9d7ZXr8l9q8wi8lE8w4Qs7l/OhtlaG3RQnKF?=
 =?us-ascii?Q?xoaObspLAYslYhn5SM7mVWC8qIzARPq8DQO3ttv6IZAywDne6T040vNFGBGA?=
 =?us-ascii?Q?IvdsfTXymbcUY9ZA+EaFYTj0R1RK+09LkKYRxJLEIwNPiV++lpTZtmMK3DTn?=
 =?us-ascii?Q?vbv0zvxfNGujJNMJ1fJcegnxslcBJRm0NkCnEMZOUa+GlVuNeqgQUpy/hTWr?=
 =?us-ascii?Q?V/8Z8JmUjThnSS4zsuSp9JFhiKd5B8qx/wuQZAAMTmprnPhY+CMcITJoh1mg?=
 =?us-ascii?Q?eLgXgnNHGFypLnYVPYOmouAwqLlI16gsmQAPEoGZrkjTlso1F81zTyQVIbkt?=
 =?us-ascii?Q?FOKXjJRsDYoph4zjp8DyhiSpualsjJcvMUnw6Z3j8TEvkMfhJhjsmVi/9YMU?=
 =?us-ascii?Q?8i35AW2KGVkZUuVjSEpbqvojQrfUllWTR6+BexCQZDcpyPX8ALpgFzMryQ10?=
 =?us-ascii?Q?hHAOWhLSu0T4iDQwErQsAZ+thSEGaTiAR9riNTL0UT1JRBIgH3N9RE+wHYNa?=
 =?us-ascii?Q?PyMEgZlbqISLVydYJz3obS3y5DpVJEg7z3lR6KwDPpPpTOwssN7NrPURtPNz?=
 =?us-ascii?Q?33wE6IuhMCBY3tzzFGwpXfoqCmviqbOddGUwo/jnAcXsmOX50OYWEZWmSQiT?=
 =?us-ascii?Q?XWXmBDTA59yWOQSyJE3ZLSsSWO88XfuISH1e3aJB9+xx8FYsrqcXhPc9UEBJ?=
 =?us-ascii?Q?3Rkj9aQwLRLm1gl4gTVORqCzNVInjo30bs+fwX6X+p7KyDffQxbC4wpibJbp?=
 =?us-ascii?Q?o/QQKa33MNksBXljq0Jt1kyuWdVelhikbl5gY6HxuBBhamvMoNfeH7ezrjMs?=
 =?us-ascii?Q?zT808y2wshwJRS/+97smnzRPNDNsazSUQomuWZ49hi+PLVF+2yan/vfJoE6W?=
 =?us-ascii?Q?598ALDBTU2gxIEonOlK34Z3/x5kXsDwIuBqLiNtV7DCphcAj13gOvs3TDX4e?=
 =?us-ascii?Q?9a2YVXnJ3qqiogIu9oAimRVmtK3qwnCV1120H+6ICfdkp4xvCWEdMIhSJlr7?=
 =?us-ascii?Q?e0bWaZcztar5ew8/HY4gbroN91aZQEBaJ2slEZn1aqRwSCHzix5ucVT4mpSu?=
 =?us-ascii?Q?Eb0CP9BnffLHGt9fd05u7etsRUrXijA2E/Kt/3HKGPM0nmZaItjkBzVSAiHx?=
 =?us-ascii?Q?xlKcPiQUJZdX48XNWpS7Xjp2mRYGGLEen46QZEWS0iO3PEI/2FkDSQGJjb/K?=
 =?us-ascii?Q?E5hNpr1SmhV8E5Qy93AcZPJL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23dda300-e831-45a6-170f-08d9251d6833
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:48.3318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaNLZG2K/dSEPBWwSJCGLnWcjeEiqLgK5MwcqD5BTOl017zHHrk3mwHBDQaVmlHTsPrqVgBoChuhQxqRktsLuhF7ahB218N2cjc2i7zMyns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.5.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Add function to change bs inside blk.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/sysemu/block-backend.h | 1 +
 block/block-backend.c          | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 880e903293..aec05ef0a0 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -98,6 +98,7 @@ BlockBackend *blk_by_public(BlockBackendPublic *public);
 BlockDriverState *blk_bs(BlockBackend *blk);
 void blk_remove_bs(BlockBackend *blk);
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp);
+int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp);
 bool bdrv_has_blk(BlockDriverState *bs);
 bool bdrv_is_root_node(BlockDriverState *bs);
 int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
diff --git a/block/block-backend.c b/block/block-backend.c
index de5496af66..b1abc6f3e6 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -870,6 +870,14 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
     return 0;
 }
 
+/*
+ * Change BlockDriverState associated with @blk.
+ */
+int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp)
+{
+    return bdrv_replace_child_bs(blk->root, new_bs, errp);
+}
+
 /*
  * Sets the permission bitmasks that the user of the BlockBackend needs.
  */
-- 
2.29.2


