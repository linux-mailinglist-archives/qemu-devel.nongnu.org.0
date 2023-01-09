Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A097662567
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:21:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqrB-0005xN-4l; Mon, 09 Jan 2023 07:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqr7-0005wX-Lo
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:02:21 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqr5-00025Z-0R
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:02:21 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so8821510wmb.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxm/+ae/RexNrDFlylFgft3ctCQnO2vjWs01C2V9H4w=;
 b=HJgCg+9AWdllygcaF4GGLwC8Jz61t2+TAgtvzWUxVW5C6Pi4X/Ho94vBwgr9CFeMqZ
 h2qLaXeLq8pknFKWg74wjPZDJiVxdhOaVRbj6ltrAt5BYMhQn65mu4Ke8usNuUsk7rEe
 UL+eUw8dEmV6656wxfp2vL900/Y3La1bM2CmDC6mXyQG8YDQGsTRdfkbhfVyLxxDf+JO
 1p19wxOw4jOWfNI6qAeGSPmyNbWMGkDokEVBBx+re2BrFDtO30CLVAICnSuhIzkyBLOQ
 WxrKePYIXMjUVR6uS3F+PNhfMhGMg/Zj/q6TmCn1SdlErQmCE28WZXC5JzmlEO/hMUj7
 QMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wxm/+ae/RexNrDFlylFgft3ctCQnO2vjWs01C2V9H4w=;
 b=v4h7i7lLzlqs7mdWtaDzjTR76Ah3HSiUTTCMTZ8UHyNiZrQ9hMo3+DjQH7jAhC9LVp
 QFVb9vG4+9/Dc8MTnTXi1r5la2yISR/nrQ2YEZeHEzHD9N2cd4twcBMl2/Etb/l6cI1f
 jrLnSjgICzkdES0+KDUDpPbwjGM0QS67ZxJ7PxRy2Tk8SGUaFSjMq3cIdDEziI/RbyqX
 BpUSweMXQZNmgCiXX9dTeaduzt3adwh5d2AmSQ9DpLH5f1jXqe/oqhxaj4tIyBg5fh6m
 KQasSqwIsH2aeHjXLeVNDQniX2sYEuDoHzUpNvRc6ZBS1dFq8Z76WMUy0PU0RvLvusVM
 wwmw==
X-Gm-Message-State: AFqh2krfgUclsmWmdBRw/KuO05/r5msZUfADQFrW5hw/6uxDV3CurAVd
 2GKhFg9LnrkUHIH1YZTUfp2ejl8bLiLPqWdR
X-Google-Smtp-Source: AMrXdXtrhUfeoZ4aF3QJP5aSAbvj9bkfYfPfJHTe9upcEg5xpk5EddyKBhcwL35Zxs/U6EIhbuPtHw==
X-Received: by 2002:a05:600c:4f55:b0:3d3:5166:2da4 with SMTP id
 m21-20020a05600c4f5500b003d351662da4mr45690040wmq.8.1673265737455; 
 Mon, 09 Jan 2023 04:02:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g6-20020adff406000000b00298d87b6309sm8459169wro.78.2023.01.09.04.02.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:02:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Magnus Damm <magnus.damm@gmail.com>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 4/5] hw/sh4/r2d: Use the IEC binary prefix definitions
Date: Mon,  9 Jan 2023 13:01:53 +0100
Message-Id: <20230109120154.2868-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120154.2868-1-philmd@linaro.org>
References: <20230109120154.2868-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sh4/r2d.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 39fc4f19d9..b3667e9b12 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -47,10 +47,10 @@
 #define FLASH_BASE 0x00000000
 #define FLASH_SIZE (16 * MiB)
 
-#define SDRAM_BASE 0x0c000000 /* Physical location of SDRAM: Area 3 */
-#define SDRAM_SIZE 0x04000000
+#define SDRAM_BASE          (192 * MiB) /* Physical location of SDRAM: Area 3 */
+#define SDRAM_SIZE          (64 * MiB)
 
-#define SM501_VRAM_SIZE 0x800000
+#define SM501_VRAM_SIZE     (8 * MiB)
 
 #define BOOT_PARAMS_OFFSET 0x0010000
 /* CONFIG_BOOT_LINK_OFFSET of Linux kernel */
-- 
2.38.1


