Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65DE59737E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:04:56 +0200 (CEST)
Received: from localhost ([::1]:33662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLXL-0002WG-Ht
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLN8-0006gF-Q2; Wed, 17 Aug 2022 11:54:22 -0400
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132]:65374 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLN7-0001M7-1u; Wed, 17 Aug 2022 11:54:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iP5JpIVWr9jIIppol1FarTjgFdEwj9kJFEEe46zxxDt3BzhL+9w/gvRlT9pj3my3SruguYakeGlcvkAC4F2K5do+mAjyF3TIguisxaBsXFTjJPaV8SHwUfFE5aUQ4oCw5e5F1HusY2OeMRyQWgAEGxCNLIHYAlt08GshSRYwBAfI+aDcqGF72iGDOxOZCxXs7M/mkMNsOXH6/9ioqIRyi6PekbR53f7+d8b9Sk9Ybc5Ue1P384ntSz1+vsPwaoeMFsZNmyNI5tOzRlUxWvijm9uTbIjfRNVrL3v/2F1HB4t/5wXa75Lr/sfyWv4UKGVs19LK9rALCU+5/yg2eqNnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9aenJPjZ7YXBX3x/Fb0ofevr0c/OQpaS57fYNdt69U=;
 b=VUSTsTuderDd8O0vl/1BpyKrNVeTCL81QlZrqlD5nXdam3eIoSaHTzn73KAsxIqWrF4C0Cs16ZzROSFYSHxzfi1kM2UweZTtRONopjg1TKQFCP7BWSGhm5xfg4fwSUilfRl++w23UEV8kAE4No5t7cpIeiwXwB7xB6PWY8AnXehNOqDkokabqSA33AIwKXJhRCrWDKxE8qr+G/ZuHigoi+1rxDUcTYpPoShLZSQ7RQR5KC1brTpTWU17UHvLmylSnRi54ywDE14t0jPau6iE7Hl69o4g22GFykjOHGk4rBashEtdM2D64Xmfm3+TkDzsu4kPLxhfLoJd69OiF33M/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9aenJPjZ7YXBX3x/Fb0ofevr0c/OQpaS57fYNdt69U=;
 b=fuMcnKo90TpNW0ne7RiuMyFmmxagbOFEv5ezfo2NrTzR3QsqAZJEJ9Fs8oluXq7eqxWlO8M+41SHCHDPymYJ05U7mBduzCx/2eO21MTMCg3rPu85hS4zJVL6iedeltlci4F8dlukkXBb/XSZHDtRpOTsIhuqbruLd/DxVsIyy5LkP53FgP4typ/jMjb5yqgjsKyZ0/c0Ggx7bchUP+8gA0G9Nf3JfyWptUpF+WgrBnOOwWqK9svyHZbE4rLt1D+xcjr+LEy9oigGvOLIYx9gcdK/HSVzx4N/ojRjGS9rErZ0LJDd2pN26/MnenXl4o//szahh/Ez0SzxmAXW2m3PEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6783.eurprd08.prod.outlook.com (2603:10a6:102:131::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 15:54:10 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 15:54:10 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 01/10] parallels: Incorrect condition in out-of-image check
Date: Wed, 17 Aug 2022 17:53:52 +0200
Message-Id: <20220817155401.2045492-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
References: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a7f9633-518c-458f-7ae0-08da8068b965
X-MS-TrafficTypeDiagnostic: PAXPR08MB6783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t7AoGPs3PUdp+G5t/5DS5tSkitkrA0xiHdprQFifwvqtUo8Fcg3sPuMZIyzxNQ3hgm5jrLFVr8d5d8zWO+7FHz5XeuSwbzmGt50Z4qegQCVIa4oNLfeQ7tguWQcDeW7+NUx+wCY3wO1xHHcFblxgmPJxF5suESBnONTkXDCMJDeauYJMG8PfxnM1fRAL/XAup79Zx5MGijlDoMbFa+WjZdcj1ZpoNAzKOcNZiX9pkzWtlmlKvyPo1fJPm3EV3aSNVeOfS8gbOqBwbQGyyXOp7vyCpUvnd4gQgi+s6Xytj9LHLk1vdtPe9QB+9Ja5GdZtGupL72bGm8E9D8FYcnL+LMhAWvi/e1Kn9AyL+V9lJ1fvFBp6mTBD7okYLdU0idrxsTelNNjAyPgSKxHdiqpkdDZZFgADgZyf4ZBYoU7FNlQy8v6RGGzrtftL6Rz93FPqZanedwizfftXDe4Zahxf/e3l6y99h02SsqYMGinXa+ku4uMBQjjaMB5vuQZqcj0JHKVhyTneyz247DfOo1EqcuVHMIz9U/NhPqzjv9cDASh/I+eNzPPaaZpFF+EdlzsqXWDyehjiksKGrEfIWqZgFsbknjCP9uitJeud2w/XFQO6KjJaJB3TMj5MUTtL3IiMi8NwvvTT/dp0Kb+BvLs6hWHtcJDLde63jzNV4u0aA1sChH4PsRXaO8Kyd31DdXPg21FkMxwtcsA+oeUXtaEPCkcOWVGn/N7WPDTp3XAHUzK2WGXKk33AQ/MJsnLpvDb8/PX8hwyJ3thqSTqXrn/7wMIT2/1GIDJ928FPaR0CXEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(66476007)(66556008)(36756003)(4744005)(5660300002)(44832011)(66946007)(6916009)(316002)(86362001)(8676002)(6512007)(52116002)(6666004)(83380400001)(26005)(478600001)(6486002)(4326008)(38100700002)(38350700002)(2906002)(186003)(2616005)(1076003)(41300700001)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dNcizeFn+CbVTFNDJVQMd/TFzAehlO0oIFVTh31RfI2iHd9NVdch9OOw4wKL?=
 =?us-ascii?Q?HEhDBKqqqJZT74bYxxB2sT7JMcqxkgWfqvmOn+fi315e8yvx+NZLWVwwGIb3?=
 =?us-ascii?Q?+pnPqUCtWvQyOtwSu3imTYBUpgAVr3dApN1z0fXP+IZuNAbz9e459lDl6JSl?=
 =?us-ascii?Q?fG4d5rFBMjG78tRRqR1YoiOqk32GPZQoLPPQOamfCgbAtS5SN+4kLT9bKdid?=
 =?us-ascii?Q?w7f6EqgtEy/25QZnBRB9Ax/52rM17y86bN/pE89ksHoGUpaMF3Wd48xANGaa?=
 =?us-ascii?Q?/d8ZPw5Mh7bqZ1rOabHPqGfPO9EwZYcq/HHAchwxpHERNouZguoCPxudYiBi?=
 =?us-ascii?Q?ci+dES8H1ilxgb+i1ZsLnsEieEyDsPcyYw3oUy99kIWdoZhfJdusQek3l4Vn?=
 =?us-ascii?Q?297WxMeSRNgTNqDdqTKzSQ146nn/Ql3Gn/8iWqv9AFxZzIksvWMHNH7/2+0J?=
 =?us-ascii?Q?8XyRe7AZxKRjC1VOAX1/Xe/dD5G5EJD73WfDCrD2ctE8z+Z5XxxMr8y4kaLs?=
 =?us-ascii?Q?ERi8oEIcnxVULJiaFtoYQ5UjVfDA2thw9AjYOKg/p/lWWy3yagVuchmn2Nra?=
 =?us-ascii?Q?4ScEhl0ykZnHNFDsLGO27H0Xe0B22zhy6mj2SK/EDdzF/9jfk2+vQ/+m06k6?=
 =?us-ascii?Q?8OImN5Pb99tej+Z84LzkaaCa1Me4i/QaMjF6k898NSEWInoddTPCGDi6Ndi7?=
 =?us-ascii?Q?VovkdSfQTqDzgXeaMbikA3MhnCG1+oeePLyCgQpojUiO4cGA0dcYkwNHypW5?=
 =?us-ascii?Q?iZt3SoSg5eCsSj2Pl2cKeQBMXMU004yxNOx4Ms/U3FTAkrCUN8QHONX6Avqj?=
 =?us-ascii?Q?1A8sMh4c1Hy5myqyfwh4IZNzPak1t//YhPF+w/US5hHg8EWSRVVYOkvdU6IB?=
 =?us-ascii?Q?Toenuf3V7nky6fCIbyEPTEqbrpH2/Uh66OvqrySexuiU0LlSxSqGKLdpNUBP?=
 =?us-ascii?Q?wgUZ2LxIRQrEPPc4gpHdfWJIiTWXSsOokbBcAYXpcNhfI+qZT//sPc/JNV9I?=
 =?us-ascii?Q?vxWxXTrjMliAgt9pg8pUD2eVUUVme3vobU98Cj5NXnYz/9YGyvAYfrTd/SvQ?=
 =?us-ascii?Q?CGHSuj7W8jc0m7F4VnmpqdT9aApFRkldmE/nP9CbLKF6aTZN1fmZ0T7L4O6S?=
 =?us-ascii?Q?cfe11sw0iYH1w1JvlLULkAd7LyRSBMpt/meMosGHPeW06u939A1JlyMkKTfe?=
 =?us-ascii?Q?l2vbC+0gmdw2wGjBTF4b6JFDzKbtwwtiwppy/sXGoD4dCKeSp+KzHEDTefk3?=
 =?us-ascii?Q?10GKpzYvwg3oxTVRzD8h3A2nfu27yCNhaiWkBt7FDXhF9HKsZabwDBZtBuWC?=
 =?us-ascii?Q?pjreYtpjQFdaah2bc/h3JktBvezTEDB94hYySWv8TNqjIKs+oOvu9LWVuHhg?=
 =?us-ascii?Q?J4ekQoenmSRUOpfEoBwMJEInBnLGTLMUi9eF3bVM1nwfZI6yxXEnGGLlBnm1?=
 =?us-ascii?Q?jlMYeIuFDY8rbZGTFrLxo6o9/mAOe4GwkYkWmCAKvNyr+HDruXIf3tn1h4Zr?=
 =?us-ascii?Q?GhOTLsG/cq7SihFY9udjKRGcdL4Cfj0a373KpkapYxrvdLKvZITZN0ZTtMlu?=
 =?us-ascii?Q?5qApACjRjVKKebiK9bVyywMcR9BSg2ML51Knq6QQup/hoCL3/sJq1YPaHXvB?=
 =?us-ascii?Q?rz7ChvivKWVwIqvs0pCkib4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7f9633-518c-458f-7ae0-08da8068b965
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:54:10.3142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+Yh2d2/KL+LLNPE9UG2+NGDZgEwEv/hyAQpUVa5tJa3VvvxyrDtgrFLjCeenBFSZ2U4WJDHvQpNlpxT2Cs45xUaJxNfQD02ZjokKy4vqbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6783
Received-SPF: pass client-ip=40.107.6.132;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

All the offsets in the BAT must be at least one cluster away from
the end of the data area.
Fix the check condition for correct check.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index e124a8bb7d..c42c955075 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -455,7 +455,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
 
     for (i = 0; i < s->bat_size; i++) {
         off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off > size) {
+        if (off + s->cluster_size > size) {
             fprintf(stderr, "%s cluster %u is outside image\n",
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
-- 
2.34.1


