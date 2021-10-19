Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D144433992
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:01:49 +0200 (CEST)
Received: from localhost ([::1]:45142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqce-0004I9-8l
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq8Y-0006Ea-Ct; Tue, 19 Oct 2021 10:30:45 -0400
Received: from mail-mw2nam12on2074.outbound.protection.outlook.com
 ([40.107.244.74]:47841 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq8L-0008VY-AB; Tue, 19 Oct 2021 10:30:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l//rWa4qVgQudv39VcK2pXoLolRS0Adse+JUUv/zrNVAqOeSyvoK1F27OtcbEW3BZuX9IERu0uJKCpfLKsgP35FyhyGnlBk9gQ4vvEH0U9U8Fh+UxgY6pdhVhwAzAL1xFuuYgEazfYIXbfuxFL+8iSAGqQt5lFeMhYi2iUAiqKZTaj7DhcqOtA/BXtm8BsxQSlueHBWBPwHuufWXLbcmZLVQIw+JQZIi7Vn6MBIJ+5xFFCYlJMQXB+hCElfrNRVOxS47pEx+2e9GpTUSE832Qu2wUnDUirC6PDZkS8Vel5xZfksX4Aa5oLUc9UjZ4EMWsT5mD+F3s+UnuQnNDOOVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7t+ouPu5WYI+gHy9SAAMmKg863mI9sae+/3yPLcA3M=;
 b=A0TpK5ofjC3rvm/57h0HGOUMJ3Xe+1ranxU/zdqaYXyVCTe0iSA4lUR0AQrrC9YDxBdmQ7uJ2qfIycIzPKjgDGaPnD8RM3OEbWK38upiAiC2FeaD+BByT++B32K52ORaFmoxVVVod0zpinUrbHLQDNL1ulnN/J29jAS+15F6tNa6JUoQZ1HcEir5GmQ63tUnosMuJPELEytYRW2racYffqFw//SM/0jetBcZlHUc/Mne05uF4gp8Nsnq7btG1BKuvEwtHrQrRt7HoN2DnLgm7JMn+IQJTUWPciQF+CwJ3XyQfp6E4xLZ+WoSF/s89NKQ0Fqb9ETqoV42HIkAWPAdbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7t+ouPu5WYI+gHy9SAAMmKg863mI9sae+/3yPLcA3M=;
 b=VnwmHWYJpTx8VvtJI+1x+RUVwNf3tAjPu7593Zxya+KFXkP9WVRgNvX4ZqNvAQngWfPaOw3nDkjOLYcdaKEnViRhpKYMCr7ieUzvtgRifHFg5NgI6cgIk4L4I4/EXC+t7VJ4pcFq95Hwz2G7j/6czOUR+aaEeBF2osMpnVVj66s=
Received: from DM5PR2201CA0017.namprd22.prod.outlook.com (2603:10b6:4:14::27)
 by BN6PR12MB1890.namprd12.prod.outlook.com (2603:10b6:404:106::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:30:25 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:14:cafe::1e) by DM5PR2201CA0017.outlook.office365.com
 (2603:10b6:4:14::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:30:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:30:24 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:30:24 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Nir Soffer <nirsof@gmail.com>, Nir Soffer
 <nsoffer@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH 49/64] qemu-nbd: Change default cache mode to writeback
Date: Tue, 19 Oct 2021 09:09:29 -0500
Message-ID: <20211019140944.152419-50-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7cb6190-5d77-4054-71eb-08d9930cfd6f
X-MS-TrafficTypeDiagnostic: BN6PR12MB1890:
X-Microsoft-Antispam-PRVS: <BN6PR12MB18901359259BF97E245FF1C095BD9@BN6PR12MB1890.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:473;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BHPOfoMHBinKdE/LV2OHF3i7uK0T3oTpahDItvcwhlRCYOzEb/iBv36kgH6rWbJHmKf/S39jF8bVK+03LpCHvbmVV9uyOsVjw97yAWSxQrRhj5DpUGCsA1u0KF9S4uDnblFjohj/Kty4fFVmQNAILFIjo0tBS5dzOWuwg647NmSMsePtg7dYpI5JpIat2CrF6qweo/fz+Cpe7WV8AycgKPiAVBwSvZuY82z5y8FQFYsNW3gA0QZN1tRuBQvclcPCq/sSXZ/tyBpWBvOUX6g4kfYlkxp4+Uq3TRstr/SgHuhVqWlMcgYz1rPSG21f8me8M/3CmqwKMouTmGLc/puGLEY5u1ENwwnCo/jqeY2ThrPrurYY99cpjzS6+4FLygR8qukeNpxk2N4r74ng4pp0byd9zxIOOKqNyQh5dGlCdCtBT23Lj5QgbX9eQ1FhYwCogakmAsJhFDsvcPBDzFQYDu2myxcsCiVaN0oL+OTCxu8tE/LobMFt8uJ8y4n7sbaBeXKQ+etjl38kbepN2onohCpDCjAOSisZy79UiloF1iUuRVVYu6WlR96P7m39Pd+Bv1C0mNoODW8ZdpgNpV5nnYoq63gcnPR40z43YSU3k3EHDllg7N3lpUo1PReSdtxyKCE5fajDlgW8nrnhnIXpIB1ixtY+CAMNPnYFBhJtjJoqLtCtA+XENEbQXJecgfBmycfdnPcYRLwqBG//tnPDDeuCTAE+rhq4RhftfLwyOIrRWRA+09aqOIuEoYeWluPODwj2cW3bYZcxZuOJurR+vFjcM4SX2bsCYyN9nTv70fIat9KiA3g56U0tva+CHIv4XnkE6pLVqv1bbUCLeNudI2VBpxj+BMp9Q978R81sI00=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36756003)(54906003)(8676002)(186003)(356005)(16526019)(36860700001)(2906002)(966005)(70586007)(5660300002)(426003)(6916009)(1076003)(86362001)(4326008)(336012)(316002)(83380400001)(47076005)(70206006)(2616005)(26005)(82310400003)(44832011)(8936002)(81166007)(508600001)(36900700001)(33290500001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:30:24.9676 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cb6190-5d77-4054-71eb-08d9930cfd6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1890
Received-SPF: softfail client-ip=40.107.244.74;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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


