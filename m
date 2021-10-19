Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6369A43383B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:18:07 +0200 (CEST)
Received: from localhost ([::1]:55838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcpwM-0001qw-Ct
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpt5-0007Gv-72; Tue, 19 Oct 2021 10:14:43 -0400
Received: from mail-bn1nam07on2053.outbound.protection.outlook.com
 ([40.107.212.53]:54553 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpt3-0006Gr-7T; Tue, 19 Oct 2021 10:14:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyrr7lAgc1TFUSSdXg4+doboeEroIvd+TSTpik7FIL1ilcRi0xF3vLUIHIva9EKEMGUJe9qu/c23V966d0SCuB9OEAMa6z2frfeRc/PouxNYO2Dd/ebqGsdA1T+IEdLwSMjRxz/xm91vWesRXKkPBz2/6oPfZbBfyeEOvJhvci/OB9MGjAyWzJjbK9FxE0cZyP9fqQsW4whVOXwX5rIPhNGVjQceaK4a+4c72TDjVWZXxiQS2TiR5ByuDGzD51VTFl2Pg9oAS8bwXasuUjILuwWiT+y8FleVDfDNuNMOVdwN/dvoWzmF/UQQQ4Jt87BdvsdsX+qgTISoZ3ZBK9s01Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDMIuFwe2bQWetjAmiu0FRdO6bsMrNc6jbT71mf618Y=;
 b=dM5ZpOYYrfPPonaUuy2ndKAAMKkfm+kQo+XN4vptBJseSMzvxMGM3gplSltQiO50Rbn57mPkJa6v4CNfV8vF3L+IHprxKPHgwg4wGZClbbKkajS9IO/9HwKvCpQnuDTRXlPwAwdm57qyEY4qhQ7p3dVjO/gdR5YGmsH5dRWoxGtw2K9ViKqkrMGfX9hUKZy8BG7kXQB9dpqBHvK056mbeRcGG+5DaR194Xp0z11Qe/8FdhiNpYqx8tf2JpS+HxCqotUqqQQuMy6MCerKprw8zQt6J0f3CC7EuHxxJa/s0JmiEaHXK/noVbUUf9DPI+1x/m+XOnXhnwJc5duBVEAlig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDMIuFwe2bQWetjAmiu0FRdO6bsMrNc6jbT71mf618Y=;
 b=e5g1yV3yqNQ6B8cbKfG/tAN6QALLzsXwMcFj3mCwtJqN8FDinUkW1xxlXErqYZfpun1xBKK1eAwFWmnA1RkyBqkdHvMbAcO6N7mmmbko4uEC4ETrPi8G/JWCfROVlWJEOOmL95G4PU1szthLLP8u1iObNgunasYTtDAL9OyD1Ho=
Received: from DM5PR16CA0042.namprd16.prod.outlook.com (2603:10b6:4:15::28) by
 MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 14:14:34 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::46) by DM5PR16CA0042.outlook.office365.com
 (2603:10b6:4:15::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:14:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:14:33 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:14:33 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 10/64] qemu-option: support accept-any QemuOptsList in
 qemu_opts_absorb_qdict
Date: Tue, 19 Oct 2021 09:08:50 -0500
Message-ID: <20211019140944.152419-11-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: a6e55978-4ab0-49ca-ff7c-08d9930ac68d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4423:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4423A33A08E84D90794E8FFF95BD9@MN2PR12MB4423.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jILgjUMTR1wBkgGFo8dKMgILbMTXofuhQTQQkPjIKIU3aGIz9VzV1Dv8UZ64KTYp9R0lIGjctBT4it9gsuYeGYZg0j2QYjRBg0Z08EGuSKCq18TpiXzRxHuxENryV0UTq1rPsl3z/U0D5WnDkRRbcKE7F8gSj9qIOhdNWI0ex4PfiTSpWSx7sKgTnSs4o81hTKMu3J5F2nvINU8iq3RYMuseDkbY86zT6GoCsV+yn5/ndgfaOxvHSbulPzyL4a/B2UayqnZrRpHV5R5gau01EFUYSHIsLmdDxW3PogI93rV5QcnjSCH4St9kmzNM9xTXiX4Hnt8JyS2xK4mHY/DxFxSSgpz2HV1xekibVdwBrX9NbW2vZRq48oBjq89dyHvguvutYDvbFdwcSexzTYrwpQ0d1PUMIAkP36/T9iZO3qRDjzwNCsM6b7z40wwAp2ahobnlxHsENKq+UlYCCZQbKfOCljGkUpqhowGcq4Pv0a8z+R5JDgQG9jaMuGUoGgCjz1w/WkvYNXiWz58iwmnX8r1WFbHEAF6nSWi8cDafZaBHRRKbWIkTLjeieHMiJH7ItcSQ8OcWktOiPnpNwMPQJihHcq71veONS0zQh00jAmigWfm/SLtJVGk0cXyU91AUkNgNuXaJXYwYpHBwKRra9u4Swrp2LvE5WG61VDHXCXk1AvtaiF4eHzPhsY21WOGfivQsRERbn8XQkCRCIymL/jHGu/dKoNSoiBflRYC6+Hc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(186003)(8676002)(16526019)(336012)(8936002)(26005)(4326008)(70586007)(44832011)(70206006)(5660300002)(2616005)(426003)(508600001)(2906002)(316002)(54906003)(6916009)(82310400003)(81166007)(356005)(36860700001)(36756003)(83380400001)(86362001)(6666004)(1076003)(47076005)(4744005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:14:33.8988 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e55978-4ab0-49ca-ff7c-08d9930ac68d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423
Received-SPF: softfail client-ip=40.107.212.53;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit 941a4736d2b465be1d6429415f8b1f26e2167585)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 util/qemu-option.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 9678d5b682..4944015a25 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -1056,7 +1056,8 @@ bool qemu_opts_absorb_qdict(QemuOpts *opts, QDict *qdict, Error **errp)
     while (entry != NULL) {
         next = qdict_next(qdict, entry);
 
-        if (find_desc_by_name(opts->list->desc, entry->key)) {
+        if (opts_accepts_any(opts->list) ||
+            find_desc_by_name(opts->list->desc, entry->key)) {
             if (!qemu_opts_from_qdict_entry(opts, entry, errp)) {
                 return false;
             }
-- 
2.25.1


