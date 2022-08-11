Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6497B58FEDA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:10:37 +0200 (CEST)
Received: from localhost ([::1]:53448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9pU-0006jo-GX
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gQ-0002g4-UE; Thu, 11 Aug 2022 11:01:15 -0400
Received: from mail-eopbgr70098.outbound.protection.outlook.com
 ([40.107.7.98]:21646 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gK-0003aJ-JC; Thu, 11 Aug 2022 11:01:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBYOGyfdUn9neH1lowYZ+pi6LJkuqKaTzkeNypdCNOoH6RgC4WsCnftlgkzLlDfWSHe6KLIF54nQhystl5ptUspFGtina1CXyWmgH34kUw1aqKcLdjvnmyUzQs75zFZIno5yMmGD6HS3RYtpRQksEcHxZCexFDe8BumVhR4fNBozpv+ch1TRz0abHXsM3ZVwkoyEUUm6MG/MOASu+GmXsrWbV55HJUTiWk7MEuEOpiijgErylzPX8HerkoZ8AbvFLFm3WsPTIzUzIRBFktQmAtVNqo113GqinbDyXGo66R4WcpbPcM1B25f+AN+KHiumDIOGxOcaArISAL/aWLy5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKOHnbmwAewWrQiviPrzhz5t7QrWlONtmVAW0TO05SI=;
 b=jmPjd5GJ1fTLFncazgvRWh00RXbx7VnCeUKoeqGoIrglgFUZuc9t25M8VyQapx3mRDgVlrKeW3zFh7QaL3lm/Z//M9TTzvaYDai+pZ68Pzh3DcOoQoSof72CMpZNpuqMKh0V+WGcZFQlDjiDsXpdOOGR5fXeUy1lxhluZYyRpXRBnOYejv6rG4mD5zdfnL7YYNedgj8JUmVXL1Sy194oj3qlJERuYGyvuxDqHeOwSSo4vLx/h5Aa3kPdfnDgkAPYIES0c2EFK10Zg0M6ohSkrxqLozFTQjA5TRii5miD8L5GBmzdCYjdVMTm2u49FHclqp4Srh3b5jdwchVOqbsJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKOHnbmwAewWrQiviPrzhz5t7QrWlONtmVAW0TO05SI=;
 b=Sgi7YBRVQ8Gkp8FZXCuuiFszONrlgVRRcur4WtDmLZwfXWk+jHTprNBRjoV48wZ/XQeYum5yxgi2JZpvyFKDPxl8kDFii54RvCUyXBJDh42jibT4STdJADVfANLjOqdLF49nh4l5MTQBM9yHYtjZn8PjCAm8eggbSXfSQbbUfDVmVkTJQxYIjJakzn+mMsKgdZ+IBowHbXFiYxq97buZxuHNBEM2vMafrkUYeGPX5jwQQiD8axTDJmncocnlOpIgFzrUQHe1IwSytaERImhCBTkehdpujpitr4ffA4VCnptDW65r/NNrTaM7gdJECjc8DEkecQAkz8mvrCc8FZZTAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB8659.eurprd08.prod.outlook.com (2603:10a6:20b:563::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 15:00:55 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.021; Thu, 11 Aug 2022
 15:00:55 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 1/8] parallels: Out of image offset in BAT leads to image
 inflation
Date: Thu, 11 Aug 2022 17:00:37 +0200
Message-Id: <20220811150044.1704013-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1294836b-d40c-4f7a-86e3-08da7baa4a6f
X-MS-TrafficTypeDiagnostic: AS8PR08MB8659:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NDrCro1ltM2yD67dpzPicCl5jYQueT7GfXHGuICBLpuWT57hsRRKWMEkFKkU2HeZk92L7BSsQDYhbNKjVJD5yNrdbUWPHeuka7wBLt+Qozf04YuWXZsHnHwLRwN4CPG4+gxPLCzIsLK+3OrzMGYKtVA3JtX2nnz/eeYcZwVO9QrasNiTXLGkeMnIC6c0cMuLJcj5SruJ5eUqkuwTCqSRmS0RG4qkSsyRSxfewOlYUiWWSFx154TRc73tscbNH28cpr16a8OH+DeIL8p316FN/OGOId9RL4mw2aFL9c5eOFngj1RpzpUrOTh1tMHDaGwgVuabf+rkw2eGtKGm5RwZbMaDwowKU7Ky2XdJxyooM/fbmzZ6dLtzG+tKw5nXa7gn8cmGGRBu/9eivkHRA5pqbX0ndXk8pfVfZREMwozi00Yyxlh6CgL5O3O6MuoM6daml1Y5cQ40Nq5BiEdmBB4stvM/Cd5MZyBlJO4xNHzzf1+SaHO4MbyIgxaKnuGntTeS8x4Xtn9C6OFEDGEvlvWUgzjfbnQEgpcSk0D/I7+nS8oI/9ms4v+FzBarMZq5Ult+ICLbb9jFLNaL4xQLiXLIonZpAIRFJgBnILO8m5XV6sSg1zxUxbRYRce/8NwOYxlrK9oAY8oiSMk+QZ5701gmeXZNimzmQd82rsFaTMmdh3Qqi5R05GixhgT0oDtSurpvoOsPrIv2WFsBjUKgOqzjMhTfUovyYD6n1h8p2t4Zm84S6Q6/IzwaCcxy0RaJclz3pi8Bp08uu7YfMD+ulSBZWnVzUIMnbJNYQMu08BSectA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(39850400004)(396003)(346002)(136003)(52116002)(4326008)(26005)(6666004)(41300700001)(6512007)(66946007)(6506007)(83380400001)(38100700002)(66476007)(8676002)(6486002)(186003)(316002)(6916009)(86362001)(44832011)(1076003)(2906002)(66556008)(2616005)(478600001)(36756003)(38350700002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0pWa2OFD9y22bGbx5Ac4buUcBSOXsUOUAd+VaS4fwJrlwiu24n7oRr/BoyCo?=
 =?us-ascii?Q?yGsfbI2X8IWWNzXTh3hUu39QzpxZ74hJC+/0HsedAOT8DXuFXaNTEXo4ZHH0?=
 =?us-ascii?Q?OehG8BMcIqmKRE1lXIACmy7OwvucTVrkkXJKFptE3TKAEdokYeYMgLNLw9CE?=
 =?us-ascii?Q?dO0FrbRO2BtzBM6hakUBjlMKonWQfdHXP2JNauyx7HdYQkjEX3sBMCSqq8Fo?=
 =?us-ascii?Q?rDbTvET+Mug5mP3FEhzE7rsrY+FxACHo6BgmJtIGwfkLipZfreL40o4KQeU3?=
 =?us-ascii?Q?s5Rvk3fW7Pm9TELugGDg8K2YLnd/XyiMRSfkNXMj12uccMCPY61kUU9VsuOk?=
 =?us-ascii?Q?wfc/sXFv5moAcj/TED+aQoYNKXEbHxEWiJLZsM5utcimih6OQB9iBPPhX7Rk?=
 =?us-ascii?Q?gGMrb/sRvanuM74a1cHIZGs852PunOuwMefGneJko5Y7nOrRlC+zuh0FQFxs?=
 =?us-ascii?Q?TLtqO+guU+SIcQQc5PBuDHsHE568scOWHbjvNz0GQxFJsspKoRDqi93swIvI?=
 =?us-ascii?Q?nwd7+u5W0OBhQOt3hTz5iw+zebPPAnvdliyNUDHpOqi4rIk9jmzHsyOcm4ch?=
 =?us-ascii?Q?KI4/s10W4I37tqdZelJv1IbHvLJQJYUDy43WBxVNfOj/Ta87Y7jGWBA0qrag?=
 =?us-ascii?Q?CEb++LhmH0w0XPbsPhrjnpZDsfXbRyhqZZuZsVQcWeGmxOx8TUJQjYOYhcpI?=
 =?us-ascii?Q?Ol82x0WUuwKujhmxV/TxQYWVrust4lJVtddfPrQ2UmKUe/YEZPD3s13h9A2K?=
 =?us-ascii?Q?w3rP3ngB1xC7GHwSfhsA6rFNB4Ys96+q6pC4Oi/GjmjyxhCZadoqzj6l7rao?=
 =?us-ascii?Q?LztGSGO7dQLL8lgq/zXorDW2rFZN92YS38sHFbc8Nc+gCXtUaoN5U//ww0Z3?=
 =?us-ascii?Q?9cwTZ0vMCuQWv5jv1lGzWtV43wIYAtlB6i9nmdUJDc07wFufe6HCEUD3lPP4?=
 =?us-ascii?Q?QXaEpIJMZtj+wDCgTWzmCaWfUFmLZzM3sA+eqrd3BsaLLqa8JyMGvofDaGLN?=
 =?us-ascii?Q?lwRObHFKFOaozQKxpFCbExZpJQCCpjVZvAPIuEIhVreJeD+UuAtm/QBTydE+?=
 =?us-ascii?Q?ITxKLh/52UXb5ncu2nThBBP2Lmn/fnqfVBINfBAlTIM9O5yYzVzqRuFKa6AJ?=
 =?us-ascii?Q?d74Ogf/ZTauq06acNezOygvl/dSOGo1WbPJHp1kHroPYSzLlXaqW/SjeO6Cq?=
 =?us-ascii?Q?l6aXWh8kWvK0ObBtQjgGwpyYlPPD7ueqW29gQBouvEBRKMPp979S7QbGe0JO?=
 =?us-ascii?Q?tl976BllyyBkAfwrFxvFkWFsJCmTFPZW6fUGiiIo/R1bM6MDQ2u8+EdK1S/t?=
 =?us-ascii?Q?q9aqekWYE1PTEjXqUss667nTMaDOv+/1JAZMoVuXbgo4XW+qPwIS7dvlSGGD?=
 =?us-ascii?Q?AffVYWOuHqnnmvBDpnwGH3VYgKFQY8xqGWJ1fly447C9H74vHMDNzO12yDX0?=
 =?us-ascii?Q?Z/D7oAxe+hIe9BTT2IkuXAN5I/UhvdvMgR4b/dX4C4piJMalzRlOS4oAUcoq?=
 =?us-ascii?Q?G+ZagLMZqSbZVvWOdvVT2qS87wXU7rmAqdMebxeQLjR2edBGKEKoobLWDj4S?=
 =?us-ascii?Q?l8Vcs3XtmFQU3Ho+BE+NShkQFU2+WxhHz5CKUqCKBg4mBhBEwwcTJ9pDkRVK?=
 =?us-ascii?Q?FlqIXRwKoRMgW6uR8g0ZFfk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1294836b-d40c-4f7a-86e3-08da7baa4a6f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 15:00:55.1232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGpWncpfTxZ9ZBqMNUqKnrPiGUlhm05RoYXOPYMpwU9GDPL0AunASgElg6FIQX4w8Kn5w02kHvHKIxbvr/DbX+OEKlLChfhhXUbIr34xGw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8659
Received-SPF: pass client-ip=40.107.7.98;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When an image is opened, data_end field in BDRVParallelsState
is setted as the biggest offset in the BAT plus cluster size.
If there is a corrupted offset pointing outside the image,
the image size increase accordingly. It potentially leads
to attempts to create a file size of petabytes.

Set the data_end field with the original file size if the image
was opened for checking and repairing purposes or raise an error.

v2: No changes.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index a229c06f25..a76cf9d993 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
+    int64_t file_size;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -811,6 +812,22 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         }
     }
 
+    file_size = bdrv_getlength(bs->file->bs);
+    if (file_size < 0) {
+        goto fail;
+    }
+
+    file_size >>= BDRV_SECTOR_BITS;
+    if (s->data_end > file_size) {
+        if (flags & BDRV_O_CHECK) {
+            s->data_end = file_size;
+        } else {
+            error_setg(errp, "parallels: Offset in BAT is out of image");
+            ret = -EINVAL;
+            goto fail;
+        }
+    }
+
     if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
         /* Image was not closed correctly. The check is mandatory */
         s->header_unclean = true;
-- 
2.34.1


