Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E5768936F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:20:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsEF-0007Ml-TF; Fri, 03 Feb 2023 04:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE9-0007EN-GQ; Fri, 03 Feb 2023 04:19:26 -0500
Received: from mail-dbaeur03on2070d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::70d]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE7-0000oK-Vd; Fri, 03 Feb 2023 04:19:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7E7hI39cjnoVw9MwbJ7ugnIj+cAVggWxdadpKuw8aKPKVz7F8QddivqK3Uoxs8fGz7Knt8luAGf7WMyAv9Y/2UQJPym2uzG5atuKRANx/iJzkFp8iKhTDDHL6PEWw9YJ6HZShDTsZ8BBzTb8pQ2zmJBazsJ0GpKskM6ZYvgUmHLp0knngFOT3lSFC1oCUmY6NUwcl49kK00RktrIJrqoZWTde3sIB5Xyc4T37UTBzL17oVGPmjhmqJPqdS3encc4d9C4Xv7TgDy+UTEZoTQcHHQK5AlKPGTVvuQaoOlB2Tm5ndeWIMLTk+dqvaTmZgqLWf/VWjm2OJ25m5+gp2Qow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IWYtYzVTZtBp1uXtdSh9wt2T3kEkMtzPWWaer+1YMQ=;
 b=lsnRp/vjz630CuF5ADoijYF1l35pJrKpTj/Xla13Uhs67DsihMT91ZdZQansIq5ynWGRNesGb8+9O9sdmvGoPiHoefPxjFFj0NS/Zv1JAhB+z/TJ6E5wxi8n9awT25uwpwvwcxMJYilnsv7xKV6HQRxhYRfOXwqyH7idgzTN2K7R/gAGe3J3V7jYTIAkZXNxEPSKKM0Rlm0XzJFNQhObyQiGC1ls+wvuA3aQTaveonbMlbER6yOuo5hd1MUfzotzYJ4OxPRPE5wTCUK2qBWXMHQxODXyOgKPWuAs4To5Qb/9xFstsAdJug6QKt2pjK4JcExkvgVjbuHy/bXyEteRnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IWYtYzVTZtBp1uXtdSh9wt2T3kEkMtzPWWaer+1YMQ=;
 b=Pw82ntQvdABN/ad0g3L8caD3bhRFHcvHd7RhF8h2hazGK0YlYxJH+e7keuiP9H/PDj4b2oLuIdErqel31Bl0BoRFEMXQXRokkXVhaqljNV0aerhIo3VQ13psWOdshA/CU6cp4zmU7e3ngiNLHbI9UgTA2BwDZ9ot7YBYUs30j66Egp3kQDSSOKITO1sLMW0KsBgYPBaYJRKSeH42wC6jQx20wIjqXQiSWhMkXzAlVaGTX8SCEapDTCu0HoFPVamvjk2g6EG18b3AwHV5ieUoo/fX2OUwlhpLr+a+xzWpmXfNS8N1wjb39BFyo+z43zL46C6l9wG2D0xPGyYG/39w2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB7721.eurprd08.prod.outlook.com (2603:10a6:10:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 09:19:09 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:09 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 12/12] parallels: Incorrect condition in out-of-image check
Date: Fri,  3 Feb 2023 10:18:54 +0100
Message-Id: <20230203091854.2221397-13-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::33) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6f343f-5330-4601-830a-08db05c7b505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: huqxDjr1XNcaGsfEgSkra/bCPXfRED/eGr+IxoRuxZoKVoTru7mR/ZR64riu+clQHFOO6B6jXKufg7F6M2kiKnWz97LU6BPxDHo1vmCNBOEJEh+zLUZBmR3vRTcl+1mrdwzzdknHEALVzBv3tCegUINI5Wik5MA6GGDw8rpxdVM/HFlphcysKNSwxZzP8vT4eEuR0TV/WV2XGm/ORi9w7O6o75gHYNGD3qsYLIY4DvSLdGRTV4BU7Ri4uZENfVHyfokh/P97YzTKgBklO/5SAV59VhY2P6FLmBo4VN2Y3+lvn9qL0FBa1h8FQRLccIkuJYkBZJbRbtsTgdVJzcadgNTKbKunvYVj9gO63+JTwnhxQfEvFAVkgGWpF7F3qBdHwfzHoAeDiVCZ0X9mjIG0rJvsaSi4XUA132+bECc8R+MHtKseHKeNjSIjeQyBjUUYbLFubCeDyQ6Tm6PVOpMS+5DgZ5uB8wM+MKMYFftEabXuhZWS0qdACzdVAF9D2xPwA61CrotG1ilykDTyouqgG7BRNNoyKcVtDxKmqByne4tAvniA/3M/Cr57O3t2pTX2OMNQe25eCy2BjwL1AKNitupRYiA7xAjbDLLOpT0pY9os2AQcmDniRGjwB05SkMWZFW6RNMz3U7Twloj1y/y6+FHw6j2tYL4v7IbijV32qrsPnsss+RlRxS5OCzO7IgrkwWVvWStwGMU7tQnA9KYTyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199018)(316002)(478600001)(44832011)(186003)(6512007)(38100700002)(38350700002)(2616005)(36756003)(86362001)(8676002)(6916009)(66946007)(4326008)(66556008)(66476007)(83380400001)(2906002)(6486002)(6666004)(41300700001)(52116002)(4744005)(6506007)(8936002)(26005)(5660300002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0xqSTCw94mtKeqJ+MsDYrUKyCpV+oypeljx+Cyn5KuLSlAxXlY+AviVJMq+B?=
 =?us-ascii?Q?ZRC8fstVcyKtBcwjkCwMnDOLlGp/gGTEbRj1ADbdOkKRCy4Jd4DhIOcht9bs?=
 =?us-ascii?Q?DJJqAm5StVx603rUjM+yUAefjuyvO6mT6NVxgKrYRw4xfDKxzCE42wacjM5S?=
 =?us-ascii?Q?Vw2vMaUwHyTH4LZ6PbJYiM59yxyti2kXy10pEDHtWasr2UzuHmUIiCBiEok6?=
 =?us-ascii?Q?IsfGJ0dVFwwSuyKBhGTKnZkY/GS8C6czu8aEhA6+R89CYPudskg61CnX7scS?=
 =?us-ascii?Q?l2jTZXaxmMo0+3YwhmloEpUmk3G7bnu9t/y8SHd5OVEcEaQms7bgGfNBUsm5?=
 =?us-ascii?Q?aRTCUco1FbCq6cnDURcCiBBTiawF13IJ7G7g0pNtzn2qZJD8dki8loSYMzKv?=
 =?us-ascii?Q?3AYGrdCsNtvoDXf18fvkvAtLpxF2q8el6rKlYE24uJh179nGEZeBx78B/Y4B?=
 =?us-ascii?Q?TW1xYDJHFJ4i+Emd2zJUVA3U7Njd1w6pSJ80PtnEZ7838bO6NJM2kXwCImq/?=
 =?us-ascii?Q?RBgGqLvrUQqLeyHK/d1zGl2Ohyo0NdPGSwWet6BzkOQ+sDCXUss86rEkQZr+?=
 =?us-ascii?Q?OXBPKmVTy1WeL1DcUBQQDjJdzxnSy7ib7OQIFb5bcWuj5fEsTfJR3A8zRE69?=
 =?us-ascii?Q?1fH2g2sCNAM14lWuildg4AKOwFikwRdGR+xGCPg/dKOxYTSxS6sA41+3AqVY?=
 =?us-ascii?Q?CWdR07iq85e8a3avCuPZ45SKTx+bG9llXdSw2KdpWnlrSjLEBBpQxQ/DRhHU?=
 =?us-ascii?Q?Kn0gDEirle548rbMzAxlgehgHRR8BTSzFEt0QyifsdYCMJR559kKqS6tNsbO?=
 =?us-ascii?Q?35y/caWH96r5lH6pw5zM9BrBGahoolcMQjoGvE8loOm1hPMc1D+qriwgPN04?=
 =?us-ascii?Q?bR14jawzMBkKufM2NfxqpySd1DlSCmnY0IzAbaTV7iGVepsrGLzuGeSmjtSd?=
 =?us-ascii?Q?pZUsULeAfpx856k91g7ylMjxH5UQUKymYpr5gHrQJ0KbPq79VAi1W1+Z6Q+q?=
 =?us-ascii?Q?1YWdTG/wCcojEpHe2zWqQbWWut2q2VA8QcFSbW6XG1mRl65klKDhoop5Cwve?=
 =?us-ascii?Q?FGJNRTUWqepF7mMI7XX2IbApOsCK9A74o4+DVJhVRjNUC0F1YqyuJxVZvwkS?=
 =?us-ascii?Q?1TK8y9pQYqXd51FQ0ApupURDVGGv28qzlCvLuw6AV1hDKnmsfi4XFgSFiI+g?=
 =?us-ascii?Q?h0vwCDrzgg9CYYlGYj6nyeH4+ySKsOJsGL0kl3LF3pqDa+tO3ZV5PiRIRz/u?=
 =?us-ascii?Q?Jfc/6Q13kXUBuFE/gbKt4PFlrD6ANVeZsovyCjEBD98OYmZMpXEG8Bmu9nSB?=
 =?us-ascii?Q?0RRqhAfpkhltalwFbA927/vG9u5sv1muU/T8U+3Z7nngo+zSB+2hz648/oqN?=
 =?us-ascii?Q?xsZssDqtsIlFiZe/p4787IBJOqxy145ayjIQSt7q35EbT4KU/k17tpe6okLN?=
 =?us-ascii?Q?JYo3ydGJqoOcJOUyxMd08/HZaZJmK3GK7pffFqjyq2Nl5grRO9+cSXKZjPuX?=
 =?us-ascii?Q?88fz6o/0KFxbzguUpZZy6APo1W2fuFhUS0qjROWzYBe3yJIhqA6CwHlkVVX1?=
 =?us-ascii?Q?xYSYqdrXyDcm7k8X86Ee73U33UpfNQ3G0HL/mvNIUhuDCq/Z/7WDFVyhiOUZ?=
 =?us-ascii?Q?uGurzLbz99BIkdlKw42Qq7E=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6f343f-5330-4601-830a-08db05c7b505
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:09.7975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1/iSer+Q0uCW8Kj3ge4OWvaGFn4DP4urEAJlwD42EbKj0dmIf6GGR6KARDB25ojc8ZmmXU5wWfzAlHKMlTJKiCmYm12WcXvVekTppcyYrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7721
Received-SPF: pass client-ip=2a01:111:f400:fe1a::70d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All the offsets in the BAT must be lower than the file size.
Fix the check condition for correct check.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index 61e7e4010d..8ff7d55c96 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -455,7 +455,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     high_off = 0;
     for (i = 0; i < s->bat_size; i++) {
         off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off > size) {
+        if (off + s->cluster_size > size) {
             fprintf(stderr, "%s cluster %u is outside image\n",
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
-- 
2.34.1


