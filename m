Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA29669AC7
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:43:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnU-0001mz-Ag; Fri, 13 Jan 2023 09:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKn2-0001G7-E3
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:17 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmk-0003qZ-Fs
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:04 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso14475072wmq.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U0jVYGVtaVuDTvfYQzXO//xeUpfHpnJsdSaFt2/PTJ4=;
 b=ICOMjXzB7d6oz4aeLRktJwpkU7OC6LyMj0cY8KavUYnfooxUPC6Nsm7yq6GAySvjV0
 opgCuRdzaqkePWXm2EzNc8jy23vZw/dEIo4HFnPd/MckTjI3zesG+a/JXDukArFKJCwh
 NIc3QbrvIvDb976fdqkZPbZAK1UNDOasFKK0YCh0B9qsjk1eC6FQUPIRUqL8rwyM5Tmf
 Nzg902Rwyu3E3U8+iw1gjCoyXAL4ReQq6hMz+irRPSAdxeJ6YYREgbH7OVSf6GQ6+fgK
 oSyWpru6lqq31ABk0YwcKte0JrGd1MhlZouNbDFtmlOIJC/OCyo5TzkEiNP+fGA71uwY
 RmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U0jVYGVtaVuDTvfYQzXO//xeUpfHpnJsdSaFt2/PTJ4=;
 b=bVNnG3CB35q6YqGIL61XczqXVeVv5ktcaAFX8uNvUW5xf6YfHoAV30roKgxp9QaZEn
 KTNJI4aTsu/gSwNbzyJgu0K/szBV0Z0xYgOWYxbtIQBsg6cEdUc31gV8quya9/Px3G74
 S8vtP6q5oEFPgKY3ddG/zXYL/DcjiiL5P6mxqm4nEVI4lQigk5IxS2rEnXo4g9khSqyq
 hE5YFq6kqdWlFEXi1l9bu1H+QBLml5EM5TvvhrQMfmbnaFbbUn8i1vHN22j8vF35ET9j
 FnmxK3rm6SCRY6LT/mESkx7GyLNJU+hLoFLYISdx5IdZ1dP7mtT39OMzWzuJli/yuPhY
 AmLQ==
X-Gm-Message-State: AFqh2kpu2k6R8z5FOqYVx6hh16OPWhNB/TmoplOvgH4ydaVQeRzfQUdV
 9TEAocN9DQFS5FSKgksWUIGjF/H0IZmFXjVG
X-Google-Smtp-Source: AMrXdXsy5/oH0Awx91H7AELyLldEJxwzM2hzLyVVLtbst2UkvZGbs7E5iHImLmURo7VukAbrZTJwwA==
X-Received: by 2002:a05:600c:1603:b0:3d1:c895:930c with SMTP id
 m3-20020a05600c160300b003d1c895930cmr58302550wmn.35.1673619117052; 
 Fri, 13 Jan 2023 06:11:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/38] hw/misc/sbsa_ec: Rename TYPE_SBSA_EC ->
 TYPE_SBSA_SECURE_EC
Date: Fri, 13 Jan 2023 14:11:22 +0000
Message-Id: <20230113141126.535646-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The structure is named SECUREECState. Rename the type accordingly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109140306.23161-12-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/sbsa_ec.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
index 8d939fe31b1..6f19c21195a 100644
--- a/hw/misc/sbsa_ec.c
+++ b/hw/misc/sbsa_ec.c
@@ -15,13 +15,14 @@
 #include "hw/sysbus.h"
 #include "sysemu/runstate.h"
 
-typedef struct {
+typedef struct SECUREECState {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
 } SECUREECState;
 
-#define TYPE_SBSA_EC      "sbsa-ec"
-#define SECURE_EC(obj) OBJECT_CHECK(SECUREECState, (obj), TYPE_SBSA_EC)
+#define TYPE_SBSA_SECURE_EC "sbsa-ec"
+#define SBSA_SECURE_EC(obj) \
+        OBJECT_CHECK(SECUREECState, (obj), TYPE_SBSA_SECURE_EC)
 
 enum sbsa_ec_powerstates {
     SBSA_EC_CMD_POWEROFF = 0x01,
@@ -36,7 +37,7 @@ static uint64_t sbsa_ec_read(void *opaque, hwaddr offset, unsigned size)
 }
 
 static void sbsa_ec_write(void *opaque, hwaddr offset,
-                     uint64_t value, unsigned size)
+                          uint64_t value, unsigned size)
 {
     if (offset == 0) { /* PSCI machine power command register */
         switch (value) {
@@ -65,7 +66,7 @@ static const MemoryRegionOps sbsa_ec_ops = {
 
 static void sbsa_ec_init(Object *obj)
 {
-    SECUREECState *s = SECURE_EC(obj);
+    SECUREECState *s = SBSA_SECURE_EC(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     memory_region_init_io(&s->iomem, obj, &sbsa_ec_ops, s, "sbsa-ec",
@@ -82,7 +83,7 @@ static void sbsa_ec_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo sbsa_ec_info = {
-    .name          = TYPE_SBSA_EC,
+    .name          = TYPE_SBSA_SECURE_EC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(SECUREECState),
     .instance_init = sbsa_ec_init,
-- 
2.34.1


