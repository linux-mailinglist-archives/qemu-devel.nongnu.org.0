Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2509F433870
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:33:41 +0200 (CEST)
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqBQ-0008E6-8G
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpvn-0002lz-DF; Tue, 19 Oct 2021 10:17:31 -0400
Received: from mail-dm6nam12on2063.outbound.protection.outlook.com
 ([40.107.243.63]:31745 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpvl-0002vd-1v; Tue, 19 Oct 2021 10:17:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBzseZcyrwNdFEZC7wdv1KYraMQXkA2nrtxLFSuY/mVeIKPfIQP88uQRAHAwx2Fv3nyzjOtIqKwUZPiRNyxgpu5uQzyKJ8ifzZMFTRiNf1IiXe2ckz+k+d7tUD4U4c7s0A0/CvPgiWXGbB7paLyFjSXmWFqys/knGtqX8+Yo/GVNyv7+iW9mMtLkFWIfB54wDXO7t+iDAAllNi3fSGd9QogxouewcIqPPzk2hDfTzTXgP77gtg/ymH+B910Arj4it4vKbWoVHkF4vwAaGWAqJJaIlkO7OFA35j9xPzBVVsbcUOCX3ffa2hD1PcGKzwu9tfmcsMrl2rKNPBKcWL8Z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jY09/SatjM0SFjBkgU0qtNTjL0xLtEfXlZXdX7/JqUI=;
 b=QP6VZo335ohm0ihFo3eV7AfPdwvjnNZtu6/EqaHAgO558YWgT4OsFpMsN3tdy9VHnQZgE+V9SNuzw3ROs7Id1FVDHkTzyhh/TYGjfZljAdoOQk6jxyuG8oUD8AssHNqD1DMRjjf+QwCfzvq4QSgnvo0Pqz4lP6hoPWVrWuaC54d60S78uZMybggnn+SkAiOqXLtIChl2ZeGp1X9pxbrkD0dYfiWhA/2T/LJcNCui/K4hVgJuC0Wgrx3TrLrAdS69p/Dr4CcRYATnMctPIY8TIca7pfGQxYJ40zhyqUpUb0Q0cyQO6K6OXcYI4YettYynWobgawFTzZUDu5/kB4d1QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jY09/SatjM0SFjBkgU0qtNTjL0xLtEfXlZXdX7/JqUI=;
 b=1D//neUfGDLBj346Aj6WkzROHEPgmvkkiIv9DiZIJxAF8W8PTDTEd4S5O/4hGwtc1yAx8BjxQdp52weycg+4XGx9BGFUbbNUQgNRGBfXVnvb5FKPR4811Z8Et4zzweVW5ld1mYGfZ3zGyLqL8bp1/mH34NgKXzsJCzIMRpaoNkc=
Received: from BN9PR03CA0392.namprd03.prod.outlook.com (2603:10b6:408:111::7)
 by BN8PR12MB2867.namprd12.prod.outlook.com (2603:10b6:408:99::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 14:17:25 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::89) by BN9PR03CA0392.outlook.office365.com
 (2603:10b6:408:111::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:17:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:17:25 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:17:25 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Sebastian
 Mitterle <smitterl@redhat.com>
Subject: [PATCH 17/64] configure: fix detection of gdbus-codegen
Date: Tue, 19 Oct 2021 09:08:57 -0500
Message-ID: <20211019140944.152419-18-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed6e2179-68a8-40cd-1a22-08d9930b2cea
X-MS-TrafficTypeDiagnostic: BN8PR12MB2867:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2867BE4A19CDB38F890C479C95BD9@BN8PR12MB2867.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukJmwAONs6V+hlHn7SBetlc9TyF0DP+6jNe6kRaUZCZynSDswCJ33BrCgAUBAV7wJKaAbYveOtzsrSqegZp8nAuL1scyvaYPfcDIhfr4aZ6DicipSV8tWCUwHRC5ve7abUbZ82LeiV2LzbLik533XpsgWAtQsqKnlqszQW6cr+2f+9vMyc3id5jfeE4G4tzFQ0WMU7CpG0Sp04VeyOD+/2/3EJp471si6pBmUbP3qnyHVU9xdsMqbIZVKiHuhBySRldW5Bhcfnqn3MSXZi1Lpg3CNZM9pQ+g/OFrLnomuN8KoJtql/BNyn9ie3N21GgSXbY4Ix77yfQm5Zv3ERp+ZNwZwkCtUMFPL4KcpAq9/NE3zCfCGiiERJ5k3+p6IoShnbI/PS9Mhqc83uLJESld15zJve87d03tlqtiNHMGcxEp2k4FE02uGs9Qg1RYcNORYlclEiXlHZLc6tpHUSbC2p/KZVi/ugNn7ys2qE+EP4FZTsfV4SNmQnSnRw059jlHj1VCt73jORMFkMT5dtVM3s03OKKY4lCgV2xykIqvP/hnF6yf6QzcNmZdIk6QWeaBjGMxavWcP7KmwMShmmd3SzL4aBE60MvYrIP+YgpFIqQ1D8bVM2Kbn1BtgF2BqDzP9c6NCfZ6Szt+7ZWRza7zeLE+n7r1ZRSPRGJDOjfPKW8EQx0M8wdFqMdEc+4u964tjoYrIKa3CjsRFtWMQB1qbKB/cJ8l/7QCjyMm2zEOcbo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(6916009)(54906003)(82310400003)(44832011)(6666004)(316002)(70206006)(4326008)(36860700001)(2906002)(47076005)(1076003)(36756003)(5660300002)(16526019)(186003)(426003)(508600001)(336012)(70586007)(8936002)(86362001)(81166007)(2616005)(8676002)(356005)(26005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:17:25.6669 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6e2179-68a8-40cd-1a22-08d9930b2cea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2867
Received-SPF: softfail client-ip=40.107.243.63;
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

From: Paolo Bonzini <pbonzini@redhat.com>

"pkg-config --variable=gdbus_codegen gio-2.0" returns "gdbus-codegen",
and it does not pass test -x (which does not walk the path).

Meson 0.58.0 notices that something is iffy, as the dbus_vmstate1
assignment in tests/qtest/meson.build uses an empty string as the
command, and fails very eloquently:

../tests/qtest/meson.build:92:2: ERROR: No program name specified.

Use the "has" function instead of test -x, and fix the generation
of config-host.mak since meson.build expects that GDBUS_CODEGEN
is absent, rather than empty, if the tool is unavailable.

Reported-by: Sebastian Mitterle <smitterl@redhat.com>
Fixes: #178
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 5ecfb76ccc056eb6127e44268e475827ae73b9e0)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 configure | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 4f374b4889..7c321662ca 100755
--- a/configure
+++ b/configure
@@ -3331,7 +3331,7 @@ if ! test "$gio" = "no"; then
         gio_cflags=$($pkg_config --cflags gio-2.0)
         gio_libs=$($pkg_config --libs gio-2.0)
         gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
-        if [ ! -x "$gdbus_codegen" ]; then
+        if ! has "$gdbus_codegen"; then
             gdbus_codegen=
         fi
         # Check that the libraries actually work -- Ubuntu 18.04 ships
@@ -5678,6 +5678,8 @@ if test "$gio" = "yes" ; then
     echo "CONFIG_GIO=y" >> $config_host_mak
     echo "GIO_CFLAGS=$gio_cflags" >> $config_host_mak
     echo "GIO_LIBS=$gio_libs" >> $config_host_mak
+fi
+if test "$gdbus_codegen" != "" ; then
     echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
 fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
-- 
2.25.1


