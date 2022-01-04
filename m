Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA560483EF2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:15:56 +0100 (CET)
Received: from localhost ([::1]:42686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fv9-00089X-Qe
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:15:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4fr7-00028M-9c; Tue, 04 Jan 2022 04:11:45 -0500
Received: from [2a00:1450:4864:20::331] (port=39931
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4fr5-0005qR-Au; Tue, 04 Jan 2022 04:11:44 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 g7-20020a7bc4c7000000b00345c4bb365aso19594107wmk.4; 
 Tue, 04 Jan 2022 01:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:signed-off-by:content-transfer-encoding;
 bh=JyHlj7eDxukYdvkmom2cAbRXsqpvnsgR0EZjsGCJfBg=;
 b=BErSZXqqMefbaZ+0SAbxqFW1/dYK97Lw0EZXxYisH/O94Xco93FTSzHE1REeRupiMx
 KsYV45VDPE+SPUK+3UuH5HuURpOxHBA/wBK3qloYBvO74sW73R4vnBLRtqWdcWf6h1mD
 VlBs2e4bAz/JYhp3NsOKxqGKIuu37NT5otKNHTW69zrA/+NuoZnbQxr/MjB2VHtPcTqr
 fEkiHFSndVkPB44qXjFBNwf5v6vcam/SCiqYEFVy8oZ020KJhaJ9DXGmO4mC0rL15qTE
 yiDCCV3Qo1IxHCXKy+nQ4j3mfEthf3nhKx3rzOCSvUsDZpFtz857cOnDb/6jM4uZPPhB
 FRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:signed-off-by:content-transfer-encoding;
 bh=JyHlj7eDxukYdvkmom2cAbRXsqpvnsgR0EZjsGCJfBg=;
 b=lCsVz/aJQt8yxqu4e3Tz3YDf1LzUQYNzIBuR4FZZTYl+efIZpUW1gPu0ENCJvsCuO/
 tx9WvowuGLQ8SjsEE/lMkQKMrNCu+fqEkm5smRSeMLstoW9re4sCgxX6bhesUSx305GX
 84oByqlvWbRBecLsaBDyRBi7EH0Hz9UCMhykirOlhvUhLVTxQfCFMSUzZ9cIDbWqe7/x
 cNCOYv6P4QCxqb1sIy7JNgYzhs5UDjzcyVCZUCqUhMTjfD/c4G6xkd5jAvzfpcrdLXQS
 K7o6KKUEQmukADwmx+wRQ9tZNruhYmN8qDaRu0raqcCT5Sr0M060qcwMxjqhf7v4iG1V
 Detw==
X-Gm-Message-State: AOAM5327OsyPP5pMdH4vaeGHl2WwqcCFYzwOM83hIW04lcqonrWBYz3v
 GRKJoZCP+5SCJt9bb5YHFwh/KX8ChNk=
X-Google-Smtp-Source: ABdhPJxq3B019bhukqkE48r6scIc9K7vi76GqNECBmWtBPN6peDFtGgpQ72/P4w5t/RvP2u5iA4GMQ==
X-Received: by 2002:a7b:cb9a:: with SMTP id m26mr37119994wmi.55.1641287501840; 
 Tue, 04 Jan 2022 01:11:41 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id c11sm43962844wmq.48.2022.01.04.01.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 01:11:39 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/display/vmware_vga: only show debug output if DEBUG
 enabled
Date: Tue,  4 Jan 2022 09:11:34 +0000
Message-Id: <20220104091135.61226-2-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104091135.61226-1-carwynellis@gmail.com>
References: <20220104091135.61226-1-carwynellis@gmail.com>
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=carwynellis@gmail.com; helo=mail-wm1-x331.google.com
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

Debug output was always being sent to STDERR. This has been replaced by
a define that will only show this output when DEBUG is set to true.

Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
---
 hw/display/vmware_vga.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index e2969a6c81..8080e085d1 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -43,6 +43,12 @@
 
 /* See http://vmware-svga.sf.net/ for some documentation on VMWare SVGA */
 
+#ifdef DEBUG
+#define VMWARE_VGA_DEBUG(...) { (void) fprintf(stdout, __VA_ARGS__); }
+#else
+#define VMWARE_VGA_DEBUG(...) ((void) 0)
+#endif
+
 struct vmsvga_state_s {
     VGACommonState vga;
 
@@ -297,45 +303,45 @@ static inline bool vmsvga_verify_rect(DisplaySurface *surface,
                                       int x, int y, int w, int h)
 {
     if (x < 0) {
-        fprintf(stderr, "%s: x was < 0 (%d)\n", name, x);
+        VMWARE_VGA_DEBUG("%s: x was < 0 (%d)\n", name, x);
         return false;
     }
     if (x > SVGA_MAX_WIDTH) {
-        fprintf(stderr, "%s: x was > %d (%d)\n", name, SVGA_MAX_WIDTH, x);
+        VMWARE_VGA_DEBUG("%s: x was > %d (%d)\n", name, SVGA_MAX_WIDTH, x);
         return false;
     }
     if (w < 0) {
-        fprintf(stderr, "%s: w was < 0 (%d)\n", name, w);
+        VMWARE_VGA_DEBUG("%s: w was < 0 (%d)\n", name, w);
         return false;
     }
     if (w > SVGA_MAX_WIDTH) {
-        fprintf(stderr, "%s: w was > %d (%d)\n", name, SVGA_MAX_WIDTH, w);
+        VMWARE_VGA_DEBUG("%s: w was > %d (%d)\n", name, SVGA_MAX_WIDTH, w);
         return false;
     }
     if (x + w > surface_width(surface)) {
-        fprintf(stderr, "%s: width was > %d (x: %d, w: %d)\n",
+        VMWARE_VGA_DEBUG("%s: width was > %d (x: %d, w: %d)\n",
                 name, surface_width(surface), x, w);
         return false;
     }
 
     if (y < 0) {
-        fprintf(stderr, "%s: y was < 0 (%d)\n", name, y);
+        VMWARE_VGA_DEBUG("%s: y was < 0 (%d)\n", name, y);
         return false;
     }
     if (y > SVGA_MAX_HEIGHT) {
-        fprintf(stderr, "%s: y was > %d (%d)\n", name, SVGA_MAX_HEIGHT, y);
+        VMWARE_VGA_DEBUG("%s: y was > %d (%d)\n", name, SVGA_MAX_HEIGHT, y);
         return false;
     }
     if (h < 0) {
-        fprintf(stderr, "%s: h was < 0 (%d)\n", name, h);
+        VMWARE_VGA_DEBUG("%s: h was < 0 (%d)\n", name, h);
         return false;
     }
     if (h > SVGA_MAX_HEIGHT) {
-        fprintf(stderr, "%s: h was > %d (%d)\n", name, SVGA_MAX_HEIGHT, h);
+        VMWARE_VGA_DEBUG("%s: h was > %d (%d)\n", name, SVGA_MAX_HEIGHT, h);
         return false;
     }
     if (y + h > surface_height(surface)) {
-        fprintf(stderr, "%s: update height > %d (y: %d, h: %d)\n",
+        VMWARE_VGA_DEBUG("%s: update height > %d (y: %d, h: %d)\n",
                 name, surface_height(surface), y, h);
         return false;
     }
-- 
2.34.1


