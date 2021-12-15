Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F59474EE8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:11:37 +0100 (CET)
Received: from localhost ([::1]:38936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxHtP-000116-UA
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:11:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHng-00027u-AA; Tue, 14 Dec 2021 19:05:43 -0500
Received: from mail-dm6nam12on2076.outbound.protection.outlook.com
 ([40.107.243.76]:25056 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHnd-0004x2-U9; Tue, 14 Dec 2021 19:05:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9dUJqquZ+i65i0WBOsprquF2CdmQlINaa8lx3OHVB9SLRejAp1KweSBEipM4zIn5p2Xn923A48dFxYY2f3yA3aXhFTxN1FaaAOdHyTxjAvourCLXKDW3U5/6CybvYyA+ePThptE6jnpmkF8QZBvlBfEulYR+IAtSq/10lWrzjwrwbsIz5LREszGdMEXaisD7i3yhsmi9sBONjretkFIL+FY8irFyZ3/RBZMowbbFIIlmYgg9tquVvy9npqYAeRcjUBjApadFwDQPtXVhtoOJojJXOMABRDNBH++gMlDGu8tMlxoWA0oS5DRQ7TKZUl7309ALABo5kKo52Tmm+Cs1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PL2Fdo3wsZ5I2F1oEIRNaFaaXPvQiwop93qVTHcORUQ=;
 b=jrdy7lsZChOCTqtqpG5ZvSaaNXT6s6TPsD7dvJsLuBdvm3M4FCqe17Sv+lgZa/IyqVgKoRWrVa4Yl+qHhD9oBxlRoSZ/GBuy7yL1xURunJ+bTneZxJQ3AqxQBMbumdRHFdON6CIcv0LdwlTNONdSRvqUrzd/rbr3a7cGEKXyWt2+NvbLL90Tk+2nO1W1ytxXWYUlTF0nQJvnSizrR4SRD4NJpw69L/+imE7E5U2fZYG+h2IFamB3FEbv3Ou1Lfr1xLwQVJ72QLt4lqXWL25LimdAzyb+tfZMcSkjNVrQ1+XTO3NNN2/r5dlfeYqt9DGMvsttpkfs+WxE2xqg7U0HZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL2Fdo3wsZ5I2F1oEIRNaFaaXPvQiwop93qVTHcORUQ=;
 b=UzU8rXJwu7ysR7pNtjNsfhNaumvNQTQewz6874YLw7LItRfMNbNJ/oERD2IxWX/CIQ2gtovAxKJBfpaWzfIlBRjZfEXGHICY8UfDnVMo5kQAv6gzeGMxzi1yQUe3XDXLB028o560H4zjwPHquLWby+X/Tv5V4EO29GnPk8WDczQ=
Received: from MWHPR18CA0032.namprd18.prod.outlook.com (2603:10b6:320:31::18)
 by BL0PR12MB4609.namprd12.prod.outlook.com (2603:10b6:208:8d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:05:30 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::2a) by MWHPR18CA0032.outlook.office365.com
 (2603:10b6:320:31::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14 via Frontend
 Transport; Wed, 15 Dec 2021 00:05:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:05:29 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:05:28 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 14/47] plugins: do not limit exported symbols if modules are
 active
Date: Tue, 14 Dec 2021 18:00:52 -0600
Message-ID: <20211215000125.378126-15-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ac2c4095-1fd6-46f9-64d8-08d9bf5e9b1c
X-MS-TrafficTypeDiagnostic: BL0PR12MB4609:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB460947FCECD4E5FFBD919ACB95769@BL0PR12MB4609.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KMiOfwMMImjx/ygXpDk4GVyza6X61Dt3WZ9vzNhwDdreri7G/PfQ7qvrtHS732c4VZENlMYAM/rnVRqIWCALLXW0xD3PRaqBdf208h4O41DPvGAO/y+TziXPk9v6Hy57Nls8ddsWE9ij37q0pPHe5xVSVLOEQgx93j+gXrYwJSFLB9dlBbPgAcE6QrHAMI7Liien7MMMYXTeQzvoC0dbXegXOqr/7di4VgZW+a50ioGnRNQrCaiyj6N5sFtHtX5hCLnM3UTs+gefhP2GmwRJyyOH+SRmI63xbih5iF0AmR6oJFoEe1QCADtzHXByEv26owsuPOpYT9Li0dbOA2j5W/vdmfQwnFdk52T/6hzODIUunhXnEoyq20i+J7fBBy5iTaFEuAldhAE75KirGbN1+rIGu0q1bOoV5Z8oNvP602ERTBC7WnKPxc7VMtuJQIYgXgzwxzgkVnZPwlPLEt7VlArw1yOwejX7LCEtau1A45+VenvM7QYRQcpTb+6J5OmDvINp++9IYf7trtVxAdYqojpXPkGrioa7VCVeFkOg4FeXrwQDpfu2YJ+ofw/mgaUT5fijIpvsx7z8W/ssGUxGQR1wIv5IqFbyfBG86dy1LZzR2NyS7872C0H8pDtwfizmkejg96XWrGfbxqQW2GWPP38cnX3IpfwZawkURJQkcOqznY5A0FF6hLn+98UAKPDPV5VTLen0Jf5VDstUyFvvcs/zPTCEua2RpYsRLPei6nS/sy/Vb5JLcCiXih5k3SWBOjA8HES5YOlkhU3+K1D/ePR175WmFmKXr3YaWTBnNzGgUQLu7VeNssbIxWUss5kEswKF+khTwD2kuW0rrIXxKTuQoFunHVB9C0CjPeuI4oQECA7klCCQVX4e8UofPaOB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(86362001)(966005)(2616005)(1076003)(54906003)(4326008)(36756003)(26005)(8676002)(5660300002)(186003)(2906002)(40460700001)(6916009)(6666004)(8936002)(336012)(44832011)(83380400001)(81166007)(356005)(36860700001)(426003)(82310400004)(316002)(508600001)(70206006)(70586007)(47076005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:05:29.8077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2c4095-1fd6-46f9-64d8-08d9bf5e9b1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4609
Received-SPF: softfail client-ip=40.107.243.76;
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

From: Paolo Bonzini <pbonzini@redhat.com>

On Mac --enable-modules and --enable-plugins are currently incompatible, because the
Apple -Wl,-exported_symbols_list command line options prevents the export of any
symbols needed by the modules.  On x86 -Wl,--dynamic-list does not have this effect,
but only because the -Wl,--export-dynamic option provided by gmodule-2.0.pc overrides
it.  On Apple there is no -Wl,--export-dynamic, because it is the default, and thus
no override.

Either way, when modules are active there is no reason to include the plugin_ldflags.
While at it, avoid the useless -Wl,--export-dynamic when --enable-plugins is
specified but --enable-modules is not; this way, the GNU and Apple configurations
are more similar.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/516
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[AJB: fix noexport to no-export]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210811100550.54714-1-pbonzini@redhat.com>
Cc: qemu-stable@nongnu.org
(cherry picked from commit b906acace2d4f68b6ff8de73739a773cc4851436)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 configure           |  5 ++---
 plugins/meson.build | 14 ++++++++------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index 9a79a004d7..7659870810 100755
--- a/configure
+++ b/configure
@@ -3187,9 +3187,8 @@ glib_req_ver=2.56
 glib_modules=gthread-2.0
 if test "$modules" = yes; then
     glib_modules="$glib_modules gmodule-export-2.0"
-fi
-if test "$plugins" = "yes"; then
-    glib_modules="$glib_modules gmodule-2.0"
+elif test "$plugins" = "yes"; then
+    glib_modules="$glib_modules gmodule-no-export-2.0"
 fi
 
 for i in $glib_modules; do
diff --git a/plugins/meson.build b/plugins/meson.build
index e77723010e..bfd5c9822a 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -1,9 +1,11 @@
-if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
-  plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.build_root() / 'qemu-plugins-ld.symbols')]
-elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
-  plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.build_root() / 'qemu-plugins-ld64.symbols')]
-else
-  plugin_ldflags = []
+plugin_ldflags = []
+# Modules need more symbols than just those in plugins/qemu-plugins.symbols
+if not enable_modules
+  if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
+    plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.build_root() / 'qemu-plugins-ld.symbols')]
+  elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
+    plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.build_root() / 'qemu-plugins-ld64.symbols')]
+  endif
 endif
 
 specific_ss.add(when: 'CONFIG_PLUGIN', if_true: [files(
-- 
2.25.1


