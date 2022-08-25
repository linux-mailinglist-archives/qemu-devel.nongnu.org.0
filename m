Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3455A14C6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:47:17 +0200 (CEST)
Received: from localhost ([::1]:55222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRE8a-0004X1-5h
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtU-0000ZG-S7; Thu, 25 Aug 2022 10:31:40 -0400
Received: from mail-eopbgr130132.outbound.protection.outlook.com
 ([40.107.13.132]:23550 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtT-0004pj-18; Thu, 25 Aug 2022 10:31:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/CsZMo5Dv2YaObVJhdU9qRbJOCJ+5oaZZm3hFvTfdi503MZg/DFQeFNNAF8H+L1N39I4Xzyrel1dIQJ6zcZhcuHiZG3sq2Z+Aniy5E3nz/sAQ2pKXbeQN3m+MLt96yweKtyPPhUyO4sz5nA2Q8X6w7ZE+h5dnXSvqIIAh7cBTyOC+5vL4rEsmaKeCyKY++A1480C4ePCeGeJ9CxJb62mIaHZIFXkuhCq4mj7q6Z7IJDQ+KlwxuqtIq5bmp0bM1P9wM6CmOkQZfDrfxEsFpkLk+JYBlMfNap10PTehfLiPHlnpwjGDZgsIa7NmAp6NwK26yJNStMXbowIeuSS3B4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2iHD9ZuqkW49ytEgmewpRVI1oNPJycke20yFKQs7Oc=;
 b=FlqXpOcim7+TAkDU6LTrXr4OUvA7nVbnaHRg3jhCoHF1HlNknDrPeaq6PJQIRT6QgjqJFYRMlPBI+eS8exzVFNMZML4kJDbhg6qBjc4wJz/yHEVYMlp2YDXb0BYg34Ad/eclB4mCdI0/Q1yrpiMK6OhrMAGy2pttad+H2bfjcVBNA+xwjHInF8hByrUkUhvqlt1PcoO/af7bs/KgFV1mZ6ezapdi1sb2+PZ/kXOKqqb613NOa+f4NcpC9T9zcm7M5agpiA5VR1fbTsIhBWIdP+OyuciMuDVvOUnsKL/hRgon2PpbGmPThAnER09ug8rfVQl32kLTyviL1Nx/6V5BzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2iHD9ZuqkW49ytEgmewpRVI1oNPJycke20yFKQs7Oc=;
 b=ogKl7WFyb9Gg85FhKTFFA/4d/2A359OKW+QpTPJNbvQrOILSgQGN2sLkzBjWijnJpaTJm2iylNPE60hDZU0TLIi8sXdZBXeImAwdvbbLYcDQ833I1u+YHp5MajJliyZTIJP9QafwMgsBUBlaRX72YO6tVimIAXZevuYCVtjtybmfTl7cfKJTcBvQ0EJZl4eXmZVLHno6RPCKGorz8aILKZTJjHFiGW27Csn+ANJMvitKP5YkQP9uRMQ4WO/pDJhwS/K8dz3qLfB6+cIQxdpghtdy41l88YDo/awNCxENN6qAT/9VTY8TMO21CQqaf2qN3NrXOCZpsct5ofYiMry7vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3569.eurprd08.prod.outlook.com (2603:10a6:208:dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 14:31:21 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:31:20 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v6 05/10] parallels: Use generic infrastructure for BAT
 writing in parallels_co_check()
Date: Thu, 25 Aug 2022 16:31:04 +0200
Message-Id: <20220825143109.176582-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::29) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5ae2c29-a53d-4d98-749a-08da86a67aa3
X-MS-TrafficTypeDiagnostic: AM0PR08MB3569:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ugIHSu04K0fobGdHqcbFNU05niwdCa0veLYuV/tWbYiTiD5oeHszl5CF+toB/SjP4ZpvYVrUWkvxuSz4ZlS8cHNrygs+N9jK+5qHBFl3cOs2tLQLo10wCGV6kbSJAzKqhiegT/vLvlTMM55BErztlu4j+OsqPKj3EmOA/MKr6U3zYq/Z6AvHeTtmLxlQMMZayLo8+a11uNqYTDjNlHgRKiqFCmXJ/K5cQDmhnCZ+r4uQtG33JmfR2JSTnBJpEv6jlDBz4PPGCgHr78vWgsEeXbgxq5MZMSwlnD5ml79KoNMjGY1gC8kB/BYx8trSjgRxTykrPRXFDUc91mrteg9/XudBx/ZUUfZXm172341oHizPjGuFpX+oBrGvqCIEW/pD4JcWibcnUdSk/Mrd048FHp65Ocu9OY1LSUxiiS0w59E7BFYVvztyuB+Ls7aQ/dOhvKlb1r48zxj3d6S7XeozUMbi7Gny1OcEUw6KnmOr6Zt4DLBmYF8te3zX0Q0bstzfx5BmUhm2xxZQMQUMUjdMvWC1RQ6TN/zKGE290YR8EiRzFW0I/bZgoqzkd2beR4sQmfwtwaAtWc93GIlXyHlZg8XefA2mQyXgkfOqMXXC+22dq7bJIMi4wP6EwOXy82hCezJWq8CE14eArQfCQft1sVJfYZsJqRIpJu4r317hDPRIr7bFfeXsTV6mU5kiUcI6k+oh8/A2jo0bMPA66osIR5APCtUpJ9v+sIoYJUg2U+mHv4B1WjacBGnqzKDBV6pLup1FZKqjFKAjiG1hP8xnr0NPgG3pOuRn3K6OQFecG0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(346002)(376002)(39850400004)(396003)(186003)(2616005)(1076003)(38350700002)(86362001)(66946007)(83380400001)(66556008)(66476007)(8676002)(316002)(5660300002)(8936002)(2906002)(44832011)(6512007)(478600001)(6506007)(6666004)(52116002)(41300700001)(38100700002)(4326008)(6486002)(6916009)(36756003)(26005)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hL/YTVEUJiY1hb4sErUvqLMxoYtJixe6erbeEVseVzAbfgGOU9qiJ3rcoVgV?=
 =?us-ascii?Q?k/w+X5xOzUr3Wms/4PtR1qMCrUVQsUrGG3ZXNLprr28ZKSmHqg5lV4pQ3uvU?=
 =?us-ascii?Q?OrDox0m0Lvw8fit0CTa/ySgxBt325F8HgM2SqQdr1EBo0umhU+IyIbUcr0PA?=
 =?us-ascii?Q?y9dOhpmXu21GAewjpLrJbzDv+CyggdbobSNqS8+TRurK/pgOK8EK57rkqJi0?=
 =?us-ascii?Q?Uyc89Rd92SVqzHOmCYIkiKAl3aB070mv8s/Q/CJNEeeOtM4FNG2j7sGej2a6?=
 =?us-ascii?Q?4Hn7hMzS44ul1bUujyyBfQUIvgiOF++eHM7DuJRm3NsI1q6ulFOP8/WgjVi9?=
 =?us-ascii?Q?MCe8bVEHDZG0Y5emKPldDf6fS8KMhTKIb5kzc7ZspVbrc+oSMSE0ObhaBrgt?=
 =?us-ascii?Q?WLKXSs6Pi6hp9sCo0vjHg+HpP5JpyumbnE0NIrYitRjKpcIt5eUyrtHHM6Va?=
 =?us-ascii?Q?gDW/lA5+psXwob0AyKjXBoMl0JPIY3iCDdmtmziDIUeUJVDKbjdo+GdqS65a?=
 =?us-ascii?Q?aBKc1ua837vTNIc5YfC47FH0bvPC+HDFugeyGonAYr3/tQA6Lp0Nn6G9DCLq?=
 =?us-ascii?Q?BApTwUmk/Fkyz6xxI63q8ck1N8y1GSQGqQq711FIchBc7EFAm9pYSLO5GI21?=
 =?us-ascii?Q?p94eIxksiUy/yAYn13jTGninuDrfE5qohNRi5wINkdunhe3vD8dnlv29uYQC?=
 =?us-ascii?Q?pGDVkICqbSxgZg8zWSi7Ck6hxqQSrfXQRozpL/hBz1eAs5vPcpZ2AEiY1ei3?=
 =?us-ascii?Q?l+KROkjOPTh3VYo1OU//wZIEH32vq26aIlfAeSq1axiSBY8/FokGYfDLfVBC?=
 =?us-ascii?Q?87X+IO8YK/1S68n8isMBlxYqdNUIYWbJ8kUk0uQDFHOZ9z8TYmCmphPl7C2r?=
 =?us-ascii?Q?N56TSlnU5w0El7wTcB7/7KHxJOMuG3S0/wABfABaBHrfQRSwxsAQElK5/BLU?=
 =?us-ascii?Q?k2ITJ/9R1EDDfcOrYwPPsYK7xSNO6h211dUh8YyF7tS288x3j3Jzr6AUAIIF?=
 =?us-ascii?Q?fWCyYGsXjY48KGgrP8/9dgZqH7HOcdFDQ99mr7sqdX60GkWMu8Y+vX0DKoUU?=
 =?us-ascii?Q?n9iObOp6RtpeGPj79y/U33zWkPtFiFcEaQqwySmXoLKZLj2riLkSgdIG0Gq1?=
 =?us-ascii?Q?6ogljGeJ6Qk/jNhjtsii8fNCyO+gOY7eVrYzTQBOPK9m28PbzEMYSoksIN+d?=
 =?us-ascii?Q?AY/yBz0Qkwkqqc3MynatRNEtPb2tNZhe4iJQGYVQ1Ry53XY4vO9tVKgZR64R?=
 =?us-ascii?Q?eYlbSwjjSO8Ched6GQG8eCngG/DTWeHZMlhKsydUTdtay0Ewgq+/Rpvx6tnx?=
 =?us-ascii?Q?tQIZJuWe64EQjchUCoU5MBfJiP+lzLCQcrxLfX606LtqnPy56y7tTiiFumta?=
 =?us-ascii?Q?aHPonp7fQtF/NSixb3yODWCnUfEpko1d/+/FbYsxlKoZpbZzXHSzlniElxo7?=
 =?us-ascii?Q?ASd6DKjTtlVhEaMAy/2FSOPFUssVRj+yVJDxNPJDVJwSV4YbSrRUzgCsPzLP?=
 =?us-ascii?Q?fj3fPeL3XPRpBO+XiA/7kbdiiG4wpakLaiIykFNBOaW+T43X7mfoWJwosxIJ?=
 =?us-ascii?Q?qdfsjhxti6j+7ogsXVcmX3KmLeRfn4ZMtNEsJPUW2M3iboi4U3Vzm8C1gKOj?=
 =?us-ascii?Q?XL5YejcmmJl0iydWqQ08nFw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ae2c29-a53d-4d98-749a-08da86a67aa3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:31:20.7665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2A+1czN25JwyWklRXS8b6LZOxdaY7l1xhH+baEGTQNuY9WnJ8R/eWwtuvuj0AjkshkBn92bHpIKS+dQuAxGaoIeOWyG78syQ22zzqxbiik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3569
Received-SPF: pass client-ip=40.107.13.132;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

BAT is written in the context of conventional operations over
the image inside bdrv_co_flush() when it calls
parallels_co_flush_to_os() callback. Thus we should not
modify BAT array directly, but call parallels_set_bat_entry()
helper and bdrv_co_flush() further on. After that there is no
need to manually write BAT and track its modification.

This makes code more generic and allows to split
parallels_set_bat_entry() for independent pieces.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 52a5cce46c..b4a85b8aa7 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -425,9 +425,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t size, prev_off, high_off;
-    int ret;
+    int ret = 0;
     uint32_t i;
-    bool flush_bat = false;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -465,9 +464,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
-                s->bat_bitmap[i] = 0;
+                parallels_set_bat_entry(s, i, 0);
                 res->corruptions_fixed++;
-                flush_bat = true;
             }
             prev_off = 0;
             continue;
@@ -484,15 +482,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         prev_off = off;
     }
 
-    ret = 0;
-    if (flush_bat) {
-        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
-        if (ret < 0) {
-            res->check_errors++;
-            goto out;
-        }
-    }
-
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
         int64_t count;
@@ -523,6 +512,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
 out:
     qemu_co_mutex_unlock(&s->lock);
+
+    if (ret == 0) {
+        ret = bdrv_co_flush(bs);
+        if (ret < 0) {
+            res->check_errors++;
+        }
+    }
+
     return ret;
 }
 
-- 
2.34.1


