Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F64859618A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:54:19 +0200 (CEST)
Received: from localhost ([::1]:59840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0le-0003wq-7r
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TH-0005OJ-85; Tue, 16 Aug 2022 13:35:19 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:35648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TF-0002a7-Ek; Tue, 16 Aug 2022 13:35:18 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id 67so10850685vsv.2;
 Tue, 16 Aug 2022 10:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2G0KC9s5eloc9sWqEhAiUUFPFdVwB90hf4HNjl5dH4A=;
 b=LvZkyCqzqGouay6AhTVFv/CDYdXilvQtwCaGyTe2Ljz2UWmn4fJBEh3CZwbVo3kxXT
 aq+vpTPJ0PJlCU7L4R3/CGrkUx89BTq0IdPSkoo+AyI4llUHQDwke/cDAMkzaVyBfykS
 /TtFBt1ZvtiqHOaPIogWJMA2XY4EnhRULWhOyPE9SWVuSiqM2M71KEpEOk3GjlFGa7bc
 59ATC7b1qNk31QEQ4JWjMqF2799B5VGqKNZwzJwHYbkxIAnJr9RnAUifyD2DUWCnr+Tk
 gC8gTTO661ayhLs4oU3h0WtFFQJwlCQxAtMlDnQcOak+ig/IXbzlRTgz67cH2mGv9/tO
 YNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2G0KC9s5eloc9sWqEhAiUUFPFdVwB90hf4HNjl5dH4A=;
 b=SCoG3tkKNYfwPAEZemvPGINXs/ub2TG7lw8+IPSEOS8eCQG5nOyicyPAWn0IDJnwy8
 AiYRX+lPH8oZugLg3p2LmoLP3giX1z48PB/lj3+bhxYhuvdH7YEBu4An0A2SMplu6856
 ZSXGVZFVSwVjSlLTQ/Pa6hkyYXtgcpaPHLtsFMRAaHH9h49qrdWGSuQdLkAEA2LXsMyF
 EKq6tYOuwpzH/QnzPv63czkgGE8QUkjhLKeRIRYoKl69rzihlw8ebrOfpgH8OplXcN/P
 ePp2kUg62biv2CA+7EM0nFEAulYip4wDwJ337pr3Loc4T8ReobPws5JXjo2FS5wEt1fN
 DPzQ==
X-Gm-Message-State: ACgBeo2J8bWtpXJl8eyrq/JWOUEVcl3z0F+FytQPPXc13JvLN4ABfrn3
 aLu84UbeGBV1Ou1asmY+3M/3GdLJRO8ZTg==
X-Google-Smtp-Source: AA6agR4SIy28hGEzXBroNag6q8FKGusnVN9ctZyEcOe+d5IibZ7rXXUVI0LBjx1uIN/SPOVdxxF/jw==
X-Received: by 2002:a67:c30d:0:b0:370:25e1:7c with SMTP id
 r13-20020a67c30d000000b0037025e1007cmr9081126vsj.70.1660671316135; 
 Tue, 16 Aug 2022 10:35:16 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:35:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 16/20] device_tree.c: support string array prop in
 fdt_format_node()
Date: Tue, 16 Aug 2022 14:34:24 -0300
Message-Id: <20220816173428.157304-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2d.google.com
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

To support printing string properties in 'info fdt' we need to determine
whether a void data might contain a string array.

We do that by casting the void data to a string array and:

- check if the array finishes with a null character
- check if there's no empty string in the middle of the array (i.e.
consecutive \0\0 characters)
- check if all characters of each substring are printable

If all conditions are met, we'll consider it to be a string array data
type and print it accordingly. After this change, 'info fdt' is now able
to print string arrays. Here's an example of string arrays we're able to
print in the /rtas node of the ppc64 pSeries machine:

(qemu) info fdt /rtas
rtas {
    (...)
    qemu,hypertas-functions = "hcall-memop1";
    ibm,hypertas-functions = "hcall-pft","hcall-term","hcall-dabr",
"hcall-interrupt","hcall-tce","hcall-vio","hcall-splpar","hcall-join",
"hcall-bulk","hcall-set-mode","hcall-sprg0","hcall-copy","hcall-debug",
"hcall-vphn","hcall-multi-tce","hcall-hpt-resize","hcall-watchdog";
}

'qemu,hypertas-functions' is a property with a single string while
'ibm,hypertas-functions' is a string array.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 softmmu/device_tree.c | 64 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 3fb07b537f..d32d6856da 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -663,6 +663,63 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
     error_setg(errp, "Error when saving machine FDT to file %s", filename);
 }
 
+static bool fdt_prop_is_string_array(const void *data, int size)
+{
+    const char *str_arr, *str;
+    int i, str_len;
+
+    str_arr = str = data;
+
+    if (size <= 0 || str_arr[size - 1] != '\0') {
+        return false;
+    }
+
+    while (str < str_arr + size) {
+        str_len = strlen(str);
+
+        /*
+         * Do not consider empty strings (consecutives \0\0)
+         * as valid.
+         */
+        if (str_len == 0) {
+            return false;
+        }
+
+        for (i = 0; i < str_len; i++) {
+            if (!g_ascii_isprint(str[i])) {
+                return false;
+            }
+        }
+
+        str += str_len + 1;
+    }
+
+    return true;
+}
+
+static void fdt_prop_format_string_array(GString *buf,
+                                         const char *propname,
+                                         const char *data,
+                                         int prop_size, int padding)
+{
+    const char *str = data;
+
+    g_string_append_printf(buf, "%*s%s = ", padding, "", propname);
+
+    while (str < data + prop_size) {
+        /* appends up to the next '\0' */
+        g_string_append_printf(buf, "\"%s\"", str);
+
+        str += strlen(str) + 1;
+        if (str < data + prop_size) {
+            /* add a comma separator for the next string */
+            g_string_append_printf(buf, ",");
+        }
+    }
+
+    g_string_append_printf(buf, ";\n");
+}
+
 static void fdt_format_node(GString *buf, int node, int depth)
 {
     const struct fdt_property *prop = NULL;
@@ -681,7 +738,12 @@ static void fdt_format_node(GString *buf, int node, int depth)
         prop = fdt_get_property_by_offset(fdt, property, &prop_size);
         propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
 
-        g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
+        if (fdt_prop_is_string_array(prop->data, prop_size)) {
+            fdt_prop_format_string_array(buf, propname, prop->data,
+                                         prop_size, padding);
+        } else {
+            g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
+        }
     }
 
     padding -= 4;
-- 
2.37.2


