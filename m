Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442D96DE63A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 23:11:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmLG4-0002Rr-Kc; Tue, 11 Apr 2023 17:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pmLFr-0002RP-R2
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 17:10:21 -0400
Received: from mail-dm6nam10on2042.outbound.protection.outlook.com
 ([40.107.93.42] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pmLFo-0003kI-PX
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 17:10:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jegRTeJSpZuE5Q3pTyaHRqHQvGxMY6P+irT7jYSVekWN5rAyXxR1So/cwGjL5Z/MnE0/jDfYXl1Aw2mIV+DLEgOhpsS4n66xuv8Rzht9Scr7ACfDjQVBlkMGgC97Bhf+QtA3vDbt/WPC5xcanZ280jYCW82zAxdI3wpqXFvdVO73ROJJbZiGvvWQhmEar6PpXkbsqNDP86EQ8lfgN0GAwa1Rg1MvGv+4Z96tFmELn2OnNVjv+I7lm2S7NyKuaHwKzQxc+nf+YMczgy37zVJhMiqA6gpYFUGO1jTvOW0lns0UDiUn1H+WIwKySbu6KBIFOnwqD2ZB6AxqNBUmzd3C1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyQCgywzSPQJgk3l7gPLyp/Wd2+MwFaNmcvT4lvITlY=;
 b=VTXEPXu8h5R2+ITRNrw9ekN6qqrpfoelBZDfFPTJ0hAAW6a/iI6RDagUQaNhSMdf9ses+zqkHjDdLrwnDIPpfMoLhb0JqlepZLPa9pXrnRKCN/VhmzNvCcSBUjewg7W0a/7m3+5yz00Dd5KphnaVof07SNeLsyXsbecRdKsGlgysZqe/3JV59pg5OHfEqxT7ROI2rP9VjGeTFkVLGCGKxymmB99gUzHBYGqChSNoKgmWw5NM7Nu3z+bYZmkhUmLpsWwPuulDT0zzgp7c/sqgfS2knxKidJhKNxM7bx/NKlBJiq+tbLtqQCGSXWgwp/Rd7zge/yknwNn33GDTIbs/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyQCgywzSPQJgk3l7gPLyp/Wd2+MwFaNmcvT4lvITlY=;
 b=HIAOrlOoPf1lOufdYmhQtb0i+ul2zvBLxwuklWzGQSL6JdKDRU4mtCJcC4HOM6kZqEok146MDaD30EKcnw2MngI74Kq+jNzxTk51XcACqXWJ3Xz536mXij8irfBlM6W+/9Dzi67z18xq5lDIlMnGuC1o7xrUlpGklhpQBZb3Aj0=
Received: from MN2PR01CA0042.prod.exchangelabs.com (2603:10b6:208:23f::11) by
 PH8PR12MB7424.namprd12.prod.outlook.com (2603:10b6:510:228::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Tue, 11 Apr
 2023 21:05:10 +0000
Received: from BL02EPF000145B9.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::5a) by MN2PR01CA0042.outlook.office365.com
 (2603:10b6:208:23f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 21:05:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000145B9.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Tue, 11 Apr 2023 21:05:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 16:05:08 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 16:05:08 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, "Wainer dos Santos
 Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: [QEMU][PATCH] gitlab-ci.d/crossbuilds: Drop the '--disable-tcg'
 configuration for xen
Date: Tue, 11 Apr 2023 14:04:22 -0700
Message-ID: <20230411210422.24255-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145B9:EE_|PH8PR12MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c46b70e-6ee8-44ab-b23f-08db3ad06f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RN1w/NXEhX5pXZwc0HtFOl0/F+RYHwjclG4S+a/RqRG+m2nbAQvVjY0RovoCmHqlNh968194MTBhC8ECFgct7SZeAKkYmXNDYR6Ed+GdrjjpKwAyPqTbZxtufa5NfTsgwHuCuE5ATlLeYv5qrD153ip4g1bZ9u/Sfw+lekGksvzeE+zcQoRI7yGsrZ/zMEX1TkKTi6yF2e82W8s6vMF7v0zC6MEdK+qnam17685sXlJMJA7xNsyTXfiq7fMWmiR+Sja5J5DR+bhJCKcxr4OYpPH1Xke8pIwyrUQM5OIBYy5NXwUWGdikmY0iL852sUnToJNrtwXfopbV1suD7UQPxvYyFo0bO2FdPlB6qQIlGrjnOuZNhg2Z0/E//k0rfyV8WZ6bKqJ9+3lIlpcIkUOCPQaVX/un8OKG4M0I7YFDtZGdnVPAx9JX8pM2ghicaZllNtWLx0iIuiub3FGTdvVepkZMTZv8HuEcstlyxcXap3aIbEcC0isVJSNDc3w98DnExBh7J6Ojg1jcQPeXpfZOZ4xa5F2PIyBlGhbec2MTYNqjFib1b25Vn0vMuoOvro4FouEswSpVTs/t8qcZyDy9sCmzF1/gzD24iG1OcMKpQd6erYBY6CkxaULL5hsd38LltVg2MvYERXYDPe6W6G153+nrbpZZI+p2wXS9pNFt47zy+Iwb5fSjPmqJ+attx+twCbNj8YQM+J6uW6ZG3KoGX/1U/RMKdOCqXt38WG1azuA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(86362001)(36756003)(40460700003)(40480700001)(26005)(186003)(83380400001)(1076003)(2906002)(966005)(336012)(47076005)(2616005)(6666004)(478600001)(426003)(8676002)(70206006)(4326008)(5660300002)(70586007)(54906003)(6916009)(44832011)(4744005)(8936002)(316002)(41300700001)(82310400005)(36860700001)(81166007)(356005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 21:05:09.2841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c46b70e-6ee8-44ab-b23f-08db3ad06f05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000145B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7424
Received-SPF: softfail client-ip=40.107.93.42;
 envelope-from=vikram.garhwal@amd.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Xen is supported for aarch64 via xenpvh machine. disable-tcg option fails the
build for aarch64 target.

Link for xen on arm patch series: https://mail.gnu.org/archive/html/qemu-devel/2023-02/msg03979.html

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 .gitlab-ci.d/crossbuilds.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 61b8ac86ee..6867839248 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -186,7 +186,7 @@ cross-amd64-xen-only:
   variables:
     IMAGE: debian-amd64-cross
     ACCEL: xen
-    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+    EXTRA_CONFIGURE_OPTS: --disable-kvm
 
 cross-arm64-xen-only:
   extends: .cross_accel_build_job
@@ -195,4 +195,4 @@ cross-arm64-xen-only:
   variables:
     IMAGE: debian-arm64-cross
     ACCEL: xen
-    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+    EXTRA_CONFIGURE_OPTS: --disable-kvm
-- 
2.17.0


