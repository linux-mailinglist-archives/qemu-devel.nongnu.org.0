Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC279423E9A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:22:31 +0200 (CEST)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6sQ-0003MR-UT
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nz-0004wt-4L; Wed, 06 Oct 2021 09:17:55 -0400
Received: from mail-eopbgr40136.outbound.protection.outlook.com
 ([40.107.4.136]:14496 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nu-0004IV-O0; Wed, 06 Oct 2021 09:17:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMg0y2jqvjUqHn9nND8KaIqQvurFFkRAX8ynC3bysRcGuMYQypP/LSzL6neRE5qCdKCTFrNbSeYFmBGpIM7LG4ZqY1WTjqlaa7RxxxnHV1Eu0oFWPzgnVnlkS+pW7Scfar4PJrmvN9JyH7bpcSXZAyXMDXIEGSACeuhm8eNONWiCFqbmNWIOchmLKTCJW+fCaJxGbmAdzZQHXbam1P3bDU6r9REMOR4HGPJEuoaWMZCugDVUzdk8tDhOVgB4t0SEOVV82rNFqRzHgvbaYLKyv/xZQhLsBHCfT8Ns3gpUT2CvbVheC+5a/Wt6pt3DbetPzAPGnof5tlMF01b3VutsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zH7HLOHLgAEtQ0IXR3l6CCx44sEWn+ky1V6mtu3YXnM=;
 b=M0+c/+nnTmFqkZ5i7muPECdXgs+Jlh6xlERAtrs1qU3VguZ6GwcCfRf6WGrU/rEVCPQbs2bC91JwB1BUrfaRGsMFHCRVu/Y5BwKaFu31AVvi36n7lsfb3kv0q2URxxtZ7H4Z4NJjOYlil20y1Ci2ijr0naVT1lfVJDAU+5BM9NKpsdMo0eJhl3yzRN9KecTJNIAsQkFLw/7GaEcZDnUy0YI03Z2bFoGq0NlhK24RFAsbY/e71ltFZtWJ9ucghdn674DZfKjEbRXr/t0LFRS9q+KJ071OpodYAEdVfQ9MGqES9F/yC2UxmKbz6nZR/EQN/cj5gAa3bHKN02stoZfaKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH7HLOHLgAEtQ0IXR3l6CCx44sEWn+ky1V6mtu3YXnM=;
 b=pZioHcqlt9IUkeBeTN/UM6P+F0BfLj1XPYnat2oRTp2tGp7kDTZf6TX8v/e5NX/abbYyJhsyKQzHWQKa8DQL/QnBvojogLGQHZp5xjrGNJwm7hhivOT+hZhCtXm7Z/gWD2hY6YpM4kq/UEoMcj8z0O3lv6+XWc/U4l6KYfsJLEg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 13:17:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 04/12] block-backend: convert blk_co_pdiscard to int64_t bytes
Date: Wed,  6 Oct 2021 15:17:10 +0200
Message-Id: <20211006131718.214235-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006131718.214235-1-vsementsov@virtuozzo.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0296.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0296.eurprd06.prod.outlook.com (2603:10a6:20b:45a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 13:17:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5d591b3-b9e2-41b0-3bf3-08d988cba8e6
X-MS-TrafficTypeDiagnostic: AM6PR08MB2981:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB298106F2472D1B7F1BE0421AC1B09@AM6PR08MB2981.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:232;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzQtTCdafUhD8KHaFdbopIf+CbYzMBlf1x2SJXOgQZoansgnv8YglkqApUTRm/UIcvC+pN2VcbLKnUJFxGTK9K68ub1XXKntrcU+eE4s6DYz9PVCGfkOEuKLHn5dMoN9Y6cLvSmNJgtUzWReFb7prRyZPa+EQrWXhvwyRzmVQqEjYqyH2XQBv+NPdSu+gpd8cUsbzBsO8RKBeTM8hDFgTA34VVpcqFYBwxVeNRIJodKByvgMB836pYl6oeoZ9b8zRBxNolqRQAeMN9z6D0JKlN6dX28eMh9JgwhfTCOhBpAtabIwIC01oXS+LrgqKvgzhvEhX6eBGVOn+uzXv3Pt7N964gPP6PqmKYD/CvfJuwC6PFJBR0BDzZ691Rd8LPO7AWObwyQpCEK6W5cL4+sYx8gZ6iguXnHVGBuS5hwdPCtBEibzZjrTU+LlMuxi8tdvS8EtEP73jIh/GnXoJcxjuM4ff4xwEjY4KVEa9OXI/pF9CrUvjxzNTgf1d+VstN5P1p8OAF/L0ijCDHVAOpC9YMgQ83pcRYRg88EhnyCHlnbuwmbdE8SVx7nH9yF05NcQZJJY3M0M4ZE3zA9bXLekVYgbfc6jzOpMVBkhzW0mIXiADGI5aQSruxrFkIAlGRZpeSsESWPVYMBzV9d/6BMmFFWBWrYXetQoAxg7Bo8BrJEE+5/Xz2OTv/mSNFEj2xX3CJaaerMVE1kl3HL5mczQJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2906002)(36756003)(6512007)(6666004)(83380400001)(38100700002)(38350700002)(1076003)(6486002)(508600001)(316002)(86362001)(6506007)(6916009)(26005)(52116002)(66556008)(66476007)(66946007)(5660300002)(186003)(8676002)(956004)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EuHgu4T3Q92VQKW62+81dqhdK8uWzOS176ZwRBV7AKoMli6P3jjySsixVs0GlBC0grOFOhroPxIwOcI+K1z3utT4NkOjLa19RPM8fEzM8qd+26klcgdy1O47JeOH3fk5lmRztbc/WhH/QseTrwjS+LbYMYtnYNtfROPyXFUNS1xYJtwUwVwfVsiVJ3b0IJaQ2mEce4Bx7+IsetQvvLxM+Wskuce49AHblvZqx+s+SKiGZN20l/F8DgNt/+I+GbuAptlX0S514Zjk0iC8hMaiJiJDkssf+dT8vB022/uSvEGuczBwwkKqNY0N6KxNHR3pvMeDwnPSVMHw2JOg1Hs4BidAzWTCX+4m7oJziLOCbLTmWBfF7k7vfEdcy/uKmc6OLTZ39jkC7gbHZGdy2MSlWQw1L2So98QnXMY5z59BQ48OHQI1sQPx0Z1uahBTgCNZGb33EensA2OH4QzyPP2dDjUelKW118aIMgywdTpg9TFfXk7UW3aljtuDTDIWtvQNNL69oKQFMWOydKidKUDAi3j60YwPmpnzIp6NHGYh1jww514MsIB9eU15iOfdwyDRBkFMHEWlQ4PBmfUP4HJRnaVNFjN90IdRm3K/zQ6wajSTAlBmrhftitea0ddEif4jR3NrSgCFUBb5wPOX9zisIJ0fAQMCvGVLweBQiG1s8OZPxDbIgOpkGTalJW/6k1wTHTD3yz1NWrZBIIDecysdFNO+L/qL+8a6H/toQVFfrhC2p9hlulc8Kp41kxafeCOZ
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d591b3-b9e2-41b0-3bf3-08d988cba8e6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:34.4608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /A5LVB1aNtoOpWAv4fxfNaxfPNMPRgO38dsIs32zGc+KzXCE/KuWBs2zS/bkA5wQtvcpqFn33z3lonH4ID2XfHKO+oAIJvoVttrqG8GnfxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2981
Received-SPF: pass client-ip=40.107.4.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

We updated blk_do_pdiscard() and its wrapper blk_co_pdiscard(). Both
functions are updated so that parameter type becomes wider, so all
callers should be OK with it.

Look at blk_do_pdiscard(): bytes passed only to
blk_check_byte_request() and bdrv_co_pdiscard(), which already has
int64_t bytes parameter, so we are OK.

Note that requests exceeding INT_MAX are still restricted by
blk_check_byte_request().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 3 ++-
 block/block-backend.c          | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 844bb039c5..398e7abb02 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -181,7 +181,8 @@ void blk_aio_cancel_async(BlockAIOCB *acb);
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
                           BlockCompletionFunc *cb, void *opaque);
-int blk_co_pdiscard(BlockBackend *blk, int64_t offset, int bytes);
+int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
+                                 int64_t bytes);
 int blk_co_flush(BlockBackend *blk);
 int blk_flush(BlockBackend *blk);
 int blk_commit_all(void);
diff --git a/block/block-backend.c b/block/block-backend.c
index b09ec5a7c7..e408893985 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1626,7 +1626,7 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_pdiscard(BlockBackend *blk, int64_t offset, int bytes)
+blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;
 
@@ -1657,7 +1657,8 @@ BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk,
                         cb, opaque);
 }
 
-int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset, int bytes)
+int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
+                                 int64_t bytes)
 {
     int ret;
 
-- 
2.31.1


