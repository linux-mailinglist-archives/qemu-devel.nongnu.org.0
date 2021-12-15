Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530F3474F66
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:41:46 +0100 (CET)
Received: from localhost ([::1]:33828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIMb-0004Yj-30
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:41:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHsq-0001ix-8d; Tue, 14 Dec 2021 19:11:00 -0500
Received: from mail-mw2nam12on2080.outbound.protection.outlook.com
 ([40.107.244.80]:26272 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHsf-0005cZ-PM; Tue, 14 Dec 2021 19:10:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6Wl3uTC0nTj9FMkWsfvi6rPltuBGhuTxpmu3CgcHWYsnPE8KLmji+9tZUKWbfkK3WfMWPL4slWdYYVhEleWBZ/yMyqpxn0EW9w/LwYb8TIlgwfgCBYMzR7lSEWOIygOdFvbor4wI1328WfTt44YKf3G3i6AAXWk1JQlp/doBYIaSIdWAU3KGKEBrOGsNGtKN8P4kVZLX79AjwiR1ZFbHW67USjKtPKDJX4hf9Sg0VDVBKueGqEVP4OmDugPaB9NC2qqFwJF2Ke5XKWq4VytIVpV8j726QI6sglWehLao50AdFWSoFGvEqI04RkJnVKA4DLtfh3wu5Ke9aCoLDIjUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nFAYyG/zwx0dsf/QQOoIjCAp60iDyS+FBdQhppE09M=;
 b=MCFI5GZzKPSeXGloixCloyYrEDgOwGpS+LMMoxSTiYeLLhZAy0gGkGHcIwS5Tj3qZrTeYLwHSPYvDPughwltNldUIG7Qn/WV/Ab+GcwvinPICPAKYQHb2GqrDxBY2VAiO8dZ/UahCNxndcFFJOD4feJ0m9cDBMg2h5c36kWSFkpDTG7dTSLxK+Kvr83BE1W+qQvnJPOYutb6oBaPgsJge0Mic1Mt8wtv4l/0gZwq/4ksXTZ5ikj5Kai4yR65AtONiGaQg3s8N1jxeMJvdCvQuN+kKWHRQOrbR5ZjFgp1cMcwyZb7ACB2etMWGdebfvwTG84ERvPlWAV55HYsI/Jvug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nFAYyG/zwx0dsf/QQOoIjCAp60iDyS+FBdQhppE09M=;
 b=em5n/5Fw4fP5eFFI0xfHAjqJjdWznK485GjBnIg8iCNk2jHHPZC+Z30+hJ/1QRUZMTKbdQc/vexOL0hNIH3Jpkk05QHkqnO/1oXUXz7Ufn37fquOGc1k1EW3tztESko3+rniC0JjUNfXCuU0+5dvjYkz50yvM5ZrZXgDZ7o+WxE=
Received: from CO1PR15CA0055.namprd15.prod.outlook.com (2603:10b6:101:1f::23)
 by BN7PR12MB2724.namprd12.prod.outlook.com (2603:10b6:408:31::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:10:44 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:1f:cafe::9e) by CO1PR15CA0055.outlook.office365.com
 (2603:10b6:101:1f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:10:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:10:44 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:10:43 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Jessica Clarke <jrtc27@jrtc27.com>, Christian
 Ehrhardt <christian.ehrhardt@canonical.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: [PATCH 28/47] Partially revert "build: -no-pie is no functional
 linker flag"
Date: Tue, 14 Dec 2021 18:01:06 -0600
Message-ID: <20211215000125.378126-29-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7de5a28-fca2-4d1c-2dc3-08d9bf5f566f
X-MS-TrafficTypeDiagnostic: BN7PR12MB2724:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB27248677CB84ED55A621061E95769@BN7PR12MB2724.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AAeStbqGihALXyuG6tpLSwn8yZfkcaJ39S9nEAEJDvsl0lS7dB88HmXnz50uH7cRxhOCrt9ZHjmO/LH44aUxznsUi5MZTJ0HjLJr0EmSBViD0GzUHRvIB7BhVq0rzY4q5sy5Sfpj+a8Z2E6JwtvbI8XpcvxGxELmVUBjtI0DgEfBNgr231L1A1a6cgdOBEgBHVNGD+E50aLHFj/zW2RpJZV7ftVYC59AaVRuOMT4rYoa2ivnSkxHZn7/38Sz8ZwVVdIaUNFnRJ6HUJMVNFIkIGemXV+/lN+2fQtJUMsUNYrM6iohAzskf4pQiUtrryFpEWUwBym+UXuovfx/uwHduYaEPyrYY7uEtGYAbi4PT8Spoqo1xSry21b2mWCoyM5Re6sXSTEnsnSTDiYFCP+GKBIccKZ8c2rwmG+h4ZkOUYIVcqYlbF16iavT4HubfDo0EA2SuSgBptmUFZELjYJ0b0LsXOTxNckvV8zL8wkVYnTY3Oxad1HVi6T+VQezMrE3/0315j97IihzSVqLHcfiLVirkfUCeiwRWpC/yV6/Dw/VbbHOlhSgfhxNg0KiVBAWMywMlLojf+oysXSq6wSaYeEqM4ThtDtRmdvm7bfUZL0GXa77M+cWDBTnOnQ/YsVa/RdQFicSch/50pVUXNl3oHg/k30OY6De/Gb2S2JvUUs4Mn5QyCRE2fi9Jk0y5GOiFx1pV87gU/1k4pFWDqcaGJRiVb67xK2elMzGFSPpW0oJnXwrwTAg7MtJ2yHFkD0H4hZ4g4GSaECevAMi/j84e0XfbLKLD2znx1lxjKR2ZzQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(16526019)(40460700001)(81166007)(47076005)(186003)(26005)(6666004)(336012)(70586007)(426003)(2906002)(356005)(82310400004)(508600001)(70206006)(86362001)(2616005)(8936002)(6916009)(4326008)(54906003)(1076003)(44832011)(8676002)(36860700001)(83380400001)(316002)(5660300002)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:10:44.0998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7de5a28-fca2-4d1c-2dc3-08d9bf5f566f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2724
Received-SPF: softfail client-ip=40.107.244.80;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

From: Jessica Clarke <jrtc27@jrtc27.com>

This partially reverts commit bbd2d5a8120771ec59b86a80a1f51884e0a26e53.

This commit was misguided and broke using --disable-pie on any distro
that enables PIE by default in their compiler driver, including Debian
and its derivatives. Whilst -no-pie is not a linker flag, it is a
compiler driver flag that ensures -pie is not automatically passed by it
to the linker. Without it, all compile_prog checks will fail as any code
built with the explicit -fno-pie will fail to link with the implicit
default -pie due to trying to use position-dependent relocations. The
only bug that needed fixing was LDFLAGS_NOPIE being used as a flag for
the linker itself in pc-bios/optionrom/Makefile.

Note this does not reinstate exporting LDFLAGS_NOPIE, as it is unused,
since the only previous use was the one that should not have existed. I
have also updated the comment for the -fno-pie and -no-pie checks to
reflect what they're actually needed for.

Fixes: bbd2d5a8120771ec59b86a80a1f51884e0a26e53
Cc: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
Message-Id: <20210805192545.38279-1-jrtc27@jrtc27.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit ffd205ef2901bd65fcfbd09a98c0ff7cfcec5e4d)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 7659870810..6e308ed77f 100755
--- a/configure
+++ b/configure
@@ -2246,9 +2246,11 @@ static THREAD int tls_var;
 int main(void) { return tls_var; }
 EOF
 
-# Check we support --no-pie first; we will need this for building ROMs.
+# Check we support -fno-pie and -no-pie first; we will need the former for
+# building ROMs, and both for everything if --disable-pie is passed.
 if compile_prog "-Werror -fno-pie" "-no-pie"; then
   CFLAGS_NOPIE="-fno-pie"
+  LDFLAGS_NOPIE="-no-pie"
 fi
 
 if test "$static" = "yes"; then
@@ -2264,6 +2266,7 @@ if test "$static" = "yes"; then
   fi
 elif test "$pie" = "no"; then
   CONFIGURE_CFLAGS="$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
+  CONFIGURE_LDFLAGS="$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
 elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
   CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
   CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
-- 
2.25.1


