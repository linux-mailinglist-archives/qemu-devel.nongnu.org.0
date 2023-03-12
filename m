Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF3A6B6400
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 10:24:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbHvs-0006jc-6C; Sun, 12 Mar 2023 05:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ray.Huang@amd.com>) id 1pbHvq-0006e8-Eb
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:23:58 -0400
Received: from mail-dm6nam10on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::61a]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ray.Huang@amd.com>) id 1pbHvo-0004RS-NK
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:23:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5WasJ0N6AtkzlAEdfLdRimGurtSACTjd2MnIQgCLUdH5kOSE/PNB1Vde2xqu9OgvIAX9p6RagrP9uyVArEIC3vdZ1ts5Hl9XY+Mop0wNAvmJIV7sIoLjjXumSma5gkVVF+g/da8XQvmA+lKN/Ffq+lTerbNCn+Faxl/jL4gOeBQatTuweoAO/ewYaACV7QBGY56fEQPmDHfBlmx8dNzukJrxjWsTC8uPry73s90/ajMSlLm0rg11i1nnFk9kZ1vNlkHrn2VVpe1uXx3Y1tF065JDnaLOLxwOcpbU/zp35kzYYNJLNKu4rItWFon03X0v3c9UuSELJPSNgzxEdekHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkxk9X0Q2z4haQr1xkk1k3YakU7Si0xG9dEUMHaqay4=;
 b=I++Js5U0CIK5nmamk834IwgW2rtM1+9Sy8p3nS8UcEOL1DbjBJujwNceNtuiDLXlHVoxX9ofn/UKGQpoRxfxkyCy3v/0NygsSw7POHNeho1GjRAm+wInjW7Y5W5dNSZV3Ozkbqwlqvl+1UNkJc+9hVcpScHIqFAhIFABfcwVEtt9VTfVsUB/uSQtFDYJfIxqOhESjbbUsHamQ3TgqTPEyqnYnwLnjad2r5rK9GCUt+mN9vpCGm9rDJUuoIfTDzwYNpm14rocVag/zuohMikWvACqkuHXhkzstJG2yDpBquWVaOQlhMSh3uQ71PQn/i5mGS65xdyeCXnmoIIfGKWODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkxk9X0Q2z4haQr1xkk1k3YakU7Si0xG9dEUMHaqay4=;
 b=BhxfFuXNjB9QTBGGOkTs356B/QU0ND9L/db4BSW5yoCiJF27ZcpTAkDBLgnOL9+kBf5icH5r6My7Tz0tUeMMv/U7BO3s8fTsXLaO+sFCKVASR078wsoQt34PBtLDgE9EyfthM9+hWpCUkGgWpT1ZdiSALKkSjWD6YWL6lFiWnIk=
Received: from MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::29)
 by CH0PR12MB5315.namprd12.prod.outlook.com (2603:10b6:610:d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 09:23:53 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::18) by MW4P223CA0024.outlook.office365.com
 (2603:10b6:303:80::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:23:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.23 via Frontend Transport; Sun, 12 Mar 2023 09:23:52 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:23:47 -0500
From: Huang Rui <ray.huang@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Antonio Caggiano
 <antonio.caggiano@collabora.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, Robert Beckett <bob.beckett@collabora.com>,
 <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Stewart
 Hildebrand" <Stewart.Hildebrand@amd.com>, Xenia Ragiadakou
 <burzalodowa@gmail.com>, Honglei Huang <honglei1.huang@amd.com>, Julia Zhang
 <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>
Subject: [RFC QEMU PATCH 08/18] virtio-gpu: Initialize Venus
Date: Sun, 12 Mar 2023 17:22:34 +0800
Message-ID: <20230312092244.451465-9-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312092244.451465-1-ray.huang@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|CH0PR12MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: 80ec8d29-17e2-4534-677d-08db22db7ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +xQ6NUWBgGTjalqIQj/mDDwvH1HiZKVP7/eEVBbnQZ1Nw2lUHuACKhTRjxlnYPUJ8Pg93Yw9GUWvykvpatNvah0s03kx9UnSbmo5o6Pe13u17hk1EaiRRstB47dTCAK6PjhvOZYvWutkRwdK4a1LZeMJ9DPgaoxhw0jrpBWesLQrIu/FjUapa8E2RIfIg0s57+sFYpd75dOXQHoL5YRLZ5jJ2Jdpxvec4zG6mOIfAB2NprSPUpFdYpMvSHXGIqKbr8t3+pC6foD3jPcH3relbTjtfSwz8u9KNsEmQV/mNj0iEMNOLlD8p0fCXFmxujEpTEELxViRpNzuQjZz3wC8Oay5MG47Jm+DnMzURuyXyPeZpiXE7I7WF5Qy40fRSnNFnq+MlTJ6P3hj1lv9CHu7NsuOFjsIAIAfjfwmGr6Pp8rc9MlVW9xCcj+pr0DJo9mQ11MUaTfVseyQIKKC8i/gR+VVsXxt628jQzjqP2ODHXvxEV9mlKBt59mGo8JeDKGY1g0n+Kxt1l2IrQeVFsXb+ky19kTP1J5wt/Kjyc6hR0Dl/WWu55RaZiYWhJmgXBh2IUsFUDK0fvsaCU6bqvmDmimg2xA4Kyih72mOmmGrsth/L2T3ikHvVRv32aGkBuumCjOZ2xQ+Z3bVMh0Bkx/XcxiU6R22IBV3a+qQX4uwjZdpa0QBw4hWsaWMNMOJ7ddk2xPLXVLiomPnsEGeYVYN89BpDWqm/GjK1xvKoWk6ltPmsjLZ72hmpBHvm2x97f+j
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199018)(46966006)(40470700004)(36840700001)(6666004)(7696005)(83380400001)(82740400003)(110136005)(316002)(81166007)(478600001)(36860700001)(54906003)(82310400005)(8936002)(16526019)(40480700001)(186003)(26005)(40460700003)(1076003)(4744005)(36756003)(5660300002)(7416002)(4326008)(8676002)(921005)(356005)(336012)(426003)(47076005)(70206006)(70586007)(41300700001)(86362001)(2616005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:23:52.4951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ec8d29-17e2-4534-677d-08db22db7ef9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5315
Received-SPF: softfail client-ip=2a01:111:f400:7e88::61a;
 envelope-from=Ray.Huang@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

From: Antonio Caggiano <antonio.caggiano@collabora.com>

Request Venus when initializing VirGL.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/virtio-gpu-virgl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index fe03dc916f..f5ce206b93 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -803,7 +803,11 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
 {
     int ret;
 
+#ifdef VIRGL_RENDERER_VENUS
+    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
+#else
     ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
+#endif
     if (ret != 0) {
         error_report("virgl could not be initialized: %d", ret);
         return ret;
-- 
2.25.1


