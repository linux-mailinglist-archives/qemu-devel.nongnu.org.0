Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E40474EFA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:17:26 +0100 (CET)
Received: from localhost ([::1]:52322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxHz3-0001sG-D8
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:17:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHo6-0002HM-0J; Tue, 14 Dec 2021 19:06:06 -0500
Received: from mail-dm6nam12on2052.outbound.protection.outlook.com
 ([40.107.243.52]:34081 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHo0-0004zF-PB; Tue, 14 Dec 2021 19:06:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz3S2zaFjnrZTHpcm5n9/VVU8ctVBFQ+WRPi2dph6ogDZmlVTomQCR9k5m6cU7d0QkvIRmTc2MpTXuHoR+xIicoyQH3Cy9WqJkSsiDiSvCijCgRojfP0+lSxZL0t+bIu4avsFPGT1oKgfD6inuuScvIDzGNNk9s/faMBbcjJ/SVX6kRx31ls5hJk0rzXK4LYAnOUZKkPyaTKCJcYj1bvmoDpblWIHoISfKBg09bQCkUf4Gkn7i3R1MkhW4Ma6j/w+/Zb6P3+/zdKFtYZriiLD1SpbDtIULYZXzVYgVmGFMtJY1TcXjw233LeDpo/4FU2pnJjNjq7lq5gP5v5bX5vgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOPHl9TZ4xavFvMc8UO3kmxtOBeNhkMLiGz0TtDChdc=;
 b=M50MykweA9/cOlJxTp9LsuPyGTVO04PpufRq2wfkFX3QdavpEe4POEqKGu36onolbZ5aGQ1BckEsJLXJ/I/+W7tkqFgjSaZfaWCCxE3Df62QyfH3MM8CAwygc/LEUDL9XgkYgaVmBrfmYCZlpCrcAM2ZQx9OISJIZmp4CEK71452V8t4bWG5ZyuF2kFkjH9XGf48v1rwUURQKoFMYQE4dEmrXrzzYEtxIDYeIAb/eUUnjwUbO+662usf/UL4XKiKwbvzGIcLqlHuTnM6O1Fcl5c+0FTQIv2fph/7aCF0T0srhrftTxbckqN9CsYwSp8aar/XZu+fUNB6QZNt5OVeTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOPHl9TZ4xavFvMc8UO3kmxtOBeNhkMLiGz0TtDChdc=;
 b=EMvXDRtxI3lilanNiejucEY3XkJ8lv56NlNVzP+KnI6hLhnwHHIA50f36rgWsJK+fR56CQiJMjYlsaVeonZ8gG1KKjMnVhP6kBYSkmnYy9fBinwj3jtEBCbaG4mPA74Jahm5pBqJLDlvy26S6wjDMOG0MTC1kYtZ4VAVH7hpvYk=
Received: from MW4PR04CA0143.namprd04.prod.outlook.com (2603:10b6:303:84::28)
 by DM5PR12MB2533.namprd12.prod.outlook.com (2603:10b6:4:b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Wed, 15 Dec
 2021 00:05:52 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::d6) by MW4PR04CA0143.outlook.office365.com
 (2603:10b6:303:84::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.16 via Frontend Transport; Wed, 15 Dec 2021 00:05:51 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:05:50 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 15/47] qemu-sockets: fix unix socket path copy (again)
Date: Tue, 14 Dec 2021 18:00:53 -0600
Message-ID: <20211215000125.378126-16-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a748a26-2e47-4f1e-d56c-08d9bf5ea7eb
X-MS-TrafficTypeDiagnostic: DM5PR12MB2533:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2533BB2F71BF092E6AC24F7595769@DM5PR12MB2533.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AASTR4e9QnxcKI+Le0f5Vtp8+3BgHm29SN0JkTGECHrgD+lN04b/1XsEEVmXGaU9NdeQz/o0lYXfCsasc5PR+GJ1X5Iv30eZovG2rIxixpGka1HFQw72dvSFu4basExobemh+DYZSgUp1jbOzzqZFdmHn7+aGEdmrjS186FslGL59trOXTBvhssIqp5t31XNR6QPCsrWCfDQTlPXgU4/LKoAQXr3MSPYBn8/m+Pw3GGkFoHzm3hnX+VGOBbv2w9dgSUwxn3PQkE7yFWyjpJpufzQsZGjQIcSADowrP/QQqbIY1gY9hrG7lshgNu8LhmF/SMOfegeNgKqcBa9zxSZBodrVOJvQ5NKxRCGGEGKMt2zPgOQXrfeYI9haQGdY+w0zS1apifzV8IA6iWiRWca2J7Xo89ZIF5XWUoeQODiNivDjmO/q893SI1dutAEHSiu1YV7sTS1Hm5pSXtWluJCiBuuO8IO1Sv21csLpoOA2518Qe4wRBCUVMm5SZ5SfquSbo+TDJtL/9ySHiQhhPrNRkNpx2g5B8acyAp/xVcFV63Nsv+X7HWtV3uI3fWM+m9XPikjJ9AmnQ4G/npYIRVUmfU17rhzcpVz2vcVD6x+OEntBXUwFhoYSnRSR2V3A66qn0As2J6pbCE+tt8tAErdrw8C0ITRPiaPqYncBUlEJz4etBAgaFVxGcuGT0x0MxNQlEaDKWEVQKyeInWXcrTms2tGZu0eA+liE7AY43LVzuFiwxBVRtNtaRb1Im3r16HrnvOpO/L4bN7rrC5cyiUYe6CsfqEVl6sgtEqV6q2/SUwsXMPna44IWFLE9GNTV0eRERESDaiTvlYQlWR3h9dXMGY9tnePTPwFz/BVx2Tmzh+WfVNNxWTxTum8LadzGrCUDWKUZnpkQfxMrDdnp2sgIQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(508600001)(86362001)(47076005)(44832011)(316002)(356005)(36860700001)(4326008)(81166007)(70206006)(8676002)(70586007)(5660300002)(83380400001)(6916009)(40460700001)(2616005)(8936002)(2906002)(426003)(1076003)(336012)(36756003)(186003)(966005)(82310400004)(54906003)(16526019)(26005)(36900700001)(16193025007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:05:51.3155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a748a26-2e47-4f1e-d56c-08d9bf5ea7eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2533
Received-SPF: softfail client-ip=40.107.243.52;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

From: Michael Tokarev <mjt@tls.msk.ru>

Commit 4cfd970ec188558daa6214f26203fe553fb1e01f added an
assert which ensures the path within an address of a unix
socket returned from the kernel is at least one byte and
does not exceed sun_path buffer. Both of this constraints
are wrong:

A unix socket can be unnamed, in this case the path is
completely empty (not even \0)

And some implementations (notable linux) can add extra
trailing byte (\0) _after_ the sun_path buffer if we
passed buffer larger than it (and we do).

So remove the assertion (since it causes real-life breakage)
but at the same time fix the usage of sun_path. Namely,
we should not access sun_path[0] if kernel did not return
it at all (this is the case for unnamed sockets),
and use the returned salen when copyig actual path as an
upper constraint for the amount of bytes to copy - this
will ensure we wont exceed the information provided by
the kernel, regardless whenever there is a trailing \0
or not. This also helps with unnamed sockets.

Note the case of abstract socket, the sun_path is actually
a blob and can contain \0 characters, - it should not be
passed to g_strndup and the like, it should be accessed by
memcpy-like functions.

Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f
Fixes: http://bugs.debian.org/993145
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
CC: qemu-stable@nongnu.org
(cherry picked from commit 118d527f2e4baec5fe8060b22a6212468b8e4d3f)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 util/qemu-sockets.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index f2f3676d1f..c5043999e9 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1345,25 +1345,22 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
     SocketAddress *addr;
     struct sockaddr_un *su = (struct sockaddr_un *)sa;
 
-    assert(salen >= sizeof(su->sun_family) + 1 &&
-           salen <= sizeof(struct sockaddr_un));
-
     addr = g_new0(SocketAddress, 1);
     addr->type = SOCKET_ADDRESS_TYPE_UNIX;
+    salen -= offsetof(struct sockaddr_un, sun_path);
 #ifdef CONFIG_LINUX
-    if (!su->sun_path[0]) {
+    if (salen > 0 && !su->sun_path[0]) {
         /* Linux abstract socket */
-        addr->u.q_unix.path = g_strndup(su->sun_path + 1,
-                                        salen - sizeof(su->sun_family) - 1);
+        addr->u.q_unix.path = g_strndup(su->sun_path + 1, salen - 1);
         addr->u.q_unix.has_abstract = true;
         addr->u.q_unix.abstract = true;
         addr->u.q_unix.has_tight = true;
-        addr->u.q_unix.tight = salen < sizeof(*su);
+        addr->u.q_unix.tight = salen < sizeof(su->sun_path);
         return addr;
     }
 #endif
 
-    addr->u.q_unix.path = g_strndup(su->sun_path, sizeof(su->sun_path));
+    addr->u.q_unix.path = g_strndup(su->sun_path, salen);
     return addr;
 }
 #endif /* WIN32 */
-- 
2.25.1


