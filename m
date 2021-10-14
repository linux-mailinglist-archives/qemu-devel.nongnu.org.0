Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D793542D5D5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:17:49 +0200 (CEST)
Received: from localhost ([::1]:36930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maws0-00060E-WA
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1mawqU-0004SU-8t
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:16:14 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:56825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1mawqS-0004sS-72
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1634202970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dqRb/X/zKAjbS/bE0msOjMIr6hIIXNWz7D+xIVKDYmI=;
 b=hD6YoneRYXDYXidmFVCirrIDc7+kzMd3ZBnlW2rg7yCjnWtfttF1Q5HT0/UG9w29K4aQ0g
 cJBe1fFszeTQzfOILk98JeBRP/EpWG/HHjRRi+rgqgqGhP4HchZexzjTE6XgSdntwTP1C+
 S9KYRrRh/y+uHLt+8rEdYQIwvmgi0DA=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-VAwSAKIFPOywBODZC9soIg-2; Thu, 14 Oct 2021 11:16:09 +0200
X-MC-Unique: VAwSAKIFPOywBODZC9soIg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aavhlsK4DB+7QngL1+S4hletap67EUeToFpUfGIEgGFAa/ciBbeH9WKL0Y1UiiZslS48sUn1p5NI6KfTWYfQtGrn51l7aV+QAuun1fzk8pz0Y6ykzHx9uaYhJb5KfBuelyfsYoD0OQLFv4WDRFNPf7/F6xquyLs2Mngedls5ge/qLqTFpFamY0om+OnF5mI34Hp8XNny3A0MHhUmRv1TnonN8zl1T7FynUQMvO6pWBfj1oWb9CoxpxPpuXgrzrKnBPMO1rdy2i6U+5qfIiB2VAjUJV22XJP4sbNrNTz9+Ud/1lsPNvaVMM1BrkVL+be65vwiTwRCYMsXakjfN67H+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyoMlmNamqTAnnw9+oC1L9n4Snb8jHygLcrqKderjBg=;
 b=aYWE0GGC/HhEXxZCuRN/Avv/9JZ2/vYAU/k9yOnRsViA70zqRJw93iwws0mIEWt+yQ5z6lqLM1HIqH6iQ8+R8x9Dpy5zca1CO++riz/MZNgj6mYBIW/m2beZb2kUJSJD5w8U94CaJhFtISHuk7z6wxPAFSSxLscB/LTW80X6ASIHax1SyqQ2GPEx4JLRbscaECWunZnNDsgj9/zfFNBg3YB716DQFfejJEYRMxNq+MjpUi5jQ0/3DwhKeGhR03kLPgpqhX+T3GfX82IL249Hg1BlRc2G2HlcdQAiFU39hFeyJyKXWN9eYN/iOBmSyItn7ni5TV9AFnmkqE+m2JRozQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com (2603:10a6:20b:439::12)
 by AM9PR04MB8955.eurprd04.prod.outlook.com (2603:10a6:20b:40a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Thu, 14 Oct
 2021 09:16:07 +0000
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::5499:6698:e99f:cf7f]) by AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::5499:6698:e99f:cf7f%8]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 09:16:07 +0000
From: Lin Ma <lma@suse.com>
To: qemu-devel@nongnu.org
CC: quintela@redhat.com,
	dgilbert@redhat.com,
	Lin Ma <lma@suse.com>
Subject: [PATCH 1/3] migration: introduce postcopy-uffd-usermode-only
 capability
Date: Thu, 14 Oct 2021 17:15:49 +0800
Message-ID: <20211014091551.15201-2-lma@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211014091551.15201-1-lma@suse.com>
References: <20211014091551.15201-1-lma@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0164.apcprd02.prod.outlook.com
 (2603:1096:201:1f::24) To AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12)
MIME-Version: 1.0
Received: from localhost (60.251.47.115) by
 HK2PR02CA0164.apcprd02.prod.outlook.com (2603:1096:201:1f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 09:16:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1ba8c6e-152e-44bd-1e77-08d98ef34119
X-MS-TrafficTypeDiagnostic: AM9PR04MB8955:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB89556046B4598DCF8049A97DC5B89@AM9PR04MB8955.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jw8u/iV/6O7usNhdz5mvPPYyvQYbEG/U/4WCZq5A1szwuZl4ck8Y5wJVr2egoNPjzWTyf+EudRs6RU/CQI6OfDAM+UlBRynszEMhrbGFdj03kndLQmHiucB/BUSp109/lpOHTi0tUb/NXV8injC3/ASrOchVw1IrNfcT5qPCjm7azsOOzSMb+YKVeB5VAy+Ky67zi3l2Cfa6QkZZjFmZ2NxbRIhau5MyRtCTn0a/ipipOttnUy0UyYgp4DxAENs8RLj1IGBqI4+3BoTrhwjXHJDio0R2SzQSrwu1LQoeq92U6enMbkh7hryyW3iQQlpa8j/GWGogXykaHJKpOnT5/G1mzN42xUKAdwq5eAfeaJc2tDoc1uZNeyqMnzLU6BYjD4JeUh4nMUVXueCIsz6A0JiZ9ECUh9Ufap135utVuVXt8T+V7ZIblrEJmYlBF5sPJ2pxD6Y2HTV6miSirgQmPpG4DzZ+idPgs2Sk7jvQm2N3TbJd1TiUJUrwd7dUPxXvlriYhP4NLDaAtn2myY4PwXxQVbBvoxpClWWD86C+7LDM3L3f/3jTy9aui0T9aS74XrDYcfb7WF9mq0XyYrj6XAAu64wh7q38QpzZoL8EWHZeg7bpFPf61gndtSbDsYCirR0CgGYZFdWm0o3pxNsL/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8602.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66476007)(6496006)(55236004)(2906002)(38100700002)(86362001)(26005)(36756003)(66946007)(316002)(186003)(6486002)(107886003)(6666004)(83380400001)(2616005)(5660300002)(508600001)(8936002)(1076003)(956004)(6916009)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GXwI9KOswoSpmhXhVrFn3k2S0GcSBpzHCBT7KQzYdPjTrFdHW0TJBQwaorER?=
 =?us-ascii?Q?ENCl7GjYesqJTwoqO2n36iuDmXQODsVRZbWhPe0zWAYSJiyP6Gbdj400V+hZ?=
 =?us-ascii?Q?f9D9qkZjQAMzR99SgvHZZuMzG64uEXHVTtaMS9gdzwwE8lpbQ3IeGEKUr36o?=
 =?us-ascii?Q?Yh64G9dqcDseeAPKE8Z79ptW51dtTGGpDLZL//CgiV5doVMtW854kxMVTBH7?=
 =?us-ascii?Q?CovTIaSVlI+gNss5C3vumx9hTae0czRSKprqm4XDU5nB7rkoMN5g2Mivzlui?=
 =?us-ascii?Q?rDkpZLBcluvyIzmqG2lTsLXdWfHwlLxsUsDqMjpAiBcXyn4GKDQDBzoFAq0Y?=
 =?us-ascii?Q?u/rQlqNabQ9sCo4nylQDsbouoYyPjDF7dRpQhTGxiC65I+LofktidvjVVoxN?=
 =?us-ascii?Q?/e2ImQF23xNbsxv/xayxh9YbvmpXhnDoZgi0P/CV/hQvBdj46D25Ezm9WQWn?=
 =?us-ascii?Q?vHW/onSvwP/TT/lYDz/SZRd7GtjOcdeAHZqI0yE2QeA1Hciu9WCij1XneIOT?=
 =?us-ascii?Q?v9Vn7Z96BWx7gV19LhiP+4DxXuQxrzm4MqhOnwcUxVLPx+vWh8d6/faOoLg0?=
 =?us-ascii?Q?KQiVi33JdNWuya4o3ju4t4tgMPoV9qwJ0eCvFtLNk+B2mHhG0UorHF5X2mDI?=
 =?us-ascii?Q?LQ9dH6Z9mqRiEu2g2x2vEr/uYrL7z+0w5q3iRSch/d2AwWbaRYfXe8VyoGRl?=
 =?us-ascii?Q?XhoM6ucQ37WU5ugfEoFpEeoQvh7t1sPGB/hX+7GjFI8j81WwecJv0qkiD7t2?=
 =?us-ascii?Q?ZSiE8meTHuoqu3OpP9ydnwR54h8sAkn5U3CDsrDeyJE7xZHG4mKupsoo/Y0a?=
 =?us-ascii?Q?2A9y+sP+TMlLt4zmn5JNHD+k03gLmYxFVx+1ac0uohF2S7iaABnhzPyeGfTg?=
 =?us-ascii?Q?0zcjnHfETexU+8DLV/UQSJrpBCugG4IDzKECDHJReeKkhO6IHisU3QraT4gc?=
 =?us-ascii?Q?f1/vO6IfFHK9K14TjV5VJJvH05lhD7RKnNeZ0wB+Lnrq2GFRUm7jELwoZ/yw?=
 =?us-ascii?Q?WmoRwke5VK0yGqHtfeM6gvTh+kPUDtrpdP/27a78PWl78tUQ2TpAqu85ycF6?=
 =?us-ascii?Q?l1HeqlrPNa8Niil57ZXnzf0ZBIdRrZOdVnmbhnW9TFfC9XN0B3rMYwRg3oeL?=
 =?us-ascii?Q?VTOP0YESArRUUWfGh27TJ1if90/+3/8gvp4/KYc3FZXleTWBoVvn7ivAWt3L?=
 =?us-ascii?Q?als7IQUmqVeV84WTRLBF/0NfIetMJDn3IKN2D5Y5RZg28rNnghU7VM8JqJXn?=
 =?us-ascii?Q?2qSQF/vg+s0Gj7PMYjllJ9TF2XLJVnAIbD+cWXNYX74Mg43q7Z6tOEWPMYXJ?=
 =?us-ascii?Q?3o6B4N02S9SVXGWbZWZ/Fm1Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ba8c6e-152e-44bd-1e77-08d98ef34119
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8602.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 09:16:07.0754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+ffDEHvyUfGrktD3jmfscHPINVzFS6Gv5+gZGrYz0Z6s7Xy4lsIiDpxFfBP6vHI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8955
Received-SPF: pass client-ip=194.104.111.102; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The default value of unprivileged_userfaultfd sysctl knob was changed to
0 since kernel v5.11 by commit d0d4730a:
userfaultfd: add user-mode only option to unprivileged_userfaultfd sysctl k=
nob.

In this mode, An unprivileged user (without SYS_CAP_PTRACE capability) must
pass UFFD_USER_MODE_ONLY to userfaultd or the API will fail with EPERM.

So add a capability to pass UFFD_USER_MODE_ONLY to support it.

Signed-off-by: Lin Ma <lma@suse.com>
---
 migration/migration.c    |  9 +++++++++
 migration/migration.h    |  1 +
 migration/postcopy-ram.c | 22 +++++++++++++++++++---
 qapi/migration.json      |  8 +++++++-
 4 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 6ac807ef3d..86212dcb70 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2380,6 +2380,15 @@ bool migrate_postcopy_blocktime(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME=
];
 }
=20
+bool migrate_postcopy_uffd_usermode_only(void)
+{
+    MigrationState *s;
+
+    s =3D migrate_get_current();
+
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_UFFD_USER=
MODE_ONLY];
+}
+
 bool migrate_use_compression(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index 7a5aa8c2fd..a516d7f59f 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -358,6 +358,7 @@ int migrate_decompress_threads(void);
 bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
+bool migrate_postcopy_uffd_usermode_only(void);
=20
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 2e9697bdd2..078c558626 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -206,9 +206,14 @@ static bool receive_ufd_features(uint64_t *features)
     struct uffdio_api api_struct =3D {0};
     int ufd;
     bool ret =3D true;
+    int flags;
+
+    flags =3D O_CLOEXEC;
+    if (migrate_postcopy_uffd_usermode_only())
+        flags |=3D UFFD_USER_MODE_ONLY;
=20
     /* if we are here __NR_userfaultfd should exists */
-    ufd =3D syscall(__NR_userfaultfd, O_CLOEXEC);
+    ufd =3D syscall(__NR_userfaultfd, flags);
     if (ufd =3D=3D -1) {
         error_report("%s: syscall __NR_userfaultfd failed: %s", __func__,
                      strerror(errno));
@@ -352,13 +357,18 @@ bool postcopy_ram_supported_by_host(MigrationIncoming=
State *mis)
     struct uffdio_range range_struct;
     uint64_t feature_mask;
     Error *local_err =3D NULL;
+    int flags;
=20
     if (qemu_target_page_size() > pagesize) {
         error_report("Target page size bigger than host page size");
         goto out;
     }
=20
-    ufd =3D syscall(__NR_userfaultfd, O_CLOEXEC);
+    flags =3D O_CLOEXEC;
+    if (migrate_postcopy_uffd_usermode_only())
+        flags |=3D UFFD_USER_MODE_ONLY;
+
+    ufd =3D syscall(__NR_userfaultfd, flags);
     if (ufd =3D=3D -1) {
         error_report("%s: userfaultfd not available: %s", __func__,
                      strerror(errno));
@@ -1064,8 +1074,14 @@ retry:
=20
 int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
+    int flags;
+
+    flags =3D O_CLOEXEC | O_NONBLOCK;
+    if (migrate_postcopy_uffd_usermode_only())
+        flags |=3D UFFD_USER_MODE_ONLY;
+
     /* Open the fd for the kernel to give us userfaults */
-    mis->userfault_fd =3D syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK=
);
+    mis->userfault_fd =3D syscall(__NR_userfaultfd, flags);
     if (mis->userfault_fd =3D=3D -1) {
         error_report("%s: Failed to open userfault fd: %s", __func__,
                      strerror(errno));
diff --git a/qapi/migration.json b/qapi/migration.json
index 88f07baedd..3af1ec4cec 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -452,6 +452,11 @@
 #                       procedure starts. The VM RAM is saved with running=
 VM.
 #                       (since 6.0)
 #
+# @postcopy-uffd-usermode-only: If enabled, It allows unprivileged users t=
o use
+#                               userfaultfd but with the restriction that =
page
+#                               faults from only user mode can be handled.
+#                               (since 6.2.0)
+#
 # Since: 1.2
 ##
 { 'enum': 'MigrationCapability',
@@ -459,7 +464,8 @@
            'compress', 'events', 'postcopy-ram', 'x-colo', 'release-ram',
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
-           'x-ignore-shared', 'validate-uuid', 'background-snapshot'] }
+           'x-ignore-shared', 'validate-uuid', 'background-snapshot',
+           'postcopy-uffd-usermode-only'] }
=20
 ##
 # @MigrationCapabilityStatus:
--=20
2.26.2


