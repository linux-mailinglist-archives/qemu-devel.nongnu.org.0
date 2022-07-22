Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9D357E807
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:09:51 +0200 (CEST)
Received: from localhost ([::1]:35948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyy6-0000xW-KD
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyp3-00037F-TY
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:29 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:37693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyp2-0005G4-4h
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:29 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-10dc6e9f500so1605625fac.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 13:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ynwsvdFe45St3WK2+5YgYIPrTLY4PoonLky5nrdFajI=;
 b=fXzVXTzk6GDjtZPVXPM3kk69Gk8+2hoiKeUFG0NiF8po6q3xnqvVgN0ihyjiDZxBmT
 pHIaTJNT+iUapzBhBV+x4JZI5exBE53cGazcVYS8IGLMrGSyd1g7JohhIvC7OG/b5Mwp
 wBt2019Y7u3W9TfisQv+GnPKnx6CIRHH+O/6nLTKUCCRLsxU7lB4cIOKi5islxYO91cu
 wsDkVU7kafscjPizplinCh88mwakgRMAw+t5LnAUXy9vBe2uL/Wr5Wrd2l7GCBMQ2iim
 KWVFK/nuNk/FOkDxPFaLXzOdTzP8O17ptn+5sYs62NbxiEINY5xUeYyHmZGpoTuJ/y9d
 /6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ynwsvdFe45St3WK2+5YgYIPrTLY4PoonLky5nrdFajI=;
 b=mAhNpZBCyIUTfaaXqg704n7EQQwNA+kFaSAxxxbw5PIfMqctty9pZTBnmxhsEPI+b6
 sKHb3cGIFGplnw5BE9ZXv4i9+wWkF7aXopIR/EsgFtHc3v6PfwaV+qyCZ3Voaqxdh57w
 CoN27ZvzCBMZPkBLK9h01Y0LP62ilViwHM2CbKuJkui6pLf+TGWP1IGUKGQzNipFN2An
 s6nSY3FO3bcl1q3dsxLxmKmyNfmxU5L2bDuYZjrk6HiirrzVoE+HKvUnD2kls1XastjA
 /M1yz6W5rM/AfgZegQxzpJdbbbcTKPZ2chla6QQ+97jsl5jnbTpu4H1EZ+PHhufg1hqR
 /R2A==
X-Gm-Message-State: AJIora845Tb339NF7ndmqoYpSiJdWt0cinTnr4/qtDYKhsr4Ms7eqzYn
 mw7dF7hHlPFDA6ESdGvoluwzSyyazo8=
X-Google-Smtp-Source: AGRyM1t+5YIqFG6R/UhlZrCX7/MPTAWZuBO2zt6VTfOzBjts4Rap7ujpW4Z1WA1cJt7R2mnUKtFZyQ==
X-Received: by 2002:a05:6870:b613:b0:10b:db5f:6026 with SMTP id
 cm19-20020a056870b61300b0010bdb5f6026mr875790oab.159.1658520026447; 
 Fri, 22 Jul 2022 13:00:26 -0700 (PDT)
Received: from balboa.COMFAST ([152.254.206.198])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a9d740e000000b0061cae62aafcsm2388218otk.20.2022.07.22.13.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 13:00:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 07/10] device_tree.c: support remaining FDT prop types
Date: Fri, 22 Jul 2022 17:00:04 -0300
Message-Id: <20220722200007.1602174-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722200007.1602174-1-danielhb413@gmail.com>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
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
 softmmu/device_tree.c | 53 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 3c070acc0d..3a4d09483b 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -681,6 +681,46 @@ static bool fdt_prop_is_string(const void *data, int size)
     return true;
 }
 
+static bool fdt_prop_is_uint32_array(int size)
+{
+    return size % 4 == 0;
+}
+
+static void fdt_prop_print_uint32_array(const char *propname, const void *data,
+                                        int prop_size, int padding)
+{
+    const fdt32_t *array = data;
+    int array_len = prop_size / 4;
+    int i;
+
+    qemu_printf("%*s%s = <", padding, "", propname);
+    for (i = 0; i < array_len; i++) {
+        qemu_printf("0x%" PRIx32, fdt32_to_cpu(array[i]));
+
+        if (i < array_len - 1) {
+            qemu_printf(" ");
+        }
+    }
+    qemu_printf(">\n");
+}
+
+static void fdt_prop_print_val(const char *propname, const void *data,
+                               int prop_size, int padding)
+{
+    const char *val = data;
+    int i;
+
+    qemu_printf("%*s%s = [", padding, "", propname);
+    for (i = 0; i < prop_size; i++) {
+        qemu_printf("%x", val[i]);
+
+        if (i < prop_size - 1) {
+            qemu_printf(" ");
+        }
+    }
+    qemu_printf("]\n");
+}
+
 static void fdt_print_node(int node, int depth)
 {
     const struct fdt_property *prop = NULL;
@@ -698,10 +738,19 @@ static void fdt_print_node(int node, int depth)
         prop = fdt_get_property_by_offset(fdt, property, &prop_size);
         propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
 
+        if (prop_size == 0) {
+            qemu_printf("%*s%s;\n", padding, "", propname);
+            continue;
+        }
+
         if (fdt_prop_is_string(prop->data, prop_size)) {
-            qemu_printf("%*s%s = '%s'\n", padding, "", propname, prop->data);
+            qemu_printf("%*s%s = '%s'\n", padding, "",
+                        propname, (char *)prop->data);
+        } else if (fdt_prop_is_uint32_array(prop_size)) {
+            fdt_prop_print_uint32_array(propname, prop->data, prop_size,
+                                        padding);
         } else {
-            qemu_printf("%*s%s;\n", padding, "", propname);
+            fdt_prop_print_val(propname, prop->data, prop_size, padding);
         }
     }
 
-- 
2.36.1


