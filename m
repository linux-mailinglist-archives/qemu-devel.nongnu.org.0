Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48B56894DD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 11:14:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNt44-0008QU-Ng; Fri, 03 Feb 2023 05:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3p-0008N2-RE
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:12:50 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3o-0002I0-BW
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:12:49 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q5so4218244wrv.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 02:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tYOm6U1mrpjpeze33/MXi3JiNC/zlctq5Oro7JtmJks=;
 b=yBju/Ft8sFCHC+DJwCACGjj0Or9yAr/a5cn+g6lRhQM7ORDKhIegCbqjxj+zQOvYSe
 HLnc64zgZNM/c7CgI99RtIiLOcWTIX1TdvAX3n0Ck4YDd9gXazqkFB/b6NmBlG7CoMcN
 CPvYFj6Kc/3rNjgWJ38JSfrbSQA1tewpldAm6bqGNOO2OusqTsO4aq3dilClwYMlhctD
 qwpMRhHUaYAAEHDlNiT4v1PTryOZ+91ayPmpOSUjoTR0zfcBH3Usp9OujPwOaXjhp4Ua
 ShTu4cSiJW4CaTe/J9RmgmL7ybSLxW2JkP+MOazcH2b76c6DJRriYbi16LxsPzhEOpSJ
 0WlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tYOm6U1mrpjpeze33/MXi3JiNC/zlctq5Oro7JtmJks=;
 b=Pxf8+XbPJkiW3R6fYOcUgzPMMC/Z/1oFTQw2vv1uumrHI3+FqB2sTloTJR7rZBBjzw
 cxYvQ3v9cM2ZJnFt4abRvomlDpPI6WyI2hWIwYip0lkgTatson47vrr1KkqDCpnKN9sL
 kmYV1Z2fDlAhiyPGMk3hGMrasfyqV98VBDo1NVJM68nsY3Gxnvcz4Zv80VHlQxVK2gHs
 HfAUHgu8Y1QRP3ZQpAIouFBU1/mx0hL73TCTPenKeyBqiX3g5LwE1WFY0lV1QuGSsKYb
 lRV4UkTdnw0aZGq/eNalQSlDM4a7Le51+yH3dscXjYhqnBsFTQGRcjyCNydICkF8sn7b
 VsFQ==
X-Gm-Message-State: AO0yUKWhTWS9F81rhzjVVWRxyEnkZTmA0STvIsZTVI3q+72rr5tfOK5H
 Vjx3w27iVPDUrVCxZ1M79El1hr7TlJBr9A8Y
X-Google-Smtp-Source: AK7set9HP2Rn2kSZdil907vjUWWofCvii/39NKh7sRQR+lLfAqYJ+aJU9viqbaZESELF8egPLHXegA==
X-Received: by 2002:a5d:6d46:0:b0:2bf:bac7:30d4 with SMTP id
 k6-20020a5d6d46000000b002bfbac730d4mr8440644wri.53.1675419166611; 
 Fri, 03 Feb 2023 02:12:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a056000008200b002bfb7c2430bsm1634964wrx.19.2023.02.03.02.12.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 02:12:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/4] hw/qdev-properties: Constify DeviceClass::props_ field
Date: Fri,  3 Feb 2023 11:12:24 +0100
Message-Id: <20230203101224.25796-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203101224.25796-1-philmd@linaro.org>
References: <20230203101224.25796-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
 hw/core/qdev-properties.c | 10 +++++-----
 include/hw/qdev-core.h    |  2 +-
 softmmu/qdev-monitor.c    |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index baf9a91b29..9789a2f5de 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -640,7 +640,7 @@ const PropertyInfo qdev_prop_arraylen = {
 
 /* --- public helpers --- */
 
-static Property *qdev_prop_walk(Property *props, const char *name)
+static const Property *qdev_prop_walk(const Property *props, const char *name)
 {
     if (!props) {
         return NULL;
@@ -654,10 +654,10 @@ static Property *qdev_prop_walk(Property *props, const char *name)
     return NULL;
 }
 
-static Property *qdev_prop_find(DeviceState *dev, const char *name)
+static const Property *qdev_prop_find(DeviceState *dev, const char *name)
 {
     ObjectClass *class;
-    Property *prop;
+    const Property *prop;
 
     /* device properties */
     class = object_get_class(OBJECT(dev));
@@ -731,7 +731,7 @@ void qdev_prop_set_string(DeviceState *dev, const char *name, const char *value)
 
 void qdev_prop_set_enum(DeviceState *dev, const char *name, int value)
 {
-    Property *prop;
+    const Property *prop;
 
     prop = qdev_prop_find(dev, name);
     object_property_set_str(OBJECT(dev), name,
@@ -959,7 +959,7 @@ void device_class_set_props(DeviceClass *dc, Property *props)
 void qdev_alias_all_properties(DeviceState *target, Object *source)
 {
     ObjectClass *class;
-    Property *prop;
+    const Property *prop;
 
     class = object_get_class(OBJECT(target));
     do {
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 35fddb19a6..fd11e9a82f 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -108,7 +108,7 @@ struct DeviceClass {
      * The underscore at the end ensures a compile-time error if someone
      * assigns to dc->props instead of using device_class_set_props.
      */
-    Property *props_;
+    const Property *props_;
 
     /*
      * Can this device be instantiated with -device / device_add?
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 4b0ef65780..f47de51f95 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -741,8 +741,8 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
 #define qdev_printf(fmt, ...) monitor_printf(mon, "%*s" fmt, indent, "", ## __VA_ARGS__)
 static void qbus_print(Monitor *mon, BusState *bus, int indent);
 
-static void qdev_print_props(Monitor *mon, DeviceState *dev, Property *props,
-                             int indent)
+static void qdev_print_props(Monitor *mon, DeviceState *dev,
+                             const Property *props, int indent)
 {
     if (!props)
         return;
-- 
2.38.1


