Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B86EC8AA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:22:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsOQ-0006C4-EB; Mon, 24 Apr 2023 05:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsON-0006BE-RU
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:21:51 -0400
Received: from mail-db8eur05on2114.outbound.protection.outlook.com
 ([40.107.20.114] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsOM-0004XK-9g
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:21:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHkROZUqptS8Wvj/CzAgic5jSNb5sNkG8crzA4JPKeiTe5hPsZzXAfqNgOwQqjd/NhvsQv55GgB4g3SeUPDogC2BJnleMn+9hDsZIEbIvnAhqJMFEuo7yeIbVCyVoe08CmfFnyAQZhws+q1Z5Lo+wyzjyuE6VHWYu+LVxhI3CH6oxySAWnB86QDWMxjFYmIHaJSl03FzazM3xCPMexLcir/G/4C0ZOED8n6SCfHW4Tk9SkOEX5BdNS8A5M3azrOmMq/Xrfjk3To2EUJvMbGLutwFQftw3ahNRl5/9n9GmKmnfCrpGvj7CAMK6gExtt1Luex1pDzkq5qyJl33lyXkmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXOwa/L67joB3+1DEfpVcK72jpfn9Lr1WBBHTA2x4Wc=;
 b=MnLsaUq/UeoU2xH/jd9WE1fo1CLnaPvo/xA2Nkh2I3mbbAAmfDukNFRrsTzX7s51YA1slnjOtWhwGT5uSc0ViTF2soNvN1l6dF1beq0aKuiqKwF9bRefcw0Gb22qIjjvANsRw93CcPZM5bBEkxnPlv6QhIpWwAozKSHN8cf0G6CuEEc4r+00/+pr07SXammTa+2Oe546bLrqxj4k64ODZ7nwPdSPfLZGox+QkhqK03Hky9NlHBbisGTRWFYt0VziCCVREzawCkfvu8Ss8vm3h7ekGVZHl6hBuCdpQQzVlA0sasIpTZddMesxoFYoBs+nmOGB1x0ccg1DWv+2TEPplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXOwa/L67joB3+1DEfpVcK72jpfn9Lr1WBBHTA2x4Wc=;
 b=v+eLQ1MuY7T7OwU/8rRl5GruWcXc8KzYOo8oNWeRgEZDRYI2ubZOhbeSJ8AsMJRtU8vdlJ50kiSBWTtLlWQmUfkbnXwj2wSYRJmmOgiWx+W8LWTYr7HttpeNeIBXnKck4uvTg8McKCAYO0Hn+hQy9Ffjerx+CmZYd//5HEU2XA8/KwRArfv5mQYv9hH/qW8ImC4WtU6ofH89mk07qijyfnHw/ins7WP5/H23AZyDbARf9DPcMHwIPtR+YtG+ewIUmgkHvCMURexNK07mwr9ksM55vooU4Y6YMTt999TIq26CZr8ZOm3JgKa6ksfD82h9iL5a975F6vrrgOw8sd4TCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBAPR08MB5832.eurprd08.prod.outlook.com (2603:10a6:10:1a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:43 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:43 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 01/12] parallels: Out of image offset in BAT leads to
 image inflation
Date: Mon, 24 Apr 2023 11:16:15 +0200
Message-Id: <20230424091626.195590-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
References: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBAPR08MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 002ba3c5-4853-4916-1588-08db44a49cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t21mQyVUIbsP0zv+U3cwmwxhoY5r7CFyw8F/wQqKG7hQCRC9HyvfYRgjeB9DvQ8kI9LVK1gxt06tlS9zOeUBxvFuI2uyINLnTXhXtnlRYiKEkHsrQW8HkzxTJ/auGTN8FaqmBxYHA0SXrSOzLTo0o9xKK1e2UYkNrf4fSVtQnIDe+uaK9nEqxiyWo4doLS+JrTvkKNuFYdk3XgynL9CuD4b390iPRgP/EvU5WPqVuQlKi/oVTTjIstoGnOP9GjyDiuyPwvkZ45Uoum3Cm65x+ydsk16cJ8Ea4+TwZHdk/ewIoGHrqLnT2AmDVX0PqEUyZDt/3+ib85gq7EMupQajFT5uQi0njw/L/btgFqSlmamiMnqMdBN2G9m15UCsHA8zh7gmtS3rY7TfqocKsq7BQYJicm+2rYTuJZPxUMdBkUuhS3Jh6Ah4QZlPaj/iJhRAPdwTn09GpmrIPdc7YHk0wI2Ey1tXP0IIoOpkeDyTTfH8BFIUNQVItRw+NSpC0rOqPYKz5wUp6ghAAr61T63k7aPsmFliW82uqq9z2By6fTCrIHYneG2nrI0/I1nH+oDodgsT97Grq+NI2YmkKeGbKeA5QVa07S/pPyLkpIQJrJR/u0bIP/y1PowZ/veIWvJ4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(39840400004)(396003)(366004)(451199021)(5660300002)(44832011)(2616005)(86362001)(83380400001)(186003)(6512007)(6506007)(26005)(1076003)(38100700002)(38350700002)(8936002)(8676002)(478600001)(316002)(6666004)(6486002)(52116002)(41300700001)(36756003)(4326008)(66476007)(66556008)(66946007)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?auK8238dAOo3KBbjxPZ4p92OcqV8t59WhN9gfxmJi+IkMXxcCaw700E35wtP?=
 =?us-ascii?Q?Fq/7ElfXkWI1gZKjf3oizc6D3TmulGhsOYSUJ859eLXpxc534hSJlxm27gO+?=
 =?us-ascii?Q?804MtTyQ63VB2wDh8Zt/cDqaCBAXcq5+9Hy3GW5gy+zW/BXs1+6LG3neEJ7H?=
 =?us-ascii?Q?gIADnwBjwzRwAJ9yro8+NECuAgfdtk4QMHCLrCgJb17MVrnf6qckog+vZM6n?=
 =?us-ascii?Q?fk5Clm7cM97QtQg9pZ7p39eNNz+ZuzYHfrVPAnMd7ARyYc78fQn5/kDiL5hO?=
 =?us-ascii?Q?JDuPDOlzZoMXcZFLvxm0mC3EYyNESbUwiOcEVjlZ7Qp3qqyWyiILJkJNxYXq?=
 =?us-ascii?Q?xY+xM97T1tku4pFKbb5AwUsyHQfh2KdM75On13PqHcAYiIIYCCoJnmRbwKoa?=
 =?us-ascii?Q?0XzXd/dsniv6V04iyQUI5esIiEtRWMF8iPgN48UxYUjwUTZAZ3Cpld//XH/A?=
 =?us-ascii?Q?NJp2PKbBrYEq5Wi0IceGqI8/i6RKjashYwUuJVBxxuyff2vxV7I4hnqPBe9F?=
 =?us-ascii?Q?YG6sasYpTTXpM/OzqBfYqNq9xjGPp9Gi75bd6Z/fhr4MM1GypEyC/ek3hpIC?=
 =?us-ascii?Q?3M/aX3oaG0gJwIoxfWLusZUAKBuvwHu/7U6S2bLIt1RqNS0h535l6xgqyNUh?=
 =?us-ascii?Q?REdRlOLF3PBSvwL01kDHxei6tHj8va82HLddMrxp1peFryeF0cLYoflX6qRg?=
 =?us-ascii?Q?n789v9kF3YYYknYYA1V65C2ysfz3STPTViJlPLbnuxAeARF9iqyRJLBK0ADp?=
 =?us-ascii?Q?2sgAOuRElMJSFoFzrNuSsH4CiDotqDnd9RR12Tmc0iOt44ZMISfqOVAW0ZMt?=
 =?us-ascii?Q?nXIaK56GKHc3XrRKH5qAuB6Qg4pKsQHEIJSz3WYgLawOCFWqErGYw8E0Q5WP?=
 =?us-ascii?Q?muqSO4FjWlgBvl0xq+wuSWe5diUT9CAtl4kHsxDxL/Wc6aXuc/MHK+g/VSZT?=
 =?us-ascii?Q?2B66X8I8nuxOzwh5MKzCxdtzWPJ7aSrtx6acBjc+Cfw1vvJ1MWj98G3rU4dn?=
 =?us-ascii?Q?AaqRc0xuQJ4rcBQbPhbLrqzK6sd6r+3Ys7X/74v+4u+Dhzco/8koQ/XJAc9l?=
 =?us-ascii?Q?7atZ7ggIwKWwmc0vfyqXq4chOqqjsEyLiKHDj45vYa2kLh2MNAbjN26rJDkp?=
 =?us-ascii?Q?oVddEiDUP42grtC9vRiFws5EI9fdY5ibFbE/Oa0Tgd0FDzhE43Gf8bT/696v?=
 =?us-ascii?Q?2Ox5iBBusFbaQaRMY5ISUFlCrLzwSStxcA5O5aNO3qUkL8t0IgACZc1NY6cn?=
 =?us-ascii?Q?iJ8s9nnEkH/qOh35pkL8Mvfp7vRZF5J6sLzWO+Jw+pQUZ8IOlqR0HDaLGNkM?=
 =?us-ascii?Q?VPDvAZ1/g4MPivSuxr5385zr0T5RaSAUE3/581namQYWJ02DRkYht30zYQVA?=
 =?us-ascii?Q?5JNNtxg9SvNQ0w5g7geJzh1YQ0GOE0FmqpkwSVlxjLsXeqgG0ytCQNxoZUXs?=
 =?us-ascii?Q?GWtplnlBjrK+DOPZos8WiMQwlknx/u1bb6DWQa/25/R84eDAMqHhlS4cHSEV?=
 =?us-ascii?Q?EGtMAoQRoYzR6EnhjcF44cjcC013QxFEmuWpVZBy9Ea3t9/DsmeD+iIbXRBK?=
 =?us-ascii?Q?NJFT8kqr2qVmu+ZjLiCeLl66PcGwUJBh/qfs3DB+gvJuqtmEndW5j9ZHG7Cr?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002ba3c5-4853-4916-1588-08db44a49cbe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:39.9155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8npTYyVvsJ2fNJi/UOWw847pDlJNNTirfZuRveEBgwcKuxgAmjPOS62W0uJe/ZSEzAMIG8nywCZ8vcuw2524fIM51DNipMrKS+9KUQR3XAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5832
Received-SPF: pass client-ip=40.107.20.114;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

data_end field in BDRVParallelsState is set to the biggest offset present
in BAT. If this offset is outside of the image, any further write will
create the cluster at this offset and/or the image will be truncated to
this offset on close. This is definitely not correct.

Raise an error in parallels_open() if data_end points outside the image
and it is not a check (let the check to repaire the image). Set data_end
to the end of the cluster with the last correct offset.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index 013684801a..7e563062eb 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -733,6 +733,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
+    int64_t file_nb_sectors;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -742,6 +743,11 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
+    file_nb_sectors = bdrv_nb_sectors(bs->file->bs);
+    if (file_nb_sectors < 0) {
+        return -EINVAL;
+    }
+
     ret = bdrv_pread(bs->file, 0, sizeof(ph), &ph, 0);
     if (ret < 0) {
         goto fail;
@@ -806,6 +812,17 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
 
     for (i = 0; i < s->bat_size; i++) {
         int64_t off = bat2sect(s, i);
+        if (off >= file_nb_sectors) {
+            if (flags & BDRV_O_CHECK) {
+                continue;
+            }
+            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
+                       "is larger than file size (%" PRIi64 ")",
+                       off << BDRV_SECTOR_BITS, i,
+                       file_nb_sectors << BDRV_SECTOR_BITS);
+            ret = -EINVAL;
+            goto fail;
+        }
         if (off >= s->data_end) {
             s->data_end = off + s->tracks;
         }
-- 
2.34.1


