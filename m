Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD405A29C4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:42:08 +0200 (CEST)
Received: from localhost ([::1]:36826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaX9-0005Kp-SS
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4v-0000J9-DK; Fri, 26 Aug 2022 10:12:57 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:37679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4q-00045q-E9; Fri, 26 Aug 2022 10:12:57 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-11e7e0a63e2so1347688fac.4; 
 Fri, 26 Aug 2022 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=GGIPr/tCDqHwKBtmxyaze85YwD8Hym/cXe/mUpra+nw=;
 b=ZNiPhooh8ydDA/MFvoSBqUIXLJ2CkAlhBQUcwYVGPdsXXdoGufjvMWqKISAq/+b5CS
 K0vIrmRhwhstfjlF3AFCwaOlhgNCpKx8+HzDg+yEiCaEcix+UuEtppKnq5pidK0hNX0n
 N3zCOE4kA4RYxKHCq5alyWtq3l7YusokTJ2W+GjvIoZtrYJr2uyi8z0uixW71pIXV9v5
 rfC5grzHEMJG6TuHMC0SYxH322TZUO2X8owtGy04tolgmQIGq/6kq9suDCxqvQYebUsP
 B50iZHBuQTFUTMJh0SaXmmFD+iRkqBnXIgqSLUfJMszWBCCyKwHzenhzxgkkx9BBnpod
 rwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=GGIPr/tCDqHwKBtmxyaze85YwD8Hym/cXe/mUpra+nw=;
 b=r1FZiW7mgecJgsX4hJNjwVqQ8dMxwuC0y0zBCgxsOywcsobxgFqWGPO8ZCmcN06wxf
 6JPUCm0dlkDR2gBCHVOBMWIBd2fNB5pTagzoanR0yGP8Aj2EZthAaFdNn+8Y19u04dSd
 d/WcBi8vN4uvHsKacw21Zh7qF5Gi6fLphvIpGrMA24NH/DuAsi/cEUT0VLIkewkftxme
 /FWA/JFd2zmMDBBz8vLKq6FQAcwXWTqXAXfVIfw51aANbi4C0X7pArvQAENr2iB8OhgC
 6vryGZe5mDS5EdWJy0Y9f/TP9YqlRWecPSw0bLvjk579bcoZLPc5TYEi17NEzcm1g5DZ
 JNcw==
X-Gm-Message-State: ACgBeo2Yw98ZfhmE9ZvIwaMK/F1xxUXdGI429l5fcSVotG9OInVsNcgF
 +wFhr3780BwxUYS+ZxjM2PTS40Y5/0w=
X-Google-Smtp-Source: AA6agR7ypqn6+9y4xkX2/HS7fqV6gZHVJnyJDJ5ocihfQEuyY3dxchRgnDvrfpz/qR7HgiZvWyehoQ==
X-Received: by 2002:a05:6870:c14a:b0:11d:588:da3a with SMTP id
 g10-20020a056870c14a00b0011d0588da3amr1891424oad.214.1661523170927; 
 Fri, 26 Aug 2022 07:12:50 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:50 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 19/21] device_tree.c: add fdt_format_property()
 helper
Date: Fri, 26 Aug 2022 11:11:48 -0300
Message-Id: <20220826141150.7201-20-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

We want to be able to also print properties with 'info fdt'.

Create a helper to format properties based on the already existing code
from fdt_format_node().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 softmmu/device_tree.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 5e4cb119f2..70a011495d 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -766,6 +766,25 @@ static void fdt_prop_format_val(GString *buf, const char *propname,
     g_string_append_printf(buf, "];\n");
 }
 
+static void fdt_format_property(GString *buf, const char *propname,
+                                const void *data, int prop_size,
+                                int padding)
+{
+    if (prop_size == 0) {
+        g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
+        return;
+    }
+
+    if (fdt_prop_is_string_array(data, prop_size)) {
+        fdt_prop_format_string_array(buf, propname, data, prop_size,
+                                     padding);
+    } else if (fdt_prop_is_uint32_array(prop_size)) {
+        fdt_prop_format_uint32_array(buf, propname, data, prop_size,
+                                     padding);
+    } else {
+        fdt_prop_format_val(buf, propname, data, prop_size, padding);
+    }
+}
 
 static void fdt_format_node(GString *buf, int node, int depth,
                             const char *fullpath)
@@ -793,21 +812,7 @@ static void fdt_format_node(GString *buf, int node, int depth,
         prop = fdt_get_property_by_offset(fdt, property, &prop_size);
         propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
 
-        if (prop_size == 0) {
-            g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
-            continue;
-        }
-
-        if (fdt_prop_is_string_array(prop->data, prop_size)) {
-            fdt_prop_format_string_array(buf, propname, prop->data,
-                                         prop_size, padding);
-        } else if (fdt_prop_is_uint32_array(prop_size)) {
-            fdt_prop_format_uint32_array(buf, propname, prop->data, prop_size,
-                                         padding);
-        } else {
-            fdt_prop_format_val(buf, propname, prop->data,
-                                prop_size, padding);
-        }
+        fdt_format_property(buf, propname, prop->data, prop_size, padding);
     }
 
     fdt_for_each_subnode(node, fdt, parent) {
-- 
2.37.2


