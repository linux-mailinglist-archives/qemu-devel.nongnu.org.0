Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E262E00C6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 20:12:16 +0100 (CET)
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krQbQ-00067f-1S
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 14:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krQWT-0003Jl-5R
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:07:09 -0500
Received: from mail-eopbgr20090.outbound.protection.outlook.com
 ([40.107.2.90]:62614 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krQWN-0006a3-U3
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:07:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0azA+fET1dWRCvd72G9Ewus50DfnLWoa7fzPLxkj/6EacqVpxmmB3qbjno2mz6vg+uuq+GqjDtWpIGrU5S4R+Gmp2h+CPYGH/2HiOSGEoAYak/Z9wlqh1r0V54RmzxzV3PNqI22yGK+2NZUIT7jf7HFDEPdSVB6tmjAF8duR3HtZ6brFYZc9oOpB2mu4+T9bVtiS04NX2FvczWlbOzS9wkv+WP3Cgn6gv0o9J/imZULiottg5Ua+tx2Iuzg23pQsfyKPQ4fO58Yu4XmR4rfv38LDDP1zEaPTzjiVJPQQRtNFfVsjKc69e0sqpZHwrNpfWJvrrTm0mM2rRUUTVZVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3Wd1bSfd6k57AWa1n4Rw3gw3s2Tga6bMsf3Jf0I4Bc=;
 b=UJcqaOy2uOmdTvbexzChBls/iflVCF0YW94d2uChZL/q9b1E69l5sw4XO5YBzhptZRYKNYFbUi0/7Z9YUItQ4jZyV7HO0oimPJp05eXi7P60lNmP3wO8t/imThVWY4qkRSrtqEwwPCJNZTBcOHubbHoVfJChn6VKkxWnciy8PXIvrlk68JbXbc6RcXjNVgFTwYJM3CorqANjmuh96BJReBQIaWL8SF7TORW9s2w2ZWyORZp40dsaYi60MObxht1cDeb2LAOeWjgAWHcJQWsi0HauR41sLNyrjcKIWwLuT+Up45K5anDbPBB5fnoziPvhkK9boxgNXPcGRnBopejThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3Wd1bSfd6k57AWa1n4Rw3gw3s2Tga6bMsf3Jf0I4Bc=;
 b=KW5/sSSIrTog/L4P7cHCsnTIOo7G33svbfnzDVGAJipn/JweE0DfAyxhnIRdkgcw26lyCPzC5Pb79+0qq/8iG9ED1RPXL07YM2er9hC5aasrqB7IJzRTSaU2x6gOgzErI9YZ5unroRjeoeQRxz2oZ+LeVFCTGoy6aHrb3RTBCO4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Mon, 21 Dec
 2020 19:06:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 19:06:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] net/tap: refactor and improve net_init_tap_one()
Date: Mon, 21 Dec 2020 22:06:08 +0300
Message-Id: <20201221190609.93768-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201221190609.93768-1-vsementsov@virtuozzo.com>
References: <20201221190609.93768-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR02CA0173.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM0PR02CA0173.eurprd02.prod.outlook.com (2603:10a6:20b:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend
 Transport; Mon, 21 Dec 2020 19:06:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f69171bc-3bfc-4379-143f-08d8a5e3898e
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652B4629953834BD5A4D56FC1C00@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PRX9MCBncdsbJZPGyrt0PrmoMFfc6sXh1d7NcHXpRPHAfXoijEZ6xXnxcy2W2q2GX5GdCw2982HSut7PFPHYmh7zgu+ULzrhh1lQ43D6JldGtrXb02ChdS8aSqIw1DX3p6iTpN5jwTbT5JPY2S8PXJb6Uh9RuiNlWQUEHz/uXo4NlmG/VvJDKvIiS+/l+3K40LBzH8uvcHyaWWEUT9deTBMfCKWJyupDhQGvucgvDTfm3YkVSfWn2rw/pZfMulQWAq1s0jjt/Swsxve1By4+Obfp5zTYDv5+9lkKJnSkpldlIMEQMlEGvxdhYzqBXEg8qIXUgKSdkwjirw+DLDaO3NngZ9kebC1H0r9PIrzmM5HtPiGPBgZUOAFP4CtLIzpXTe3zYcPvwL1GeR0r20UbWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(136003)(366004)(376002)(478600001)(186003)(16526019)(6506007)(6486002)(8936002)(8676002)(26005)(2616005)(956004)(1076003)(86362001)(5660300002)(4326008)(66476007)(66556008)(66946007)(107886003)(6512007)(52116002)(2906002)(6916009)(6666004)(83380400001)(36756003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hs4UQW1Am1MqfHIjr8QMzcoGUNbJw4jsBnTGjeeARWTj1Bjo3BeQYZ5M0a4x?=
 =?us-ascii?Q?SFR9h+C2NcPzyu2izIMWiJify7Abg5szaRQWGVVS9UioUrJpkRhkqyxuxtdb?=
 =?us-ascii?Q?z00wZpQm5agyqi5n/rG+HvrRBlAV8Ez56zKLmfW87NzN4ZHoAkQcoMy6Zyvw?=
 =?us-ascii?Q?m3gvnAaxBnGz92kWhEXulO9pdIKgnDYQdvlnilSPuzYMFomYKXtzyjumLooR?=
 =?us-ascii?Q?qwm2DGI83Ou41EG5VvdzPoTIfVyE9JdePNhVawEXC1IVZT4m7uN2EbtswsLC?=
 =?us-ascii?Q?XkC7w9Whi8x8XnRk9F1vl/S5gOWapo9HsedYOn/6lEKtcVIi2t38RwkK12BI?=
 =?us-ascii?Q?DmMezk9fYiye5pCRCrbj64kVwB3vSTJDJ1N5p3Ebu/iazSWIPdkv/gTaEVFO?=
 =?us-ascii?Q?7JcryQ4lyDvbOUjqt+7RINpmeWiDA7ueqIsZnc26M6RxO3rc7C6/VCNcEbr3?=
 =?us-ascii?Q?n7XeGZB1tDsnN2VyBPYCLYC2rwtZPQPcTTkR1zJGwspLlKod6BW0HabvU/bc?=
 =?us-ascii?Q?Oh1D6WvTY+kjc50gkc7+jLMLYT17apMWDB7JY6fZpbZkvlU50UJwQjcmGtn8?=
 =?us-ascii?Q?mdVx2ktFL8DDp7bcFr+9eXULzmOPmjzqEOz6hd7f8w0AoFYt9ZP7ICOsC52y?=
 =?us-ascii?Q?+QrHOaX5Ibsia6E04tMDQs96ZU3HeaTnUIpCcaeK+1eOBc5Z6aihE2dVm8ZW?=
 =?us-ascii?Q?hWY5lbdINb0Jg+6WK97I4+XLQos4/cfSoATOHoi/4SybOJMSExmyQ+VkFflm?=
 =?us-ascii?Q?T9zm5Lmd+cRekk3s0SAP3Xb5FdXoxCVOq1SAYkCCmmynbbdD5fm2QTFvRuzG?=
 =?us-ascii?Q?6YqiIwjCTgkSn5SPp/nuy9UaXr9qOpwXpoDKECJOkGUQDtfo4hvzufqoz6TW?=
 =?us-ascii?Q?Lfl0GM0iUi6XeQmlXVw5SqaveuKATALwXc417kg9OrplCta2UNsQNgs58Shx?=
 =?us-ascii?Q?T1CLiMfRvxf1zDrGdrQH39IJiaZWop+klbK9BaY7oM+X6fi3GiQ3Lj/Ff6f6?=
 =?us-ascii?Q?epCI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 19:06:35.5978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: f69171bc-3bfc-4379-143f-08d8a5e3898e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqDUGSNUXJCTjKy8Hz5B6oxA5oGX4a7wEwGaRBOmLEeOTkC3iCUV0ytWf1h1Q/UujD7g7ulyd5zwp8ad8gHiGIWYedsLldkwaMS5iAuzoZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.2.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: den@openvz.org, jasowang@redhat.com, vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First, 46d4d36d0bf2b24 changed the logic of net_init_tap_one() so
that failure of vhost initialization is ignored (still, warning
printed) when vhostforce is not set.

Then 894022e616016fe8 updated net_init_tap_one() to use
qemu_try_set_nonblock() instead of qemu_set_nonblock(), to not crash,
but it didn't consider the failure-ignoring logic and used wrong fd for
error message.

Let's refactor the function net_init_tap_one() splitting out vhost-net
initialization and fixing all the issues.

Error message change: we need to fix fd anyway. Also, don't want to
pass name to the new function only for error path, so, drop it. As a
pay, add more information on vhost fd itself.

Fixes: 894022e616016fe81745753f14adfbd680a1c7ee
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/net/vhost_net.h |   3 --
 net/tap.c               | 103 +++++++++++++++++++++-------------------
 2 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 172b0051d8..c00871cd1b 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -4,9 +4,6 @@
 #include "net/net.h"
 #include "hw/virtio/vhost-backend.h"
 
-#define VHOST_NET_INIT_FAILED \
-    "vhost-net requested but could not be initialized"
-
 struct vhost_net;
 typedef struct vhost_net VHostNetState;
 
diff --git a/net/tap.c b/net/tap.c
index 33d749c7b6..89ea04862b 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -652,15 +652,61 @@ static int net_tap_init(const NetdevTapOptions *tap, int *vnet_hdr,
 
 #define MAX_TAP_QUEUES 1024
 
+static int tap_init_vhost_net(TAPState *s, const NetdevTapOptions *tap,
+                              const char *vhostfdname, Error **errp)
+{
+    VhostNetOptions options;
+    int vhostfd;
+    int ret;
+
+    options.backend_type = VHOST_BACKEND_TYPE_KERNEL;
+    options.net_backend = &s->nc;
+    if (tap->has_poll_us) {
+        options.busyloop_timeout = tap->poll_us;
+    } else {
+        options.busyloop_timeout = 0;
+    }
+
+    if (vhostfdname) {
+        vhostfd = monitor_fd_param(monitor_cur(), vhostfdname, errp);
+        if (vhostfd < 0) {
+            return -1;
+        }
+
+        ret = qemu_try_set_nonblock(vhostfd);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "tap: Can't use vhost file descriptor %s(%d)",
+                             vhostfdname, vhostfd);
+            return -1;
+        }
+    } else {
+        vhostfd = open("/dev/vhost-net", O_RDWR);
+        if (vhostfd < 0) {
+            error_setg_errno(errp, errno, "tap: open vhost char device failed");
+            return -1;
+        }
+        qemu_set_nonblock(vhostfd);
+    }
+
+    options.opaque = (void *)(uintptr_t)vhostfd;
+
+    s->vhost_net = vhost_net_init(&options);
+    if (!s->vhost_net) {
+        error_setg(errp, "vhost-net requested but could not be initialized");
+        return -1;
+    }
+
+    return 0;
+}
+
 static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
                              const char *model, const char *name,
                              const char *ifname, const char *script,
                              const char *downscript, const char *vhostfdname,
                              int vnet_hdr, int fd, Error **errp)
 {
-    Error *err = NULL;
     TAPState *s = net_tap_fd_init(peer, model, name, fd, vnet_hdr);
-    int vhostfd;
     int ret;
 
     ret = tap_set_sndbuf(s->fd, tap, errp);
@@ -687,58 +733,15 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
 
     if (tap->has_vhost ? tap->vhost :
         vhostfdname || (tap->has_vhostforce && tap->vhostforce)) {
-        VhostNetOptions options;
-
-        options.backend_type = VHOST_BACKEND_TYPE_KERNEL;
-        options.net_backend = &s->nc;
-        if (tap->has_poll_us) {
-            options.busyloop_timeout = tap->poll_us;
-        } else {
-            options.busyloop_timeout = 0;
-        }
-
-        if (vhostfdname) {
-            int ret;
-
-            vhostfd = monitor_fd_param(monitor_cur(), vhostfdname, &err);
-            if (vhostfd == -1) {
-                if (tap->has_vhostforce && tap->vhostforce) {
-                    error_propagate(errp, err);
-                } else {
-                    warn_report_err(err);
-                }
-                return;
-            }
-            ret = qemu_try_set_nonblock(vhostfd);
-            if (ret < 0) {
-                error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
-                                 name, fd);
-                return;
-            }
-        } else {
-            vhostfd = open("/dev/vhost-net", O_RDWR);
-            if (vhostfd < 0) {
-                if (tap->has_vhostforce && tap->vhostforce) {
-                    error_setg_errno(errp, errno,
-                                     "tap: open vhost char device failed");
-                } else {
-                    warn_report("tap: open vhost char device failed: %s",
-                                strerror(errno));
-                }
-                return;
-            }
-            qemu_set_nonblock(vhostfd);
-        }
-        options.opaque = (void *)(uintptr_t)vhostfd;
+        Error *err = NULL;
 
-        s->vhost_net = vhost_net_init(&options);
-        if (!s->vhost_net) {
+        ret = tap_init_vhost_net(s, tap, vhostfdname, &err);
+        if (ret < 0) {
             if (tap->has_vhostforce && tap->vhostforce) {
-                error_setg(errp, VHOST_NET_INIT_FAILED);
+                error_propagate(errp, err);
             } else {
-                warn_report(VHOST_NET_INIT_FAILED);
+                warn_report_err(err);
             }
-            return;
         }
     } else if (vhostfdname) {
         error_setg(errp, "vhostfd(s)= is not valid without vhost");
-- 
2.28.0


