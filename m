Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D96A446B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:30:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe6w-0001HB-5S; Mon, 27 Feb 2023 09:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6g-00010q-Gr
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:00 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe6f-0007w2-32
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:58 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so7224255wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vpl9vEKMKT9/BEtmXepusmjvuZlR1l2LpRiJAanevzY=;
 b=wJ5irwSVwkTY6kNKdbWMgUt8i/u+4FdmCL3S7VTKfrQ02EKejvcSlYJpaqbnAHnAtA
 0gEz4QClNTEWPP0YJGYUc2NRiXDhf2ZAQbdVTTBaH9umDry9cYxB4EiHDp0mlyOy+qm5
 stga3JIQ3m/wb0qMDTm/h83b4+bELumi2+mCchZjSjhpxKfg0e64hQLtWQ9gnZN66uYh
 N0n4V5aE1zCFKRQqshL9MowH534iaBlROAoc2/PVER0xytWMr3wvVYlkAvA5Y0Fc+9xl
 mZV1izB0A2+5aYHFjbAd5NRVzyrVhCOpDffI01vg/eDXUuBiYZ7Og3DCkbbsuEmBzmSw
 SlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vpl9vEKMKT9/BEtmXepusmjvuZlR1l2LpRiJAanevzY=;
 b=5QsIfU8NlVrCcsFNfifXV+oH9GLFiHVrizy0Jk6QPR+h6SrIRElfaXkCPuf4ixDQ/W
 EHHYq8ky+cPANuFTpDMT9lO+o/cEZlAnHgXfpvfxRYFFZZT/LBAaJSVDLEjs4+WdijuJ
 4ZW7Kg/zzSrl7W+4wdLbVw+jGDcauvqnXMojn6Gerb2kxtPgA4/JfGj8pc9LPMRcsZt+
 EVkIEQcsFcV3GRXzVUn6EFijtE1f4bPrbBGJVhn2fNK9r8ie25m0THXy4aPFlfYU+qZG
 /MLuv3vM4fsSuiwQtU/X3ApmBP1gC0D2dqCtBu216b30RYnVhIFU7vqAX+Jph+5gJL9a
 Blow==
X-Gm-Message-State: AO0yUKXV02e1s/Qk+oOIs0LEy7CpusoYZQCLOhpZzBqQdGqZNZ8MolYm
 /DUoY4p1PaHix2CcdDqXA094KuTS4TzLy7cm
X-Google-Smtp-Source: AK7set+vyKQ5eWQV782s9MgWuMnWYsCGupAdkyzGMFwbBpwOOMnsarKIT9wHsZ1W+68Snx3G8WE3xQ==
X-Received: by 2002:a05:600c:44d6:b0:3eb:19e7:b291 with SMTP id
 f22-20020a05600c44d600b003eb19e7b291mr8296914wmo.11.1677506635259; 
 Mon, 27 Feb 2023 06:03:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c34c800b003dc4480df80sm13619424wmq.34.2023.02.27.06.03.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:03:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 028/126] accel/xen: Remove dead code
Date: Mon, 27 Feb 2023 15:00:35 +0100
Message-Id: <20230227140213.35084-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Unused since introduction in commit 04b0de0ee8
("xen: factor out common functions").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Paul Durrant <paul@xen.org>
Message-Id: <20230215153451.30626-1-philmd@linaro.org>
---
 accel/xen/xen-all.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b..c1b697a8bd 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -23,16 +23,6 @@
 #include "migration/global_state.h"
 #include "hw/boards.h"
 
-//#define DEBUG_XEN
-
-#ifdef DEBUG_XEN
-#define DPRINTF(fmt, ...) \
-    do { fprintf(stderr, "xen: " fmt, ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
-
 bool xen_allowed;
 
 xc_interface *xen_xc;
-- 
2.38.1


