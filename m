Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9815EEFE4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:02:36 +0200 (CEST)
Received: from localhost ([::1]:48646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odoV9-00067E-L3
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoMJ-0005LW-O1
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:53:31 -0400
Received: from mail-eopbgr60106.outbound.protection.outlook.com
 ([40.107.6.106]:26178 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoMG-0000p0-NB
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:53:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+NjBYFaVxEdVyp//ZoOFvDyG7eeWkCIm8W8LxFeyw9polHzD+PgnPxPOVPpo1bCykPRTGk5lGCOPoZrFW/iOvmM0Kmi0xLTwChrnG99iTGSFGwEgFGYd5tw41S+qavwXoghdJxSsEBKRyAeu8a6EyRCX2nLa8X7/AulzfrjEs3kLksdKuPXsgP4dqktPzCCv0k6TkmTkO+0N70jDfLaAS5OK/W1XySRJEp26e4QF5Z5Mo1FJfM09wKPYrG6fGaKc+LPJphMX2oOeikcbT3v4FhQ9tAb1nWSm780VonoqEm6Og9zzCqwKzCdeHsySeOpEh2UeMgxVSbWP6uragBw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ib2e5xzdE0WiFHNs69iekKSNbMFGK80IhRwHxNZSI9Y=;
 b=bZ2UuiX2Q0YH5L+3Vk7XZGyoSOuOsuhLJYKgTyBA7FTFCTy7jZwe5K8Gh7Fpn4bt8kq5PlsD8ZI2xPWDF8ces0MYz1IEE01WWh8/hnY75vDsD32YnkBlA1qPaAmpm7+7+P1eDFX9oWfbiDwav4yJFa/T8LpsJmWekdMzqw0rTPQDuIUVfWL3rWi5XeNvXMun5dUuIN+g6fQC6WxeQZiqDPG/P0r6Qev0AqExe+v0tJcQU1hI06I2EOmfQAhsWvMcp00y4RZmH9IYReGsVXIGfi14bJK1NQDwvlIIF4mqEqIypVeOi2DLhW6IS7yom9ExI6N2btfFmVM1UYdrurSyfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ib2e5xzdE0WiFHNs69iekKSNbMFGK80IhRwHxNZSI9Y=;
 b=hpd5EbwmzvkkHHhoUZutAj5svVNh37BhKA/Hgt5PgicvHnNTO0SOKEGJQMlp2b6fBkbLxraf3Gj0DWYL1oTogDcQwuJb9sV0fniEPqb7uu2UF3H7d3mFyAvpHPfBbABvAkQdNaCmWnh3LoBluCZQa78LtZR+AMRTmsXwCFxmi08kfp/RTMFgSdgwuKSXYfnHEH+SUWBD0VRXTi4VOcJeBRgur/VWO6Xgu90ocMU5k/z8vM1VJb56cB5u/dZAzc2/Cqt/5uy6z82oitdTw0aKVAvVV+M87clje5kUAUzKnR8JSHofacASD9zv88oRLXYIW81aQ79iYHCVo7Zx+bB8EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9509.eurprd08.prod.outlook.com (2603:10a6:10:44f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 07:52:46 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 07:52:46 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH 1/7] qga: Add initial FreeBSD support
Date: Thu, 29 Sep 2022 09:52:33 +0200
Message-Id: <20220929075239.1675374-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
References: <20220929075239.1675374-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0039.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c40b43-6b40-4cfb-3646-08daa1ef9938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ETccrTm5YNs64j22QkMOR7UIsNAOjqWWT6+p73eg8xXQMx3n/lmEmH+gSUVSXR2StmyAQawlZ7KPEqRD8uY4pCwjRQBxdVVa8q2Ewh5igl1c+ggMUV6+ccOIbpmsTuo2dekV8IhnB+MJ0YJaMATmrEVSUCYJ6f0OC53SZw12Aou6QnjYC9U554zpDL2J6+wDokqh+Lic9eXUrb2C4XN1OTrSRzUqg3Zrps9ViyboRhYiAd//NACSe+sKo+QvyYb2mEJcQbgQvWoQ3F8q3pOQQ751iggJOhmKtJeSRvP4hkt/01K+haDUT3pgED7U+0Gbt61aCpSPdFvLMi8Q9rkyALkWBuUJNgtoWU4bXbiy6HhkH3+9FOU0BpjEnYOIEgMhNoQeGRBkpPR/scz5wj6ZMPqZXcbLTYh05AacIayonuUsSk1YdXtCgVK39tuMfeaogzh6VV6/WFqt0V0RztdiNaGkF+piMj0j3AV3+0BKA8florqz+Sbcf1I03ojc+/Se52B50wRjlrWUryITFns4L12EhODi9XFLzPbz4pCO0L8lM6tTjt8tXPfbFuvExJOTCMoH9vkqeqUm862vquq02/P679nq3Mzd6dNo8ME2JaBQw/9mJJurFR6G4a5O8iALWv6RsL096Sgybt6XX1q1RATZIgzVnGoI1rjXs+x7ZkxsOiA2XlpefN9rQxOuKXs+ZjJyJZ7fJBrI34Hl5tMNqs/JRQD/VN/QZJ7zTrwuMTnSVpLo+9pK+PV7fGm1no9DL97Jbog4e44AysDCzYJalw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39850400004)(376002)(396003)(346002)(451199015)(2616005)(38100700002)(38350700002)(86362001)(6486002)(478600001)(8936002)(83380400001)(5660300002)(6506007)(26005)(6512007)(316002)(6666004)(2906002)(6916009)(41300700001)(8676002)(36756003)(52116002)(44832011)(186003)(66476007)(66556008)(66946007)(4326008)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7r0PVYtpcXW5d223F6ORUEQn9RChbr7LMOpTK1VlVTq/u0+s8rKGYvfc/qNA?=
 =?us-ascii?Q?BU/vNEOZBwrgH4w08vkbfVOQQgZyKrEIZqeaKnAhxo41SQzy3HhsiR/wUCej?=
 =?us-ascii?Q?Z2PwP5K65+/O1laJAi/6yC+fpBFer0skDz2LVzdKUjdbPsL1UViMSHWEDHTW?=
 =?us-ascii?Q?2ty6fjrGg9M1DgsOe0teCGssvRCVl1qbbn3kOgl7AowNfF8kTtKEE15JZI4B?=
 =?us-ascii?Q?SZSsTUo5LRFlkV8IovFcuDLPQ1eEOkss523jVo/rckYQu0zOdnNmoJkcfYT4?=
 =?us-ascii?Q?JCuiFmsVjR5DSVHZRxtysSrwlazScHSV7RZIRGWcKtC8FQwgawQwMPjD+4j6?=
 =?us-ascii?Q?xEiXwSmZD+LNdy4MAv3jd9i4yF8JhT0f58aEdRq9U1VCp2XaEWTmRXQZ0lJe?=
 =?us-ascii?Q?NRCzuvkQpblFkdHBgQd+615nzHO1/UIVewz5K5AovOdj1sqjGPMw7I1773Tg?=
 =?us-ascii?Q?PJway5IriEQdrxLIKNob8aGoA7qovITiVfx50GCIq3ZEYtExhnjZcAMq+Pml?=
 =?us-ascii?Q?2H++4xVA+ynmDinuyH7iPEQWp5J3Z/eStjrpn8qVaJWyuN7JtwL5F5LBmO7z?=
 =?us-ascii?Q?XPGFR+PS6bH0fZwuOMs6YiSOmZz6m+ckqojRuVz5TxehNb6hvWchFBbPnluf?=
 =?us-ascii?Q?GrO+woelxNKim4V0rERxD9GKxrBR/CfG5a/SW3iRGoYfseR7rAg21ABjt40H?=
 =?us-ascii?Q?VM0VhxPBAwgCIEFZkr0jJINRX6L9xAvCig+eMFRNGmddEJH3dy95hDmS4KFG?=
 =?us-ascii?Q?I3fZ2kUzjlRd0hP3O63hUnTL5GyForXIxxJJ5Zt6/OEoyzU3M6I/Vh7Ipds9?=
 =?us-ascii?Q?lcX3WVtG9z1B6cdtLRIT3kIjLyVqZKjUwmB1c4JJ7lPjRdi4jtPgOmbiGliC?=
 =?us-ascii?Q?b6oYnDbAN+VcTu1Q5U4q2PNkq6Qi//RPDYQ7bqizMvyJ83nheA1rx+55uj2U?=
 =?us-ascii?Q?7iMscuzixJwKTU9t24/gEJPxgpoxWC0HttW97XPpHfSNtKZ7KW0dXX7lG+FB?=
 =?us-ascii?Q?RA52VXY38Ijeu3ttfmiceKrxX9aK08/rrkmrTzwQEJJtZelJgFpoAIdQUhWW?=
 =?us-ascii?Q?JebCuyNE6scquTLr/aW19ktmiW1lrxQT7sUWd0sqZlNDo5H9ahVZfv/EbCZq?=
 =?us-ascii?Q?Ks29nVxyoCUMzvYEPRJZQPzgQc1o8wokrVI4Jki1O5btR4qwtKnEr05T7IMH?=
 =?us-ascii?Q?acNC/l/93VsBb2phOHp35tz/EpB3bhnF75sgLTuR2IaRTcZpoVbplOraU8eR?=
 =?us-ascii?Q?oZ/NK4Fuent2CYNjN30ou1zD5rKxtcfeC7RIKGisa0WYiQcv3/bZJAEcp8iV?=
 =?us-ascii?Q?s4ntA001fP52rLaAKze1PuvOSZFILZ2gLCkp09OjaHUhDc2cBe9IXdOAJvgW?=
 =?us-ascii?Q?hSi+i5GP2k+eHcHhHW+KoJsAGMuQTPvMpdXyczVslKV/SVBCaa0Sk/lNaoqq?=
 =?us-ascii?Q?e+AS22kgDe0P2XmL4Ylaru9KSEDpFbEuWyqTCstRXbYEoWZF0XFCpV/2OJUL?=
 =?us-ascii?Q?SQc3WzTA2cHR0X5u29nWlvuUfk46GS46E1ofYjqjV3TIG04VCkXnpOuO0TNB?=
 =?us-ascii?Q?u2Q+VHwN5SQGdrQ6AKPOlmjK/NJQW65v6pEWdhdJEPCWvwBVfUjrPIUWX8uK?=
 =?us-ascii?Q?0/iaBzKyEY4IALj+8BdXaB8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c40b43-6b40-4cfb-3646-08daa1ef9938
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:52:46.7293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNhGCfTW7cZ+D9NirL+Xgh36T4O4SgcGlh1LzZSK24/KAHcuUFJeM2tO42yqQmQec5r1Yie1TPkpMQmxCQV/CaVbxxRe0MjZQdzmzH4iVv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9509
Received-SPF: pass client-ip=40.107.6.106;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
 qga/channel-posix.c  | 14 ++++++++++++++
 qga/commands-posix.c |  8 ++++++++
 qga/main.c           |  6 +++++-
 4 files changed, 28 insertions(+), 2 deletions(-)

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
index 6796a02cff..0f14246563 100644
--- a/qga/channel-posix.c
+++ b/qga/channel-posix.c
@@ -149,6 +149,20 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
             return false;
         }
 #endif
+#ifdef __FreeBSD__
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


