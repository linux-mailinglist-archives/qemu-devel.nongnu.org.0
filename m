Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220B26B0EB9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 17:27:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZwcQ-0004lu-Bl; Wed, 08 Mar 2023 11:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dhobsong@igel.co.jp>)
 id 1pZwcM-0004kp-QE
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 11:26:18 -0500
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dhobsong@igel.co.jp>)
 id 1pZwcK-0002sD-Nb
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 11:26:18 -0500
Received: by mail-qv1-xf29.google.com with SMTP id nv15so11422278qvb.7
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 08:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112; t=1678292775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=78ydkmMTOCm6kt7Hh6Cy+HDr2L1dCmuECV9DyZPvslc=;
 b=ugNUyLQr/NzcfuyXkHdJMw3oFETCvI9AKGQIroh+ObG9reLorDndCmnpzsV+TJvVR7
 iNhMNeaNwRFmTT5l9ObKEOAS6Cn8DTKjRuaXo8We40iGMWA7RUkXP2MHqzS9ZgmLqch9
 roy2nTRlauwBsF6v4aOU0eV6RDn90DOEzAjRQxeFI5reAHYDwpB/MMmuT/CSRtM5YyYM
 wCMoeSI5qj3i1qENAAdj5taMxkrsnm3CYjDXC6ARctWBBUtZJw16RUn+q9sBwJKIZ03B
 4TRY/ct1uAtaTSWLaSgAMt+4Y3lg+jeSOExW2mimH1angyRmUAFU1E8IR9qlEF+aj6Hb
 zmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678292775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=78ydkmMTOCm6kt7Hh6Cy+HDr2L1dCmuECV9DyZPvslc=;
 b=F8Cn7sbSmvt6auAemaTE1Okff/bZwOMioleolRDzOuinGV8ZDDgTeZdpOzs+ZY3eFr
 KXhG9ZMtWf15ugPykjohdkyv6v6TB0kXXUOkejoI9DuhNvvAo61xLAv0KQXKsJ3QrooQ
 EZ+xosPOkQb8rB7PPLKg8iW0YQeNIJ/Qy7m1AiT/784sbixxDTdje9CJBR2zNe1q8Ig4
 mhHlsfZ3QLPVKezJL747M+uo8iDgyUX3OCUnYozUMSx2E51YC2TEAMllH1Q/j1+nPud9
 rpqkhg190E7eAf3ueTGQYbIfeaqXwQQg5s2R3OM4dqFu5LjEdiEVW6X7NGr49kgqsgTn
 LsXQ==
X-Gm-Message-State: AO0yUKX9FmctoE3jxXEwSJiawRfOdlmBXpl5uz5qCewdmgy6uJElaMkz
 YA+n062nBLaPlLDqN+9+2Zzju/z64eekus8JylI=
X-Google-Smtp-Source: AK7set/eM20N+3lsiw5ORghxhZluIuBXsTlAjQ06CUgaOOrxq9n9fynR6ZL3cSeqL3Y15i1inVOIhg==
X-Received: by 2002:a05:6214:5089:b0:56e:b5a1:b52d with SMTP id
 kk9-20020a056214508900b0056eb5a1b52dmr30405070qvb.28.1678292775610; 
 Wed, 08 Mar 2023 08:26:15 -0800 (PST)
Received: from D100-Linux.hq.igel.co.jp (135-23-249-188.cpe.pppoe.ca.
 [135.23.249.188]) by smtp.gmail.com with ESMTPSA id
 z207-20020a3765d8000000b0074236d3a149sm11780577qkb.92.2023.03.08.08.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:26:15 -0800 (PST)
From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>
Subject: [RFC PATCH 2/2] virtio-gpu: Add an option to connect all outputs on
 startup
Date: Wed,  8 Mar 2023 11:25:48 -0500
Message-Id: <20230308162548.1766359-3-dhobsong@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308162548.1766359-1-dhobsong@igel.co.jp>
References: <20230308162548.1766359-1-dhobsong@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=dhobsong@igel.co.jp; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

When multiple outputs are enabled using the "max_outputs" attribute,
only the first connector appears as "Connected" in the guest DRM
device.  Additional connectors must be enabled from the host side
UI frontend before they are usable by the guest.  However, multiple
outputs can still be of use on a headless configuration, if for example,
the display will only be used for taking periodic screenshots in the
guest or integration into a CI pipeline, etc.

Add an option to start all of the outputs in the "Connected" state,
so that they are immediately available to the guest.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1107
Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
---
 hw/display/virtio-gpu-base.c   | 12 +++++++++---
 include/hw/virtio/virtio-gpu.h |  7 ++++++-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index a29f191aa8..885184e302 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -158,6 +158,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(qdev);
     VirtIOGPUBase *g = VIRTIO_GPU_BASE(qdev);
+    int connected = 1;
     int i;
 
     if (g->conf.max_outputs > VIRTIO_GPU_MAX_SCANOUTS) {
@@ -186,10 +187,15 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
         virtio_add_queue(vdev, 16, cursor_cb);
     }
 
-    g->enabled_output_bitmask = 1;
+    if (virtio_gpu_connect_all_outputs(g->conf))
+        connected = g->conf.max_outputs;
 
-    g->req_state[0].width = g->conf.xres;
-    g->req_state[0].height = g->conf.yres;
+    g->enabled_output_bitmask = (1 << connected) - 1;
+
+    for (i = 0; i < connected; i++) {
+        g->req_state[i].width = g->conf.xres;
+        g->req_state[i].height = g->conf.yres;
+    }
 
     g->hw_ops = &virtio_gpu_ops;
     for (i = 0; i < g->conf.max_outputs; i++) {
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 2e28507efe..54b3eba632 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -90,6 +90,7 @@ enum virtio_gpu_base_conf_flags {
     VIRTIO_GPU_FLAG_EDID_ENABLED,
     VIRTIO_GPU_FLAG_DMABUF_ENABLED,
     VIRTIO_GPU_FLAG_BLOB_ENABLED,
+    VIRTIO_GPU_FLAG_CONNECT_ALL_OUTPUTS,
 };
 
 #define virtio_gpu_virgl_enabled(_cfg) \
@@ -102,6 +103,8 @@ enum virtio_gpu_base_conf_flags {
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
 #define virtio_gpu_blob_enabled(_cfg) \
     (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
+#define virtio_gpu_connect_all_outputs(_cfg) \
+    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_CONNECT_ALL_OUTPUTS))
 
 struct virtio_gpu_base_conf {
     uint32_t max_outputs;
@@ -148,7 +151,9 @@ struct VirtIOGPUBaseClass {
     DEFINE_PROP_BIT("edid", _state, _conf.flags, \
                     VIRTIO_GPU_FLAG_EDID_ENABLED, true), \
     DEFINE_PROP_UINT32("xres", _state, _conf.xres, 1280), \
-    DEFINE_PROP_UINT32("yres", _state, _conf.yres, 800)
+    DEFINE_PROP_UINT32("yres", _state, _conf.yres, 800), \
+    DEFINE_PROP_BIT("connect_outputs", _state, _conf.flags, \
+                    VIRTIO_GPU_FLAG_CONNECT_ALL_OUTPUTS, false)
 
 typedef struct VGPUDMABuf {
     QemuDmaBuf buf;
-- 
2.25.1


