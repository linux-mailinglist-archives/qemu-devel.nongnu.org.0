Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D014AB18A
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 19:59:14 +0100 (CET)
Received: from localhost ([::1]:48856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGmkj-00085v-86
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 13:59:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1nGmTA-0000sQ-IS; Sun, 06 Feb 2022 13:41:08 -0500
Received: from [2a00:1450:4864:20::32f] (port=56213
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1nGmT5-0006cO-Ns; Sun, 06 Feb 2022 13:41:02 -0500
Received: by mail-wm1-x32f.google.com with SMTP id r7so8414494wmq.5;
 Sun, 06 Feb 2022 10:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:signed-off-by:content-transfer-encoding;
 bh=jKL9qqUZeMzWh1oOcABKtOSBvwjikYZx8Li4HYOPrsI=;
 b=FZFJXtENLvR+ckCuic/CRudWUYvAwiFuzGX5HhfVWN+8hYM7DF/OLRkNge43xklW9V
 VbJFEmP0TjOzrMkjPOMDCjHdmBcR6Jhck+oiMDwCjZz/0G1F2iyKdNcv0beZJNdnEoFt
 8fIQz33/4X43FKzlCFgLJzOzPXJrhHYG9PHxXsrJ1GLeJutw+L+SXMiFVkHqzhXQzH19
 OIrs/6UUBM91ONqO4zdtwoX2Xj9heNywf4Gw7M0RJpzmEWaQA3kekOSr6FmVqEK4+o0g
 /POzearTeLjXQ379iibCt/2lEsPyRzVfGDbuoMNc6xpTFyESKhsKs7l9aL8MqEwADrib
 UqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:signed-off-by:content-transfer-encoding;
 bh=jKL9qqUZeMzWh1oOcABKtOSBvwjikYZx8Li4HYOPrsI=;
 b=6ilX96fPF4a7itZM9AycLudJ84bY8RClhhhIF8pCVNi0nGpVAauGMRlukuSNrWjQut
 UQOjqBtEpyIlJcvgj6wFIgvWzHXxl4FpDnRzZW9y3K5LwE6eam0XTxu5IUXLNqqcTR/5
 hFSEE8G4pb6PVb12XnNRUgNEFBCokSSg42RWNhKc/P3kcC2qTU97KCqnTcO3NeRjLZVB
 EGSeW5MLgzQeC3zrlyY1/kt9f/T5xTuKgphvNHSEtVvOz007FLdpzK8ddyjisZT7NawF
 1ZwqWJ0RUhfKrtJ/mrLzfE/1DLWyoQ8A4aTw4U/1B6Nbt6ZGldf0L7v0ep1KTBXr0GtU
 /NMQ==
X-Gm-Message-State: AOAM533p7BzoQjqPNPHr5aRzAa0HIZq8dEApAR12zA4r4B+P4hhBNi+H
 tigN5yjJzwhJlLQtiAfVuzaC2JGnIVI=
X-Google-Smtp-Source: ABdhPJw9xmq9ZDhdWkBtWF9ihxeGY4Av9U4Kc3slE8gylPyVS5Teharmz9gfTWaW9IlUR2Cs/344ag==
X-Received: by 2002:a7b:c381:: with SMTP id s1mr8638067wmj.114.1644172800104; 
 Sun, 06 Feb 2022 10:40:00 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id y8sm8695566wrd.32.2022.02.06.10.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 10:39:59 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] hw/display/vmware_vga: replace fprintf calls with
 trace events
Date: Sun,  6 Feb 2022 18:39:55 +0000
Message-Id: <20220206183956.10694-2-carwynellis@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220206183956.10694-1-carwynellis@gmail.com>
References: <20220206183956.10694-1-carwynellis@gmail.com>
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=carwynellis@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Debug output was always being sent to STDERR.

This has been replaced with trace events.

Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
---
 hw/display/trace-events |  3 +++
 hw/display/vmware_vga.c | 30 ++++++++++++++++++------------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index 4a687d1b8e..91efc88f04 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -21,6 +21,9 @@ vmware_palette_write(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_scratch_read(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_scratch_write(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_setmode(uint32_t w, uint32_t h, uint32_t bpp) "%dx%d @ %d bpp"
+vmware_verify_rect_less_than_zero(const char *name, const char *param, int x) "%s: %s was < 0 (%d)"
+vmware_verify_rect_greater_than_bound(const char *name, const char *param, int bound, int x) "%s: %s was > %d (%d)"
+vmware_verify_rect_surface_bound_exceeded(const char *name, const char *component, int bound, const char *param1, int value1, const char *param2, int value2) "%s: %s > %d (%s: %d, %s: %d)"
 
 # virtio-gpu-base.c
 virtio_gpu_features(bool virgl) "virgl %d"
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index e2969a6c81..0cc43a1f15 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -297,46 +297,52 @@ static inline bool vmsvga_verify_rect(DisplaySurface *surface,
                                       int x, int y, int w, int h)
 {
     if (x < 0) {
-        fprintf(stderr, "%s: x was < 0 (%d)\n", name, x);
+        trace_vmware_verify_rect_less_than_zero(name, "x", x);
         return false;
     }
     if (x > SVGA_MAX_WIDTH) {
-        fprintf(stderr, "%s: x was > %d (%d)\n", name, SVGA_MAX_WIDTH, x);
+        trace_vmware_verify_rect_greater_than_bound(name, "x", SVGA_MAX_WIDTH,
+                                                    x);
         return false;
     }
     if (w < 0) {
-        fprintf(stderr, "%s: w was < 0 (%d)\n", name, w);
+        trace_vmware_verify_rect_less_than_zero(name, "w", w);
         return false;
     }
     if (w > SVGA_MAX_WIDTH) {
-        fprintf(stderr, "%s: w was > %d (%d)\n", name, SVGA_MAX_WIDTH, w);
+        trace_vmware_verify_rect_greater_than_bound(name, "w", SVGA_MAX_WIDTH,
+                                                    w);
         return false;
     }
     if (x + w > surface_width(surface)) {
-        fprintf(stderr, "%s: width was > %d (x: %d, w: %d)\n",
-                name, surface_width(surface), x, w);
+        trace_vmware_verify_rect_surface_bound_exceeded(name, "width",
+                                                        surface_width(surface),
+                                                        "x", x, "w", w);
         return false;
     }
 
     if (y < 0) {
-        fprintf(stderr, "%s: y was < 0 (%d)\n", name, y);
+        trace_vmware_verify_rect_less_than_zero(name, "y", y);
         return false;
     }
     if (y > SVGA_MAX_HEIGHT) {
-        fprintf(stderr, "%s: y was > %d (%d)\n", name, SVGA_MAX_HEIGHT, y);
+        trace_vmware_verify_rect_greater_than_bound(name, "y", SVGA_MAX_HEIGHT,
+                                                    y);
         return false;
     }
     if (h < 0) {
-        fprintf(stderr, "%s: h was < 0 (%d)\n", name, h);
+        trace_vmware_verify_rect_less_than_zero(name, "h", h);
         return false;
     }
     if (h > SVGA_MAX_HEIGHT) {
-        fprintf(stderr, "%s: h was > %d (%d)\n", name, SVGA_MAX_HEIGHT, h);
+        trace_vmware_verify_rect_greater_than_bound(name, "y", SVGA_MAX_HEIGHT,
+                                                    y);
         return false;
     }
     if (y + h > surface_height(surface)) {
-        fprintf(stderr, "%s: update height > %d (y: %d, h: %d)\n",
-                name, surface_height(surface), y, h);
+        trace_vmware_verify_rect_surface_bound_exceeded(name, "height",
+                                                        surface_height(surface),
+                                                        "y", y, "h", h);
         return false;
     }
 
-- 
2.35.1


