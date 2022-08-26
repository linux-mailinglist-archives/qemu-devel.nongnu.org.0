Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5175A2948
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:23:35 +0200 (CEST)
Received: from localhost ([::1]:40438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaFC-0006Zj-T2
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4j-0008Hf-S9; Fri, 26 Aug 2022 10:12:47 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:45810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4h-00044T-Tq; Fri, 26 Aug 2022 10:12:45 -0400
Received: by mail-oi1-x233.google.com with SMTP id o204so2096981oia.12;
 Fri, 26 Aug 2022 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3WFTx8tKktnqdh/Jp2z4twP6sgM95iWuQSmsE8ZM7FE=;
 b=S0blnVW9VmEMh+UMUIc9RX1+9MBJW2FxuiYal6zyVCv+e2684k++d+yEzj7nvzyiUj
 hNth1m5ZSd37IneoQ9FnCFOLzvEu3lxQuy2dIrMS/gT4qvAqgB0IRS5n6oKNGWP5ZXCU
 7uYxQL7VuHQMpz0djXrqWB5PojXL8QKNfxkRQDTjXdNLUHjYD/uhuBSnY9Lq3Qi03OsX
 GbmFkebQlOw1FeqkZspHkR99yl5h3+ucCMZBuHTuPLOFo3q7CxAHJaWKvlpfx22t3Trs
 ZwP+zT6O0N9fMl5BTal8CVxrdgrelrWTswgSN8sbEfeQN7dCN2YaoaKdFZeBeoKHoqoQ
 /qHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3WFTx8tKktnqdh/Jp2z4twP6sgM95iWuQSmsE8ZM7FE=;
 b=gJG2drEORvF1HIKv/z0lD4TsyMjZMl8rHoY9xWzeQy5UJhR9t6ZM+dlUY0ysMwpKcK
 PZEM++F4fGfyXTnpLk2YcwwA/cI+zVwz9x2xdscgKtmI7bS+CVp2agwUWsc7+a2pbT/w
 qqUAsVm7ri56l/uEculNWlB2vA9qGrFJdyIwaQ45Yjye6vEApk+yquF8e0XpJs8sHaZv
 mE7F+J+8eCb/SQMJoPvpH4GkuZGuC9eIMTTzFaSQCV1rijpA6wBXtTHVkwURLFzW3PqA
 J/MEMwFzRGiNik79dDMK/ziFAJ1uvtS9OdOk67Ya69DfGOp0Eq7PQD96IUBcEsZxDMpR
 OmZA==
X-Gm-Message-State: ACgBeo27rStX/u3TWICez8HjAz9hxmL43kAFsXqt3jDULVQT1cMSdPF3
 +OCib46OXw4Tlq4MnhDJ73qgTgcGGj4=
X-Google-Smtp-Source: AA6agR6glQoqxi3D2sn2yR0/z5R339lST3+y8tmYR3MXS4mZDdEV5fZ12aRKCkPIZ2gwCVQuOgQzow==
X-Received: by 2002:a05:6808:e90:b0:345:6ee0:9a68 with SMTP id
 k16-20020a0568080e9000b003456ee09a68mr1758963oil.173.1661523161845; 
 Fri, 26 Aug 2022 07:12:41 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 16/21] device_tree.c: support string array prop in
 fdt_format_node()
Date: Fri, 26 Aug 2022 11:11:45 -0300
Message-Id: <20220826141150.7201-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
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
    ibm,hypertas-functions = "hcall-pft", "hcall-term", "hcall-dabr", "hcall-interrupt", "hcall-tce", "hcall-vio", "hcall-splpar", "hcall-join", "hcall-bulk", "hcall-set-mode", "hcall-sprg0", "hcall-copy", "hcall-debug", "hcall-vphn", "hcall-multi-tce", "hcall-hpt-resize", "hcall-watchdog";
};

'qemu,hypertas-functions' is a property with a single string while
'ibm,hypertas-functions' is a string array.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 softmmu/device_tree.c | 64 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 6b15f6ace2..3e38d9ddad 100644
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
+            g_string_append_printf(buf, ", ");
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


