Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D43A5961DB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:06:16 +0200 (CEST)
Received: from localhost ([::1]:34990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0xD-00039K-IM
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TJ-0005WH-LI; Tue, 16 Aug 2022 13:35:22 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36]:40912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TI-0002bo-1M; Tue, 16 Aug 2022 13:35:21 -0400
Received: by mail-vk1-xa36.google.com with SMTP id c22so5516678vko.7;
 Tue, 16 Aug 2022 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/Vah1AuhQRScSFR5gj4+/AeA5/yJnR0p8a4S5U2NcVQ=;
 b=HsJ11dYmxf56zpSZ96Wzrg3Ecrsz0eAIDJCkV6IboGuEKbo0XQvKQsw+o51JKhOiLx
 /bLLV+hK6mkE5Byf+8shNbnfCAr7OV0p5h6h7PoSZPEaQg6a38ZbSTxq9m10YZwUTMVk
 1pvOlAuXHVTTXquKPIPDx6xwlcgwqNNXAVpJsMCo7tFaf1pqjb/yF8kKEWZ8t/kUfoE3
 q7eaXlt8VA+dxcCzNP6SLl2QixXLYarNChsR/h/ZCTvps/GuN4/ZQ6KpFy0xJbQW/0tQ
 lK0WqbjKi+tAPotxp0oGRVHcSws7nFDKp2cCKqq6osouctuv5sRZiwYuSFcp/d7PM0Yi
 Xxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/Vah1AuhQRScSFR5gj4+/AeA5/yJnR0p8a4S5U2NcVQ=;
 b=2pFWkidKdOfQQ/LXq1kpuVffvBVwpKqhgjYEL902BpcJE9wA7oeMTmmTNWAMxxTE7C
 WY57PWn48jmZ1wWV3S1SJcpqHjyeKT7RBZgutrxTkr1NUdJQg4Au32Z6vhFoGds9yIxN
 +6Fa1yMQnJJ5Mr5VFozyazEgXkB3DLQa55nFH0lhRXAanmx9gwZGPszB9M1NvpPAcG6w
 PTcOgKRrQGn1+TJ6J2QPTHeZM1ty6uFd1aFs6d9iMY/cInORRw+379ql0uFVeLQaH3/h
 ciMW6Gmx9DgheNuh02JXvNWyXWiFUltSrrd29zdsvuv4xxlPOZDPG6JtfUsFy8yQpnkl
 1pQw==
X-Gm-Message-State: ACgBeo1rRlt8jtRjucjSk8kpbjQe8UruKO9vWGkqvf/t+GlJ+ok45Mv0
 ItXW/k4vh/G7yQV8YWtiguMl+3qOyhKHQA==
X-Google-Smtp-Source: AA6agR7Hn8wkHrKxYxKtmdZpq6X/IfDH+dZqdLpeSNkp76HYPXTVRvmf0In/djEYZE/m7DaV/I4Xew==
X-Received: by 2002:a05:6122:d86:b0:37d:3fe:df43 with SMTP id
 bc6-20020a0561220d8600b0037d03fedf43mr9587894vkb.15.1660671318713; 
 Tue, 16 Aug 2022 10:35:18 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:35:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 17/20] device_tree.c: support remaining FDT prop
 types
Date: Tue, 16 Aug 2022 14:34:25 -0300
Message-Id: <20220816173428.157304-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When printing a blob with 'dtc' using the '-O dts' option there are 3
distinct data types being printed: strings, arrays of uint32s and
regular byte arrays.

Previous patch added support to print strings. Let's add the remaining
formats. We want to resemble the format that 'dtc -O dts' uses, so every
uint32 array uses angle brackets (<>), and regular byte array uses square
brackets ([]). For properties that has no values we keep printing just
its name.

The /chosen FDT node from the pSeris machine gives an example of all
property types 'info fdt' is now able to display:

(qemu) info fdt /chosen
chosen {
    ibm,architecture-vec-5 = [00 00];
    rng-seed = <0x9cf5071b 0xf8804213 0xbe797764 0xad3d955 0xe0c9637 0x1f99c61e 0xe9243741 0xe800f17d>;
    ibm,arch-vec-5-platform-support = <0x178018c0 0x19001a40>;
    linux,pci-probe-only = <0x0>;
    stdout-path = "/vdevice/vty@71000000";
    linux,stdout-path = "/vdevice/vty@71000000";
    qemu,graphic-depth = <0x20>;
    qemu,graphic-height = <0x258>;
    qemu,graphic-width = <0x320>;
}

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 softmmu/device_tree.c | 57 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index d32d6856da..43f96e371b 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -720,6 +720,52 @@ static void fdt_prop_format_string_array(GString *buf,
     g_string_append_printf(buf, ";\n");
 }
 
+static bool fdt_prop_is_uint32_array(int size)
+{
+    return size % 4 == 0;
+}
+
+static void fdt_prop_format_uint32_array(GString *buf,
+                                         const char *propname,
+                                         const void *data,
+                                         int prop_size, int padding)
+{
+    const fdt32_t *array = data;
+    int array_len = prop_size / 4;
+    int i;
+
+    g_string_append_printf(buf, "%*s%s = <", padding, "", propname);
+
+    for (i = 0; i < array_len; i++) {
+        g_string_append_printf(buf, "0x%" PRIx32, fdt32_to_cpu(array[i]));
+
+        if (i < array_len - 1) {
+            g_string_append_printf(buf, " ");
+        }
+    }
+
+    g_string_append_printf(buf, ">;\n");
+}
+
+static void fdt_prop_format_val(GString *buf, const char *propname,
+                                const void *data, int prop_size,
+                                int padding)
+{
+    const char *val = data;
+    int i;
+
+    g_string_append_printf(buf, "%*s%s = [", padding, "", propname);
+
+    for (i = 0; i < prop_size; i++) {
+        g_string_append_printf(buf, "%02x", val[i]);
+        if (i < prop_size - 1) {
+            g_string_append_printf(buf, " ");
+        }
+    }
+
+    g_string_append_printf(buf, "];\n");
+}
+
 static void fdt_format_node(GString *buf, int node, int depth)
 {
     const struct fdt_property *prop = NULL;
@@ -738,11 +784,20 @@ static void fdt_format_node(GString *buf, int node, int depth)
         prop = fdt_get_property_by_offset(fdt, property, &prop_size);
         propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
 
+        if (prop_size == 0) {
+            g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
+            continue;
+        }
+
         if (fdt_prop_is_string_array(prop->data, prop_size)) {
             fdt_prop_format_string_array(buf, propname, prop->data,
                                          prop_size, padding);
+        } else if (fdt_prop_is_uint32_array(prop_size)) {
+            fdt_prop_format_uint32_array(buf, propname, prop->data, prop_size,
+                                         padding);
         } else {
-            g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
+            fdt_prop_format_val(buf, propname, prop->data,
+                                prop_size, padding);
         }
     }
 
-- 
2.37.2


