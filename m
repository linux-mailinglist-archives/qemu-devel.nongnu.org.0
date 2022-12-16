Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51564F396
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IUd-0006EN-UF; Fri, 16 Dec 2022 16:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITr-0005wP-T2
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:05 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITn-0000bU-RT
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:42:58 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so2965148wml.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ejnwplBuFjPQYjVXN/BBF9M+6FV2TieQ9nezCnNqXI4=;
 b=fpLbppGgUnqCSumlbXT80u7GXnt10v3E6uLy4P6P1PlzaXIAgl+XsmcY4RZWIyh2L8
 wf4NSzvhh0SMmjgyeuygbF35SH+UO/4awNeSxHwSinDnVCYoOr196i44Rd+z+Boj3sPn
 a3COXyrpyDf6fsBF3BF8ibZIyc5GZZXjIn5XOsW2C7VSg3gO+quHkVSaTQZgKMdxrHIp
 4F5HH6g1MevTxGAiTNY8y6LIV/nNmK6m5RyhYcZ7HLNea9VBRYzpO+1q3KLrFcxUnyfZ
 hjdnNF9N07/x4joPojOEXiBQ0mjH8FIK+iz/VMKAcVU/ZHHeE0YSb3+wL/Z6lZisUlMO
 Ky/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ejnwplBuFjPQYjVXN/BBF9M+6FV2TieQ9nezCnNqXI4=;
 b=WwQ/OL5ykOb70zbQBP2j2YSvnXNCNoO8BdhzOfclPRUUoN79u2k75fsqRhuhDyjqXZ
 tEVNIkZJpxv/PlWsNCUvUkmlZqjLiVZM6BU5/LNH7yMbOjUsdhgyxKEKusTCl6fRm1CJ
 31IHZebgy1uAZlMI7xqJFLaSNFFjmrvTtAspavNGCtqvhMbR0VwN1RzQdJQqL9CZQ1qN
 5xr6bJuM6RZuOxvBm2+Gu4A5a4szaORP/+o1sQG4G+1mLD+Bzf0P5eW2IFAaA0Qb8mhu
 VeA3FrUDMqxFuoCbHTdMWqxdCEcCZqFWydXRHeO1H2QosR5PfpBxeJJHeXSKTq1PEOwu
 CM1A==
X-Gm-Message-State: ANoB5plqDpXhoVPRL4qUEEcTn8XqvFlKI0Bim9ZuDBQQHjLgmzw8q5g8
 ALYpRdWKZ0/Ksgx7eYEXxDer4SJyW1kgARaz
X-Google-Smtp-Source: AA0mqf49mTY5QY8axnr4YCSjW4nwf8vcLJz5224sutztaD9dPVtrC7NgS26rNOdfhOGeMUnA0dSvnA==
X-Received: by 2002:a05:600c:4494:b0:3d2:3d3c:46f7 with SMTP id
 e20-20020a05600c449400b003d23d3c46f7mr9234052wmo.30.1671226971698; 
 Fri, 16 Dec 2022 13:42:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/36] hw: Remove device_legacy_reset()
Date: Fri, 16 Dec 2022 21:42:14 +0000
Message-Id: <20221216214244.1391647-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

The device_legacy_reset() function is now not used anywhere, so we
can remove the implementation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/qdev-core.h |  9 ---------
 hw/core/qdev.c         | 10 ----------
 hw/core/trace-events   |  1 -
 3 files changed, 20 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index c7eda169d78..35fddb19a64 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -776,15 +776,6 @@ BusState *sysbus_get_default(void);
 char *qdev_get_fw_dev_path(DeviceState *dev);
 char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState *dev);
 
-/**
- * device_legacy_reset:
- *
- * Reset a single device (by calling the reset method).
- * Note: This function is deprecated and will be removed when it becomes unused.
- * Please use device_cold_reset() now.
- */
-void device_legacy_reset(DeviceState *dev);
-
 void device_class_set_props(DeviceClass *dc, Property *props);
 
 /**
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index c5ea0adc713..d759c4602c2 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -868,16 +868,6 @@ void device_class_set_parent_unrealize(DeviceClass *dc,
     dc->unrealize = dev_unrealize;
 }
 
-void device_legacy_reset(DeviceState *dev)
-{
-    DeviceClass *klass = DEVICE_GET_CLASS(dev);
-
-    trace_qdev_reset(dev, object_get_typename(OBJECT(dev)));
-    if (klass->reset) {
-        klass->reset(dev);
-    }
-}
-
 Object *qdev_get_machine(void)
 {
     static Object *dev;
diff --git a/hw/core/trace-events b/hw/core/trace-events
index 6da317247f4..56da55bd71d 100644
--- a/hw/core/trace-events
+++ b/hw/core/trace-events
@@ -2,7 +2,6 @@
 loader_write_rom(const char *name, uint64_t gpa, uint64_t size, bool isrom) "%s: @0x%"PRIx64" size=0x%"PRIx64" ROM=%d"
 
 # qdev.c
-qdev_reset(void *obj, const char *objtype) "obj=%p(%s)"
 qdev_update_parent_bus(void *obj, const char *objtype, void *oldp, const char *oldptype, void *newp, const char *newptype) "obj=%p(%s) old_parent=%p(%s) new_parent=%p(%s)"
 
 # resettable.c
-- 
2.25.1


