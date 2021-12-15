Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE72474F12
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:24:05 +0100 (CET)
Received: from localhost ([::1]:45972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxI5V-0008CB-2q
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:24:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHu2-0003it-Fk; Tue, 14 Dec 2021 19:12:14 -0500
Received: from mail-dm3nam07on2045.outbound.protection.outlook.com
 ([40.107.95.45]:43009 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHtz-0005ip-WF; Tue, 14 Dec 2021 19:12:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcJUPYuasYqUlZN1nES3M0auiQGPohTG+GvrIsCy+KGgQQsPdRqhshD7z5wOffW2a2514z2Th4/+HdBqjm/TBQAy/JHJw9Z4rpoX0SpeguK0gNWxTXVV/PCXL5qzBBstswUBN1fZa97eaNZbMVGGptoAFlc5X83kNlSy2bYgzJWIdfpSFklcc9k1TZvKBxzPOCUPSiMhNhwLtPHkBkWDL9vX4I2nI8vLRkL8t1at0WOS+Tm5Aypm0XIQRrbDve5KuNZ1EZSCRqI48CpxtndbGv+UhKRRmnZpK04hQT5QNYYZkeBVY/9nVgkdSCj6zkGVjflaAE6XjZmhBRQxHYFI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzHw6xVcP7JPT9KyWOihzF5g83dU2a2sHZZIZT22jvc=;
 b=Q09DKlyEtO5cAubmzxBB11ijfjePqhUFj5MQ91BLM2FOKb7hU6cOGxL+w0siOrnvLn2Fx981skQH1U/lEJVzxnP7B8lYuX5OF+7JKOhPGZKdMy7D/OYbGtl6m6F1/egK1yBtEgnAdnII7mCuCWREslclBiTm/U59LS+tyrwDYWfLEN80SSTPgJ9PfKNiVxNOexbZjhWZq7dkDlM2+XAQ0s4Fo0B4wEf+PlDirHdkXDQlk+VDCY3r8+CTOeaopG8tx+jvDZJpi5dlCjT2vACk6egK08rbbjHcZzBHPI+Qr0omTLrnlpoyXXL1LbX5wJ8k3Zc5fazuQhZqT5leJuVpEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzHw6xVcP7JPT9KyWOihzF5g83dU2a2sHZZIZT22jvc=;
 b=g/VpG4ayL0zPXnJqnWol3zyHcQBnZdmVxYvCxiIXidmxwEpnZnJhQfBnPh+qrYneKebBqmXw/AZfEuHu7t025u2ULb6Nyv0cMYDduBwj9UWPfLncQQxYsiaVZVJ/RXh31rlimqF8tMlH4CJF2dmu0YPkY4b1OU0mev/TN8sNIJM=
Received: from DM5PR11CA0003.namprd11.prod.outlook.com (2603:10b6:3:115::13)
 by MWHPR12MB1775.namprd12.prod.outlook.com (2603:10b6:300:109::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:12:07 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::61) by DM5PR11CA0003.outlook.office365.com
 (2603:10b6:3:115::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15 via Frontend
 Transport; Wed, 15 Dec 2021 00:12:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:12:07 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:12:06 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Mauro Matteo Cascella <mcascell@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH 31/47] hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in MODE
 SELECT commands
Date: Tue, 14 Dec 2021 18:01:09 -0600
Message-ID: <20211215000125.378126-32-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 008ae836-6d87-4994-0b00-08d9bf5f8805
X-MS-TrafficTypeDiagnostic: MWHPR12MB1775:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1775B1180CE48CB2A6C03E3D95769@MWHPR12MB1775.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:51;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6A2MUMLiIZjphnWouBImdTJIzJuWVYEsRnI7dXQH2MHAi0xXFYtgcuoQMBm/hISnMisLgnS9DCe0lFUWFKrLDl1/2cSf0wC61kzmG2VyvHQy72skjkvSGATsXjk8Sq5jcs+aHh+oV4SE0TMiNjR/ea6VY5gPKY6DsRsyG4S9G/fV89sxbRsZWjkTRN1k9QiJDo3SR9cDy/jGWntGhUkUgSAJ+UyEbnuACWD1RvridstHV6qTJJvlhZnJxm6a/+sSfNfoXhH1HwPZHLLumddPEwpW+bg4X920HIQHDcN0XOKK2gJEsTUuS6+2xmeFqHBg3GnJCXtFl1LPRzy6QQvRAOEa1Xbn76YJjLG1JNVRNUwYCNL9NDa4jdKZncMrwj06jRLprsCTBu5qecmxt9fy916fNqPlTkfMuEawFDiqEiQjmSpouh24vfd3l5zDM73pCILPyrTAca/pfmxQ4eAa1jl6lWCQdinLZLHg1BGR7YuCBWRcKM4WgTIk6az4nTNuxeoNM+PeMJ+iPFZ0Ga+OrPP8CuTIJojY7lgOXsao1x04h5alekqwAYOcNcG+n0MH5Jv3RNfSNpgjclqcEWjEHSvpyXwWoTwzBljk9NEbNegy//dzZFlwzGg5ZtjIB3HL+6MRvX7Unv5+patz7Efu5ArOrYJcaAZVkZU2ML7Nr27Oi4hI/gbakIDYyyjrd0OcotP3BDux9iJRje8puITVJf5dc5Pqh4Bhm5Tsc39+HfiEki+NVT1v47RsM2mxPSRyDIOkPNNZL7koOV/AZJ0SaFUmWpbLgFI996rMYbICLko=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700001)(44832011)(1076003)(54906003)(8936002)(70206006)(70586007)(186003)(16526019)(8676002)(2616005)(4326008)(36860700001)(508600001)(336012)(40460700001)(36756003)(316002)(426003)(26005)(2906002)(82310400004)(356005)(45080400002)(81166007)(86362001)(5660300002)(6916009)(32650700002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:12:07.3413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 008ae836-6d87-4994-0b00-08d9bf5f8805
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1775
Received-SPF: softfail client-ip=40.107.95.45;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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

From: Mauro Matteo Cascella <mcascell@redhat.com>

This avoids an off-by-one read of 'mode_sense_valid' buffer in
hw/scsi/scsi-disk.c:mode_sense_page().

Fixes: CVE-2021-3930
Cc: qemu-stable@nongnu.org
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Fixes: a8f4bbe2900 ("scsi-disk: store valid mode pages in a table")
Fixes: #546
Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit b3af7fdf9cc537f8f0dd3e2423d83f5c99a457e8)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/scsi/scsi-disk.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index e8a547dbb7..d4914178ea 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1087,6 +1087,7 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
     uint8_t *p = *p_outbuf + 2;
     int length;
 
+    assert(page < ARRAY_SIZE(mode_sense_valid));
     if ((mode_sense_valid[page] & (1 << s->qdev.type)) == 0) {
         return -1;
     }
@@ -1428,6 +1429,11 @@ static int scsi_disk_check_mode_select(SCSIDiskState *s, int page,
         return -1;
     }
 
+    /* MODE_PAGE_ALLS is only valid for MODE SENSE commands */
+    if (page == MODE_PAGE_ALLS) {
+        return -1;
+    }
+
     p = mode_current;
     memset(mode_current, 0, inlen + 2);
     len = mode_sense_page(s, page, &p, 0);
-- 
2.25.1


