Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2405EF00E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:11:13 +0200 (CEST)
Received: from localhost ([::1]:58614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ododR-0000NS-Py
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoLr-0004zq-PE
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:53:03 -0400
Received: from mail-eopbgr50137.outbound.protection.outlook.com
 ([40.107.5.137]:58243 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1odoLp-0000hg-QO
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:52:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOEtPf5MIj2UTDN62rYpbI9OZNJO8OQlvp7zi+HDHF7kQwLIqq3p7h6cUKAzGCIO3GmhFADxA3O71IdW9rrgVu0lIxvUfiX0dNneWIxnMrJC9ujeegbLJEBaQ4aaeYdQIM9X+qxbP7CzrU+briS/MN6vGvyuqkVFRD9/QvFgTfX0s09gkn8q50RW8k+aX6Sxj6gjN79yR8RzA5pRQPMcZStpVDJWtiNUm6R7nJxQYXgqqNbug/onv7no45nSOEMBEm3xJJ9yVUWdyYkgOUjbRhIweZKPHVxB3aWl7fxngjXbE6DXZLuR4gypBdUpQbxaI/uPf+8ldZBJT9XHWPqYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6IYw1Yuo9xEANhuQwTiGpnfATLTImxbVXiIyCqZeas=;
 b=em9QmaRpRAwSTyaKvQeN++q01jiuM9cAjLuk7Fn23GvpjROXoClx6psBaqTxSt/xmsscSG2DiDdbMNJ+7YHx9P2ar59fAQDuQfNp+fjTYThmvZRUxSII4STwcCIorKeSeEV7Sh46A1IiRKs8NxYri6g6V0fsLR8jtGHjXT8Mjpn6CK9GcOf97s3slXdPuAws06V6hCrDZ+cXWeyWeUl1TmMi1xP4nWJubLPrwkWFP4PDUi5bJ4JzTQYBrt16bMCxRtKDljRL00aUrgB9RSxlhsRuhmDKXw87HFQdoRf/aZSgi8idiUIsh+u1n8oeMuN6ouuSgC1xHw3FI4P4YJlVvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6IYw1Yuo9xEANhuQwTiGpnfATLTImxbVXiIyCqZeas=;
 b=jzG+S80lasTlKng5eexs8pLMPg0z+8eJE0iiYiY9j2iU3XAGSY55aWJM7ZyId1OD/R/8nzZgsjne2qeiR8ofp8icqe4iO+F/ruP+eCAPoxNgDdwXKEMa5CHzp+vLs9Dau6EgEK9OrajyRHmGcE9t1nAr9QZz+8s9HBuDcFkamQqT/WByzjOEZLbAa7Dk2SQyHTOGQe1/JhcoTkYioB4NXKrdlS9kGxO5So2BCt8DA/0Hw1JMBN3jNkGRgxH5jhwVw59K2JL4cl99SPTMEBOhsuzz1e7zstZbQIykXE3hXm1uoGpx48aOZ5k5Kd55wsMS5htwMVCrahCroYeaeYNPvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6461.eurprd08.prod.outlook.com (2603:10a6:102:153::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Thu, 29 Sep
 2022 07:52:49 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 07:52:49 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com,
	michael.roth@amd.com,
	kkostiuk@redhat.com
Subject: [PATCH 6/7] qga: Move HW address getting to a separate function
Date: Thu, 29 Sep 2022 09:52:38 +0200
Message-Id: <20220929075239.1675374-7-alexander.ivanov@virtuozzo.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PAXPR08MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a16c04-9065-4c08-b3f0-08daa1ef9ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6vdm8xRJL9mIYRsgYkrh7fPJuvCO2Hno4FjQ1E9tqmB1yRaHrlZMPTCoBzh2D8rZgH+CviHPiIC8+O/IT/Zc9VOceJVlAIIuNeXmZXjoUHkhyIfoX4Pc1/SQrjgPGGk/58ghai7fKBTPYL1rAZLwTvhrhywu4u48yfRS0HlbHfPLhYLGLhANHEN8gRQcijxZc0p3RMk1ydhO7BrWvEGu/FrlCe9BLjH3NeNoEzpozOGCrBPWJ6Nw4qt8rXj/ZwvWU14NRipde3ZH9nf1tw5WWygjG80oVoj8LT7E2u4p7sr1Zt+ncS3CnCxds7/hb5TuhPXu0slrhN9N92/wQh1SGZU4rYK1vYGH8nTV6diexc36qGgEKiH0GSqq6KWXhag7gpphc/8bAHprHIWfvS0JKp+RxS6O/0f7+iFvhTijujORgMrCZi20w3zWyuwsZ47s2bVnYSE0cEYwb3D7uyq1ZSmzmdBU8GUUUUTnLgqenCbtWM7dZ3CmouMkhNFiZzpLVMQ6JAVOrcOHRJmrL4d6tsj6nO2ZBslE88yvnoAKI3dDUMAHxQeIBcRUU6lGJ4R6DUVJESbLZDXDM0jMmyTbkGDc0xuLGp5TeOFn2wP1tQgXC6cIWzMdDHCoiTRacd7GtrMHtN5hngHz8PR7ZZ1WmMEGNMou+609VltuGzuSMByx7jMrc8k+6xYhtRFVZ7dR+/SvZMMi7jzfgPNx4dh7XSNgnCZkEQNGt+udLts58WcZCX1nN7ldNnMS60ZqSyKzlge3mzUpxc7S6Vx9cCr6KQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(451199015)(38350700002)(41300700001)(38100700002)(6666004)(6506007)(478600001)(26005)(186003)(316002)(36756003)(6512007)(44832011)(86362001)(2616005)(52116002)(83380400001)(8936002)(6916009)(6486002)(8676002)(1076003)(5660300002)(4326008)(66556008)(2906002)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1vK6vlm6R/NlOOEW97GGVMGuOTHykY0cZe2pwIHY6Dziv7JF6qRWdBLNqzNX?=
 =?us-ascii?Q?D3RwdAshVGdYzzpqkcHHnGbGaPcBIM5SMn2K7BKLN0kmpkuq5RrWlgNL25VM?=
 =?us-ascii?Q?RWpMe4m54pS3v7pVC2bMSvhhHCz8dgc+zhwt0hFsjweG1hrYlpXFXp4h0Dnl?=
 =?us-ascii?Q?3Rfa/QuI5jlaUbWMLPnCs8WTZo6sbrkT56H+zW81NEiBMaAHY43GIZy0jm2w?=
 =?us-ascii?Q?k9ECIVDyFPhWYn+OxNOIFrHXNcyXEewrtxD/ElT2ygN53sS+ZKSFBVQoEfPJ?=
 =?us-ascii?Q?JSP8fl26JTHTnxcpqCNY/LzQA+uBfqVhdEE86G9S9mHDa5i08661ezuqXdYF?=
 =?us-ascii?Q?jd8TWzFXdCibDF/FfNfPsyCvUFbkSrtyjG0481xkn/b7Po0oQwUDTmTwJDaL?=
 =?us-ascii?Q?SpW38+c3ZtXZG0OfJIpz0J1GcywzTVJgZu/Y+zaQkW94b1+ZzW+kA6FVi/iL?=
 =?us-ascii?Q?Txv3G3NCE76cFC2NM5k6QATJeKIJ+C7YPNewhAtFmnXuqHX0+lafwaWD3A90?=
 =?us-ascii?Q?xz6BYOoLW0ojIREzvvURfLyKP5pGwFutC/4/w4GLT+ecs6spIH4FXk5KCkY1?=
 =?us-ascii?Q?w9EBjGnoNq5fU2WTXNGKjLsThe5aSwU3XIZ34Lr/qqlEQ0/SEB4p/DFxIx5i?=
 =?us-ascii?Q?XAQhg355p7ztGTNOWNI1ZAeEhb650DYMf4N2+mzxTyo8BGL1+f00TsnV4qXZ?=
 =?us-ascii?Q?H8ZWqFjgsu67SYoIQEJ/CXdzzjHLfUOzdaMfp52M7ZbOZmxf08V4BGn8iUv4?=
 =?us-ascii?Q?PuWDpXUP+I/ob4VDspCZStQyqxy1QaIKd6ZPxmbVEbPXFrA4v6vOYpj7N8gQ?=
 =?us-ascii?Q?E4YUF0b3VhBurd9QhHURmL3Xe+uVC8GmBqdptDgVB0zIN4OZmkQl4v3vchh+?=
 =?us-ascii?Q?3sGlhGLpxFLpwLLDTDe2zorME4hqi2dQoHJSvhOyCjzbLyBY2Q3+sZqKULop?=
 =?us-ascii?Q?OBiNDdzBklmTlxY2PbOSgr9PKpF1GVBJBmFVUMDQFj6qDe+b4Z+n8btnqig1?=
 =?us-ascii?Q?fAw92rykMLbCzqPL6vDT28qYu+iL2XxyP0JHgR/Er+/llupsNqsGjYsuUtFN?=
 =?us-ascii?Q?c92SZpx5pCaGVcueH/0TUNspsxe/ciMIU78C2M8B8CNwtBKs8c8jGNcMxeog?=
 =?us-ascii?Q?4kGdrDgUKg5wJ/deovrJ+IgMXFeSXBSWocUjkqNVjBHnJjp6lXyaYrrlrM5r?=
 =?us-ascii?Q?vO23uolhd0awgeXXL7SQz8jp3P6MdmFEErxSzSSSwv7zX2PZ9hWa54C1quni?=
 =?us-ascii?Q?vwU5iQa7NlGbg0sMznNpI+opj8Ww5f8CKyLfWxPk9GOZDulSGDRLE/+Ljw1r?=
 =?us-ascii?Q?gGNJdu92N21fk8zYwsQGbpKOeoNvLWEirFCxEWdXya60sbaBCYwUcGju3Djx?=
 =?us-ascii?Q?fsQGfx9KgpoqvEusrU8ne9uB6Bf6rG1KSpbH4mwvXRSStH4vXXzt898Q3jvy?=
 =?us-ascii?Q?P34lOqq1ujEOiQjQgQO0xya1Vhhy7kQdmGqXKOe7e6YbGRcwoO4PsqObxN17?=
 =?us-ascii?Q?BKSTvgbYa37PkHOxic3ntzccmDnYZATyQmu4+lzQ95ZM39IThqDmgDmmtLHm?=
 =?us-ascii?Q?jVDLpckmpZC88OEjNOlgcPG/v4Ytg3ZEw638MdRFEYEHNp80dFikRvGgAw4H?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a16c04-9065-4c08-b3f0-08daa1ef9ade
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:52:49.5606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KV6jugwKT24eWfX8KDiCQWEfrFQYqHMBy9vhsTfWWqmDo9rDebuchS3CeRVoAAP50YsdXK5CsvO4JG67r2QDKy8B8Ze06MRStHlBo6CtSpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6461
Received-SPF: pass client-ip=40.107.5.137;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

In the next patch FreeBSD support for guest-network-get-interfaces will be
added. Previously move Linux-specific code of HW address getting to a
separate functions and add a dumb function to commands-bsd.c.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-bsd.c    |  18 +++++++
 qga/commands-common.h |   6 +++
 qga/commands-posix.c  | 114 +++++++++++++++++++++++-------------------
 3 files changed, 87 insertions(+), 51 deletions(-)

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index ca06692179..ca81114171 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -167,3 +167,21 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
     return NULL;
 }
 #endif /* CONFIG_FSFREEZE */
+
+#ifdef HAVE_GETIFADDRS
+/*
+ * Fill buf with MAC address by ifaddrs. Pointer buf must point to a
+ * buffer with ETHER_ADDR_LEN length at least.
+ *
+ * Returns -1 in case of an error, 0 if MAC address can't be obtained or
+ * 1 if MAC addres is obtained.
+ */
+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf, Error **errp)
+{
+    /*
+     * We can't get the hw addr of this interface,
+     * but that's not a fatal error.
+     */
+    return 0;
+}
+#endif /* HAVE_GETIFADDRS */
diff --git a/qga/commands-common.h b/qga/commands-common.h
index 2d9878a634..2485a037fd 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -56,6 +56,12 @@ int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
 int qmp_guest_fsfreeze_do_thaw(Error **errp);
 #endif /* CONFIG_FSFREEZE */
 
+#ifdef HAVE_GETIFADDRS
+#include <ifaddrs.h>
+
+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf, Error **errp);
+#endif
+
 typedef struct GuestFileHandle GuestFileHandle;
 
 GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp);
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 6ce894ca6e..0bebd9e690 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -41,20 +41,12 @@
 #endif
 #endif
 
-#ifdef __FreeBSD__
-/*
- * The code under HAVE_GETIFADDRS condition can't be compiled in FreeBSD.
- * Fix it in one of the following patches.
- */
-#undef HAVE_GETIFADDRS
-#endif
-
 #ifdef HAVE_GETIFADDRS
 #include <arpa/inet.h>
 #include <sys/socket.h>
 #include <net/if.h>
+#include <net/ethernet.h>
 #include <sys/types.h>
-#include <ifaddrs.h>
 #ifdef CONFIG_SOLARIS
 #include <sys/sockio.h>
 #endif
@@ -2659,14 +2651,6 @@ int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
     return -1;
 }
 
-void qmp_guest_set_user_password(const char *username,
-                                 const char *password,
-                                 bool crypted,
-                                 Error **errp)
-{
-    error_setg(errp, QERR_UNSUPPORTED);
-}
-
 GuestMemoryBlockList *qmp_guest_get_memory_blocks(Error **errp)
 {
     error_setg(errp, QERR_UNSUPPORTED);
@@ -2804,7 +2788,15 @@ out:
         close(datafd[1]);
     }
 }
-#endif
+#else /* __linux__ || __FreeBSD__ */
+void qmp_guest_set_user_password(const char *username,
+                                 const char *password,
+                                 bool crypted,
+                                 Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+}
+#endif /* __linux__ || __FreeBSD__ */
 
 #ifdef HAVE_GETIFADDRS
 static GuestNetworkInterface *
@@ -2887,6 +2879,54 @@ static int guest_get_network_stats(const char *name,
     return -1;
 }
 
+#ifndef __FreeBSD__
+/*
+ * Fill buf with MAC address by ifaddrs. Pointer buf must point to a
+ * buffer with ETHER_ADDR_LEN length at least.
+ * Returns -1 in case of an error, 0 if MAC address can't be obtained or
+ * 1 if MAC addres is obtained.
+ */
+int guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf, Error **errp)
+{
+    struct ifreq ifr;
+    int sock;
+
+    /* we haven't obtained HW address yet */
+    sock = socket(PF_INET, SOCK_STREAM, 0);
+    if (sock == -1) {
+        error_setg_errno(errp, errno, "failed to create socket");
+        return -1;
+    }
+
+    memset(&ifr, 0, sizeof(ifr));
+    pstrcpy(ifr.ifr_name, IF_NAMESIZE, ifa->ifa_name);
+    if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
+        /*
+         * We can't get the hw addr of this interface, but that's not a
+         * fatal error. Don't set info->hardware_address, but keep
+         * going.
+         */
+        if (errno == EADDRNOTAVAIL) {
+            /* The interface doesn't have a hw addr (e.g. loopback). */
+            g_debug("failed to get MAC address of %s: %s",
+                    ifa->ifa_name, strerror(errno));
+        } else{
+            g_warning("failed to get MAC address of %s: %s",
+                      ifa->ifa_name, strerror(errno));
+        }
+        close(sock);
+        return 0;
+    }
+#ifdef CONFIG_SOLARIS
+    memcpy(buf, &ifr.ifr_addr.sa_data, ETHER_ADDR_LEN);
+#else
+    memcpy(buf, &ifr.ifr_hwaddr.sa_data, ETHER_ADDR_LEN);
+#endif
+    close(sock);
+    return 1;
+}
+#endif /* __FreeBSD__ */
+
 /*
  * Build information about guest interfaces
  */
@@ -2907,10 +2947,9 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
         GuestNetworkInterfaceStat *interface_stat = NULL;
         char addr4[INET_ADDRSTRLEN];
         char addr6[INET6_ADDRSTRLEN];
-        int sock;
-        struct ifreq ifr;
-        unsigned char *mac_addr;
+        unsigned char mac_addr[ETHER_ADDR_LEN];
         void *p;
+        int ret;
 
         g_debug("Processing %s interface", ifa->ifa_name);
 
@@ -2924,45 +2963,18 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
         }
 
         if (!info->has_hardware_address) {
-            /* we haven't obtained HW address yet */
-            sock = socket(PF_INET, SOCK_STREAM, 0);
-            if (sock == -1) {
-                error_setg_errno(errp, errno, "failed to create socket");
+            ret = guest_get_hw_addr(ifa, mac_addr, errp);
+            if (ret == -1) {
                 goto error;
             }
-
-            memset(&ifr, 0, sizeof(ifr));
-            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
-            if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
-                /*
-                 * We can't get the hw addr of this interface, but that's not a
-                 * fatal error. Don't set info->hardware_address, but keep
-                 * going.
-                 */
-                if (errno == EADDRNOTAVAIL) {
-                    /* The interface doesn't have a hw addr (e.g. loopback). */
-                    g_debug("failed to get MAC address of %s: %s",
-                            ifa->ifa_name, strerror(errno));
-                } else{
-                    g_warning("failed to get MAC address of %s: %s",
-                              ifa->ifa_name, strerror(errno));
-                }
-
-            } else {
-#ifdef CONFIG_SOLARIS
-                mac_addr = (unsigned char *) &ifr.ifr_addr.sa_data;
-#else
-                mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;
-#endif
+            if (ret == 1) {
                 info->hardware_address =
                     g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
                                     (int) mac_addr[0], (int) mac_addr[1],
                                     (int) mac_addr[2], (int) mac_addr[3],
                                     (int) mac_addr[4], (int) mac_addr[5]);
-
                 info->has_hardware_address = true;
             }
-            close(sock);
         }
 
         if (ifa->ifa_addr &&
-- 
2.34.1


