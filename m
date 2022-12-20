Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9456522CA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:37:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dim-0003le-MF; Tue, 20 Dec 2022 09:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dik-0003jf-AI
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:35:54 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dii-0000vi-PB
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:35:54 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so8955211wms.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dCP5cZyT8xpPHd2CcQgqWCjvisflP6TbPUTdpLOWF1Y=;
 b=KzRe0Ud/a43NW5H7qYzcwe00FAFc4sTxo6J+P9yZlpZUvuCHUl7e9i3sIsAAQvi2y4
 5RJhpIveURRwX/02s011zFYUDubFk/edMbNob/YY8N/Lrt3kGLShyq7KxS3XQBU5v/fy
 FyYMNEpPMgKX+LJmbw9/bipCgFd2puaHmH0BLXt3gjX71CywG9ZJTkmu5KccqfCg/fmn
 JBJShSu6tfjMTEmPUTcbPU4w9aJX4fVtsmaCrUyAcpiLa/YIXCNoS1rjKXTCkhucr8YM
 hshnrlMag+kg2uSG3rk3ST2vxSYl1pI2MzfMZn1IA1684MLcP+2DvWmIFmnea2kefTxU
 VtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dCP5cZyT8xpPHd2CcQgqWCjvisflP6TbPUTdpLOWF1Y=;
 b=798aCovfWxYwTzHEiBMqaz15RaEu5FdqArunAjuIl0e4GJ5GBTXs1iCybq2E1FhJHx
 JK/b/8dUbvl+9P9h2LEe5QLOFoaIhqC1Knn4ezbSfS6gdN2fYbpmHTaFGdispmJnBhz1
 R83yBHN4tXKyZicdU7zWD0KsUrzePZz67xMxifD15Lvah6qPy9fQxGKSo0fmVgd0Q/U6
 XVir8SJgQ9hXD9B12nYJxLoH5XtuB21PUMiwEf3zDVY/hRAZicRVPXz6o5zwitJLrKJ8
 oTKiRFRvu3hGNyTB50CnaegCsKNwQozqCnomFH1ImDIDKy34W4Y+Gd5eQAgKvn57/l+v
 gxEQ==
X-Gm-Message-State: ANoB5pnnf3KP/K3v8IDUgJElf5tKAh0q/d41IO58aYLUqq6MHHdj0l6O
 B9CpBA9m++AdOHZGZddhUVq7BhW/HfvqzWdjBmo=
X-Google-Smtp-Source: AA0mqf6F6t3bo/Ea/mNnCTSXbbu6OK1UfnteDWHluOQ+0KdZTZB/cVoCAv/MjUbmGCW6bqC/p9Lx3A==
X-Received: by 2002:a05:600c:2211:b0:3d2:259f:9061 with SMTP id
 z17-20020a05600c221100b003d2259f9061mr35596684wml.34.1671546951067; 
 Tue, 20 Dec 2022 06:35:51 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b003d208eb17ecsm17185582wms.26.2022.12.20.06.35.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:35:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/3] softmmu: Silent -Wmissing-field-initializers warning
Date: Tue, 20 Dec 2022 15:35:32 +0100
Message-Id: <20221220143532.24958-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220143532.24958-1-philmd@linaro.org>
References: <20221220143532.24958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Silent when compiling with -Wextra:

  ../softmmu/vl.c:886:12: warning: missing field 'flags' initializer [-Wmissing-field-initializers]
    { NULL },
           ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 798e1dc933..12c56d3b37 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -883,7 +883,7 @@ static const QEMUOption qemu_options[] = {
 #define ARCHHEADING(text, arch_mask)
 
 #include "qemu-options.def"
-    { NULL },
+    { /* end of list */ }
 };
 
 typedef struct VGAInterfaceInfo {
-- 
2.38.1


