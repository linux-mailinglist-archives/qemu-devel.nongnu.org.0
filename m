Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6326D065D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:19:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsBh-0008Oz-2J; Thu, 30 Mar 2023 09:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBa-0007zt-N0
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:27 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phsBZ-0001z6-4M
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:19:26 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso13451089wmb.0
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680182364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBSELtOf9xv0/cDxDhg88YCz+YYHgAmDVorjbtOUtaE=;
 b=b1gZqUxj6PoTjIdBskg3vZ7vW2lBsuIwClSS4pyVG+hoZ+4i2Dk5OFi9ylvyL9Yu6A
 XVHGig5bJq4kST3W8iZ+/KHpOmSF+0cCWaX3Q9f/Cq2Wz2qFfiCf7qI+gPcEPEm8mfRb
 qfbWaVBcdMeSBJSBxl8Jdm/jLPvFXW/COyQAKRrGbgpAQ10eiDlE4XfWSxzewiEzKhFZ
 KrS7WyYJW360cVFw44jTw9l9enec+yKSl0uuCSp40ldxhlpiaa5j2DGPQWVABifkYyI1
 8Htv3SYcY2KVTEN8rjssu+2qwEmbeZnzWh8DUD5MRvNbnngXMDONzCIDXp20fQJeApjM
 gDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBSELtOf9xv0/cDxDhg88YCz+YYHgAmDVorjbtOUtaE=;
 b=Wr8na13ulmWnwfRBb1/iZ6iSbhwOyXDrqz//GWx4IGeA6EzL497iXhCWOVGmDGasOj
 0H3DT/0ifR/0pLmD6Fy0VeasG43rRJaszLTx/OF+0m2t/zrnfcU7hvJbfUu2s3XeMmQ/
 BGcXkOXoChvQc4ejInFFjGAoik4HQDcsK24P+gvuGJ+BIjFlsCyhb0M47UsH6xtYptlX
 GeIaUiMx4OXDhOTVJ2WpQR+BbrT+2FpQBndZI9bJGGcSH1B76Q+m5EatDqqAS7SlhCrz
 GfzFKP8bY21EUJUZX/BPpI7Yn9vDrwr8bC1eByX4xZvvIkVSVdfKYsHo6d6J5TaW2NYw
 UH9w==
X-Gm-Message-State: AO0yUKWEcaR3JQ4aWESiklRLUmKQ3ST5U/oz8dUnlUCPdBvdf9Iwi9Gp
 37GHa8s8KaYpzkvN9bklJXcgsUe6AUTQ1lQtXn8=
X-Google-Smtp-Source: AK7set9aG+/Xp6kv40jDzKzRgRZVGCEFiblLCMB0aVwx+Ulx0C8w7PEhf9JVbokw7kNjPr6V6kyFEA==
X-Received: by 2002:a1c:7702:0:b0:3ed:cfa6:8854 with SMTP id
 t2-20020a1c7702000000b003edcfa68854mr18261991wmi.26.1680182364111; 
 Thu, 30 Mar 2023 06:19:24 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003eda46d6792sm6268321wmo.32.2023.03.30.06.19.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Mar 2023 06:19:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Titus Rwantare <titusr@google.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Patrick Venture <venture@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 5/6] hw/i2c: pmbus: block uninitialised string reads
Date: Thu, 30 Mar 2023 15:18:55 +0200
Message-Id: <20230330131856.94210-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230330131856.94210-1-philmd@linaro.org>
References: <20230330131856.94210-1-philmd@linaro.org>
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

From: Titus Rwantare <titusr@google.com>

Devices models calling pmbus_send_string can't be relied upon to
send a non-zero pointer. This logs an error and doesn't segfault.

Reviewed-by: Patrick Venture <venture@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230322175513.1550412-5-titusr@google.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/pmbus_device.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index c3d6046784..44fe4eddbb 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -94,6 +94,13 @@ void pmbus_send64(PMBusDevice *pmdev, uint64_t data)
 
 void pmbus_send_string(PMBusDevice *pmdev, const char *data)
 {
+    if (!data) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: %s: uninitialised read from 0x%02x\n",
+                      __func__, DEVICE(pmdev)->canonical_path, pmdev->code);
+        return;
+    }
+
     size_t len = strlen(data);
     g_assert(len > 0);
     g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
-- 
2.38.1


