Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9166B6403
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 10:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbHvd-0006Id-0V; Sun, 12 Mar 2023 05:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ray.Huang@amd.com>) id 1pbHvb-0006IF-Bm
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:23:43 -0400
Received: from mail-dm3nam02on20619.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::619]
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ray.Huang@amd.com>) id 1pbHvZ-0004Pk-8x
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:23:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGeiznf7X1fyU4D8Y1dYI3gsCwaWRlrACJwuB9bm4jNbN4XK8DZgHSqsYiurx1CFECh1ElL4/615Ia6+43leNNRfLZIVlFw3YGpXXUqZf4mEYgsKQih6IekDdkmRcIyO2jyfEeFYY9b227XduVFcTvUMHG9I99N5XG3QVTZ7IpGWU9/Q1XMsbCqEf61j3RK8/PKuctXifQ1Q4tWT05PPe7AtKrrUNCOfWLQOCwCBnsZWmHkI24ObOZyiwUSrbPbGit+2//apzOA3PzuYTlWOZsq3Q5Dzaom6f+hqkhKfwAGX8SJs9XYKtzI7kncZfk3EzgO9X+w+5mkkhpuu4yi7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwO3ECcjBTANwRW6in0V3p3RKHpMrAOCX+HdexMgjsc=;
 b=DRmAt2by8jatvak9IWqjF9tks+MxjGlASQc8vTx5vqTz67a0mnYJXvy+GlbBVbD6f/NVCUOx1lRn7xvlu+a2HAmXZVqoy5JtwWs46Rh9YUZ+b9KM71+M6a29/yVoI/4qejZmboaRaWIAMXra5GTUvoWYOETxwwOQhNjRLD+glWUHMCwQ+u+AtiDtvbLzHQIRkSctw/IQBDahYSSOVp5VRIUgOsjk+tqm4B3dQy2iI0D0UHsSAEtjVgNXlBJtx4ELLm4+KNAylBEl1WL6BDDdwJDTH08euFRJEy85uWLV8URlIhF5/eQCXBMNPgLDugXmT0dVIcfwDcmvRw+4bgx+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwO3ECcjBTANwRW6in0V3p3RKHpMrAOCX+HdexMgjsc=;
 b=EWqJb9KRHkmObL69zFqjTMXbHtJr5WbVE3nEZV5aY3Tb3zwEjlfv3LcwRtha4Brzd4k6LrR0WVoc298AlE4N4hRw8Fh9mEnvrEK+w5FAvg2+cbF4iEpR+F4Kh+nxAb6sPNzuPQtboquSGMlpcBqaUlepZnms+ZulQDnMojWKpns=
Received: from MW4PR03CA0273.namprd03.prod.outlook.com (2603:10b6:303:b5::8)
 by CH0PR12MB5041.namprd12.prod.outlook.com (2603:10b6:610:e0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 09:23:35 +0000
Received: from CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::26) by MW4PR03CA0273.outlook.office365.com
 (2603:10b6:303:b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24 via Frontend
 Transport; Sun, 12 Mar 2023 09:23:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT090.mail.protection.outlook.com (10.13.175.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 09:23:35 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 04:23:29 -0500
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
 <julia.zhang@amd.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [RFC QEMU PATCH 04/18] virtio-gpu: CONTEXT_INIT feature
Date: Sun, 12 Mar 2023 17:22:30 +0800
Message-ID: <20230312092244.451465-5-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230312092244.451465-1-ray.huang@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT090:EE_|CH0PR12MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e86e931-b5bb-4f89-eda1-08db22db748e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: af0y3k6r8CX7j/uC1tgO1mOAYWCGr+eBir7gGr2nojwxGwQF+DdPN0fgz2aXpWszK8muho3nkqJlLVmdInM6c5ge0fVb5S7I8FNubJABRhAGpFokl8sF+YjF1ZJ+ailH3xwK+X5h7aOTAmS7VUnYjhDimr9XI/GR4hyEcdYtls79gokxtiSULg0Q381e1r/G4WXNMaeOyVph9etToZmalPgs0DMYu72kDI2NLft2mSEm/xqA7W99eQ7aINbOaDEbCUT2lsNKTj97wN8tSZnPN057GUXbILGeFDC7FH/xefBlmbkfHlrJx+i3yzjHWUFGeRtd5W2pi5PYDqJmumY2GnrwNC/75942NXBITh0zSG4I0B3sOumV8WYTEoHHu+XW2SAvAp+GJAM8cRbIJHHa1yRZjstjBr60qH0GcfQHoBZn+gZAPfCXh3xAJrIsCFtsMw62xjVKLjoK1GaKRm8k1SvvjPXVjBT+WdhmITbTeYM9eoLfk1hIb1aaUvUMQzNZTiyDroKCwlsSt7y2Z40WDf2CUt4VGVCmNLFB6cuevzjdJG4kJ+T+9SCs4GUZjoLT1dCbxdBLcSEziX/FcVZugFbfcD91WfoQYNY6YgWcutXg7egU91gTablzv7S+w7y2ZwBkKFr1JwNEFlAan6f8F/Hi5BUusL8fD1xTXAxUbDkm8P6Opovqo7pw5TlXW6IxQozxh3mXnle2rW2jeyKt+H31uxmaW5PMjNyliKcVv2JvYemjzZvCImjX7ZwALHmO
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199018)(36840700001)(46966006)(40470700004)(40460700003)(110136005)(54906003)(41300700001)(8936002)(478600001)(4326008)(8676002)(70586007)(70206006)(36756003)(82310400005)(921005)(356005)(86362001)(40480700001)(36860700001)(82740400003)(81166007)(26005)(1076003)(7696005)(6666004)(186003)(16526019)(5660300002)(7416002)(2906002)(316002)(83380400001)(47076005)(336012)(426003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 09:23:35.0200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e86e931-b5bb-4f89-eda1-08db22db748e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5041
Received-SPF: softfail client-ip=2a01:111:f400:7e83::619;
 envelope-from=Ray.Huang@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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

Create virgl renderer context with flags using context_id when valid.
The feature can be enabled via the context_init config option.
A warning message will be emitted and the feature will not be used
when linking with virglrenderer versions without context_init support.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/display/virtio-gpu-base.c   |  3 +++
 hw/display/virtio-gpu-virgl.c  | 16 ++++++++++++++--
 hw/display/virtio-gpu.c        |  2 ++
 include/hw/virtio/virtio-gpu.h |  3 +++
 meson.build                    |  4 ++++
 5 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index a29f191aa8..6c5f1f327f 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -215,6 +215,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
     if (virtio_gpu_blob_enabled(g->conf)) {
         features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
     }
+    if (virtio_gpu_context_init_enabled(g->conf)) {
+        features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
+    }
 
     return features;
 }
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 9b5e3dc782..41712b79ee 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -99,8 +99,20 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
     trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
                                     cc.debug_name);
 
-    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
-                                  cc.debug_name);
+    if (cc.context_init) {
+#ifdef HAVE_VIRGL_CONTEXT_INIT
+        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
+                                                 cc.context_init,
+                                                 cc.nlen,
+                                                 cc.debug_name);
+        return;
+#else
+        qemu_log_mask(LOG_UNIMP,
+                      "Linked virglrenderer does not support context-init\n");
+#endif
+    }
+    
+    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
 }
 
 static void virgl_cmd_context_destroy(VirtIOGPU *g,
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 95d1347a2e..11f3e56013 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1430,6 +1430,8 @@ static Property virtio_gpu_properties[] = {
     DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
     DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
+    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
+                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index caca834680..d1ae97153f 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -93,6 +93,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
     VIRTIO_GPU_FLAG_BLOB_ENABLED,
+    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -107,6 +108,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
 #define virtio_gpu_hostmem_enabled(_cfg) \
     (_cfg.hostmem > 0)
+#define virtio_gpu_context_init_enabled(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
diff --git a/meson.build b/meson.build
index be74b653b6..826b3473c4 100644
--- a/meson.build
+++ b/meson.build
@@ -778,6 +778,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
 		       cc.has_function('virgl_renderer_resource_create_blob',
 				       prefix: '#include <virglrenderer.h>',
 				       dependencies: virgl))
+  config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
+                       cc.has_function('virgl_renderer_context_create_with_flags',
+                                       prefix: '#include <virglrenderer.h>',
+                                       dependencies: virgl))
 endif
 blkio = not_found
 if not get_option('blkio').auto() or have_block
-- 
2.25.1


