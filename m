Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD09A433B35
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:51:49 +0200 (CEST)
Received: from localhost ([::1]:53450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrP2-0002Xp-Rv
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqCk-0003tJ-R8; Tue, 19 Oct 2021 10:35:10 -0400
Received: from mail-sn1anam02on2047.outbound.protection.outlook.com
 ([40.107.96.47]:9535 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqCc-0006N5-GO; Tue, 19 Oct 2021 10:35:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnc39U4ubIGG+K7jpT5PnguCD1DO9cg1cbryGqccUNd9uXg/MbfPWeT8NzU7k0GdFCqjkYSFe3g5bqZWJQ+9daoCb9bbAwMJ7LxZQ2sv8SFJB/OfMmKzIrxGuElRaeWGkKYbcOjo7pPSTh9boTJUuroUxGnXvN3TmPVUsLaRI+hSTS1j+9tmbgOVWorcFR3THG/kr+oBowRTVFO8r1OSmnDAyR0Au8A3e/QaGMz1/MOwa8C26ePP4izrk1XGscv7PEbbSm1/li6bKzsN1yD6Loi4jduvCASOq1QJ7rgVQzMzw/jUqIjBRUkd4m5glgYWduPu9QrnAH18stn2wcyFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSOzh3QuuMbQNrtIdS0wRlK2s8CCHS4uN6LNngsVoR0=;
 b=HqowmUrpI5c6lF6aDlNFlCvtIRhZLIkEAoulrOHBI0k8bzB7jnaQxd8nQU3tychd7OhAxe8VgDnI0TnDK+xQ8xphVBIg5QgLa6y1piDYB38guyrfeopP/L7J+vLT2W0mwxRMbqBtDge2wjLem2gc9zctnDqqMor9gIy1pWj2oroVTFk4uJG+w1ZpaLzvggAim1KcvHQx71TXBg8m4e58SX1MnBiHwv1u+mr+wLUnZ7/zvCpIR1sVKYG/2f/bLMNeEbGZphWfhmRRleWHCJYID/m1Zqa8Rp7/1C/I+obzrfVAMf0qWVORfc4XoiLl35uZ+avMCHXWPpDWdzvfXjk/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSOzh3QuuMbQNrtIdS0wRlK2s8CCHS4uN6LNngsVoR0=;
 b=na+SDvRo30vJp+WdFKjRy7PhS8YROEon3l/tUdxvRQDnFmgsw4csfvN7boTZoD9PsadH8liDbmeBNzdUrWi+vto8BHtkNnhdyHVXQedlF10j8gyvtRS1ZFsBPaj6bMrn4l9FvTlkMTxSYcBYsJu3HZevVP6KL2/hKPtg9dHkGFs=
Received: from DM5PR15CA0039.namprd15.prod.outlook.com (2603:10b6:4:4b::25) by
 DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Tue, 19 Oct 2021 14:34:46 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4b:cafe::d8) by DM5PR15CA0039.outlook.office365.com
 (2603:10b6:4:4b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:34:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:34:44 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:34:43 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>
Subject: [PATCH 60/64] vhost-user-gpu: fix memory leak in
 'virgl_resource_attach_backing' (CVE-2021-3544)
Date: Tue, 19 Oct 2021 09:09:40 -0500
Message-ID: <20211019140944.152419-61-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6bd865ab-2611-4acb-66ea-08d9930d97d8
X-MS-TrafficTypeDiagnostic: DM6PR12MB4171:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4171CE5D830C15174B841E6D95BD9@DM6PR12MB4171.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:343;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bSe2JJp4sDjqrh2wzz5vkiCmJIcSp4l95GtDe3O5cvyVxBv+52bWgYQm41Gk446L6yQ8WhPUcX12cnNgIGUvshpEPm+4M22/l45UQP3giM4zlyOLm+He57g4i7FWehpw57NSvs2o4O5Q2h5jakmqYJigJsSPwhB7H2QcsuWH9icr5kbBqQNRMyyudtOBydS5uiA8W5ax/0rJv3B10av499KUHMW3R5vqHG2ZRh5CwSR84EIa72+fjwIlJ0CzgM3Hr+5rU3K8qreDl68ETbnonfcQvDF3SolIt8YQSmlVLLViomLDJk+9j2otC++64eopCTgWqqx8vTlRIydu27ta08vOA2Pmwhfb1o080pfwBYiOZ0SqXc+Yws8LwoUHzwzrNBhz+fALAI93lH9G4emCXBC+fE3RRMODtsIg4R3KGZuWmDyEyKgkZjVrPND5VdYTgctNWMQg+EMtteaev+NQO1CDx1lQmFps3TBveu9zyPdzLRSGVQ/avczIpD97ZcBzeYcqgLt/nnok3g8Y10X/DV18j0JkMy1D3O4KMzhewTOwHoNAis2qdA0k3VdH1Hptu+6cVGV0Cegrx8ViGKAvzJEnSDWr5To256BdgwPW1AoaMSeVXhbdbVxVf6X019JYLJCT5nUsND+Cct0rKzvM4CQ/goObZjDsYwjGfHs4wBBPGMo8xWEsJuyORiDYb+fGDWWGPIZnafJfbSoox2H/bNHYyugILozznu2G++tRlT8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(83380400001)(5660300002)(2616005)(36860700001)(356005)(82310400003)(8676002)(81166007)(4326008)(186003)(16526019)(8936002)(44832011)(26005)(1076003)(70206006)(70586007)(86362001)(6916009)(2906002)(336012)(508600001)(426003)(316002)(36756003)(47076005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:34:44.0245 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd865ab-2611-4acb-66ea-08d9930d97d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
Received-SPF: softfail client-ip=40.107.96.47;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

From: Li Qiang <liq3ea@163.com>

If 'virgl_renderer_resource_attach_iov' failed, the 'res_iovs' will
be leaked.

Fixes: CVE-2021-3544
Reported-by: Li Qiang <liq3ea@163.com>
virtio-gpu fix: 33243031da ("virtio-gpu-3d: fix memory leak
in resource attach backing")

Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210516030403.107723-7-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
(cherry picked from commit 63736af5a6571d9def93769431e0d7e38c6677bf)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 contrib/vhost-user-gpu/virgl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index c669d73a1d..a16a311d80 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -287,8 +287,11 @@ virgl_resource_attach_backing(VuGpu *g,
         return;
     }
 
-    virgl_renderer_resource_attach_iov(att_rb.resource_id,
+    ret = virgl_renderer_resource_attach_iov(att_rb.resource_id,
                                        res_iovs, att_rb.nr_entries);
+    if (ret != 0) {
+        g_free(res_iovs);
+    }
 }
 
 static void
-- 
2.25.1


