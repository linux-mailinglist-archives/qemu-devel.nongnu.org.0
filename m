Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CFB5A472A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:30:56 +0200 (CEST)
Received: from localhost ([::1]:52464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSc2h-00014U-BA
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblY-0001Nh-KF; Mon, 29 Aug 2022 06:13:12 -0400
Received: from mail-eopbgr70135.outbound.protection.outlook.com
 ([40.107.7.135]:32646 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblX-00066Q-2a; Mon, 29 Aug 2022 06:13:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl1HXEh9FKZ4tdflrBaMz28oLdheCOLofgobefR/LvdZwipfVn3DpnsZeY3sxQVVIlOWT59WiECZ24lAQs4pJiNlEEu+5Pnod4jkr5vrHY2AD8ciQSxqpCE+PuwSC/DktxXfaWsSyBhLEhDIKutRza/4kBLCbYhIM4zvLJOoyB4TYHl3Sl1+sHZPTMuD5cWELSmyj/cqriSWUCJEHT7PhqixiwvmhY6ZUeCHlfc+glfVqM2hkXHuX/mV/VZWWJLJ8ON+e1Ec+e/xzVNrS6oGzvhI7l9bNNQjBJTK9U2OIjSoFzlEKU3oFHZqm8eKu5CT6mgoqdo+tPrEXNlNpXwJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iYReJi0zV4ezBFk28gCUFO+tGQpkythYzHceVAAbYo=;
 b=WpocpHVylO4QkGl5FdFNikSRLNARFabyq0teKTfdf57mH7NnTzm9ceUsF2D5WVtkdj+p6Hr7jph5d7h5nwLUbCx/N5LNebiblLj4oCCwynw30eLTE3X1cyC0fbAlkC34FrzWqP0Jl4VGUJyK4dPfyWloBJodH0mHAzMO/Ac6YrOWuf+KZRY+EyRYftEO89h9IPenXd4mJIb7MtIujW4+VbH31IgqlOmLC0BxHVVN7x0Eq8ioI8COpwKzp/TAcrINnVl4BjOav6Fo7EcBuEVAoytOTLNZ9++Os43ulei/pvIdsuyrpAFyALPWaSf6634JW5S5hMCtdbYnuBJI9me9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iYReJi0zV4ezBFk28gCUFO+tGQpkythYzHceVAAbYo=;
 b=xZfJmIfa85y8wvM0hXyZPmJGCUZcOmAFjvYzyiIUQcX9nfhoh/A9hUaFd5cH5ldPdXb8E2nr3Tt/i5ubSAHQ4qBMjeolqqYFuxb1trxt7uY4TdqMOzIrI3mBS2jO7YDH3S+up0TfPffwb5WsFsh4H5dPOsbi5hSR+WLedxlXfjZ8QxO+0CG9FeLJN2zqd1a4P/kP5CtCuX38ylRJXqDrwqj8tBYLs0XANbW46LrI0M1WMBh3rZ5E38tlmuB7kpJ84F5Ne77Rg+QHj74rFvObvMvSnPIFVZr16oTK5v1TB6KnbDUPiU7jYJxCT7P1/Hi7rEvvijXwqdPtqHh99P3XmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:13:01 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:13:01 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 11/10] parallels: Incorrect condition in out-of-image check
Date: Mon, 29 Aug 2022 12:12:46 +0200
Message-Id: <20220829101246.343507-12-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
References: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 757c30a3-b5d7-42a2-1ce4-08da89a70e08
X-MS-TrafficTypeDiagnostic: DBBPR08MB4725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ilw+4lNn1p/87SYkNI0N2vaYc9DYRY8qM95jzLof8BBSk2Y7+Fykt0vqKHRXo+4btrxwzYiiIqvZYo9gQqCzJL4KOu+I9vLo9bY1fOmzJG8cXi4xje+rVDy1LCnuY9laWhVHphuWINCcLBnbZ/ob5baGc2du4CTsnl6GShH5qGRUB3uSiMoOj88AM5+WzF6MZXYIsa2iw/sNs8uEpQWDXDKJyOsTzBPU7jajCbsSlVAIGNT7WQqLBs2hC4mBkPqYaLBsk6RbbvIbViY3qkCPgQLi1/+2WqE2pMupm+ILTr90j22DwRy5uhmg+NPZUmVwGLwubLDFB2eSXz1jQh8J9WsLJ3Fa0ZlEXU1xQJX4GZ+9+twpVfzbLCA194QxFbmgjiIyJikblYVmh+vreEWY6FRMNt73R7lNoLzbJhzrcG0xGaWSuIJ16q9xE2kJwOB56LGlKH3+zeN9CyE9xBkZepW3frQf1sOeuXXs7DjJsKfx951wS9H7Tjo/ZkXRp06tiHD1MhVq+J0/iqKH0uQitxnEpQq38WVJ2HsY8j1W1ExKS/3Tnq8XhvIM9dyHceZh4U/7UphVrQ+hmE/++cbAEJkfx/m2MQDWmK4HPywMN6RhtbAvvUSrEX/n+kHvif6Tmo2UbiuA8tIsPQEq/Tp7uVezwTwikH58nseP6NrSLZE8s/jj7Jt6JKvgH9+GbVp3bHJKXUvj54tnwl8P3MVtQmpFqNpS2D5cQcsr8KggI8xYD+4KuMA2n0y3DRJeKsRZuFS5byL1Gf41RPEq9H9cfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(2616005)(316002)(1076003)(36756003)(38350700002)(186003)(38100700002)(86362001)(6916009)(52116002)(83380400001)(2906002)(478600001)(41300700001)(6486002)(66946007)(66556008)(8676002)(4326008)(66476007)(44832011)(6666004)(4744005)(6512007)(6506007)(5660300002)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZWPoZm8In10iz/AdbPAsyrvm74zCbHRjKQPskhHskN/ts/40AOEljt0RjjYZ?=
 =?us-ascii?Q?/3Hz7T2nbTB7gtb2L4+UKyam8l/VXkkdfMtoaaXzz1exs7RygUkG4ZtEdnfV?=
 =?us-ascii?Q?iA03jvFzx4O2rKBphZu2lXLGcKObLobsPdKZqcHk2qqHfTyfnqh2S2VsprUj?=
 =?us-ascii?Q?2WyKIN5wqRzK8M5s3oyfjMgS9tZ1leV4XugiEXiEtpJr2eCDPaC+sQhY99V+?=
 =?us-ascii?Q?kH7UdExhleVbyzrc1bhe/SzkatXmXcjK+2NPZxnHR0HekEWbI5wxVjQMuUeG?=
 =?us-ascii?Q?47kEnfAI2eD4AsLaWllEsqjgaRj/VWiF8kHpFzHWKktFVmag33zj3jabJpco?=
 =?us-ascii?Q?0L2ByO7Pzxj1BU/PmhmYn8mbCduMT2OFn0M4qEoPxCuQtYGUU1Oa3o1Py19W?=
 =?us-ascii?Q?6QDiLfgDRZgIdXVMsCgxzNXLmkSRV3mEOucYbVDuy/JDFh10+AKzmUCLdpvA?=
 =?us-ascii?Q?v2V1W9CbQCGaxagE97x5u1G1nVLSHN+Ti8ZqKtOv5jbtgMsD2Ivu75Ffoxlt?=
 =?us-ascii?Q?I4qF8NGPOjtRcgW24HeB4xzNW1oEW6DQuOkqcPy+R9XMEPkYDopaK+pvjCUs?=
 =?us-ascii?Q?EWgUb4DjAGORFR6Uu3gYdE4aNR2Mk4DLnvP30Np+8ilh2nok0g7bkguoHkWe?=
 =?us-ascii?Q?LCupa/vZqK7xmxA6WTRlt+nLKzv0om91niIAblbcRltljegc3Ar1Qwdlrh2R?=
 =?us-ascii?Q?JZbkMVhFnvXbIA+EuVIRNhxe0lutYBTiB2yWs89c6JNT+ClMQxpGgh7bOscl?=
 =?us-ascii?Q?45DeE6i16Y01Qgs/QYxzMPblUjwYh8G0tQE+/RF8YtXgcGwPYjIMhX4PeVgr?=
 =?us-ascii?Q?8y97unwE7T3x0LoC8sDZ7XZXVFbtrG3kgj8oX8PM5Rg0unJQ3gcPFxUAyRd2?=
 =?us-ascii?Q?fTz+G8QLK8ciYb98sURZtHU+oSsfFD4fbw6zWFLvc3OaihPZs4R9V7dQnUmO?=
 =?us-ascii?Q?aYdCeKoviAcgkc0S+f4twT+PmFz3Iq0F9O9P+8aCSPFYPhVcQac4dM3iT+wA?=
 =?us-ascii?Q?NQeyGuyZI/d7LTySH4i3aAUmiiO8oj6W4Hj3DJWtefTpcKr2Q39TJwP2R8V/?=
 =?us-ascii?Q?ErA/2iUJ1cuzC/FBgmr0l1omR+CVKcDdrQGhA7fJqI0HgzrTKpmMMNEIFFvB?=
 =?us-ascii?Q?BFPlphF6EQu1Tzbw9DAbGJKHwOl8iFJ1vJKdL6GNlPTErzCG/Jg1XUJv4fgi?=
 =?us-ascii?Q?R7iRfqp8lfaP734g3Lg+/7xEbuvJAHutzgG6F5OtMPzUUPpabGn6oVw8MCbz?=
 =?us-ascii?Q?ZyRnxh25NvIg1B9fuVUtEuYNEan3XLj3tZwi0VPh00t3NerJNCc0ma71rnWk?=
 =?us-ascii?Q?nTF2sR/J0oFpFHSLM25Nr2cNjrFyVvmTlQL/CVMluNjCA2hlDovuTuxy0Ftx?=
 =?us-ascii?Q?7LX0zwMsUQE2aQCNki6jMKueUTHVs+zV9cw5wKjKb1i2t3OUNzfijAcbdLAf?=
 =?us-ascii?Q?m1c3JBASflSHmSq9qrR6+qCy8b6z/0OvRdHQksOuZb6DL0TDq1HEj+Abe8yU?=
 =?us-ascii?Q?Vzr2s9X4oXsH0y4vBJbyl2G17euUI5A3M1SeaVpBEw4AzVcLcNzFSlu9q6x3?=
 =?us-ascii?Q?WiirDkPpNUwz2M0xlWRCd2p6U/vAhob7qvG25132zAFJ5VLMBReR+RA8zuXD?=
 =?us-ascii?Q?d+rfYssXJWBUrO34tn49kyM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757c30a3-b5d7-42a2-1ce4-08da89a70e08
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:13:01.5708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGPCkOHfoY049BzKsPfBJvKGTJHR6plYyPZU2BJhBr31GSE0wF5m84wnsJ/jUHwOagUPV+IuL+kG2DsbFqqFvcfFoQgivuB9nw5mg2U68r0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4725
Received-SPF: pass client-ip=40.107.7.135;
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

All the offsets in the BAT must be lower than the file size.
Fix the check condition for correct check.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index 8943eccbf5..e6e8b9e369 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -455,7 +455,7 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     high_off = 0;
     for (i = 0; i < s->bat_size; i++) {
         off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off > size) {
+        if (off >= size) {
             fprintf(stderr, "%s cluster %u is outside image\n",
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
-- 
2.34.1


