Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2883F474FB4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:57:01 +0100 (CET)
Received: from localhost ([::1]:33372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIbM-0006kA-9V
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:57:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxI04-0006jM-6I; Tue, 14 Dec 2021 19:18:28 -0500
Received: from mail-dm6nam10on2086.outbound.protection.outlook.com
 ([40.107.93.86]:10112 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxI01-0006W8-EW; Tue, 14 Dec 2021 19:18:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYUnZZFwFGp051vZAWQhaTFi82qRvLSuWzFTy+F0jvX4Pw0zQEZANC1+kjdpdqh9dRh/jPMCpGR4nRc5Z3e3A8SfOK6kb6G4LU+60gMfsse0aGTp11qVZLqv5SKmLINF0UhVnK+qa4PTHPo05SX5gXvfxiUU0DEnuPXQ4hTcE+04M6ryRz9Bg/dlFjaEd5xguNqpdKEQA5BvBzyV+jzGKZEFEAWHr+HGhedv2JxOzRXMvJE+VLc4yryHlROJ5UlroUpsqwR496WAtbxCW9U4iOXWcfJ/gkl7zv5aH+gahWlxzkQ0Qq6pju/ymLNHm/KpOJDfja4bbKP14v9bifn3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7t+ouPu5WYI+gHy9SAAMmKg863mI9sae+/3yPLcA3M=;
 b=cBlzJUeTLioUefWMlVF9Sp1lTv1HR4ykabAKnITbkLzfGUC8d9cMko5b+23dCn18RBOnhOnUCJRWz6eJdONtAaXyC7JMiKi3XI+Oli04yRy6y29lhQ/4BO999rQmfJio/dYu9K4HNmVyLKBJsUnuz8bG5TeI3SINEbTYhdK1f1ny4wiOJtCt3gAaKyjvZE36Z5vMTdFlvpHA2wbKdbXoaJ0+nVuhQkDUcmn2bW+HACGdpCi3Eo43ikVFd+8r1miAVH71lvrC5ScWm6AlCko1jFACCyHtsHYdqauY/2autJQepy9+TnAs5eQwL8rDeCKhhp6zk6QUJnS6TDBppc6mpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7t+ouPu5WYI+gHy9SAAMmKg863mI9sae+/3yPLcA3M=;
 b=IaEPCDB2ruHnAds1nCno3Uzy/q3XxFQ+yrH2p8562xJ0ggxDk3xrKi4/RHs0APw1VPi8OfD1XgcdzmKNbLVuuXwps0xd8FYhgFrfYjEUBP5a/xcA+YcxNtQy8Su9qnV8GiH42eXdbsUinVXVrsMJrtBFbnWvA7a1djvqlAVDFyo=
Received: from BN6PR14CA0002.namprd14.prod.outlook.com (2603:10b6:404:79::12)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Wed, 15 Dec
 2021 00:18:22 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::13) by BN6PR14CA0002.outlook.office365.com
 (2603:10b6:404:79::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17 via Frontend
 Transport; Wed, 15 Dec 2021 00:18:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:18:22 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:18:22 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Nir Soffer <nirsof@gmail.com>, Nir Soffer
 <nsoffer@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH 04/47] qemu-nbd: Change default cache mode to writeback
Date: Tue, 14 Dec 2021 18:00:42 -0600
Message-ID: <20211215000125.378126-5-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2d28f6ac-de0b-47c1-4875-08d9bf6067b6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4061:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB40613ED0D42D647AE1240A3595769@MN2PR12MB4061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZNo57rfdUpmzsXr8++tpYBiMyjlbVziTzKjmJXjneBx1/GAl5mh60LvdNlf3oZq5V0x26HrBefRINZMtRnKTMGwIuelCmTlw4sbhSXxmYwqxjfty4NVVoXdVFsSoepD8Ym5nIIrF69TDA++UJ2+iZwHX7eFS5wcSBGXcpn2dZuI7zEuzZXNWi2GVlTTgeroTPoEYRxdQcPtBQN36/PYwCrpM7PmajZvPhq7afAh3guXKBo5RIAIqlSpIrtv8Cie/t4iQP8f0NZKS3dMhUUs7QLc1n1W/Dvr9SHUu2TwD4fag/Wj3ksTlsKGwjNgZX00LvDHG0O+XcVwJbrB9rwag0H+aKbkakodylsNcJVnB1fiAnhY2eZStLcblazxjg2nIgUb6Kc2M2iaQqve8rSNdo6WUvPivQwwyqPnBnOkkpYht3/L8g/sJ6IEdrXjb0SoWZlbosZbWyVJ8DibLomwCf1kCLIbTArdAE7UnIb2P/aQI8W4hjs/9D1kai931yvVtp3xFFQIxSfaw9g4YIHlG34K/G6GGDnjrPFHxHiO5cgCrtaU6Q+/ZfuoZYRAcqV+DbNS42vMbDGnyf50r3TtGcDngTdHwr25x9QF6Wc1w6xAd4rETngOHpvWWUMinjI3qWRbJRakS61eu6Bk9XiEpdFHURBGrVM0kCHI5tn4weO4L0vSViLHNIEHuNVEbeZwHHTXdzVi7lMdQcFJkt33jdfheqy4s38c8Wg1XQq68z3nQPbu96zWmI/Bo94Giew77eTOsrsjmvVkP67L00eXKyJTK4Gc4qvVO5KR9csmNU1/M+jSz0ZVmi52IA1+fmgJbMlj3jVKhE4U+mtzErhuzayNIVsCH6nBLOppRmy6JQpEBiuyACdvULPwz9HAbFF2sNCaNfy4d3XHJe4dzAJx+PMEAGVWK1UrR3UHhuPt/tT4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(26005)(81166007)(4326008)(2616005)(6916009)(186003)(6666004)(82310400004)(8676002)(47076005)(316002)(356005)(16526019)(83380400001)(966005)(2906002)(336012)(40460700001)(1076003)(36860700001)(36756003)(70206006)(70586007)(8936002)(5660300002)(508600001)(426003)(86362001)(44832011)(54906003)(33290500001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:18:22.7088 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d28f6ac-de0b-47c1-4875-08d9bf6067b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
Received-SPF: softfail client-ip=40.107.93.86;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

From: Nir Soffer <nirsof@gmail.com>

Both qemu and qemu-img use writeback cache mode by default, which is
already documented in qemu(1). qemu-nbd uses writethrough cache mode by
default, and the default cache mode is not documented.

According to the qemu-nbd(8):

   --cache=CACHE
          The  cache  mode  to be used with the file.  See the
          documentation of the emulator's -drive cache=... option for
          allowed values.

qemu(1) says:

    The default mode is cache=writeback.

So users have no reason to assume that qemu-nbd is using writethough
cache mode. The only hint is the painfully slow writing when using the
defaults.

Looking in git history, it seems that qemu used writethrough in the past
to support broken guests that did not flush data properly, or could not
flush due to limitations in qemu. But qemu-nbd clients can use
NBD_CMD_FLUSH to flush data, so using writethrough does not help anyone.

Change the default cache mode to writback, and document the default and
available values properly in the online help and manual.

With this change converting image via qemu-nbd is 3.5 times faster.

    $ qemu-img create dst.img 50g
    $ qemu-nbd -t -f raw -k /tmp/nbd.sock dst.img

Before this change:

    $ hyperfine -r3 "./qemu-img convert -p -f raw -O raw -T none -W fedora34.img nbd+unix:///?socket=/tmp/nbd.sock"
    Benchmark #1: ./qemu-img convert -p -f raw -O raw -T none -W fedora34.img nbd+unix:///?socket=/tmp/nbd.sock
      Time (mean ± σ):     83.639 s ±  5.970 s    [User: 2.733 s, System: 6.112 s]
      Range (min … max):   76.749 s … 87.245 s    3 runs

After this change:

    $ hyperfine -r3 "./qemu-img convert -p -f raw -O raw -T none -W fedora34.img nbd+unix:///?socket=/tmp/nbd.sock"
    Benchmark #1: ./qemu-img convert -p -f raw -O raw -T none -W fedora34.img nbd+unix:///?socket=/tmp/nbd.sock
      Time (mean ± σ):     23.522 s ±  0.433 s    [User: 2.083 s, System: 5.475 s]
      Range (min … max):   23.234 s … 24.019 s    3 runs

Users can avoid the issue by using --cache=writeback[1] but the defaults
should give good performance for the common use case.

[1] https://bugzilla.redhat.com/1990656

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
Message-Id: <20210813205519.50518-1-nsoffer@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
CC: qemu-stable@nongnu.org
Signed-off-by: Eric Blake <eblake@redhat.com>
(cherry picked from commit 09615257058a0ae87b837bb041f56f7312d9ead8)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 docs/tools/qemu-nbd.rst | 6 ++++--
 qemu-nbd.c              | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index ee862fa0bc..5643da26e9 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -98,8 +98,10 @@ driver options if ``--image-opts`` is specified.
 
 .. option:: --cache=CACHE
 
-  The cache mode to be used with the file.  See the documentation of
-  the emulator's ``-drive cache=...`` option for allowed values.
+  The cache mode to be used with the file. Valid values are:
+  ``none``, ``writeback`` (the default), ``writethrough``,
+  ``directsync`` and ``unsafe``. See the documentation of
+  the emulator's ``-drive cache=...`` option for more info.
 
 .. option:: -n, --nocache
 
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 26ffbf15af..6c18fcd19a 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -135,7 +135,9 @@ static void usage(const char *name)
 "                            'snapshot.id=[ID],snapshot.name=[NAME]', or\n"
 "                            '[ID_OR_NAME]'\n"
 "  -n, --nocache             disable host cache\n"
-"      --cache=MODE          set cache mode (none, writeback, ...)\n"
+"      --cache=MODE          set cache mode used to access the disk image, the\n"
+"                            valid options are: 'none', 'writeback' (default),\n"
+"                            'writethrough', 'directsync' and 'unsafe'\n"
 "      --aio=MODE            set AIO mode (native, io_uring or threads)\n"
 "      --discard=MODE        set discard mode (ignore, unmap)\n"
 "      --detect-zeroes=MODE  set detect-zeroes mode (off, on, unmap)\n"
@@ -552,7 +554,7 @@ int main(int argc, char **argv)
     bool alloc_depth = false;
     const char *tlscredsid = NULL;
     bool imageOpts = false;
-    bool writethrough = true;
+    bool writethrough = false; /* Client will flush as needed. */
     bool fork_process = false;
     bool list = false;
     int old_stderr = -1;
-- 
2.25.1


