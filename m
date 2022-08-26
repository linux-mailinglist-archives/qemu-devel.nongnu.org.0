Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2A5A2957
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:26:48 +0200 (CEST)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaIJ-0003xB-Eu
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4m-0008JJ-I7; Fri, 26 Aug 2022 10:12:49 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4k-000448-UP; Fri, 26 Aug 2022 10:12:48 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11e8b592421so721725fac.0; 
 Fri, 26 Aug 2022 07:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=KRFx6V1DJCNRq8IcfTrxMaL3ZO8XkbM3yOTe5IXGOOU=;
 b=ONqB98y0jDUIm2Oz4L9XgCud9jicnRFnzYHW//IT1jGRUvBmnNTAAosXYHT3lofO5n
 F45jpVC+nvEZ5C24BiJLEsvqLK0Ay0seTHzDB4VNAxQ8SwjcVYvJfcQa1WcKIQYb56Q3
 H2mCpyGU7FIXqfkLLY5JJJ6yNO6xMrIvg9AK6H0XoTssBwFborL1+nvpwK1092wZi1S/
 O8Fl23CK3DNSgX/FLCrBa6e/RdCMszs+Ju0/OR1EK6bHgqXLpjySucCwzzz8JRNwk25w
 z0I0kZaJIk6xWPj3D5xCOc+zKmoypXx+jMbYWsK0t7YaZjF15zwr6PoJNG3EaexvoDqd
 h5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=KRFx6V1DJCNRq8IcfTrxMaL3ZO8XkbM3yOTe5IXGOOU=;
 b=6EkbGV5v3WM14BziRFkmeimhXXrI7OvDJqWMdgpJSJ93I1zgVJOod9f6bjSD8FBn9a
 92Hon5Qo4ep3IQiAZjxpwl8Rjk1BP2Y1QQCFnlt9jEeBw6oZ6Z7oQeSLY+xtV3E0MWos
 9J3y1dWOB9tSu9GVzCqriyw4z3SK52R1yTupw3VAydrexUa9HqaeduMjIqdDWRgISf1Q
 miomJWxBqNRt/Y7YvOHe4HPB54KwAiKvenL4sphuzFRpSsXwrHEdbU4m9dH7x9FRzbhG
 zZ4D55Owu3Q50LBi0y0e6sVaE0HGopT1u3L0YCpyR0NXCpL34nTSAWqBBFeBMY5kdtAr
 nkzA==
X-Gm-Message-State: ACgBeo0csd05hx5f5ZrUosnmst59rKk0K+fYCfil86aOfqfZrjpJV9zt
 aikfnZVEAApwHIrcTm08RnovnTOXvDw=
X-Google-Smtp-Source: AA6agR6H71FXi7WTl+H34U8K+h1G1CiM319An9q4JUA63//sftXxoQC1dNcT7GmNYglegMx8FqRcJw==
X-Received: by 2002:a05:6870:2488:b0:10c:3362:17ff with SMTP id
 s8-20020a056870248800b0010c336217ffmr1860749oaq.33.1661523165730; 
 Fri, 26 Aug 2022 07:12:45 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 17/21] device_tree.c: support remaining FDT prop
 types
Date: Fri, 26 Aug 2022 11:11:46 -0300
Message-Id: <20220826141150.7201-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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
index 3e38d9ddad..a770c6c1cc 100644
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


