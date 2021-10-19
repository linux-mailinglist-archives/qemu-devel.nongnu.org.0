Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6334339DF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:11:04 +0200 (CEST)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqlb-0001qr-Vn
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq47-0007Dj-7b; Tue, 19 Oct 2021 10:26:07 -0400
Received: from mail-mw2nam12on2072.outbound.protection.outlook.com
 ([40.107.244.72]:12224 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq43-0003HS-7B; Tue, 19 Oct 2021 10:26:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bcxs37UZeme8co4FRxXyzH7J1A48ux+mRFApRlk27lFxBLJ/xxi9nTgi/WHtJ/AEB9u36wmflikUePn00chtsTU14LuIiZal8aGk/FDvyHEpk+rrv1amjBJ8qEkFO9XhxbOv//pxWkAO7FDkZLDRyXGc2wHxPPjZHLbWVG3OpgPi6an/D1JcCxY/ZkNIdKtFBHRgRai9/06BixIXSUc8e/87xQaUI3nGwl/E0i9GM3PUP0AHsIV7TCTjMRODlkfXgui8GwYXpJsHQvt0qp2RyHNTbIZXf394kbyErit3LsR5A3/l2BSH24MpCCk+fG6WoPCFuJatiIFAuokiBLLxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhWt7tNuSrejOvZcy9qkdPspCjUiO+8CallbDCs6Hl4=;
 b=ZNqfUnHA2SlOg9m9SIuZKrxVpZtR8VHn9KwdqqAHCfX+I0tZQMiuMvoCgcWREmyMAqWOoxHOotFCHSlBBsj/t0+fmg8ZHeNFnh/Hxp9RqFDLxPdnAJ9GPqBylXofkLZooKFgVrHJIfofXiYXErnq6YB8FxsBgHAs9kS5IYclMG7XOkcNyF8LfGoLZFeoleIZPg1ruyNWINyHOvFk6GYKeAEtBETCCXtqD+R7UbUlqhPxRvyhumyKwFDMiNZ7wxPRjmmmexZoM5HhIvbuOFHix+K6emk8o+1gc0pogPVt7zixt66yHir5NyIyS/mxbmVS1e+g+C1Vkw7l/5qBQ9Lj1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhWt7tNuSrejOvZcy9qkdPspCjUiO+8CallbDCs6Hl4=;
 b=pXvQY/APeUgmJnilNN3L7PRO966vzo66YevCcLCdkUtdcbv2D51wQ5r3cWjbIQWdNn5DStw+HQiBVCGAu8wKbc4YAKNQvaFyGuwofzUaxmhc6L46BofMjX8Xly3ortoFD5Vexm6zWl9M8kTfQeo7SQ4CgO4rAx4QQnt6RROGROg=
Received: from DM5PR06CA0065.namprd06.prod.outlook.com (2603:10b6:3:37::27) by
 CY4PR12MB1270.namprd12.prod.outlook.com (2603:10b6:903:43::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 14:25:58 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:37:cafe::98) by DM5PR06CA0065.outlook.office365.com
 (2603:10b6:3:37::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:25:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:25:58 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:25:56 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Igor Mammedov <imammedo@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, John Sucaet <john.sucaet@ekinops.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH 38/64] tests: acpi: pc: update expected DSDT blobs
Date: Tue, 19 Oct 2021 09:09:18 -0500
Message-ID: <20211019140944.152419-39-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 69231292-93b0-40a6-9f9d-08d9930c5e70
X-MS-TrafficTypeDiagnostic: CY4PR12MB1270:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1270DC6BBA6238FF1F0F5B2895BD9@CY4PR12MB1270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HQOlwIkTcOzMAzP5cVsrhP3j53ZUtPFtfVj/UwydUnmb7nbV577GwET+jR5+wdsPTTgJa/XPiRTEF1Vd0JG1cwGrmmkOZ3YUdfmhlC/RJKJkYXuckuhN+k+rWz4v6mKeXSfCkd9Vf0wHoejbfkM7S1ILl/GUA1PJbMvvHceU28Bxvr94KYywryFztLLxWWzXGCTJbg4/NqteSQv4DG4d9uB7gNe06EvUDIRu6Y8TFD3BJsCQrXAP1e/McEK3VPDm5gjZ/uanBG/eaGqDjmIC7RFdq2mSV+yzAKe5cDkfQzUDA3uxedVvOePkZ7JDVG3DIs8OchCo62JdYndosFsuOZNr10g7IxpqXrPBcvJ8t71xEjMDBm+zF3u6WzJdEIvlqUq0atptUdxVCQtkHc1gUHzumxDBz96B4By4qod3vztCF6jdEWcoC/BVG7REC2xzQpQGmBF2GHugu46TMTxkr4WZrb2DUtfywr6/Jt7bAN4EEekJZ9uXZxG83hdhhdBeLraPNGVWgAS6PS74Y419I8m/V/2B39gERLE3ukczCrsV3Rq0ZtV8Q4yt3Hf0SPlMAvsEoK5R7WLD6sW+dKccUSLeAJ+fUZS7LMhG4LPHECzCsk23dU7QSgSWaPrL3oXHj8KXKo5rVcMzdr9wKPS34ihYWfMAtN2zovuf2Ey4whfVDXae49tw40ee3nrYT0u2A2e491O9wsX9CJESb8UeUWfNrayBl5s8RbhJvzGnvnE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(5660300002)(2616005)(83380400001)(4326008)(6666004)(81166007)(70206006)(47076005)(36860700001)(2906002)(1076003)(70586007)(316002)(8676002)(6916009)(508600001)(86362001)(426003)(15650500001)(82310400003)(16526019)(336012)(8936002)(36756003)(356005)(26005)(54906003)(44832011)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:25:58.2176 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69231292-93b0-40a6-9f9d-08d9930c5e70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1270
Received-SPF: softfail client-ip=40.107.244.72;
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

From: Igor Mammedov <imammedo@redhat.com>

@@ -930,20 +930,20 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
             Device (S00)
             {
                 Name (_ADR, Zero)  // _ADR: Address
-                Name (_SUN, Zero)  // _SUN: Slot User Number
+                Name (ASUN, Zero)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

             Device (S10)
             {
                 Name (_ADR, 0x00020000)  // _ADR: Address
-                Name (_SUN, 0x02)  // _SUN: Slot User Number
+                Name (ASUN, 0x02)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }

                 Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State

with a hank per bridge:

@@ -965,10 +965,10 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
             Device (S18)
             {
                 Name (_ADR, 0x00030000)  // _ADR: Address
-                Name (_SUN, 0x03)  // _SUN: Slot User Number
+                Name (ASUN, 0x03)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210624204229.998824-4-imammedo@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Sucaet <john.sucaet@ekinops.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 40f23e4e52f6188036062abea432560e5cdd239a)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 tests/data/acpi/pc/DSDT                     | Bin 6002 -> 6002 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7327 -> 7327 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 8668 -> 8668 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6466 -> 6466 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 7656 -> 7656 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 5969 -> 5969 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6074 -> 6074 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7361 -> 7361 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 5860 -> 5860 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 6008 -> 6008 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |  10 ----------
 11 files changed, 10 deletions(-)

diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index b9dd9b38e4ef720636ba19ccbdf262de8a6439d5..cc1223773e9c459a8d2f20666c051a74338d40b7 100644
GIT binary patch
delta 61
zcmeyQ_eqb-CD<jTNSuLzao$F*B3?$v$+f%^5{|*4e$h={EWw5b@f`7vE<rpD3``6h
Rj+58&N-{cbKF+(E695!d5Lf^J

delta 59
zcmeyQ_eqb-CD<jTNSuLzQEekv5ie_eaHt={WI;YDAupC-LxXsZct@8Y9tH*`29Eg2
PYk4IZ<2N7YUCjvq#N-aK

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index cba5a1dcb0464e56753bc0b931a4dd2e3b209787..2d0678eb83277088b156d386067429b0f29f9338 100644
GIT binary patch
delta 100
zcmbPlIp31YCD<ioz6=8cWAsL@`9j`~!J&Q(BI5Bb!M;380)S*jW>&USu&WP9BD%?o
fCD_m)o+IATC5VTCfr)_wB+SKxRm0{lLaR9eXLTFp

delta 62
zcmbPlIp31YCD<ioz6=8c<KvB7^MzRBgG2ooCff;1iF>gG8yduO#5=kK@h~tjF>rvS
QxR@rdlak#0LuffC015RFTL1t6

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index a9b4d5659457f6de30b993962bce673c9413d81d..77778c3a69946efd501e7eff0a73af309b553f13 100644
GIT binary patch
delta 73
zcmccPe8-u~CD<k8jv@mCW6wse5?)5f$@RPv5{|*4e$h={EWw5b@f`7vE<rpD3``6h
Yj+58(N&=Of<TV76zd`KHqI}1N0R$Tq1poj5

delta 71
zcmccPe8-u~CD<k8jv@mC<Bg46CA^IBlk0gUCg0~{6Y^pSHZ+Lmh<9`e;$dK5V&I6M
Xyq;GQsNf{8A&~qHVs94ZJ1z_W`ZyF*

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 8d86155e275aa688f8767dd92c4b9df08b4a18ad..af046b40b0a150b4ab1e113bd9d77912c707074f 100644
GIT binary patch
delta 61
zcmX?PbjXOyCD<jzNs@tqk!d5B6F;NlWM6&>3CG}2zvw0}mS97Jc#e2SmmnSn1||j$
R$H}$)l8la<r}MAo1OUh?4t@Xt

delta 59
zcmX?PbjXOyCD<jzNs@tqv1=oj6F+NwaHt={<cIuHLS8Jvh6eE*@s2J*JPZs>3>@*3
PYxyM^<2O&|U(E>s%3KcC

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index e00a447f92b27f9a91be802eb11fe89dc0457e20..b56b2e089017f933f8a3089c4fd2389fb8ef1e40 100644
GIT binary patch
delta 100
zcmaE1{lc2dCD<k8g)9RD<C~3KFND1vgG2ooM8xA=f_-_G1OUm5%&csuU{@cIM0ArE
fOR%9qJV(5vOArqO0}}%WNSKQWtA@?CBC9z80jwPB

delta 62
zcmaE1{lc2dCD<k8g)9RDW64IY7s9OZ!J&Q(lleuZ#JyO84GrQs;vHRrco-O%7&t&u
OTueYYiOmioD>wlr;t!7i

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 5d8ba195055f2eda74223323baeb88390ea36739..bb0593eeb8730d51a6f0fe51a00a00df9c83c419 100644
GIT binary patch
delta 78
zcmcbpcTtbaCD<h-P@I8*aq32{B3?$v$+f%^5{|*4e$h={EWw5b@f`7vE<rpD3``6h
fj+58&N&=M}=QUshDdA$C+{i1!=(t&k&z=(iB>@v8

delta 74
zcmcbpcTtbaCD<h-P@I8*@!>|UB3{<`;7~t?$&P$dLS8Jvh6eE*@s2J*JPZs>3>@*3
b*YZj-#!o)ZYrqCl#>EU&C%0Le&x{iQ&x;Zm

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index 01e53bd436698db6f6adfff584ec56cb99074a5f..2e618e49d357ae1d0ac20d822f71d676ea90f2fc 100644
GIT binary patch
delta 53
zcmdm`ze}IXCD<iompB6hqtQmLUA(N0!J&Q(lOOVlFgi}Y$1BDL;&U-U1UB>Yt>y#(
Dp7{>n

delta 49
zcmdm`ze}IXCD<iompB6h<F1WdyLegSgG2ooCO_npn*5kokPXD+Vghm{HVg5s-~<4L
CZ4W5`

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index b8103799b45224c08344369931b87cf3b7797d7e..c32d28575b967aff40afb9138822ecd3186dd4ce 100644
GIT binary patch
delta 65
zcmX?TdC-!}CD<k8pbP^8<AjY|2ZdN2gG2ooCNm0)NPt+;O<pX)h6eE*@s2J*JPZs>
T3>=P={|HGkI&KydUd;&rQ4bK$

delta 65
zcmX?TdC-!}CD<k8pbP^8qr^t8gF>wF!J&Q(lNp6YCOe3*33;&u8yduO#5=kK@h~tj
UF>u6B{v#v_lw#Q|DZGLc04$Uc4*&oF

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index d4f0050533f970128774f825274177096a46c3b8..623f06a900d12500d2197d101f76f6875e92ed64 100644
GIT binary patch
delta 61
zcmaE&`$U(^CD<k8i5LR|W5!0VCp?Ufli%}5NH_+E`b9T+u>>0$#B;<ux&-ksFfcK2
RI8K)5m1K0>Y{|Qt696|m5IX<>

delta 59
zcmaE&`$U(^CD<k8i5LR|<A;r0Pk0#PC%@;Bm@Lo7CgjBuY-kYA5%1^{#KXYA#J~|h
PS)NytF@Ccp?`lo}8wn4|

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 8632dfe8a8bdd991871a1e633162eb9a2e1497ea..f0a3fa92de94f55d5406f0fafce331776dbb0317 100644
GIT binary patch
delta 100
zcmeyN_d}1%CD<jTLY#qt(PJZ51+TYbaHt=Hh<Ln9urJS&03ex>nU(Dn?CJxOh;H&?
f2{tr{=ZJT73F2X3U}E3^33D-F)v)<2?`lo}e)Jpa

delta 62
zcmeyN_d}1%CD<jTLY#qt@xn%~3SQRu;7~t?$@BT7#JyO84GrQs;vHRrco-O%7&t&u
PTueYYiOm;yS8xIVCQlHc

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 6c83a3ef76..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,11 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.nohpet",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.hpbridge",
-- 
2.25.1


