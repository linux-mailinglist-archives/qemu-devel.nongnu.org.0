Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BF360081B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:52:07 +0200 (CEST)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okKus-0004ib-QA
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKd9-00086W-V2
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:33:53 -0400
Received: from mail-vi1eur04on071a.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::71a]:42753
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKd5-00029p-VR
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:33:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0bJcEu7fenr1PFmvRixefOZdt713xyXMWbq1rGJ9g7B64WaCIRSqHfS+oUI11enyNs19SAtdtJ2wkepmeHAbUUq2vCbdl+Nzt8PwE+GFImG2U1K/JmU+AmB3sOitpeGFRakX2lN9rHwpK2VvlwO12sqysfz5VP5oj3lAUpnnnw9WtN1nobtF1weTudB1T08LjhCBM4A2tr0jVUYot8+Rh0Qu15S3VvGEXL6W7SsJfjRIIjpzkk8CwaQgnjWF/hQgx+OyH20jJ3KmlYJqiLLh71PtRZjgRReRZFOBfZkOGct53zQOrUHDX1KthtzYJULoMpKIHURBWmXHdOkbMbC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntgPPnTOKgxTnF+LfBEBgtehlf04PvP6KLfYZLNlrmc=;
 b=Lx+aoK8jvypmnQEiJUshjt++yUNCcmB04upzBfJQUFmPzX7tfL+XMN4JdYgo2HgtQ59aTFjMd2zEpzPJqHiblotl1AohKnvA93XYQcdpC4TnTe/pqpAHgfgZVKrclhQEo2JuUtIBG4EW1a91tOF2OkJPDSwAg7CH/RoLqTcQGrlASs3NJ9tEbHEBWT/8frGi5I5zVqkalT2F91ULGb3RdZLZ2Dxe7T24mKRmsxpLhhzfuukhO7Jmogg0Fk2qO2jcEyq1ANdBLr2QM0ZZ/m4jmZnEqRRdsiX9+WK4aQ01B2EWSL1IA8KcAuNeGCmDMbOvDF0KR6iAQCQfh/oKuP42RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntgPPnTOKgxTnF+LfBEBgtehlf04PvP6KLfYZLNlrmc=;
 b=rqu4JVrcl/Oxz1xLAa4MECrxLaoCKq3vLK+WwvuIb7nb7wwgLA5y2K9bm8Vi71+kydCZNuKyWF6sy2iOFHKce+kJ39Rt4sF01/KxOHpeijFQU1nW8ENZqmMEAxBQCb3KLSKmEhwaQIlrhpP9oQBlkUuUalV73peF2W0BWgJB+exkbF6ZXMAQJ2OX+Su/pHwEM8+FM+a3Pk1FAmLd4ayqqOOcthxPzU+rW21vHS3SjgvyfKjft6eHpYTdoWyi/Tl39Y5xWOD2/CWtr927ZmKJ0edMsrjjYy7PHTTPvx1VFtMqtpPwpKDJw6rqWOgtrGHCuwQeAUPHIgMAmUEQIff/Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB6710.eurprd08.prod.outlook.com (2603:10a6:20b:397::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 07:28:38 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Mon, 17 Oct 2022
 07:28:38 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v5 3/7] qga: Add UFS freeze/thaw support for FreeBSD
Date: Mon, 17 Oct 2022 09:28:21 +0200
Message-Id: <20221017072825.72867-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
References: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 39236878-a793-4c63-4737-08dab0113588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bolLiR5ECIH4wVyhxVAK3e4M7QG6jWdUXel+LA1MTfYt4/riZJ1P3pMdc19UppWKTLqc0J40jvc2dRat4bPveQZTQvLNFu9d/TlwbI7f8N/5GNHHkVkMOlQEVpyKzk/OJXjQB5e6L1TF6XZ9yifqPwX6ke1AxnRSFMC8kev3ZJsARLYKEsfFtUwjED7+E1g1x8/sqlgCu7kHdT7t8HOyJBdQ8Uu3uCqcvh6VU/xDPk3hdjIqI6KbtvBNJM5JJADqPJvk+qgDamKz4yMvNJObpvbdoFHWo2SWJE/2BQ5m4Z8rQok0ScD6fNYfGONRKHlrMgNoriA35gO287dSVkE56/gEcljS4rf2MJF5f1gtG3a7diznmBS010nBwf4XwbD7mN4TKUsS8ZPoqtBc4SrhrMUjh9yNG6cUJvFeFAjI0ka2yGzutjjhgfTyj2hauPasV4LofjpZxWr2lToR+Ibfq74ZYxTvzZEJ9hURZnw4wAXm1ArX8TxiIDf9+lCvyi60X1R4E0Pu4suQyvfmL/MhaMKZhAuUy6ccTHK5SBUD2mBCSAhO97v3LNvdpiUe1sTuX9HFf8lHaHMyDenJ4ZF/ps2VOc0h480NKEBJHjJ4xHGnPnSaTKr/Rodn5zNZejj/CUayVpPrCCk6Xzi6LeLJ+kIZOz3HAGSyxHWmjFPc8KDU3+BR1hsCPDCvUXbsxDSEVyOKobKbVre0EuA+5TUMbjHQQPiBZ/aK2AK79lFlpcfqClZitS/HAzrSvtCFJK+9GntrcjChhryJo3HQej1QWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(39850400004)(136003)(366004)(451199015)(316002)(2906002)(1076003)(186003)(83380400001)(86362001)(36756003)(38350700002)(38100700002)(6486002)(478600001)(6916009)(41300700001)(52116002)(44832011)(6506007)(8936002)(2616005)(5660300002)(26005)(30864003)(66476007)(6512007)(66946007)(4326008)(66556008)(8676002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3E2clFBQ2NMMnliZU5iWGxlTFZOWDdObHR0d2ZMcDFWZjdJcGdkUGRWeTZU?=
 =?utf-8?B?Nnk4NEloVld6SGc3Z3VFb1NLSWpFcnIxVzZodExlTUtvenFYN3FpWUFwSGFI?=
 =?utf-8?B?YlFyZmpnYi8rbUxiZFI4TEhsb0Y2TUpBbUZJU2ZLVmV2amszYzBQeEE5RG4x?=
 =?utf-8?B?ZHBvY0prNDJKU1NOVUdoOGpYZ1pXSmhJVUFjdkJJUnpFL0ZMc0lXeXh5bURM?=
 =?utf-8?B?Y2lmNG5IV0VmUVNpekJLcWFyYjVSc095OUdURmJNa0k4VGVSWXY2Qi96emZi?=
 =?utf-8?B?SG5ROTRrdjJTYzNjNzZwWVFHZWZielR4UTJ2NkFqQ0tuU1RmNkhWYUljemkz?=
 =?utf-8?B?WlRicWlLajN6SXBQdDR3aWhMcXR2bzVSaGxTTXdBaUR2cDRQNVkxMDB2UEpF?=
 =?utf-8?B?Rk13cWtpY1IwMmxtemFvS3RtVXpBYVA1WnV2b0Z3UHBHT0pJbHk2S3FXSUVs?=
 =?utf-8?B?YUpmdlpmT2o1TlhPZ09rMTBqK3dXMEk1QVRNWXZodFpLQVlESVB5ZDZ3N2JO?=
 =?utf-8?B?YkhNNUx0RnRnVnhvUm1Ea3dXNW84ajN3UFB3U0hSSG9jMnJhd3A1UmZpSjFo?=
 =?utf-8?B?bjhzZlowc3lQVlVOMmV3OWhJT3VKbjhOcDRUMzhWVWNHNkFJTjlnSHR1R0Nq?=
 =?utf-8?B?TnhhMmY3SkE0QUMvUUp4NjZyZkh0TGlkYXdLdHJVV0FyV0tDZFIybzJjWllF?=
 =?utf-8?B?Y1VhTTIzc1hpTFZtbjJUVXQ2Q0JMaXBsOFpRVlIzMDlPb3pBN2ZtZWcxdFlM?=
 =?utf-8?B?bFZXNW9qN1VtV0VpSkgzVWNHTFpncDVNeVF2VWhvdzMwQmU0RWplNjhEYjBn?=
 =?utf-8?B?MUUvL2Q3TEFWV0NwUjcvQndHeU5oMlVkamNGOVFmaTBRQ3Rad1cyZVhnU2VO?=
 =?utf-8?B?MXNFaUhkUE5Yd1B1eittTTZIMTNRNDdKb0FLK2pGU1F2V0dqdmVXWFhyZmxq?=
 =?utf-8?B?QTFvZTJMaXR6MklzdFk2bVM0ZlhOV042Z0hnZ1BCMElGMXd4Zm5wUVFpcGJY?=
 =?utf-8?B?SnNENE9rVjByYmFHYWdRVWlDUzhIN3lFRVl3TFB6RkZJK0ZJT1d6RnN0YnJt?=
 =?utf-8?B?ekZmSGhhWFRQc1lpWlFNS1pES0JxM1BBOSs2KzA2emRJVFY5UEtrNGNyMFh0?=
 =?utf-8?B?L01jVzR3WVNUdmJBMHNydEMrdU9EcDY3eFJ5YXhtenRLa0twMUkwUEQ0di93?=
 =?utf-8?B?dVJqcysvR25aR2EzNEZIZFFXQ0daUlU4bmxzckx2ank3TTFsU0l4V1U1NTQ3?=
 =?utf-8?B?K3AyQ2NGZmgxVC9QY0hyQkg4VnpJb1loQm53N2c5amtMRXNHSk44YzdmTTFP?=
 =?utf-8?B?ME14eFJMVi81SWVIemQ4WEdLSURPZ0g2RVVFRmlwcDRCSHc4OGp5WGE0OGlM?=
 =?utf-8?B?ZWtCWUIvMkY3dlBKWnZnTFZrWVhINzd5VDdqbFNvcnB6V2ZqcjVUTGYvNjl6?=
 =?utf-8?B?UVlsUkdoakdIVWxIcHFUeFdVbDdPRVgvNmFhYXZtL2xmY01aT3hIYVNwb1d2?=
 =?utf-8?B?OVpkWER0Yko3b00zN29EU3FnbnpNZUxrUHBEWWs2MTFYb3lqakorVHZ1UG9l?=
 =?utf-8?B?NUVYM1ZEaEZvRXI1SDgzRUtxZ0dTK2hCM0FKN2RUcDEvSXRWVE4zVmRSeUJl?=
 =?utf-8?B?Zk0yRGJSaGpWbWVkYSs3SVB5NUhzYlpHK1VOTFF4MlZ0WlVkbEFYSzdneXhy?=
 =?utf-8?B?cVVkZHNRTUFad1BrdVlIRU1CREE1WDYralI5WjREL0F6MDhIVEdhSVlwN2Q2?=
 =?utf-8?B?NnJUcFloNmxrTnJjMGNvclVoRkVVZURVZDZySllaMHZQdGN0Z29nOEFHT3Vz?=
 =?utf-8?B?eWhHZ0Yyb254ekdGdmg5cE9FQm8rOUVuVldHOVJvaFk5Q1RZUHl5VmdZR2pP?=
 =?utf-8?B?VFNwR1lVYXVMSFdFS0J0Zkp1NXJXQnhWbXFEejBiZUViVUJyRkVIcURodjMv?=
 =?utf-8?B?MG5Ea09namFDQWdYL1R2ZGUzekJDbVRKR1JzTmZQM3ZZZU5HOVYrTzhuTjdr?=
 =?utf-8?B?bXZuaW1WSDZUWjlyc1M0SmQyOW4vNnA5bmVIcUR4VFlQQ1NRV3N3N29qcCt6?=
 =?utf-8?B?VW9FUkVVTTh4Sit3SlFQckJyM1kyZ3dmdjNCMkxabUc5OHh4RlBGSGFuQVc0?=
 =?utf-8?B?UTJIMVR3QXhGZ1VDRWNveVk1UjVmQ3hXU3pkNFg5ZWQyU0NyKysvZ3pJb2lV?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39236878-a793-4c63-4737-08dab0113588
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:28:38.7121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7CHP29i89bXR3yFn/aU94WiYXOyDQVxpiUXpBm0xeS/AHD7z94XsUbhswMfZZjx+0bNeB3wVITpBv/a+OFH6kBRr6YEhKuHus+QSbLOApI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6710
Received-SPF: pass client-ip=2a01:111:f400:fe0e::71a;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UFS supports FS freezing through ioctl UFSSUSPEND on /dev/ufssuspend.
Frozen FS can be thawed by closing /dev/ufssuspend file descriptior.

Use getmntinfo to get a list of mounted FS.

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-bsd.c    | 169 +++++++++++++++++++++++
 qga/commands-common.h |  11 ++
 qga/commands-posix.c  | 308 ++++++++++++++++++++----------------------
 qga/main.c            |   7 +-
 qga/meson.build       |   3 +
 5 files changed, 334 insertions(+), 164 deletions(-)
 create mode 100644 qga/commands-bsd.c

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
new file mode 100644
index 0000000000..ca06692179
--- /dev/null
+++ b/qga/commands-bsd.c
@@ -0,0 +1,169 @@
+/*
+ * QEMU Guest Agent BSD-specific command implementations
+ *
+ * Copyright (c) Virtuozzo International GmbH.
+ *
+ * Authors:
+ *  Alexander Ivanov  <alexander.ivanov@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qga-qapi-commands.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/error.h"
+#include "qemu/queue.h"
+#include "commands-common.h"
+#include <sys/ioctl.h>
+#include <sys/param.h>
+#include <sys/ucred.h>
+#include <sys/mount.h>
+#include <paths.h>
+
+#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
+bool build_fs_mount_list(FsMountList *mounts, Error **errp)
+{
+    FsMount *mount;
+    struct statfs *mntbuf, *mntp;
+    struct stat statbuf;
+    int i, count, ret;
+
+    count = getmntinfo(&mntbuf, MNT_NOWAIT);
+    if (count == 0) {
+        error_setg_errno(errp, errno, "getmntinfo failed");
+        return false;
+    }
+
+    for (i = 0; i < count; i++) {
+        mntp = &mntbuf[i];
+        ret = stat(mntp->f_mntonname, &statbuf);
+        if (ret != 0) {
+            error_setg_errno(errp, errno, "stat failed on %s",
+                             mntp->f_mntonname);
+            return false;
+        }
+
+        mount = g_new0(FsMount, 1);
+
+        mount->dirname = g_strdup(mntp->f_mntonname);
+        mount->devtype = g_strdup(mntp->f_fstypename);
+        mount->devmajor = major(mount->dev);
+        mount->devminor = minor(mount->dev);
+        mount->fsid = mntp->f_fsid;
+        mount->dev = statbuf.st_dev;
+
+        QTAILQ_INSERT_TAIL(mounts, mount, next);
+    }
+    return true;
+}
+#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */
+
+#if defined(CONFIG_FSFREEZE)
+static int ufssuspend_fd = -1;
+static int ufssuspend_cnt;
+
+int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
+                                          strList *mountpoints,
+                                          FsMountList mounts,
+                                          Error **errp)
+{
+    int ret;
+    strList *list;
+    struct FsMount *mount;
+
+    if (ufssuspend_fd != -1) {
+        error_setg(errp, "filesystems have already frozen");
+        return -1;
+    }
+
+    ufssuspend_cnt = 0;
+    ufssuspend_fd = qemu_open(_PATH_UFSSUSPEND, O_RDWR, errp);
+    if (ufssuspend_fd == -1) {
+        return -1;
+    }
+
+    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
+        /*
+         * To issue fsfreeze in the reverse order of mounts, check if the
+         * mount is listed in the list here
+         */
+        if (has_mountpoints) {
+            for (list = mountpoints; list; list = list->next) {
+                if (g_str_equal(list->value, mount->dirname)) {
+                    break;
+                }
+            }
+            if (!list) {
+                continue;
+            }
+        }
+
+        /* Only UFS supports suspend */
+        if (!g_str_equal(mount->devtype, "ufs")) {
+            continue;
+        }
+
+        ret = ioctl(ufssuspend_fd, UFSSUSPEND, &mount->fsid);
+        if (ret == -1) {
+            /*
+             * ioctl returns EBUSY for all the FS except the first one
+             * that was suspended
+             */
+            if (errno == EBUSY) {
+                continue;
+            }
+            error_setg_errno(errp, errno, "failed to freeze %s",
+                             mount->dirname);
+            goto error;
+        }
+        ufssuspend_cnt++;
+    }
+    return ufssuspend_cnt;
+error:
+    close(ufssuspend_fd);
+    ufssuspend_fd = -1;
+    return -1;
+
+}
+
+/*
+ * We don't need to call UFSRESUME ioctl because all the frozen FS
+ * are thawed on /dev/ufssuspend closing.
+ */
+int qmp_guest_fsfreeze_do_thaw(Error **errp)
+{
+    int ret = ufssuspend_cnt;
+    ufssuspend_cnt = 0;
+    if (ufssuspend_fd != -1) {
+        close(ufssuspend_fd);
+        ufssuspend_fd = -1;
+    }
+    return ret;
+}
+
+GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+#endif /* CONFIG_FSFREEZE */
diff --git a/qga/commands-common.h b/qga/commands-common.h
index cb51b1c6e9..d0583c6ddb 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -23,11 +23,22 @@
 #endif
 #endif /* __linux__ */
 
+#ifdef __FreeBSD__
+#include <ufs/ffs/fs.h>
+#ifdef UFSSUSPEND
+#define CONFIG_FSFREEZE
+#endif
+#endif /* __FreeBSD__ */
+
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
 typedef struct FsMount {
     char *dirname;
     char *devtype;
     unsigned int devmajor, devminor;
+#if defined(__FreeBSD__)
+    dev_t dev;
+    fsid_t fsid;
+#endif
     QTAILQ_ENTRY(FsMount) next;
 } FsMount;
 
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index d24f2fafd8..6875ea8888 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -33,20 +33,12 @@
 
 #if defined(__linux__)
 #include <mntent.h>
-#include <linux/fs.h>
 #include <sys/statvfs.h>
 #include <linux/nvme_ioctl.h>
 
 #ifdef CONFIG_LIBUDEV
 #include <libudev.h>
 #endif
-
-#ifdef FIFREEZE
-#define CONFIG_FSFREEZE
-#endif
-#ifdef FITRIM
-#define CONFIG_FSTRIM
-#endif
 #endif
 
 #ifdef __FreeBSD__
@@ -623,9 +615,6 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)
     }
 }
 
-/* linux-specific implementations. avoid this if at all possible. */
-#if defined(__linux__)
-
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
 void free_fs_mount_list(FsMountList *mounts)
 {
@@ -644,6 +633,156 @@ void free_fs_mount_list(FsMountList *mounts)
 }
 #endif
 
+#if defined(CONFIG_FSFREEZE)
+typedef enum {
+    FSFREEZE_HOOK_THAW = 0,
+    FSFREEZE_HOOK_FREEZE,
+} FsfreezeHookArg;
+
+static const char *fsfreeze_hook_arg_string[] = {
+    "thaw",
+    "freeze",
+};
+
+static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)
+{
+    int status;
+    pid_t pid;
+    const char *hook;
+    const char *arg_str = fsfreeze_hook_arg_string[arg];
+    Error *local_err = NULL;
+
+    hook = ga_fsfreeze_hook(ga_state);
+    if (!hook) {
+        return;
+    }
+    if (access(hook, X_OK) != 0) {
+        error_setg_errno(errp, errno, "can't access fsfreeze hook '%s'", hook);
+        return;
+    }
+
+    slog("executing fsfreeze hook with arg '%s'", arg_str);
+    pid = fork();
+    if (pid == 0) {
+        setsid();
+        reopen_fd_to_null(0);
+        reopen_fd_to_null(1);
+        reopen_fd_to_null(2);
+
+        execl(hook, hook, arg_str, NULL);
+        _exit(EXIT_FAILURE);
+    } else if (pid < 0) {
+        error_setg_errno(errp, errno, "failed to create child process");
+        return;
+    }
+
+    ga_wait_child(pid, &status, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (!WIFEXITED(status)) {
+        error_setg(errp, "fsfreeze hook has terminated abnormally");
+        return;
+    }
+
+    status = WEXITSTATUS(status);
+    if (status) {
+        error_setg(errp, "fsfreeze hook has failed with status %d", status);
+        return;
+    }
+}
+
+/*
+ * Return status of freeze/thaw
+ */
+GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)
+{
+    if (ga_is_frozen(ga_state)) {
+        return GUEST_FSFREEZE_STATUS_FROZEN;
+    }
+
+    return GUEST_FSFREEZE_STATUS_THAWED;
+}
+
+int64_t qmp_guest_fsfreeze_freeze(Error **errp)
+{
+    return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
+}
+
+int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
+                                       strList *mountpoints,
+                                       Error **errp)
+{
+    int ret;
+    FsMountList mounts;
+    Error *local_err = NULL;
+
+    slog("guest-fsfreeze called");
+
+    execute_fsfreeze_hook(FSFREEZE_HOOK_FREEZE, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return -1;
+    }
+
+    QTAILQ_INIT(&mounts);
+    if (!build_fs_mount_list(&mounts, &local_err)) {
+        error_propagate(errp, local_err);
+        return -1;
+    }
+
+    /* cannot risk guest agent blocking itself on a write in this state */
+    ga_set_frozen(ga_state);
+
+    ret = qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, mountpoints,
+                                            mounts, errp);
+
+    free_fs_mount_list(&mounts);
+    /* We may not issue any FIFREEZE here.
+     * Just unset ga_state here and ready for the next call.
+     */
+    if (ret == 0) {
+        ga_unset_frozen(ga_state);
+    } else if (ret < 0) {
+        qmp_guest_fsfreeze_thaw(NULL);
+    }
+    return ret;
+}
+
+int64_t qmp_guest_fsfreeze_thaw(Error **errp)
+{
+    int ret;
+
+    ret = qmp_guest_fsfreeze_do_thaw(errp);
+    if (ret >= 0) {
+        ga_unset_frozen(ga_state);
+        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
+    } else {
+        ret = 0;
+    }
+
+    return ret;
+}
+
+static void guest_fsfreeze_cleanup(void)
+{
+    Error *err = NULL;
+
+    if (ga_is_frozen(ga_state) == GUEST_FSFREEZE_STATUS_FROZEN) {
+        qmp_guest_fsfreeze_thaw(&err);
+        if (err) {
+            slog("failed to clean up frozen filesystems: %s",
+                 error_get_pretty(err));
+            error_free(err);
+        }
+    }
+}
+#endif
+
+/* linux-specific implementations. avoid this if at all possible. */
+#if defined(__linux__)
 #if defined(CONFIG_FSFREEZE)
 
 static char *get_pci_driver(char const *syspath, int pathlen, Error **errp)
@@ -1467,153 +1606,6 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
     free_fs_mount_list(&mounts);
     return ret;
 }
-
-
-typedef enum {
-    FSFREEZE_HOOK_THAW = 0,
-    FSFREEZE_HOOK_FREEZE,
-} FsfreezeHookArg;
-
-static const char *fsfreeze_hook_arg_string[] = {
-    "thaw",
-    "freeze",
-};
-
-static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)
-{
-    int status;
-    pid_t pid;
-    const char *hook;
-    const char *arg_str = fsfreeze_hook_arg_string[arg];
-    Error *local_err = NULL;
-
-    hook = ga_fsfreeze_hook(ga_state);
-    if (!hook) {
-        return;
-    }
-    if (access(hook, X_OK) != 0) {
-        error_setg_errno(errp, errno, "can't access fsfreeze hook '%s'", hook);
-        return;
-    }
-
-    slog("executing fsfreeze hook with arg '%s'", arg_str);
-    pid = fork();
-    if (pid == 0) {
-        setsid();
-        reopen_fd_to_null(0);
-        reopen_fd_to_null(1);
-        reopen_fd_to_null(2);
-
-        execl(hook, hook, arg_str, NULL);
-        _exit(EXIT_FAILURE);
-    } else if (pid < 0) {
-        error_setg_errno(errp, errno, "failed to create child process");
-        return;
-    }
-
-    ga_wait_child(pid, &status, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    if (!WIFEXITED(status)) {
-        error_setg(errp, "fsfreeze hook has terminated abnormally");
-        return;
-    }
-
-    status = WEXITSTATUS(status);
-    if (status) {
-        error_setg(errp, "fsfreeze hook has failed with status %d", status);
-        return;
-    }
-}
-
-/*
- * Return status of freeze/thaw
- */
-GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)
-{
-    if (ga_is_frozen(ga_state)) {
-        return GUEST_FSFREEZE_STATUS_FROZEN;
-    }
-
-    return GUEST_FSFREEZE_STATUS_THAWED;
-}
-
-int64_t qmp_guest_fsfreeze_freeze(Error **errp)
-{
-    return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
-}
-
-int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
-                                       strList *mountpoints,
-                                       Error **errp)
-{
-    int ret;
-    FsMountList mounts;
-    Error *local_err = NULL;
-
-    slog("guest-fsfreeze called");
-
-    execute_fsfreeze_hook(FSFREEZE_HOOK_FREEZE, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return -1;
-    }
-
-    QTAILQ_INIT(&mounts);
-    if (!build_fs_mount_list(&mounts, &local_err)) {
-        error_propagate(errp, local_err);
-        return -1;
-    }
-
-    /* cannot risk guest agent blocking itself on a write in this state */
-    ga_set_frozen(ga_state);
-
-    ret = qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, mountpoints,
-                                            mounts, errp);
-
-    free_fs_mount_list(&mounts);
-    /* We may not issue any FIFREEZE here.
-     * Just unset ga_state here and ready for the next call.
-     */
-    if (ret == 0) {
-        ga_unset_frozen(ga_state);
-    } else if (ret < 0) {
-        qmp_guest_fsfreeze_thaw(NULL);
-    }
-    return ret;
-}
-
-int64_t qmp_guest_fsfreeze_thaw(Error **errp)
-{
-    int ret;
-
-    ret = qmp_guest_fsfreeze_do_thaw(errp);
-    if (ret >= 0) {
-        ga_unset_frozen(ga_state);
-        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
-    } else {
-        ret = 0;
-    }
-
-    return ret;
-}
-
-static void guest_fsfreeze_cleanup(void)
-{
-    Error *err = NULL;
-
-    if (ga_is_frozen(ga_state) == GUEST_FSFREEZE_STATUS_FROZEN) {
-        qmp_guest_fsfreeze_thaw(&err);
-        if (err) {
-            slog("failed to clean up frozen filesystems: %s",
-                 error_get_pretty(err));
-            error_free(err);
-        }
-    }
-}
 #endif /* CONFIG_FSFREEZE */
 
 #if defined(CONFIG_FSTRIM)
diff --git a/qga/main.c b/qga/main.c
index 0d27c97d38..b3580508fa 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -37,12 +37,7 @@
 #include "qga/service-win32.h"
 #include "qga/vss-win32.h"
 #endif
-#ifdef __linux__
-#include <linux/fs.h>
-#ifdef FIFREEZE
-#define CONFIG_FSFREEZE
-#endif
-#endif
+#include "commands-common.h"
 
 #ifndef _WIN32
 #ifdef __FreeBSD__
diff --git a/qga/meson.build b/qga/meson.build
index 932b4e7ca8..3cfb9166e5 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -75,6 +75,9 @@ qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
 qga_ss.add(when: 'CONFIG_LINUX', if_true: files(
   'commands-linux.c',
 ))
+qga_ss.add(when: 'CONFIG_BSD', if_true: files(
+  'commands-bsd.c',
+))
 qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
   'channel-win32.c',
   'commands-win32.c',
-- 
2.34.1


