Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D696B63FD
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 10:24:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbHw6-00076C-4w; Sun, 12 Mar 2023 05:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ray.Huang@amd.com>) id 1pbHw4-000759-Mv
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:24:12 -0400
Received: from mail-dm6nam10on2062e.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::62e]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ray.Huang@amd.com>) id 1pbHw2-0004SK-K5
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:24:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pbm4MWQMJ9vrBH9ZOoisFYWMLLh7XTn0isq7KbTSHDprPVGRfwNEKES8zlAzvdB1wTyHERyXUmp0WbjQtPE+QDKK+duANG25hrLElGldgpzchKcXVuWWjHVnDAaLmqvWJvQk4XuNeBYHzLqG1HmmPJagS65l4ghGEavm1YmCDokO/xYnCY0UxZV6WG9YE8oR4b7+XAgeTqQZbcquEkwbiqFRNEsddoJ2lGyU4XHjf2ag+BOTytRlmFs0YpsDfJkWhLZ5LW5RVJbPniQ65NE3EIGEI5mmKLa9NTXkR77zf/7dP7mpe4sHRbnX1DAnQRjDOtCYLGnaN0wOtduMU2nfLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNkEmUpH7IGDk/2IJhLSTZ80eBUHZ2EIp5WUPKtLLzY=;
 b=H/eBaXlm4SfHROK6bxkilnkrPEGnjjNpfTCjdy23XtvlWHsBwimPtXmnTsnEC9f1oSteluL/owUiHhGWHBTuaIX48YQuciiX6ETIeZrEWv3hFfExAkh81bRiRZkAIaH9gkThLbs74aMjpkHH3XyaIJzVy17w0OBfsfJCNAmA1Tm4gAq0E7QFp0Tx9/V+Gf0AfjcCu3vG8J3FxKqYd7LBJjZdAZjKKX6bGlAdi7YdTlYqkVROj1C8/9Uh75/7AgMutP6hpk2Ukx3C/7gB/ZO4KKiuabFYmLtFylEu+/i2h3oUquB463NtjvpEb6k8J6Fd7JXrBp3BLLSXsvuErlUidw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNkEmUpH7IGDk/2IJhLSTZ80eBUHZ2EIp5WUPKtLLzY=;
 b=HHSMUTBexlt+a34Xupwt9zVfbKCKgn1afhICP0Sn0F0Oq5OLmyKgs+VTd/q+xL+JfXOaVHmvnwIuu7qNrXd0HWqr8Gho8Z0Aq6QWspUn7kbjLstiHcMZ+gSQy+uBymXf1/aM7GXGXSawVmfsM9QCU21gKmdNg0pPzNv2Alyqnok=
Received: from MW4PR03CA0337.namprd03.prod.outlook.com (2603:10b6:303:dc::12)
 by DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.22; Sun, 12 Mar
 2023 09:24:06 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::9d) by MW4PR03CA0337.outlook.office365.com
 (2603:10b6:303:dc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:24:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.23 via Frontend Transport; Sun, 12 Mar 2023 09:24:05 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:24:01 -0500
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
Subject: [RFC QEMU PATCH 11/18] virtio-gpu: make blob scanout use dmabuf fd
Date: Sun, 12 Mar 2023 17:22:37 +0800
Message-ID: <20230312092244.451465-12-ray.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT007:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: b74e6c69-b477-4d2c-248b-08db22db86ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t6ub4QDusTL1/8jllv0iUXcdHrMi0fysP/UoBYZkSUYjVL0uMnKIDMJUubWcf+H2Mmez3U+ObN23sLAPdmxhjRay5Rmja+ks3F57wNHvAfAkOAS14v+Q1H8sU/0QuOVcw3RSrvU7zMhs6OBTLjcIw8Rnv2nEACvjRi9R0Rl2Ang5IHRODQTHnUTa/KWWyTnerlkXna13+PtlAPdQNLA6BsZaYFyOvEOjWeheqkqfhDeBIFMXatbIycA5LN3apDhBtY9INJMhSM0tu/kopJllQNcJGBqU7CBkX69/68Th7VoidphekqOUObxXKmbLe07WGIKovaKrjN+xmDrBhjN5ivCXfUmpJh4V9S8e2EVsYptv6ONQdvgsPDBAP/kuLhptu65ZGsYAekRDAavjalzudSkUguuaS+inqjm7pgkCXfa1sekYLfvL913w0anwZtj1Qk7dFY/rogVo/iGSmuBoZitfMWVoBJFeGV72ArP3Wb7oXq+3yFHewEyNiu8rJ06pE4l6CPskMc9JJTPCAIKUIqdto0NjmNl0muUmorduVRo5rAcD5jlpop6Rv+cYxY9rnYdyH9UVcB8n1VJVrAnrKZ0cqLXSKNLeouFsAMP4jZBCS1s+towxX0xNHejMkIXXz808kBgOOCFZADnH+cgnfB1G3Mr5bEbJS+LNfXgesSAKzXlVFcNkQsFxe2Zg0G/XiSxr4SrfyVhV299S2wAa6iSpGIHr9uesvJVbi8R02gLQXiEdGIet80uUNucTCJ+q
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199018)(36840700001)(40470700004)(46966006)(186003)(356005)(921005)(2906002)(16526019)(82740400003)(26005)(1076003)(81166007)(2616005)(8936002)(5660300002)(36860700001)(6666004)(7416002)(336012)(426003)(47076005)(40460700003)(41300700001)(86362001)(8676002)(4326008)(82310400005)(40480700001)(70586007)(70206006)(36756003)(7696005)(478600001)(316002)(83380400001)(110136005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:24:05.9544 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b74e6c69-b477-4d2c-248b-08db22db86ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287
Received-SPF: softfail client-ip=2a01:111:f400:7e88::62e;
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

From: Robert Beckett <bob.beckett@collabora.com>

This relies on a virglrenderer change to include the dmabuf fd when
returning resource info.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 hw/display/virtio-gpu-virgl.c  | 103 ++++++++++++++++++++++++++++++++-
 hw/display/virtio-gpu.c        |   4 +-
 include/hw/virtio/virtio-gpu.h |   5 ++
 3 files changed, 109 insertions(+), 3 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 1fe144f64d..69083d15a9 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -18,6 +18,7 @@
 #include "hw/virtio/virtio-gpu.h"
 #include "hw/virtio/virtio-gpu-bswap.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/virtio/virtio-gpu-pixman.h"
 
 #include <virglrenderer.h>
 
@@ -208,6 +209,106 @@ static void virgl_cmd_set_scanout(VirtIOGPU *g,
     g->parent_obj.scanout[ss.scanout_id].resource_id = ss.resource_id;
 }
 
+static void virgl_cmd_set_scanout_blob(VirtIOGPU *g,
+                                 struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_framebuffer fb = { 0 };
+    struct virtio_gpu_set_scanout_blob ss;
+    struct virgl_renderer_resource_info info;
+    uint64_t fbend;
+
+    VIRTIO_GPU_FILL_CMD(ss);
+    virtio_gpu_scanout_blob_bswap(&ss);
+    trace_virtio_gpu_cmd_set_scanout_blob(ss.scanout_id, ss.resource_id,
+                                          ss.r.width, ss.r.height, ss.r.x,
+                                          ss.r.y);
+
+    if (ss.scanout_id >= g->parent_obj.conf.max_outputs) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified %d",
+                      __func__, ss.scanout_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
+        return;
+    }
+
+    if (ss.resource_id == 0) {
+        virtio_gpu_disable_scanout(g, ss.scanout_id);
+        return;
+    }
+
+    if (ss.width < 16 ||
+	ss.height < 16 ||
+	ss.r.x + ss.r.width > ss.width ||
+	ss.r.y + ss.r.height > ss.height) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout %d bounds for"
+                      " resource %d, rect (%d,%d)+%d,%d, fb %d %d\n",
+                      __func__, ss.scanout_id, ss.resource_id,
+                      ss.r.x, ss.r.y, ss.r.width, ss.r.height,
+                      ss.width, ss.height);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
+
+    if (!console_has_gl(g->parent_obj.scanout[ss.scanout_id].con)) {
+	    qemu_log_mask(LOG_GUEST_ERROR, "%s: unable to scanout blot without GL!\n", __func__);
+	    return;
+    }
+
+    res = virtio_gpu_find_resource(g, ss.resource_id);
+    if (!res) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: illegal resource specified %d\n",
+                          __func__, ss.resource_id);
+            cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+            return;
+    }
+    if (virgl_renderer_resource_get_info(ss.resource_id, &info)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: illegal virgl resource specified %d\n",
+                          __func__, ss.resource_id);
+            cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+            return;
+    }
+    if (!res->dmabuf_fd && info.fd)
+	    res->dmabuf_fd = info.fd;
+
+    fb.format = virtio_gpu_get_pixman_format(ss.format);
+    if (!fb.format) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: host couldn't handle guest format %d\n",
+                      __func__, ss.format);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
+
+    fb.bytes_pp = DIV_ROUND_UP(PIXMAN_FORMAT_BPP(fb.format), 8);
+    fb.width = ss.width;
+    fb.height = ss.height;
+    fb.stride = ss.strides[0];
+    fb.offset = ss.offsets[0] + ss.r.x * fb.bytes_pp + ss.r.y * fb.stride;
+
+    fbend = fb.offset;
+    fbend += fb.stride * (ss.r.height - 1);
+    fbend += fb.bytes_pp * ss.r.width;
+    if (fbend > res->blob_size) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: fb end out of range\n",
+                      __func__);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        return;
+    }
+
+    g->parent_obj.enable = 1;
+    if (virtio_gpu_update_dmabuf(g, ss.scanout_id, res, &fb, &ss.r)) {
+	    qemu_log_mask(LOG_GUEST_ERROR,
+			  "%s: failed to update dmabuf\n", __func__);
+	    cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+	    return;
+    }
+    virtio_gpu_update_scanout(g, ss.scanout_id, res, &ss.r);
+}
+
+
 static void virgl_cmd_submit_3d(VirtIOGPU *g,
                                 struct virtio_gpu_ctrl_command *cmd)
 {
@@ -654,7 +755,7 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
         virgl_cmd_resource_create_blob(g, cmd);
         break;
     case VIRTIO_GPU_CMD_SET_SCANOUT_BLOB:
-        virtio_gpu_set_scanout_blob(g, cmd);
+        virgl_cmd_set_scanout_blob(g, cmd);
         break;
     case VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB:
         virgl_cmd_resource_map_blob(g, cmd);
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 1e334a1e78..95e421a525 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -371,7 +371,7 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
     QTAILQ_INSERT_HEAD(&g->reslist, res, next);
 }
 
-static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
+void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
 {
     struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
     struct virtio_gpu_simple_resource *res;
@@ -575,7 +575,7 @@ static void virtio_unref_resource(pixman_image_t *image, void *data)
     pixman_image_unref(data);
 }
 
-static void virtio_gpu_update_scanout(VirtIOGPU *g,
+void virtio_gpu_update_scanout(VirtIOGPU *g,
                                       uint32_t scanout_id,
                                       struct virtio_gpu_simple_resource *res,
                                       struct virtio_gpu_rect *r)
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index ce49cdfafb..ba509833db 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -286,6 +286,11 @@ void virtio_gpu_update_cursor_data(VirtIOGPU *g,
                                    uint32_t resource_id);
 void virtio_gpu_set_scanout_blob(VirtIOGPU *g,
                                  struct virtio_gpu_ctrl_command *cmd);
+void virtio_gpu_update_scanout(VirtIOGPU *g,
+                                      uint32_t scanout_id,
+                                      struct virtio_gpu_simple_resource *res,
+                                      struct virtio_gpu_rect *r);
+void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id);
 
 /* virtio-gpu-udmabuf.c */
 bool virtio_gpu_have_udmabuf(void);
-- 
2.25.1


