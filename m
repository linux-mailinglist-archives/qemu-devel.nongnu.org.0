Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D0A6894D6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 11:13:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNt3n-0008Lp-8A; Fri, 03 Feb 2023 05:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3c-0008J3-89
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:12:38 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3Z-0002F4-Uk
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:12:36 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a2so3893609wrd.6
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 02:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrEmjsQWUs+O54UNiVqyUtKQaK97UySf4g9leluZ4II=;
 b=QQwOg9vlwpGMppX49RZ7vpgn7E0+iLi5zWjDrbtM7B9hAOEq3bI8N0OgO/8UmCOVB4
 VQPzh7FQ9wv3wVAk4yz6uC1qX+2xI8N/TT7EkD41A3dUKQUX2ccB4GDw5BLvP7D8y3Bs
 AM44GHLv7fZi39+PqR0h3L5MXBXpNIsoQXxlO/7O3gr6NjG8HQxm1IqcvAhI9oGVXZi7
 1n+JssDgT2dNgB0tSRGuvPqg4Xu18WbuuyaBqeWeCDRrXhD94uYlfCHylK3zXxsm32Hw
 n0/s+vQ8Z3bbzwWrCw38WH7KPfB65DpOiXgnxVCQSGDdgelp2bTX99xSgMpBgAMKtfFw
 XsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrEmjsQWUs+O54UNiVqyUtKQaK97UySf4g9leluZ4II=;
 b=HqwbLxSHA1alne9bDgycU0Z45yfdwxBaeTdVUMyvIlv02KTUMqXEZUEw6Q6SXgGaN0
 bbBHUv91puyM/GzMzAf8ChEp23lQS3qcbqQfE0N651B/LVoDCIxhJAI9moqZZjKx0Th8
 9ssCJZWjWfcgtY085zuhlWY50tm6OCThUHsLu+6r/AnWsD4y1j9pEKl+8E+yn6UXisGj
 DAqBakPBJsMou3IlPo+imUWk4Es5DAYZ1rMoAfVRK1H20QxjoXV4occWRtjIHc/5ryDC
 ZZRAcR/9eJ7Qfa0MothaPTG5d6Nt/fojac3/yV7utrrmqn2I+mhqaltcEKssE401GToX
 hnKg==
X-Gm-Message-State: AO0yUKX8xtqfwd5ufcs2lKRqk9Lz3Zf1iwUkCc8/mQL8x5CfnmbO472I
 QUEpXQBStGiKAq9r3+g7S94RlfyFtSP7eZx9
X-Google-Smtp-Source: AK7set9939UJFm/XvmsBvTnrb+LLdcfOD1q05umb0m0izfFyaYo8k4AvZXUiNPiCNEWwJn8ZiKXbbw==
X-Received: by 2002:adf:8912:0:b0:2bf:e692:2636 with SMTP id
 s18-20020adf8912000000b002bfe6922636mr9049032wrs.26.1675419152301; 
 Fri, 03 Feb 2023 02:12:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bv20-20020a0560001f1400b002bc8130cca7sm1586794wrb.23.2023.02.03.02.12.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 02:12:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/4] hw/qdev-properties: Constify Property* in
 object_field_prop_ptr()
Date: Fri,  3 Feb 2023 11:12:21 +0100
Message-Id: <20230203101224.25796-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203101224.25796-1-philmd@linaro.org>
References: <20230203101224.25796-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

The pointed Property structure is accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev-properties.c    | 2 +-
 include/hw/qdev-properties.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 357b8761b5..858c33830c 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -50,7 +50,7 @@ void qdev_prop_allow_set_link_before_realize(const Object *obj,
     }
 }
 
-void *object_field_prop_ptr(Object *obj, Property *prop)
+void *object_field_prop_ptr(Object *obj, const Property *prop)
 {
     void *ptr = obj;
     ptr += prop->offset;
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index e1df08876c..b5a0ab34f3 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -206,7 +206,7 @@ void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
                            const uint8_t *value);
 void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
 
-void *object_field_prop_ptr(Object *obj, Property *prop);
+void *object_field_prop_ptr(Object *obj, const Property *prop);
 
 void qdev_prop_register_global(GlobalProperty *prop);
 const GlobalProperty *qdev_find_global_prop(Object *obj,
-- 
2.38.1


