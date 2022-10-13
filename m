Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27555FD7A5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 12:13:26 +0200 (CEST)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oivDR-0005P3-Lg
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 06:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRL-0001zk-Bz
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:23:44 -0400
Received: from mail-eopbgr140123.outbound.protection.outlook.com
 ([40.107.14.123]:28929 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oiuRI-0004g6-Oy
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:23:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbHKGp5kmXNjdnmi5M4/pSeWEKpgukQjnBp6I8eB5F1fs/CDp7bnIZc58kKJWrKsVUHFUBGMsb+/HZh7XD3xgmbF0hmbUKzcenNIO/a5zXe0uLx8YM2DOEWBNqc8lbAM/AXbY4wLfjaGffX21amJRgWyWHZjQqfYHYtpgn6dc5D3eFumcFpceVvBSn2SicZnYgkwFdvpe1CLgHp99WpDXAw117fFbjLCTh+wSIOuvDorszbgJ5+HzlB7DRoX5jfKf79QgqHbxQs+F9nmYEgk8LZ+9xdGlBKFNVx81uH9UhtBtmjX0rGPN3Q6tkc1iaF7NqCs+XKgV5x6/klUSIHl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV9wrn2ZNFyUxTphZO2ecIz35cNR6OWMtpYLx3aL51c=;
 b=oM1FPvy1uhRL0eetadC1jmXnD5y5eEDLJ8i/3nvPXtSR/ttHk9Muwoj8doYQ7zf8EBwyUDLWJ+WiCsDGCxhhlaE7dqErVvx9lRlJV0vOqo6lxp7u6AYRGsGnrs8MJMGj/BBttPomQfflbE42n5Q0Bs6uh5dKkWzHAHg+FLOgsZGYLNJ7SRORLiwBnNKj8fmVJmRZmMct7uWluqw/4dT3teHer++Nhnyvoni1XIwSLFYug6UzNEniwAZQusRW8ZAOd2BV0Yn6zyWiplgw8aKauk4IMsydvcBwxPfoF0wd8iNzu0FMnth2FW0USiFXZjF1U0YtFrakY8XCWS0oZVO5NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bV9wrn2ZNFyUxTphZO2ecIz35cNR6OWMtpYLx3aL51c=;
 b=0JvP/Ar/5YFj/QIj6gY8+6YQn2+uPl1d4IPi2sTrXtUl+pY2fOVS9dLRO+2fTelx5KJuJKatwU/YSD9la9dI7arvRFeCorYZOVuMwkTAIzjYqFZdfkZJo/NXMKBimpD+s14H9tgjzAOmbAyklbzGNR+hcwY2qx84NeSxpzRYPRx+00j3QV0TkCX7KNp3WJmb0KMDbdzSTeOE6qFksS0j6NWIUz+v0vRMIXnAlwVvxPVRtBcqQiTx37FBVVcgjlbUpClFeNI9P0zwr1FT9b4p4j8ELlRa5gtIo7ThSbvDiTeZ6/5HiY15vK129QRJs3/G2YYA45zvrxNJG/hoCnpjBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB6466.eurprd08.prod.outlook.com (2603:10a6:20b:363::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 09:23:35 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Thu, 13 Oct 2022
 09:23:35 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v4 1/7] qga: Add initial FreeBSD support
Date: Thu, 13 Oct 2022 11:23:20 +0200
Message-Id: <20221013092326.2194646-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013092326.2194646-1-alexander.ivanov@virtuozzo.com>
References: <20221013092326.2194646-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AM8PR08MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 13baa343-8ad9-4aa9-4584-08daacfc9a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A1SK7ClPiew7qosc0yt7sy2BiD4CHVhRdbXWSjaDsbPe0iUyUNLhISja51k97sMLLcV7bPqEuSRr4T9kfakUbI4bUF/GS79vw3orh8R8yxy/266VZYIb4RZHUxvsRRFf73dsFf6MEGgPAndzPSpK4y1HEGqIKZyha4UXEQJN/gszH9FsPqdWr/MUaRajCElqfgCWM9unWvy+eBS0lN9lNE+iNt5XB0Yubv+Rv5HqezbC8bWKdn1mSZJtMLRcZsfCnOxhzw+ChxkBKHZRyhDcoByOPD+oCCzfuW022lqRRGggcVsuzClwB8fKNW2euk6IikXNVrL4tcbh5m/SmeG9NF2pJ3tdLpoW7RMZtzSkT4SDLR2VpqPvsXokY8E8vHw4xCNrzmo5XhvgWtp69pCFyd0BMtBbWtGN+ZHtfsZ5+/sqy/QHDaxCx+Ur0OpyE+ZBbV75S02PyLO7Tr2k9BvTTO8Nbw3q79gtyTuDg7O+gNlCtBKR6bwSZvJc2NxyJJJLE+uWzY+jRh7Gd0At7rnc1gvRh8gzd1fNYW2PbOaWY7CDljZsuLIaL+e2Oi76AldRDO0dccmee/yIPFNeY4fpTqYUYL8de0k1E3MArshvc+8csz9WWd8Ds56hMctB1Wbxd8c9zZzoAOyKEVLzYvnQ0JaChM0EsHxSGB3QOI1Nz6k/o8ntbacw0hQqHjp0NUPL0CQdFT1fVpgryzBfecZZ1bgk70ofAEQxylTnO2eB4pi7bUEQOYkrUZF64Ntb/cqbAOHypf4hi/+AALL0YRsEDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(36756003)(2906002)(44832011)(4326008)(6512007)(5660300002)(41300700001)(8676002)(66556008)(316002)(86362001)(6916009)(66946007)(66476007)(8936002)(38100700002)(478600001)(6486002)(6666004)(38350700002)(83380400001)(26005)(6506007)(52116002)(2616005)(186003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFcwUWxmZXM2dFJjVEN2M2F2M1RKUGptQW5xSlU3azVnSkl1NnRyVXVnN1RY?=
 =?utf-8?B?em1TVVZVL082MElBSGF1Q1loUW1uQktBSDg1UFhxYzZoVmcvQ1BJTW1CUFgy?=
 =?utf-8?B?VGsxanhObDRtNTRuOUlpMk1QdU9qZ3dUYWRUdWlUSWlGbXdwczBkS2hvT3Bj?=
 =?utf-8?B?RFFiU25mWmRPMnEvaVJRQXdIQ2x1aDA0MXZxNUZFMGFnMFIrbllEajh4NWUw?=
 =?utf-8?B?dGhkRVpYdHlXd2dzTVBIUS9pOUI1dDE2a0UrcUZKTzNEb0hFSjFVcCtzTzVo?=
 =?utf-8?B?RlJ1eG04Szl5eCsybldqcHVuQjdhYXo5aW4wbENLRFBsSWFubHlOc1BXWDJG?=
 =?utf-8?B?Z1FnSkFPK2I1aDJVckhhYUhkTE5tZDVxU2pybFA1bjZ0ZlBNWC85cWV3bE1y?=
 =?utf-8?B?b0x0WDE1ZFlDblR0WFJzYlJ2Z0RPY2tZdEkvVmM1M3BkOFdLclhVZExHTjg2?=
 =?utf-8?B?L1lLcXZIQVlRQVZPQjF3bGRoNWdhRXd0K254SnZoV1JUd1RHRmx4QUo0SXVR?=
 =?utf-8?B?VkZ3WVBwQllVeXVZVFJSajk5cHI3U2NNN2Rreng4dVFKajdMdVFUU1I5eTJa?=
 =?utf-8?B?RnZoWmhRT2FuNVFWZ1Q5bWY2Y2sxMzBRd0dnY0pOMFVaLy80RWlpbVJYaTVn?=
 =?utf-8?B?MWMwbUZ6YmNOU2xjMEdZYXBvUkZOaitEbG5KVVRUcjRnRGxUS3l1TFJWVDlS?=
 =?utf-8?B?S240Mk1oN2N1bHZrNngwNENtTDVEQkoycVVwK3ROeXJnWklCcWpDSDdldTB3?=
 =?utf-8?B?Z2xaNmNMZzltbVdDQkM2cXdQRmRzWjFBZVlsYk0ycmU2VjJMTnZnMnNkU1Zj?=
 =?utf-8?B?UjRmZG5LYU1WSFA2MUpWS1E5bGlGdFE4cENHakI5NDYzZWZ1Sysxc0Zxdkxv?=
 =?utf-8?B?eERIR1JBbktKd05CRE41dlhOdkpQTFdqeDVYZjF4SEdjZ3BBVVVndkNONXVs?=
 =?utf-8?B?SnBJUVJqVCtmNkhnc3RPQzJCUWh4cGFMZ0FNc2VmRGNzQmkvMWppQlhRbTlD?=
 =?utf-8?B?UUdBZUlYM25RMzdvejlGWGxyUDdoZ2U5WnpGNXovVDA5YzU4dkNKZkg1ZlZu?=
 =?utf-8?B?UG5IaGJPdzhtRURlYUZ3TzhyampsSEJjQ1RyU2lkTVBYL3Z2VE5rWHk4V2Rz?=
 =?utf-8?B?VlNrbkhiTVhXalZYNzdCd01iMElZaXp1RlZKaVdtUUZ2ZDlMelZ2dDdjUCtK?=
 =?utf-8?B?aHFzYnd2b0E1cS9Jc0l5UUhrU3BEY2JNd1J4SXFFUnpESVlReDFnbEhtcEJo?=
 =?utf-8?B?SGpibEFYNUJOWHJYK2lGb2RoSzJVRkZVaW5iYkhRTHVRNEdVSEdpVUtycTBO?=
 =?utf-8?B?Vmx5Qk1nSWJodWQ1WFFhZXd0dEhLR3dLNVcyWHZYVTY5a3VJa2VDaEp2SlJs?=
 =?utf-8?B?bDZtVTZvUXQydEdyUU1mMHFJV1lPN3JJVjhOUUJkN1lBeTZHa21wSUhXc2tu?=
 =?utf-8?B?YXBYZ0h5S2N6bmlPcytXbDRRV1JobGxESEQ5N3pXWXpLNVdEZ3l4UzZqMjFV?=
 =?utf-8?B?RkZENkJ1bFdUZ2E1bGtaOUVqREJtb0tzSysrWmVkQVVMekVweDFBQW9iSnZU?=
 =?utf-8?B?RmZUN0VYZ3dyYlh2Q25BQ2RJTjBHL2s0UFZDcXIxTklwK2JuUHV4R1lWQVdH?=
 =?utf-8?B?Yk5TWE9uMDMyOEMrdXhTNDBna3Q5NWxLL2Z6TWlkVkVoYlM2UU9Jd0FWTzhh?=
 =?utf-8?B?UHp2dnpLRnJESGVZUk9qRjEzWWJlOWY4dWlxSGlJUHE4YWphRk5hbnZ1OWV4?=
 =?utf-8?B?aHNnVzZtTHVQYzBubHVIcjRhaUhlbGl2MkNwUDRJZzhjM0MwM3BHcjNOR3dm?=
 =?utf-8?B?ZDlvVlhCZjJqeVR0SkRmbnhhdVZVU1B3NmIxdFEwZHRzUkRIRFMzK0RxNmh3?=
 =?utf-8?B?WG5Ub3c1cGdzNktnb1gvQngrRXh0TGV0d1JpSm1xS0FmV3hvaXdxdnBCUE9x?=
 =?utf-8?B?WXk1eGZSelpxMUdmRHZZQVRNVXFlUVJvZ3pjdlQvd1F3VXFmUGxEZGlwS3Nw?=
 =?utf-8?B?Q0tkODE5VkhVOXNaTERCalAvYjdkMjhMZ05TM0tTZmFtRkkyV3c5UW1xbkFk?=
 =?utf-8?B?dnhzK0JkTDBKVjhrZmFud0Jzbkg0clZ3WC9pbjYyR1o2RVM0WmlOWHFabkFz?=
 =?utf-8?B?dVhIb1dEa29ic1FlVU9BVVlpNzZhYmxJK2dKeHRXUjlrdC9mWE82eG1Qdm1w?=
 =?utf-8?Q?Ky4YHxDVr8xPV0eKXJMBIBc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13baa343-8ad9-4aa9-4584-08daacfc9a65
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 09:23:35.1861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRA1xlHAlD9/B0NRcPUfdQ+W7DmRaUgjBki/x2q+u/8n74do2HkDfratMte7gPcIhiLpIr8eI4H0ZZ20HLVppaJySxOHG7eGnSURpmpZkjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6466
Received-SPF: pass client-ip=40.107.14.123;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Acked-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 meson.build          |  2 +-
 qga/channel-posix.c  | 19 +++++++++++++++++++
 qga/commands-posix.c |  8 ++++++++
 qga/main.c           |  6 +++++-
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index b686dfef75..71fe72ea06 100644
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


