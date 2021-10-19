Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A5B433A00
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:14:47 +0200 (CEST)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqpC-0001Ya-8Q
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqDE-0004HN-UC; Tue, 19 Oct 2021 10:35:34 -0400
Received: from mail-mw2nam12on2050.outbound.protection.outlook.com
 ([40.107.244.50]:53633 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqDD-0007IC-19; Tue, 19 Oct 2021 10:35:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwvOCx/COomg/cn1aDcv6VtFc2F90Pfb7zwIm+n+oRty2Nj7k1gdhiFuBhaueCrOioHNAph8e4aXuho/fq6E/mxxcH9Ur2/0VQxz57WHsy9OdyJ+lvYGN5S3Sh/LNMB6ereis482/qtVgoI6pqNIM0l3uqxGp/FBFlnhsWeZteH2FBBCp2rI92CKso4Zd8jYgFP/BajijvvXzYaaOqs5nDD0yVf54vnQ0O5zWn2TQv8NDRLnOJC2pu2psSvNQLQoSG2nqJyiEa+Oavv571ChGi6eETTYeTNQZ73oc32YQb3aovsm+YGhERzwqRJUjlJ/LlxUWMprpXl7OLtCIyFEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLxbo4PI4U0+zJlTkmS42jfaDc6aPBF6mkXGfdrs+ak=;
 b=YUGMh15GSFIBPZY4KzthF9QMrneH4TktWmj03SJKr/JMAPsDq/Cj06ULYj6xcjjhT3/uw9tkeqfjrZIt2m2XXLwMQZ+YlHVyL9ef834bknTruP4aOfWkak5R3Ec5Z/iKjf4a67XoYh5ULr6tahXZZBjGyfyvY/PB01nKmBQ+21yNhKr0/V2MXr0tEEcLP1vIoB5S+CQ7rrSFHL/9RwmxVNzyNFMl5mNQSygCCqQjp+WPYXV1g3X2kZdkWrJ6BBqp2PW61knt34b2qbphMD+IWZi0nrghJX/fnXn8jcXgJNaQJCjibfgDs/DaORoXfSwbrlQCdDfkyxh1xVoV2Fp5KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLxbo4PI4U0+zJlTkmS42jfaDc6aPBF6mkXGfdrs+ak=;
 b=iTNQDnJLqf9AqBx09JoJRFUz0TJ4WhDm1tu2fnkoimyqkKFmtgHJ41xGZeSd/1a0cF5nTnH5OIaql446ErsCKg0eiv+eYsTtgV3MxeKqvM3YaEG/ovRqNzvVzVe6h6MzsVzyJZj+UJwL4aW8fbR1kdtIfshvd9RB/5GI2qKYBVM=
Received: from DM6PR10CA0020.namprd10.prod.outlook.com (2603:10b6:5:60::33) by
 BL1PR12MB5110.namprd12.prod.outlook.com (2603:10b6:208:312::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 14:35:26 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::15) by DM6PR10CA0020.outlook.office365.com
 (2603:10b6:5:60::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:35:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:35:26 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:35:25 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Li Qiang <liq3ea@163.com>, Prasad J Pandit
 <pjp@fedoraproject.org>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
 <marcandre.lureau@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 61/64] vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'
 (CVE-2021-3546)
Date: Tue, 19 Oct 2021 09:09:41 -0500
Message-ID: <20211019140944.152419-62-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7ba6676d-3f1c-4b31-0e0b-08d9930db118
X-MS-TrafficTypeDiagnostic: BL1PR12MB5110:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5110CE19B2B43228AAF3254595BD9@BL1PR12MB5110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: llnTloY0ahCiDVcvcofE9k8F92PDpPlPm1j4ao2HMTljrxf8kBVTN9C8zmD2bZC7NxlOhn96KmGpFQF+h5BLibepZWb9l/pIosdM6wxLjcWI9TKn0pBiWl127thSTxV2yYZMTH5Z04qyLqUrXG4eKOyL3Y5v5OZNp2Mjx5vSYJbni+zD5vvZ4WMJjZNtjt8IljIFYC8EtjMQohpBLKZSr4E3kBluEqFOXW41qkGDzBbPqObc2BPz9n8gz0vFA+YpRa77x7ZcCvTEBzv+KSR1pqPYfQxEEFYJ3uKV4ubTLh/Mwldp+5BnTfai5OfnEAasIajN43TANkOKhRJNz3SPhOwpczavPJCNGi1Bl1LFqGyVLmgr9amMxn6YWURd+zMWXLf6GxiP2DcARWlaTCAgralv9b3kBLp7m9GlyRFpS97BRJ8efjGFIWxuil6dzranfQEKyLyG93gKqoRSOppZWL8Zv5wOE4RXS98Slh6fG3jf1n/YkZibwWSOPfjz5Magb43F6vuSOFAN6D/cAz8luzLoXUVhbZTu7XhYOoFd/B3mNWU9DnRyXP+QrLGCBiaOXvdZIFQDOXw3oDPrs/SKCM1R9Y5Rm8j5cudcJecNJqzerHPurbWGk5H4EDonrR23AtmjzwGpecpO3y/u8WO8GYS167XG73GQtVvUTqmZoMoW122VpEXatYhlvqHE6vtwYr5MPgr5rHSflLzrl9q/peV4Ov9zGYDyg7TephI0TW4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(36756003)(6916009)(82310400003)(86362001)(8936002)(5660300002)(54906003)(336012)(8676002)(2616005)(1076003)(426003)(26005)(6666004)(47076005)(16526019)(186003)(508600001)(4326008)(36860700001)(44832011)(2906002)(70586007)(70206006)(316002)(356005)(81166007)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:35:26.3837 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba6676d-3f1c-4b31-0e0b-08d9930db118
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5110
Received-SPF: softfail client-ip=40.107.244.50;
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

From: Li Qiang <liq3ea@163.com>

If 'virgl_cmd_get_capset' set 'max_size' to 0,
the 'virgl_renderer_fill_caps' will write the data after the 'resp'.
This patch avoid this by checking the returned 'max_size'.

virtio-gpu fix: abd7f08b23 ("display: virtio-gpu-3d: check
virgl capabilities max_size")

Fixes: CVE-2021-3546
Reported-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210516030403.107723-8-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
(cherry picked from commit 9f22893adcb02580aee5968f32baa2cd109b3ec2)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 contrib/vhost-user-gpu/virgl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index a16a311d80..7172104b19 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -177,6 +177,10 @@ virgl_cmd_get_capset(VuGpu *g,
 
     virgl_renderer_get_cap_set(gc.capset_id, &max_ver,
                                &max_size);
+    if (!max_size) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
     resp = g_malloc0(sizeof(*resp) + max_size);
 
     resp->hdr.type = VIRTIO_GPU_RESP_OK_CAPSET;
-- 
2.25.1


