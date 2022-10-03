Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C0B5F2E8B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:56:35 +0200 (CEST)
Received: from localhost ([::1]:50892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIBd-0002MV-S9
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHvB-0006Oo-Fm
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:39:35 -0400
Received: from mail-eopbgr80119.outbound.protection.outlook.com
 ([40.107.8.119]:34208 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ofHv7-0002U6-UL
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:39:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ux8oBh1f6EBlyGTF8wBZZtbi6Fk9dHAM5pMVu+wiwr/lCcwq64eH3Fprj6P8CMhYk5RrSo4czl7jU8kob0nzkxWqnrISkKRnCjp54+wubMc6CJWScvl4Yu3vdy3DHewlN2t3bAYIAr9yNoM4pnHLlMbLyNpUoGmbkCcj/myeMtjwHf5CoClmk6ycA7Smtk2Q3xXnUMOSM8ZynlDi87xoJweI3X6n5wa+BOataKCqMijvgT/vEfolN1Lm02pMI0d2VTeSZVU+42wONfI66aG/HjT6whGJwb4Siwrao3Wd9fogrTKPul92EIhVDLBrcx7TOb9r7TaU5mjxgDX+g5MHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/82Gl6voQJFtnW6vuop4f0r45SnstBbJM5MVYGtscM=;
 b=aoLGrA4LvGofQQUvNplA34koRcWadNuNpCIJEewUG2d2InOM/AOKe6JC+OgNlKt91jqkJvs2wK4WW5LdTPQ4whC+AnZK8VbavIDXgFW37CxnTeOWLsiXFQQR6mbNubV43MwhLWNqn055kzspIw38fqDiifLeFX5T3ST6A5J0rC1tnuAQbCFHqq5h3En8UX+2OdTXjnojeoYYDGTTK3wc9/mIupOqq5PoJsmZAFQZx5oiEkksiW6ni41SvpmQHoc+5lU80MbMPLqeSgMxrG+E0gqgcAAMusy4PJHzCy6YdLfpZKx+39NmaK6GPRf4XThwVcvPGBtuMaepv0j5dAk0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/82Gl6voQJFtnW6vuop4f0r45SnstBbJM5MVYGtscM=;
 b=EU7fTeUopTQCipHEahLyDTgUm647tyTYwAr7OAPc7psPAB/DwHvUXNu3oDp3vidCrZJOE0gWUhJ5WQrWfiS/jlzHwpl+9qWGh07UiO/GPAQvWgNRSce3A/Wywfn7tS5AePRb1ZVbK2NnmfMvxfmxtzTeF9u9BRyS5ao6dKiSqHZntIyIUYNaMOfr2GivOpDjRoUzEH/ui+E6cgitA5dlwLnYNHWxSINaQwD2caVpBHUGwU/Mv/JMfsU16cyB4AnNw/htmgrok+m+mM6EbpJeSkwefdLkH8pXJBeLFF22nnAzsOIt8qqjFhn1pHln1I/KEx5wmmI4/gKcY6swnvBPAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB8203.eurprd08.prod.outlook.com (2603:10a6:10:39e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Mon, 3 Oct
 2022 09:39:21 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 09:39:21 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v3 1/7] qga: Add initial FreeBSD support
Date: Mon,  3 Oct 2022 11:39:05 +0200
Message-Id: <20221003093911.1844031-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
References: <20221003093911.1844031-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: bd3df395-eb79-4c2d-0ba7-08daa523262b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QowE5Djl3zDKrLCbribcnCjz5PODm8Izlg+6tXl+vPGiVGm8ojxG0o5RtzGQPGcCcR71C26wTpbbj85BL1SpI7CjwJvlPGb1u+4KyifHMMlJbc1wq6emPHF7bMyqFQ38z/STx70Mpu/ivat8o6LfpOsi8APXKTj5Ve5iy8svwh9981FXJ+6sJCVqpCgu7osIRdFqh5T1LFeEH/bzMbmbkmIT77TyEOtq3P7A1R10MsgBO63WAfqZcFzWboxSrIrdkWqiGa1wDZ1ZY1sxmN2Z2wb7pHqwR5aU8MXHuaBMfBuxtBB4XFVrm9AFqmAg7MI7lraR9V3CrbapJlh3sEzdSKFeDC1McKPD9BanvxcyNQyLwA3YmVGioeprWWF7G2WQ8WGumV0DJVTJCa5v0np4isuEEmLPOaAwzSSVTEwDxj9zrdkERQpQQyzbVNxzXDI+zRg59r0pMVZfwK3Oq7iQyJn9MJrvBnyeivKkyn6efVKvLPDlCEtAh4LG8JwPJcX+0s6zVJ3b5jbxVqU48hNIsPi5xKFk9zncsxtUeaL4KCQ0UWY3uZ9ZsPwtBTgJOdj11c89asK6guosP41XWRBwEVOv2At1lJREA2KFMJN/dgZ4SyXKoBOY6MOrZ2H2l+fVUx28HnKF2Jg0NWL0xyRDb2NFRx6pJuh56SLlYgUlLJGhWJYGG4RVmJOx9Sp3AdvSvuzr9bJaG0nFTMpieaFNGzdmMCbXTFydxRebPMEZGCsBTx8MGht+gmyD4ckxxkpH7jsyn9RmAj1EMa+WuqHndg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(39850400004)(376002)(396003)(451199015)(6666004)(316002)(66476007)(66556008)(26005)(4326008)(8676002)(6512007)(6506007)(52116002)(2616005)(6916009)(478600001)(6486002)(66946007)(36756003)(38350700002)(38100700002)(86362001)(186003)(83380400001)(1076003)(44832011)(41300700001)(8936002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7B4OJt2Ztl7t6CasEoVyGY7DpHtQANTUeUt+ydUxG6c1+Ee2RVJ+xe6N95OY?=
 =?us-ascii?Q?Uq2WqxSj5kLSLx4+zU06MzuquEDtNSHWRJ8oZ0eX9G97r0twOpaPkDHUyHWn?=
 =?us-ascii?Q?88LaIR2qaO1jfbFnZwC/Xoej2KKENLO4LeKmx7MC4CAzgnEacENgRH0atP8R?=
 =?us-ascii?Q?xqJdAmUa32lu0cEXQe7tlvEZiX1OXa12hInvtQ/FZUpGwc71RGJqLyPIjOEd?=
 =?us-ascii?Q?nZ7vAeOJvcSToSYjK7d+RvKj/mm9BUVMTKESY4hi15PwIHZT2K2F8TcviPMf?=
 =?us-ascii?Q?kuXtiXNyGmnRVV8SGXu9XXQMRLZXS/QH1ptulDRS2bd0GcA2+JonY82eO5JT?=
 =?us-ascii?Q?v0e07RgX/kLyGgczC/w64AsfQmJTuGPDn/YYFdQU+Jb7NYQayNDM8V03ESHB?=
 =?us-ascii?Q?WMB+E/2FIY7SF/5Z4tOjTWkxpeYLOmQXlPZLHPWMqGnEYPTIgiZpbiHHIDKA?=
 =?us-ascii?Q?hxp5KBFcCuI2ynbfTgkTmB2LiVcxwR2LvgeXMxQavyrmtCUZQFLs9tRxkTZQ?=
 =?us-ascii?Q?2x64iXESba0J3gU8bvtdwuzU0ncjA5fkbreA0bWUDWZTTiq4zEMG9iU5ZQ9t?=
 =?us-ascii?Q?wpOQiYWclfg18RHIaCHaG58EL1QSCcH8d8v/vzWy8G68HEcRPHs3lGDPIZwm?=
 =?us-ascii?Q?EhMQHAwGfVPh6O/bPpSq+tvO7lSQTimU1W+X/QABPo3SUSr6w7M+I4JKw1Rg?=
 =?us-ascii?Q?L3fZAdjmSq59cxlgs4q8s340IUNRtaYek8UXJGQpRvg+WCMEmIViRQtnq3fQ?=
 =?us-ascii?Q?ItzdW/IDq9zhULttBHecd+J+/L1bjusYd1ZW06y2o+zNI6WbUb+3kNd/FiqO?=
 =?us-ascii?Q?5u5I3y0gfwq/Mg9GwD8aN7iTlCa2fb4Vfy0ujvqtVlrhDcnInbokzzOD9wVX?=
 =?us-ascii?Q?JxASYdd/gB9dF2IZvx7oX/VkbRTiZXIU4SIFDoOk1IuPlZpZebORd3C20Khb?=
 =?us-ascii?Q?qJywfJmN4YMEqVy6O7JpM/KQ5FIW9zFnJq8wM6g5FyHXDGSf7Ol7R20+pa92?=
 =?us-ascii?Q?09XNa5iOZzUa57smxvAx5VgqYlqHIiQsKZx6Xr+ey9n8FtzvZkCgT3YPhlz1?=
 =?us-ascii?Q?m/WIKJ6IP1VHqks/Unwks1sZPPvAKfyTCN4StlFc4e2ybuOC3wpuN1DbSg+B?=
 =?us-ascii?Q?INRigF6fPm1u4ACT4xMs98BqeLgHUqUIoS6apRhRMVt0nyJwq98aA9PMzg1c?=
 =?us-ascii?Q?4eohThA8HBjz+xnWSme7PNglQCEQ8apTL6AqsDSCSC1W3Hjj6HNlUtVQ1hcN?=
 =?us-ascii?Q?gJ98qhXnsJoGcgP9Dddoa59euGQOG7tZ8taotnM1ckCtTE7TSd7rfOtRAbUh?=
 =?us-ascii?Q?W7bFu2rkxLA309m00tkSNIiySt0RkNjk+U0/6HxK1A71bmlyEQuQTLcjmAew?=
 =?us-ascii?Q?uJtWCoDm5j/wbhDWZdhwRmArmeiOGyOiYn2jAuKtBIgWPC8YeqyqO8kvHHBk?=
 =?us-ascii?Q?/m1JFXmODzNIEUafl9iLdrXKZDE8W90erdMA49RjVLWzaMljxGgkjAixSJ7o?=
 =?us-ascii?Q?CsVg1fBLoRJ87Ctg6BhGacT59JiR1PKvEbH9JRk0B04SuffRnEQ4GhDd3S7O?=
 =?us-ascii?Q?AgCeEMQRAoeJp/7+qScPiQspztacIuPDi/tIVJE9cTkdVxxbyri7S2h7OrDu?=
 =?us-ascii?Q?zQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3df395-eb79-4c2d-0ba7-08daa523262b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 09:39:21.3997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtDZMVaOvDuggAf1g3DLKQTjYPKz69MK/3iA8yXi4ux8kp6g8lrWKTv573XeCRSYyt3R8AZjaE9vYrY2ModqpUmaQEYA8OXTk5WnnTWEvCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8203
Received-SPF: pass client-ip=40.107.8.119;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

- Fix device path.
- Fix virtio-serial channel initialization.
- Make the code buildable in FreeBSD.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 meson.build          |  2 +-
 qga/channel-posix.c  | 19 +++++++++++++++++++
 qga/commands-posix.c |  8 ++++++++
 qga/main.c           |  6 +++++-
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 8dc661363f..5c11abc8aa 100644
--- a/meson.build
+++ b/meson.build
@@ -75,7 +75,7 @@ have_tools = get_option('tools') \
   .allowed()
 have_ga = get_option('guest_agent') \
   .disable_auto_if(not have_system and not have_tools) \
-  .require(targetos in ['sunos', 'linux', 'windows'],
+  .require(targetos in ['sunos', 'linux', 'windows', 'freebsd'],
            error_message: 'unsupported OS for QEMU guest agent') \
   .allowed()
 have_block = have_system or have_tools
diff --git a/qga/channel-posix.c b/qga/channel-posix.c
index 6796a02cff..568350ded4 100644
--- a/qga/channel-posix.c
+++ b/qga/channel-posix.c
@@ -149,6 +149,25 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
             return false;
         }
 #endif
+#ifdef __FreeBSD__
+        /*
+         * In the default state channel sends echo of every command to a
+         * client. The client programm doesn't expect this and raises an
+         * error. Suppress echo by resetting ECHO terminal flag.
+         */
+        struct termios tio;
+        if (tcgetattr(fd, &tio) < 0) {
+            error_setg_errno(errp, errno, "error getting channel termios attrs");
+            close(fd);
+            return false;
+        }
+        tio.c_lflag &= ~ECHO;
+        if (tcsetattr(fd, TCSAFLUSH, &tio) < 0) {
+            error_setg_errno(errp, errno, "error setting channel termios attrs");
+            close(fd);
+            return false;
+        }
+#endif /* __FreeBSD__ */
         ret = ga_channel_client_add(c, fd);
         if (ret) {
             error_setg(errp, "error adding channel to main loop");
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index eea819cff0..16d67e9f6d 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -51,6 +51,14 @@
 #endif
 #endif
 
+#ifdef __FreeBSD__
+/*
+ * The code under HAVE_GETIFADDRS condition can't be compiled in FreeBSD.
+ * Fix it in one of the following patches.
+ */
+#undef HAVE_GETIFADDRS
+#endif
+
 #ifdef HAVE_GETIFADDRS
 #include <arpa/inet.h>
 #include <sys/socket.h>
diff --git a/qga/main.c b/qga/main.c
index 5a9d8252e0..0d27c97d38 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -45,9 +45,13 @@
 #endif
 
 #ifndef _WIN32
+#ifdef __FreeBSD__
+#define QGA_VIRTIO_PATH_DEFAULT "/dev/vtcon/org.qemu.guest_agent.0"
+#else /* __FreeBSD__ */
 #define QGA_VIRTIO_PATH_DEFAULT "/dev/virtio-ports/org.qemu.guest_agent.0"
-#define QGA_STATE_RELATIVE_DIR  "run"
+#endif /* __FreeBSD__ */
 #define QGA_SERIAL_PATH_DEFAULT "/dev/ttyS0"
+#define QGA_STATE_RELATIVE_DIR  "run"
 #else
 #define QGA_VIRTIO_PATH_DEFAULT "\\\\.\\Global\\org.qemu.guest_agent.0"
 #define QGA_STATE_RELATIVE_DIR  "qemu-ga"
-- 
2.34.1


