Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29379600810
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:50:25 +0200 (CEST)
Received: from localhost ([::1]:54400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okKtD-0001kU-TU
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKYk-0004kU-9R
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:29:23 -0400
Received: from mail-db8eur05on2129.outbound.protection.outlook.com
 ([40.107.20.129]:65301 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKYh-0001Je-UE
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:29:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cn9GReXWtYfSv0UbqRp3BBuIDkZ+Qim7QVo5zS7cDlI1raLybciQ07ORZxeVTQ//rgkQCN5+SrGvkMgXIpuaMBTIzM45GpYNRsDVNADCUyvi5jJ4KIp/CLofn/Zwi2YdB3f5uAORW2hwJ3APmOmdqrdFnEO3yo0XsPzpCegJco4AzR+VTq1YRTcW4CMvZeIqMkfEsMlJDaFHb3geSqDJfM6xeZ+wwgSn1EWesh/+3/lbeJaU1I6tigwMMp3OVSXDkSMzUBzG6lXGGGU7+R/ChcuVPhu0L4lDlZvVtA8ImQDrR2g98ISNerE3guNK+o4SWkl1/SqIYO5gW9kx4Wihow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV9wrn2ZNFyUxTphZO2ecIz35cNR6OWMtpYLx3aL51c=;
 b=C3ZCZJhH32SA8taJe662Ni/pMf92rh0F1IfWR3W+PZdOnfYngKJKnKVV0L6UIDN2eDckUv/Kay1Z5O6t+HmJ6pk2rfcm7EJo+dUsjwfgjsVPoPMs38M2CXpw8jLdM/DKQLdzToUXNzt2W77FPr2tT1M1y5kMJZtLe5mUD5HMfdQBWyI6RpWdf8mWV2Vagz3Byjl2oGPOGh0lz8uSdS/ouUYViDMDAv3wA1Yxqydyerq1BBDjIB+h9E3mUFkv8WEINeL2eWp9h/0jRLkQdma0qcep2XUyoG0rvmDezQdu3yK6CNrrU6HgDFFQqv3HZCcLlZRd/Bh2uCTMEDVH3UnO2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bV9wrn2ZNFyUxTphZO2ecIz35cNR6OWMtpYLx3aL51c=;
 b=ocfEPaZ4banjtejk19WbObJjp57thUqBh6+DmZsfSUEHOjUZ+m8JvwBL4yy/0Ay/vFXiF4NK68mG2CTqIMjuqEmtqvt2RO+AW7XjJ/1IsdyIOiy2LYzVmSapSdMyA7aNB5uyjxseeMR1gHDyHyWeKO39gQjCSw6o+kgrAdjVHcw7gI3Q1DKmuTERIsBiNzEM/nmaZt51LuKm6PUvLSPqux+mN+f5VkRqndiA2dozCi+O6Gp8D/o082ZuQoI1OPhIFS9QpIDmTHK6tdMKarOQriuK9eWdN3ndu1pjP39CQmnlhP2UZrcX4W3x9y7m5cd3HgJLKaXJS7uiQ+q55Z2YNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS2PR08MB8286.eurprd08.prod.outlook.com (2603:10a6:20b:555::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 07:28:37 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Mon, 17 Oct 2022
 07:28:37 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v5 1/7] qga: Add initial FreeBSD support
Date: Mon, 17 Oct 2022 09:28:19 +0200
Message-Id: <20221017072825.72867-2-alexander.ivanov@virtuozzo.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS2PR08MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab66c2d-dbb5-43c3-f61e-08dab01134cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDfxdOI6U085ABahK262AR9SO6qcjU1j9jWdJkWeLVXWY5qGSP6fyIQuN4RdoTPMtLORw+89q1X56T7HqIxb16w96JZQpBIbDq2P6dAV4y0txwEJzgl01WiLI45OIcDMdifN2uZ1F3sKq1ayw6z/WRFJ9JLE0v/cI3y8pGaM9rN3rCYReHXjHVwFwX+EoMbuwTYAIS8X8FqZOIBucSXl3zlfFuECPy6x/N9uMRTMbbPBGVqJmU+n0lQ6nzqKhFK3TLXBWsAGSp3C+xg8m9wOo1PScwuQMogxzEAB4jwBY4oUYSloq7YaHRtWEc/ZiVqRE6kHouDz6DaicLJkr7ETvATjyCV4uGRLx6C0I7mUjg4FpG/yRxg3Ar0NsfvPndh+4J+o2QSy0eOooU+QDv0NcTA6KIhguNUWVhKxFgRxNGkD+zsIvDiLOVequ3+5nEdOxigvPtEHGon1qmm5o0s//X1f8SzWhyWsTvtRGq6hjD43rboOVk/vOsNxOipfOtbF0mzHeasMkE937JQME2TTigbjw1Foi2ifJEokDMhAcMNEVSdzS0s4kO5GsjlYTOe14OEHHaP1LwoseWb23eqyjLPUZa2NatvmWuyv8JL4kGohYVqsnQaqBC8IbQZ9gWu603bgwg54TatnMuEsEWKkluSd0l1smfI9JeocYpN3jzUuHbLTkH5M+cr1NKRG5PfdUL+JO8Yc8eKjrFqpNwLoR2CweQ2cWEiBeMsfR74bLp9ZzWT2GE1wWLvDpy6nCzfqssHFD0rZkCa9jppa1wUmUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39850400004)(396003)(366004)(451199015)(6916009)(66946007)(8676002)(66476007)(6666004)(66556008)(36756003)(6506007)(41300700001)(4326008)(5660300002)(316002)(26005)(6512007)(86362001)(8936002)(83380400001)(2906002)(2616005)(38100700002)(52116002)(186003)(1076003)(38350700002)(478600001)(6486002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um1oM1hiY29hbkhCaU0xRWpiQkljNEVia3dGNDVQanUrYWQvZlRmR1NXN3F1?=
 =?utf-8?B?YUVKUTkwNzdFbUVrQ0pvUmt6MFYzMzkzejh4bDlITHNGbXNmQnIwSGtyOHM1?=
 =?utf-8?B?N1kydjV3QnBMY3JieUtOYmUyalo3aUxqYkI0VDBrVTlYcS8vTDQ4RTJDUVdo?=
 =?utf-8?B?WXdOSkgvbmV6VXJFMlRQTC9BY0dIeW53dDB6Y0dzZXRMTkdSTW9jeWlPb2Z3?=
 =?utf-8?B?OHlIQmlCOHdVbE5RK3NCNDY0UGV2TnVrZ0pyRk5EcW03QkIrQ092MkR6S1hm?=
 =?utf-8?B?alFIVEhtVkNTaVpkWUNYc2ZpZ3ZpcGJOWkRBUUt5Rzg2UkpjWUVISjVuS1pk?=
 =?utf-8?B?c2FoSnN6WTZGS1RTUm5OQWt6dlVZZjMzMC9qMGNXRWRWM0ZXc2xTNTRUUDZk?=
 =?utf-8?B?eTJzMS8rVmJNK2I1a2JXQ1JNVzRnWTFZczkrU05MRWtBWFJlakd4SVNBWkhh?=
 =?utf-8?B?ZFVKNlhnMzZSb2d1NUZ4WjZzTXdvVHh2Q2d0WitoSGdTNFI2c3pKaDMzQUJU?=
 =?utf-8?B?QzZpd29NWittdjdJa1ZPU2JORnRPdG1RaDk1WFRCL1lQZ1ZDVy9BdHlzR0dN?=
 =?utf-8?B?dk1mVUN4MG43UEowa3hDUlhOYzB6Z1VLWGsxcy9YdWFETloyVWFhcE1HeHps?=
 =?utf-8?B?MkhUcDZWUks0YlNUcmtaZm5JZ216dy9xTGQyUXFjdW4rUGVZR1Q2M0pHcTEx?=
 =?utf-8?B?dThSampybmtGR1AxMG80eTUzYm54WGZkeFJkNnpsSFJsdVNSaDRudjJLZ0g4?=
 =?utf-8?B?YlZDVE9KcnhSazhrbHFkYmlQZ0VwYU9UbWM0eTIrNUFjcmNTZ3pVYis5V2xv?=
 =?utf-8?B?R0Q3aHpnZWkvK2lDWkFhK210R2hRTUtEWm9KdUlsUk5POXV2VmtMVHJsVjlX?=
 =?utf-8?B?dDRka0ZWci9aVUloWkNhT0ZuYitCNCswZjJoU2VQYlZDWUxBMnVnSGtjM0t0?=
 =?utf-8?B?YnlCSHFHQ29USVZxUW9iRGJUa2xsNDRTS2RQbFB3WkFudDNnVGljR2FqeTZj?=
 =?utf-8?B?dVlEZVVuRFFBSGtpdjI3VU1NRFZhOXBaQlRDcE1za01OT2tha2lCbW9aUWYy?=
 =?utf-8?B?WlN3b0V3aU5tQmtURS9lSHJHazJPWlFKU1A4bFRkaWFzbFV3Y2xGdHJPN1ZU?=
 =?utf-8?B?RUdueUk2emJiVG5GT2RlYXZlbmQ1eUpSV3lNWkhuVXRFZDlFUjZXbXk3L3A4?=
 =?utf-8?B?aWpFc2JzUDlkMnlnZDFqVnkyUDZ1ck4zbXFHUjdiY2NhcGRTSWYxQ2tXNDVu?=
 =?utf-8?B?bk5FWC9EaU8rSStZZ2tJS0J6UXl1WDkrZjZPOFFpTzRoVTV4YzArMWZwTmMx?=
 =?utf-8?B?REp4eTlxQ2l1Sm1KVWtTZXV5c1cwdDh0TTdOSEFNdmF3Q3lHcTNmRDdqcFhE?=
 =?utf-8?B?T1Jta3JlMHcrTUl6VnNyaUloT09rbHZnY2RTZnlTeUEzWnpyZTF2OWFOcVd1?=
 =?utf-8?B?MEZXRVBLN2dxbk1NR1FLaWwzUFBqbys2MEErOUtESnBFR2JPOVF4aENUcEEr?=
 =?utf-8?B?R3JkY1JOTk8rNi9zTXg0TmRaVG5zU2dSRTcwc2ZrSnNOMm1qYm8yeUhCOEtE?=
 =?utf-8?B?b2hDWnFuMGI1eUgrZFBTYnZiRzZJRjVaaG55QkFnZTRxQ0NwZmlpV2YybWdY?=
 =?utf-8?B?UzlaaERmM0NtY1FvbEd4clo2b05POWNFbGtXSDloa3gxM2hyRkFqeU11b29k?=
 =?utf-8?B?UTRiWVpLYk1iRmM5RDJmb05nZkhmVzg3T1hpa0tuNmxMdFJvZXJER0Y1eGVr?=
 =?utf-8?B?RytJUENKL0tmanBUS1VUd2tnUGtwK0RKakprSm44Sm1xbko0WlRpczBSWGF3?=
 =?utf-8?B?NG9OOVR4d2J2QzdzdXlYcmo5TkNibEFqN0dQQ05EelhrNUF1eStwR3l5WHRS?=
 =?utf-8?B?czBZU0ZUREFCMUxlSkxpdWFOY1NYWXhQZ0dTTWJWTGV2S281U0R5SThZcGFl?=
 =?utf-8?B?a2ozOUU1VUFCYWl5NFR5WHlDcTVJSmpvZ3V0d0JXaURhWVkxbHAxN0V2TURJ?=
 =?utf-8?B?ZDRPYUQ5WlhvN0pySStGZGtXVGN3UTVzdXR2UEJuWkk1a3ZpenZqRGROcGJv?=
 =?utf-8?B?RTlUamRSOFRvck1QbU4zUHdSU1Zpd2V0Sjd3Vk1pajZKVnhJcjN5S0pSRTNH?=
 =?utf-8?B?Zk5IcWhPSkoyYzBFUHVMdkVvdFhQL290TVZwQkhnZmczRlpVMFpCTTNIek1v?=
 =?utf-8?B?WEE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab66c2d-dbb5-43c3-f61e-08dab01134cb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:28:37.4310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsp9yOxFGdz8DU6hCBlbLreHDahoYZaQKxM2S+aGkqJvjPAV/D7OUI6uRMqFwtKTtfj86Ic8rMbA5liyeeSWbiG2zBzaPYuLu6PHGXemuRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8286
Received-SPF: pass client-ip=40.107.20.129;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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


