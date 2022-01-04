Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2ED48477E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:09:46 +0100 (CET)
Received: from localhost ([::1]:34172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4oFk-0007j3-Oc
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:09:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4oDG-0004M8-J8; Tue, 04 Jan 2022 13:07:11 -0500
Received: from [2a00:1450:4864:20::436] (port=39595
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4oDE-0006Nt-PR; Tue, 04 Jan 2022 13:07:10 -0500
Received: by mail-wr1-x436.google.com with SMTP id s1so77822531wra.6;
 Tue, 04 Jan 2022 10:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:signed-off-by:content-transfer-encoding;
 bh=TC6fcyrbPLoGHS5hWK+yxMJDZROs9siQqDFYf3yADSw=;
 b=opx8uJTz3UBqgStZLVQjxj5HPlrciun+/okRxBubUH4tPp6TBUuOxxqBF1N7pEkP3y
 NSFKrtqNKN81sqUV6Nr+Y7Dpg82S8s3ENGEB4kCCPCchPtVL5uw5QFbI3VkfZwQIXEl4
 ctpLVPRXjcSXBBaWa5dMm0/J2y1hmad5su7HvquSC6hFCs3V7hkwj73zC1w7BoD+UWC+
 cdEZVtWkEMXUl7qx8lEuEsY2qfWulne1qUXF2Riq+xbbxa+xvDkz7+jaHXVtsq06Hv6m
 ETJG/g1mzPrr0E/wEOq0sphWsfTSNZforZEntFHZyKGLKeyhO0plf4aChYTqQsmm0sio
 34ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:signed-off-by:content-transfer-encoding;
 bh=TC6fcyrbPLoGHS5hWK+yxMJDZROs9siQqDFYf3yADSw=;
 b=otNk26gextQt14n1zp/EWmE40QUf8sSkbib2GKhNy0ENdDbitiyw1ZVrNGI1/nZGHn
 LK1OMFQeY9d8BgqA2NuSoSZC0VpbQBvKIt6UXn07EvUmlO08fLbtLpR6Isnt1g/UjILi
 a22aiYI9gHOPSfcMfVNrRLHHS1msAo1vDXgCjEzYB5LX7xbhpVNBVjAUUHITCByLbLJw
 tRdcu7+pDVXEFdPYCtsZ/hlaqph/PYnD7XWdfFZuZeJMxDaNHPESLeho+hBBr5rj2mQs
 ejbx7ShcpDi6LLlr11PAmGywAbaPn9ODujCKEtkXBFkUQ8lFqJ+tsSmfRjwuc0HdyyjF
 XhKA==
X-Gm-Message-State: AOAM531pfdZIyHy1EbcYfz1bocAvVVhCIgws35vRau9BJNT2PhLq8mzc
 wXFQrGQEYymisW2NXAaDdpCWFG77IeY=
X-Google-Smtp-Source: ABdhPJyuQNQejx/sUdlwgRoZCyV3SVk5JAdGekBKR/zMT3k1jE8AY8ishzhHYUQBhQOshJdemTMOlg==
X-Received: by 2002:a5d:4c48:: with SMTP id n8mr42878804wrt.25.1641319626786; 
 Tue, 04 Jan 2022 10:07:06 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id o11sm121997wmq.15.2022.01.04.10.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 10:07:06 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/display/vmware_vga: replace fprintf calls with trace
 events
Date: Tue,  4 Jan 2022 18:06:58 +0000
Message-Id: <20220104180659.91619-2-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104180659.91619-1-carwynellis@gmail.com>
References: <20220104180659.91619-1-carwynellis@gmail.com>
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 hw/display/vmware_vga.c | 22 ++++++++++------------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index 3a7a2c957f..e1a0d2a88a 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -21,6 +21,9 @@ vmware_palette_write(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_scratch_read(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_scratch_write(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_setmode(uint32_t w, uint32_t h, uint32_t bpp) "%dx%d @ %d bpp"
+vmware_verify_rect_less_than_zero(const char *name, const char *param, int x) "%s: %s was < 0 (%d)"
+vmware_verify_rect_greater_than_bound(const char *name, const char *param, int bound, int x) "%s: %s was > %d (%d)"
+vmware_verify_rect_surface_bound_exceeded(const char *name, const char *component, int bound, const char *param1, int value1, const char *param2, int value2) "%s: %s > %d (%s: %d, %s, %d)"
 
 # virtio-gpu-base.c
 virtio_gpu_features(bool virgl) "virgl %d"
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index e2969a6c81..0d32a605a0 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -297,46 +297,44 @@ static inline bool vmsvga_verify_rect(DisplaySurface *surface,
                                       int x, int y, int w, int h)
 {
     if (x < 0) {
-        fprintf(stderr, "%s: x was < 0 (%d)\n", name, x);
+        trace_vmware_verify_rect_less_than_zero(name, "x", x);
         return false;
     }
     if (x > SVGA_MAX_WIDTH) {
-        fprintf(stderr, "%s: x was > %d (%d)\n", name, SVGA_MAX_WIDTH, x);
+        trace_vmware_verify_rect_greater_than_bound(name, "x", SVGA_MAX_WIDTH, x);
         return false;
     }
     if (w < 0) {
-        fprintf(stderr, "%s: w was < 0 (%d)\n", name, w);
+        trace_vmware_verify_rect_less_than_zero(name, "w", w);
         return false;
     }
     if (w > SVGA_MAX_WIDTH) {
-        fprintf(stderr, "%s: w was > %d (%d)\n", name, SVGA_MAX_WIDTH, w);
+        trace_vmware_verify_rect_greater_than_bound(name, "w", SVGA_MAX_WIDTH, w);
         return false;
     }
     if (x + w > surface_width(surface)) {
-        fprintf(stderr, "%s: width was > %d (x: %d, w: %d)\n",
-                name, surface_width(surface), x, w);
+        trace_vmware_verify_rect_surface_bound_exceeded(name, "width", surface_width(surface), "x", x, "w", w);
         return false;
     }
 
     if (y < 0) {
-        fprintf(stderr, "%s: y was < 0 (%d)\n", name, y);
+        trace_vmware_verify_rect_less_than_zero(name, "y", y);
         return false;
     }
     if (y > SVGA_MAX_HEIGHT) {
-        fprintf(stderr, "%s: y was > %d (%d)\n", name, SVGA_MAX_HEIGHT, y);
+        trace_vmware_verify_rect_greater_than_bound(name, "y", SVGA_MAX_HEIGHT, y);
         return false;
     }
     if (h < 0) {
-        fprintf(stderr, "%s: h was < 0 (%d)\n", name, h);
+        trace_vmware_verify_rect_less_than_zero(name, "h", h);
         return false;
     }
     if (h > SVGA_MAX_HEIGHT) {
-        fprintf(stderr, "%s: h was > %d (%d)\n", name, SVGA_MAX_HEIGHT, h);
+        trace_vmware_verify_rect_greater_than_bound(name, "y", SVGA_MAX_HEIGHT, y);
         return false;
     }
     if (y + h > surface_height(surface)) {
-        fprintf(stderr, "%s: update height > %d (y: %d, h: %d)\n",
-                name, surface_height(surface), y, h);
+        trace_vmware_verify_rect_surface_bound_exceeded(name, "height", surface_height(surface), "y", y, "h", h);
         return false;
     }
 
-- 
2.34.1


