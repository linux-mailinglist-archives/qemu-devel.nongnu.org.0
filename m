Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610915A471A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:27:21 +0200 (CEST)
Received: from localhost ([::1]:53048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbzE-00055n-Fw
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblL-00010l-QQ; Mon, 29 Aug 2022 06:13:00 -0400
Received: from mail-eopbgr80130.outbound.protection.outlook.com
 ([40.107.8.130]:50395 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblJ-0005zs-Vx; Mon, 29 Aug 2022 06:12:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEJb+0GVAB0x8Wy5ZAgHsyERBJPHkI17hnh9G0SWeLvw+wy4KYQ5k7aTqy8uymZHJty8dv0KWVW0QOIiM7BMNoxKGbJ4b/AOIXSWWgUaJ4idqkiBR7OoMom4FRrhZjlQcFROODuMOaZ4+HDxRWi3I2AzR9vj0awOfPdUv35Xju2TAu6yy/1t7Eyzl7RuJGdByArM5KOTBnK9fhbpIoRg435sSBy/Q3aaBZ3BMttl+aet4Tt4K1qd+64EyE33P0IBzZQW0Rd/UbHVFCSNTWwwQ26BXlx6PSYUDm34YMjTMXDh8GPaT7bfrhmPpd7xneLRX5bnu9PnH2DoPeJCA+C35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rzYQDMuEqZ44aJNahV9Td4BHVOEFdrgVxFetwvyKCw=;
 b=jH7UZI7e0tb5yXnXl5gdY2LM48Do9WUYtYiDgPDN8E+n/+6DOjkEjW3WF7y96qDPLfcC0YWTazLBUYHNAGCq00r00Ya3sgNYdx2A4eMxATUnNgUcF7gPl7Mok+HpCNLMJ8x5QjMeWjfJKTKdclI59rMH5+oOHs/hFDgluCrE0//IFEoy2sNoiK/CR0TJcGxEFErJWw1Tl3nXVu7co730t90pdCs6OQiu5sMVxIKBBUCVKrvwCcOdV2CXqCeX++d9nWYqcirMN3hjztdx3HIWsxlKiRj/5uAE/W7obaIeIMqU6ZQ0rCyNoxbFzQuNhIjcMlKFxy7tSMeEjPiDkzx/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rzYQDMuEqZ44aJNahV9Td4BHVOEFdrgVxFetwvyKCw=;
 b=vSENmaDSsbgUR72TEBUBQu2oyqBSCTDU8qJsB27oX7khAWsILCNFh4ukXHG8RoaT4/WOgGdgmNq27R2/lmbYk1hVl4KdAr32QiUrS3q6u3611nCvueq0yeb3Ly74jfX+Dg60SygM1zMjU+UzqSpkpBLH9vh0szggdoIghU9Q78l9VFjdgFgAS7xZ6ZMj8V+t+HbZAjgbxochZZtBBwWwupV7dHexbdC19tEGVxX+Y/PQF/oNmBx7Y3SIJ2R30q7oKF+10yU/S6yGMrff5lfjUKSBoP0wmqdRrzZZIfFbKwfUAa7tB/eioESuqJS12IfnPpaGJpqcgDFgh6jmFkgJzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB3023.eurprd08.prod.outlook.com (2603:10a6:803:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:12:53 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:12:53 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 01/10] parallels: Out of image offset in BAT leads to image
 inflation
Date: Mon, 29 Aug 2022 12:12:36 +0200
Message-Id: <20220829101246.343507-2-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 390ab1da-e2a7-433f-346c-08da89a7095d
X-MS-TrafficTypeDiagnostic: VI1PR08MB3023:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JbhyqaxAeqJQiCc2O/NH7DdVdSi6bwPRBNW+hLWO9BV8w2BHpw1eV7Pm4DtRhmVCXYJxSSVDtqbElpxjOuEzVR+nHRAbnohE+oCeMcgER1ApfF+04vYKtnHgBqBNpcVJAcMP6WZtcoOu/7p73FI3vwVGKB/bwULzM3NJtBQdXSp6vyAvK5/LdmNCdYurTZvjowMzDGx3oblst0Xfec3EN1nm+1mt8uCTmQqRpgyTqxCvZ7p1uYmxpWrULSrXhzDTQsAV4D+XnoNttXi1Lez8IpmXgMfE5BflamMnP9ItCBaOKpBEYZ2RMFnh1mBkb/6oqZRK+9XS3BgH7cg11spOxB4nRZfSzI8wtIRNQNXvOZ5rKd6OF91Y4Bu2GdWCqUCT9eRoswlFMsWgnL48T9FGQAKFskorRX81EeIhq7FanASLz1dBxBCZ9EtAb6amFwAYC37NBWpZcTU0B1SbmdUBUtAXXbS4T+wU4orPsd0d3ZTXL0J6e41j/L52RV/ZoazbiAojmvOsaxG7fS84U8cJ36G+5mdbD6c8Y4W2EH9uMCsCqPJtFWSgMsULEl4zXuhsteOTqBbEIvj4JZcqk3zYOoHczRTBnIG2VDEHOvi2MHlUTY1UfFLGw8ppNr0bJW7JGwrhlPcypbRSw9PKO0G28kiNgulczy0kLVrVrH8rRNHSY9LA3KJV1yY8NNdSLehi3JKvH6ODynXk/zjYfwBbaGlAufj4twZfYSMY3SzPR5PspqoUjjfhHDHfgpUpEFwYK8vYsWBbQ1YuPbq1ntwlXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39840400004)(346002)(136003)(376002)(83380400001)(86362001)(1076003)(186003)(2616005)(38350700002)(44832011)(38100700002)(5660300002)(36756003)(66946007)(4326008)(8676002)(66476007)(66556008)(8936002)(2906002)(6666004)(478600001)(41300700001)(6486002)(6512007)(6506007)(52116002)(26005)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0mKBD0bF3SVP+K9uYuGn3yPDs0nFKDp5RuSo9P6l/kfzmwXZ2R6qbCmHDD74?=
 =?us-ascii?Q?lbXgieQoC63h4CeSZFVoXm4zNcRhE6SNCXxmrtSU0X07y5n5IGsYTol8bSSO?=
 =?us-ascii?Q?rwlHwSCuykdlGughanzbAPHUINlCgC8yw+2ztRXiSRSDDKqE92u82FfZvi/V?=
 =?us-ascii?Q?hGe8AFgF8jpmw6tzJi45dqFxNE/O/XENxoU0cChD9YgFqU8vnx4jnd27ECa4?=
 =?us-ascii?Q?NBvkfKCyOib2u4ejCjhk6zc0F0oOc7bFOb7cHmccJgF06wye+3wy99dSF7Ys?=
 =?us-ascii?Q?/UC2+CKi+oHSV1s69Og0vXBK9DC4w4BcqKpf/0hPAffUpdG8KZXaa1g0+vGS?=
 =?us-ascii?Q?lbN54ec++S97RYQP7ys9KzwSr2MSUE6aUJDLCjYkYhX8x7Wn71Cd3kdxER2y?=
 =?us-ascii?Q?82ehRYlwSjahWEpR0LH0sVzD/BqkqzM/Fbr1t/6rW3dAxxONE7SzqWcnBM9l?=
 =?us-ascii?Q?5EZB53Fr2Py5Q8PcjBm04AE/4DikC2sfvyDn5wynjrqcUuUzLIYVdrTYPSSa?=
 =?us-ascii?Q?lAOfgiCL7xm5k29+z6vKxXZjDxTC2+ltT3PKz9u38fXouqFaX0KB8jMF7k4k?=
 =?us-ascii?Q?kyI9rEI7LY8CYRtWyD3HZRf2LK2QGnA7GwpZjZ45s1JFnTgrWeU3oVkeVse/?=
 =?us-ascii?Q?2ZZ6oaKarm9aJlt1Z8jb6ITfzTg3T3VooEZmv5KgmKCTnUcghIGenobifh4I?=
 =?us-ascii?Q?+bmvGLllVYIc96sxhMlUMHYde8k1aDr0zjGMBaowlaJjJrNqAEeJKNHHKbVY?=
 =?us-ascii?Q?dAD6EtwlUbyxs3qUP9cXSRDVGakiqU+Xgk5sauEsZtGHncTeijT5hqPGi+3R?=
 =?us-ascii?Q?lbtwmtwWAzqWhtmWfZR+tmcLwIsWDlH0JFyGMzNwYPYQ/7KRqTuXWh/2tXBi?=
 =?us-ascii?Q?zQEWqFOEry4eMqU86InHpw074fbWv9rgdr6UyY6avTVivK92Lk/ggNTlD5ey?=
 =?us-ascii?Q?AyQpwxWD9+iy4VEwdyYTu2cM84A4sNjjF+Qc+iqfsfb7nTr9raLAp8sCZbSy?=
 =?us-ascii?Q?ZggBI8nLcdPPY490dmjxmkNAVcpzy7H2qcwWIMSdLaVyNqHuQUYsUZk4bNhl?=
 =?us-ascii?Q?Avro7KabXak4HyzwJ7XkFdvAKqx9FEsn+QrRXKTxMzMfR4989faY7nZSjfFg?=
 =?us-ascii?Q?STuMrTTcfXIitm4DmuvqFs+H3tjLCmWtm6QdXLhtRL+BZnnzqr+QjEtFpRAy?=
 =?us-ascii?Q?Babyj7gYH2TqlpNqJyZFFV322iMmKaUicLeHvXKB5n3hPUZU1TOjBOBN96aF?=
 =?us-ascii?Q?rUQtjDDxTwlP/2L5PAEcLvqNNnCLZD963pn5oYmyHBhjaXEgO6n5uKfYhINz?=
 =?us-ascii?Q?3V7CfKFjUPPuBQF3/BNUQ1a0N1hso7nxcugoEVtzWtT4EQ4nMuTQVJfZzIvo?=
 =?us-ascii?Q?lIjn5TXq4eWHncPyg6nKixZHIBfpv+Jtuo4AoBKUUZxhq05310k/6Yf5FstL?=
 =?us-ascii?Q?N93SvEWTyPL1U1IhIvHpewb8BbDHAQkh0K2xTxHjdkAFhzNhWTaUei08/vdZ?=
 =?us-ascii?Q?HWuf89BVy1MlDTrP7ZErpK+dHrTSZP+DGlJ+huKUKRn5+9czzMeVoKXGo6vn?=
 =?us-ascii?Q?AOO+ElewsB7s0NwSnwFpZlSc2WA8yPfiDNhbIM/1iHFMJcq7eTyXzMxeyxBF?=
 =?us-ascii?Q?97ypQIrm96ZySfSG3aN67yU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390ab1da-e2a7-433f-346c-08da89a7095d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:12:53.7243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPFwh/B9gZvY/l43q27iF9yWlhj2Tld7VFbPmjLDwl6D49FOcjuVrYZUnb/zir5nzUJ/ar0NjqfXBLAHNynHZPpIMWBJ92EHWqmcSnbX3A0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3023
Received-SPF: pass client-ip=40.107.8.130;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

data_end field in BDRVParallelsState is set to the biggest offset present
in BAT. If this offset is outside of the image, any further write
will create the cluster at this offset and/or the image will be truncated
to this offset on close. This is definitely not correct.
Raise an error in parallels_open() if data_end points outside the image
and it is not a check (let the check to repaire the image).
Set data_end to the end of the cluster with the last correct offset.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index a229c06f25..93bc2750ef 100644
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
@@ -742,6 +743,12 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    file_size = bdrv_getlength(bs->file->bs);
+    if (file_size < 0) {
+        return -EINVAL;
+    }
+    file_size >>= BDRV_SECTOR_BITS;
+
     ret = bdrv_pread(bs->file, 0, sizeof(ph), &ph, 0);
     if (ret < 0) {
         goto fail;
@@ -806,6 +813,16 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
 
     for (i = 0; i < s->bat_size; i++) {
         int64_t off = bat2sect(s, i);
+        if (off >= file_size) {
+            if (flags & BDRV_O_CHECK) {
+                continue;
+            }
+            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
+                       "is larger than file size (%" PRIi64 ")",
+                       off, i, file_size);
+            ret = -EINVAL;
+            goto fail;
+        }
         if (off >= s->data_end) {
             s->data_end = off + s->tracks;
         }
-- 
2.34.1


