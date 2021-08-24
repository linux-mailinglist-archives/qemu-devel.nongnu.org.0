Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A55C3F59FA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:43:59 +0200 (CEST)
Received: from localhost ([::1]:33708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS2I-00030L-91
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy2-0002RM-Kl; Tue, 24 Aug 2021 04:39:36 -0400
Received: from mail-eopbgr130120.outbound.protection.outlook.com
 ([40.107.13.120]:56386 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy1-0007HX-3c; Tue, 24 Aug 2021 04:39:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hfs9rTJGppy5wXT7nvZ/9yqvNk3H11IKzOkziRZdu3jjcOFSgVQSKWhgrnbNEQaf02QXmw/j+XOUM5ktqlDeWKRgB84oiED4y7Zt4zcjGHT7bVdpbLs7k0PO9wundwc1fZ4gLQes8YEvnLOJ72TawjV5OgZIUPwGtvYWuxZDmbgSiFlBUNLC+ZbWgUlVjKKRm8NAtVC618PMfy6PNPJYzU+CsyQl5/oMbeoBtkKW10iqdQN95JjSS6+nhN2nXNqHv1Oszia85Sputp3ZkXpx8bKg0YHntc2qmBN3RlsPt1hmEyL8QfEbxXD0XKrDeszaFaZx/dCpLQQaGkpRupZaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GmJJP2me1hAQJQvNuKG3Yp1F2STkJylbpXCBY/QG70=;
 b=Ol/hjIdX/C/B+kHyP7t161DOso02QK6vsX4MfX2k9SdjKEab9l1sglwjgvUXg3bpbUeTCxHl77lVNo4Cup6je+Pk1GkGFDBlvvqstEfmhxAzPYqIS+P4CUmFkxRGhKuBoHlWLo9tEM0tHZgITd0F5bvgJDufwClQU1fnYmcwSdiaAhHsBjwZm3vwO4IY+uCysosHf3BfY4aY55V+4oKT2/yjN5+4Wc4bBbcsenHXWrgs6ArVAwqJfi4avfO6xheONP9g6bzak7Hb7npy2p2d3b3hNheZJiwPah/3v6DVYIK0BpxfdpnHpdyYy4+Qe1Tqnnrohbu0Wv4gkreSHy3AGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GmJJP2me1hAQJQvNuKG3Yp1F2STkJylbpXCBY/QG70=;
 b=bl5JjvfeyTcg9bKC7JdT6YXvM/PPU1GMGjirhiwopkKMLE6b2HpJzyeXImjqfA+cZ3LfAUJi7X/VHyhMnZaduJnJBApFv5qHGFstrxcj7SETUz2XzT/b+IokvZEcbVisNhCasRKvJTlwjA4savK0AykRljVg2zqT8e86STJVGY8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 02/34] block: introduce blk_replace_bs
Date: Tue, 24 Aug 2021 11:38:24 +0300
Message-Id: <20210824083856.17408-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36a1e139-5936-452c-50e8-08d966daaa4e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB653383F71A3B8DEC37F5A56CC1C59@AS8PR08MB6533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FB9qxIPpwtUT5+JbNdxQCaYHrqwu/Q1CKMUtCSFzy/kHXpxnSn9KqxpJ71sZHi6mpI1MQ2w7Zm8DAFKZCpZ7uXV/BHIUohOTCC2SB31XsMlXVKirlhRbCKiPo/p+hp6CMHh8+te45CCVL/4EeZ9PmxTblhUwBceUrg2ElFrsVRm1x2IuV4OOft5wYg0RrteMRrlWZdQ2G3p5tAiPPH0RwX//sSmaRtXGmHKHHBGxcoqJArDGqhWQ5SU/Q70xQF6+QCIeXrS9duabyzrmKEjEyqbxnT8c1F9f6BLKM9tvL+Mc4vRFHUcj4gjq9llTZ5EDV2Uk25o7gUMkh32ykgpow68vvpxo9RlD9FNZrqP5raLNLya08JrNxtMJRYJFaa11T8d7nErVSHgL6bOj98aNPvhgELVvsz0Hai2/nlv2L/UQCKWzCd+0hNFJIFI/Odr1ZzaR1mH82u8dCcZTPTaC8JZdX6Nehyp6bgjN3qgPZ7K4W3g+uTCCB2iBFn76fLZJw8M2RzwqcsvlGKMmh/yCZDfi/ABqa7vKwbMhMqTH9JS+mXsqEWQFQij3N2tLIMt+3tr8KP/P+B6cw6+S2nLCchJG4GPtkq1SjOhBfOMfS+FuDYYrD1/qvKtdnYEdcGc2GVum4QvOPb98LLlp3x1/qafSkne+fHW1sDfaAhSL41i19c+f/TkBdMtgBLnt/HfFKVdb3kgOOJz/oD267RqzWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39830400003)(346002)(316002)(83380400001)(86362001)(36756003)(4326008)(6512007)(186003)(6486002)(478600001)(1076003)(6666004)(6506007)(26005)(38100700002)(38350700002)(7416002)(52116002)(6916009)(2616005)(8676002)(66476007)(2906002)(5660300002)(66556008)(956004)(8936002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ETKPveF1EDh+aaTItru66TYl8bCznwxWjNcRd6lls9FSbzmutk5kFBDnRnAm?=
 =?us-ascii?Q?gTJGC7/gI1kb7wuJNHe5Lh24wQp7HVQI7cZ/VlCZN7vtNxYqf9RhkFsncBGD?=
 =?us-ascii?Q?inRVWIpYbyrfFCdnFB2IxNM7cWs4tLHrm8iaeXJkozxltdPOYWUoSp2DqmaS?=
 =?us-ascii?Q?dXZXs9SS4nvJvLmq7KEksa5TV7+zyrhFUAG6PbPwSw84lonR2q7F3GhnbdCx?=
 =?us-ascii?Q?ZrunkyZyPT1uXU7xCJ0SZ1jJOrf9qa4YFt3jDTHJCj+u2xksI649hxovg2sj?=
 =?us-ascii?Q?HVq3gcE0TZYTKXHR4CSKJv+X7sPwghimeMsqAWugjc2C9S4B8/v1OQBk5vo6?=
 =?us-ascii?Q?VSiu+ErtUyelcevD25NVaG4zMqC1qIYpIN4NEEPp+j/87MXdKiHambV2FYRb?=
 =?us-ascii?Q?uyJBAeD9UK9fHkSRFRUl9KdPKgA5giYLcpDOcwEceU9OQEShkj73OK/VrHt6?=
 =?us-ascii?Q?tHicBtKa5JsJUTjpUtHqi6im98WPzF2dnept4nzeRqPEn/41nxifeDqBeIUn?=
 =?us-ascii?Q?NHRLdh7cmPnRWKYnL5RRG/MslMJbr1zk2L2fiNQLCoZ885W+umsqAhYcbFhP?=
 =?us-ascii?Q?CR/mOCGSGgCqxTKGi2kLliu0dnvw446ma2ZWxYqvAwVe5ElyhOjkdgVtuFu4?=
 =?us-ascii?Q?QIIB2B/T+5qk6pz+rSJNlaD8Nqd+nePljSdzzdHYq+A1zLjhA60DcIyJCLJS?=
 =?us-ascii?Q?QRsDmxIoVYoT6v3y7kYpZeHV+GPcpRN/aZv12lyXRVoIJQw8Q2Qdobm6xuko?=
 =?us-ascii?Q?HebiEhlu+TWh8ln/dXarvre6MBCBsPXcWS6o3+N1FzPdiq4asusXnDtcbQIu?=
 =?us-ascii?Q?urHsMB3LfIf4AmaBTXYM5vLnIKeBhlIwANxLC5xDA1zqpc+FHlNC75u9bulW?=
 =?us-ascii?Q?eTmfgMYxBo5iiHUUfzRtPQ3kwhG9h3z2a7idN+qpb/wewpbtO5FyB7cf96kP?=
 =?us-ascii?Q?gLMDcOTD6cKBGehbrrVfvx6FESSEdajIa3ozYvGCTBl0yLDuQVUMs25Sc8Aw?=
 =?us-ascii?Q?q/dmpbhSguxzZmZUnTeycMZmFl3DN278qxQajWnjgt75AqeBLLXwQ1Hf3s2K?=
 =?us-ascii?Q?iAboKdUeMsOpFeJUeXHBc9dv07q1UMABKITBxXA309S5HovH4CjUXB3EWj1J?=
 =?us-ascii?Q?WTJyGiHDA2qE/MIehedRnQSAQJpDZflpFFI1EPl3UXiuA0LM3f6sowiN5ZZV?=
 =?us-ascii?Q?fnPsokDPA5XNGWDbbR4Mk6UbxK1+EhlU8AdbN5+B0jnWHnMSt9jHYkqC3CTo?=
 =?us-ascii?Q?1HR/BdlMiBouDnV3fneeGV3nRq/8/ts+F3n+b0c7wp5v85um2NVIBzWe7t5p?=
 =?us-ascii?Q?v1tdAIGFcYcYwnMIwg4FMivQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a1e139-5936-452c-50e8-08d966daaa4e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:19.6983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGQ5GiqL5NWqiyXA8XzTmnvb0WilCSduWttG1Jibyw2gQtjiJK1DUc00NywewwZZub/0aqAzXEa5RgNRXsRFQQKYiMSivZssOuSk5vJdPcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
Received-SPF: pass client-ip=40.107.13.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
index 9ac5f7bbd3..29d4fdbf63 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -102,6 +102,7 @@ BlockBackend *blk_by_public(BlockBackendPublic *public);
 BlockDriverState *blk_bs(BlockBackend *blk);
 void blk_remove_bs(BlockBackend *blk);
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp);
+int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp);
 bool bdrv_has_blk(BlockDriverState *bs);
 bool bdrv_is_root_node(BlockDriverState *bs);
 int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
diff --git a/block/block-backend.c b/block/block-backend.c
index deb55c272e..6140d133e2 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -869,6 +869,14 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
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


