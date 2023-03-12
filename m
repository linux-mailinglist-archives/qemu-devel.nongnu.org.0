Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE196B6407
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 10:25:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbHwd-0000n4-Vl; Sun, 12 Mar 2023 05:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ray.Huang@amd.com>) id 1pbHwb-0000ba-HU
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:24:45 -0400
Received: from mail-co1nam11on20613.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::613]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ray.Huang@amd.com>) id 1pbHwY-0004Xp-97
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:24:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyaruosxKMOHK/NgDOANwot/s+BJKTphY4jfG9PIzm6YW5z9tpD7Rh6SC3J3QnXVm//0Eo1oFWOrqC/gpxuE6kovtSDGsPI2T7sssPrRJLRH21cI4J6Jkybzo9K5DKLnXsHpvAEfcDYkbJyhBggf+3VMEb36rVonbeHItYBMRVisJe2XaeFxS76U1JZwClg0QPe4TlUg1sSc1MQQKOrG9K4Qn6IG/NrBzqC0eulbzn+mviBBu2l6qd2t4DKVQMJfrrBQPnJsJ1JVikZ59pUPE6AkJ/WG0OtA00HHO04vzts01CNDsdFZY4QKEkuOvq7/HLsy599GfOZZr11rj4NDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PChcqlgg/1AX3q5gkPO8/Y72dq7j51chPEAff/NNK80=;
 b=lXdc5YMeYO1ppf/oQVMMhIRyuNM0QL6cufQ3VZEoEsUstEMzv0ock2qoaj3bpdLHYKvbjLpuYnOK4zzdZuk90Bez8NoL73oHs/wR3bDn2k81evs7K3qPSOODeW10mkrLwH6HcNjMa+2SYZADsYxI/hI1UhvddTo8isDWT+k24cwL/Fo4LWlO7WngENw85HxNqk4FPHqjYGRpe9f0pQdODNgOTztc1lklKvGaHovjstCkhdsUGhZ18Ycur4KHQRXCTjbxQPuGNKvgQa1ugxgE5owFRdVsSBnLyCYnTZunFJw7A9unti1w3peeL3FOAYkOlSz1LsTipEB3oX61kkG4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PChcqlgg/1AX3q5gkPO8/Y72dq7j51chPEAff/NNK80=;
 b=h5LZZ4Lg8mB6zZRXMsyx5zYf5HKjGuVOk5Elc82RiPburAFySWFnUKkWb5yUSqDOx9LlXM7aYk3a4neyCtsvLl5JXjJL/ivdQ0ZuMM/kdVVaUTh/oEW4Mes1JY9ku6xoxJGh88Pgo7hnFb4iiaj3KpPR2YxLNIWTSZ9afhVsA1c=
Received: from MW4P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::10)
 by PH7PR12MB5901.namprd12.prod.outlook.com (2603:10b6:510:1d5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sun, 12 Mar
 2023 09:24:34 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::6) by MW4P221CA0005.outlook.office365.com
 (2603:10b6:303:8b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:24:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.19 via Frontend Transport; Sun, 12 Mar 2023 09:24:33 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:24:28 -0500
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
 <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui
 <ray.huang@amd.com>
Subject: [RFC QEMU PATCH 17/18] virtio-gpu: Add video hardware accelerate
 support for virgl
Date: Sun, 12 Mar 2023 17:22:43 +0800
Message-ID: <20230312092244.451465-18-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT045:EE_|PH7PR12MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 2230cd2f-e615-45e6-f989-08db22db97b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PnQkbM6r1qZs+pSWIT7uQVEAF08dfnMK3vtkNn6EaBZohne2lBoTZr2SU9BspSXQ/+hWFHcJfW3TCGdtqJcQyWEk0L9Qm4PrpC7Ey5dUngo1O+ACThyJneacl5MruDO+tZhrHc+i2m78s+6ZF/WGqI42J4pRsgY/ePOJmoD/uipfXLRRDfbepM0NcCIknTCpuNUnmqK8OlCG9JL6TJ8dUY8OzWoHKXcSX9XWvOubu+urrg1oi5rqZOoWCRJKYITRRn9OmZZTMawvE1d38QY+b/wcPvMRGKWblQGiHrXSOMZmoLSq5qSDj0uLpOjEmcFJ1DSTzrz3UvprB5NnrZg2dyNmmmERFEoQDeHnKRBFnM/Py98bnpfOqZchCL7w4wjPNlu0DE74WE6PVRTxAjbH8Eb9LSsOD2SpPcLUOv85NJi++TdfQcKJVyonZJE/tHOzg0ugGTP2MvNCdwDYQVND5rLgc2MQ8QuKoMNmjjDXLEQ5gBioCB8feM7GUmzvnHYnkJSd1n8qjx01wlaizavz98pq1vH4QKdwUJ/SitE/qHXX0ULatD0Tcr7XJroWQYTSrmVlsCCfxHz6hcxDcc4LW0O7AG5swNUoXByELURwOxSqB5NgjtBDsvTy4zgVmX1NTS+xMOjwJfagIVYZVdiobwa2eieKkfLx98FWmlzx+AEl/bd7Oe2PbPepMLMGOV11daj6Nq8QwvNJZK+4Eb22/iFtgKVcFuWq1LrVrf5JJKyisC85kxwW83gjuEM4G4Pw
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199018)(46966006)(36840700001)(40470700004)(36756003)(81166007)(186003)(110136005)(40460700003)(921005)(54906003)(7696005)(7416002)(478600001)(4326008)(316002)(5660300002)(70206006)(8936002)(2906002)(8676002)(70586007)(41300700001)(36860700001)(16526019)(86362001)(40480700001)(6666004)(82740400003)(2616005)(82310400005)(26005)(1076003)(356005)(426003)(336012)(83380400001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:24:33.9075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2230cd2f-e615-45e6-f989-08db22db97b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5901
Received-SPF: softfail client-ip=2a01:111:f400:7eab::613;
 envelope-from=Ray.Huang@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

From: Honglei Huang <honglei1.huang@amd.com>

Add get_drm_fd callback let the guest OS can get render node to using hw accel codec.

Signed-off-by: Honglei Huang <honglei1.huang@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 hw/display/virtio-gpu-virgl.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index d5214e0f43..aef735a427 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/iov.h"
+#include "qemu/drm.h"
 #include "trace.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-gpu.h"
@@ -827,12 +828,22 @@ static int virgl_make_context_current(void *opaque, int scanout_idx,
                                    qctx);
 }
 
+static int virgl_get_drm_fd(void *opaque)
+{
+    int fd = -1;
+
+    fd = qemu_drm_rendernode_open(NULL);
+
+    return fd;
+}
+
 static struct virgl_renderer_callbacks virtio_gpu_3d_cbs = {
     .version             = 1,
     .write_fence         = virgl_write_fence,
     .create_gl_context   = virgl_create_context,
     .destroy_gl_context  = virgl_destroy_context,
     .make_current        = virgl_make_context_current,
+    .get_drm_fd          = virgl_get_drm_fd,
 };
 
 static void virtio_gpu_print_stats(void *opaque)
@@ -886,14 +897,20 @@ void virtio_gpu_virgl_reset(VirtIOGPU *g)
     virgl_renderer_reset();
 }
 
+
+
 int virtio_gpu_virgl_init(VirtIOGPU *g)
 {
     int ret;
 
+#ifndef VIRGL_RENDERER_USE_VIDEO
+#define VIRGL_RENDERER_USE_VIDEO (1 << 11)
+#endif
+
 #ifdef VIRGL_RENDERER_VENUS
-    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
+    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS | VIRGL_RENDERER_USE_VIDEO, &virtio_gpu_3d_cbs);
 #else
-    ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
+    ret = virgl_renderer_init(g, 0 | VIRGL_RENDERER_USE_VIDEO, &virtio_gpu_3d_cbs);
 #endif
     if (ret != 0) {
         error_report("virgl could not be initialized: %d", ret);
-- 
2.25.1


