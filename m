Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFA258A942
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:14:48 +0200 (CEST)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuLv-0005Uh-4S
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtou-0007e8-KA
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:40 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:47058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtop-0001iP-7P
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:38 -0400
Received: by mail-ua1-x92e.google.com with SMTP id z14so823856uaq.13
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=A3eMa96N5+DdIY5wqc8E6Ll1NSx7o7edEN31miUgkfI=;
 b=cC9nTq5kESxrGWr+0tTKo5M+scNzLDe0k/hHjIwuP/8MDim1lg+tjsd44zy7XJl4fi
 DICMgVmsKY403lQHrwtxQhX76cYgghurKIEERcDqj3kN4+mj0eD3St3gazPb/ckD7dgc
 96chfKKayHXa1mCt0+WzoqMxTXA3UGMCQVRFHu3/em8Nfe35s6vt9Mo30RBR65Xv+PVC
 xcOqj2fnWLTFwRi/Jlk3RmylOuGJzkBFBp9CchjkDJMqJ00cazOWKg/+AsHY/0JaQw64
 9FiHg1uClAc2WbbbOdR7+M3o7y7CPKDauelLOGzRnlR+d/cBU9d1SFG8GwKr7qbrOHf1
 GtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=A3eMa96N5+DdIY5wqc8E6Ll1NSx7o7edEN31miUgkfI=;
 b=Sj/1rZbW2Rn/OTilVA5pG6ax42SiL4NpAOobTOLCdEDJRbyaU+SA78DQUZSseAjeOT
 hul1+HHshYfODz5QDDOlFJ9coPCI11LH2qrQhV7bsQeK/QsgXh3frWyD+ZlMXpPArCVI
 EuGrnXKf3Cir/QbXHHFbQhJdG5FuWsz/yvNJYJ8cLxQTf2HIf+F0KQLMTKeJxEyfy8Sy
 Nlku8QQfBafikQ/adK1UBjOs9j56FrNsalaOKRyicQx7RomWck/55LiSAxjxhu1R0RLJ
 1awtjkm+VBoBqnOaW0ifAwRTUe6eYoyjqa2RpkigwkHnTbOkvpodXRmfY/0iVEzjo6K4
 Gh0w==
X-Gm-Message-State: ACgBeo22PcaDBwJAI3xW3paFAux1W4/arHs7w8EJ/m2hVhQtqMaWL0Ba
 sdQKZiQCrfHQItB1mvxRp2KBtHDNPtk=
X-Google-Smtp-Source: AA6agR4It1zOZ2EEHy/jEwWwfxmcCQcAFD/fzPPq7lUZCOMbxnbCuOuLCoV9ptFhttLEjrKWyrQzog==
X-Received: by 2002:ab0:3bc6:0:b0:381:c4db:ef5 with SMTP id
 q6-20020ab03bc6000000b00381c4db0ef5mr2937984uaw.81.1659692429834; 
 Fri, 05 Aug 2022 02:40:29 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v2 17/20] device_tree.c: support remaining FDT prop
 types
Date: Fri,  5 Aug 2022 06:39:45 -0300
Message-Id: <20220805093948.82561-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92e.google.com
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
    ibm,architecture-vec-5 = [0 0]
    rng-seed = <0x5967a270 0x62b0fb4f 0x8262b46a 0xabf48423 0xcce9615 0xf9daae64 0x66564790 0x357d1604>
    ibm,arch-vec-5-platform-support = <0x178018c0 0x19001a40>
    linux,pci-probe-only = <0x0>
    stdout-path = '/vdevice/vty@71000000'
    linux,stdout-path = '/vdevice/vty@71000000'
    qemu,graphic-depth = <0x20>
    qemu,graphic-height = <0x258>
    qemu,graphic-width = <0x320>
}

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 softmmu/device_tree.c | 58 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 8691c3ccc0..9d95e4120b 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -681,6 +681,53 @@ static bool fdt_prop_is_string(const void *data, int size)
     return true;
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
+    g_string_append_printf(buf, ">\n");
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
+        g_string_append_printf(buf, "%x", val[i]);
+
+        if (i < prop_size - 1) {
+            g_string_append_printf(buf, " ");
+        }
+    }
+
+    g_string_append_printf(buf, "]\n");
+}
+
 static void fdt_format_node(GString *buf, int node, int depth)
 {
     const struct fdt_property *prop = NULL;
@@ -699,11 +746,20 @@ static void fdt_format_node(GString *buf, int node, int depth)
         prop = fdt_get_property_by_offset(fdt, property, &prop_size);
         propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
 
+        if (prop_size == 0) {
+            g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
+            continue;
+        }
+
         if (fdt_prop_is_string(prop->data, prop_size)) {
             g_string_append_printf(buf, "%*s%s = '%s'\n",
                                    padding, "", propname, prop->data);
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
2.36.1


