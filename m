Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7FC5961A6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:56:07 +0200 (CEST)
Received: from localhost ([::1]:35100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0nO-00087T-SE
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TO-0005ax-Ge; Tue, 16 Aug 2022 13:35:42 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:41912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TM-0002cH-Up; Tue, 16 Aug 2022 13:35:26 -0400
Received: by mail-vk1-xa34.google.com with SMTP id bq26so5508368vkb.8;
 Tue, 16 Aug 2022 10:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7MSOrzKW9De/OsPUl8FUotcZQZzHLy31adv2QBBK3xM=;
 b=ndkxuHF9BAU4wQb1kOc01x13HH87ql3pCtXfkWs7ieI78+UqNSTL1dhp74Jkfyw8hy
 +SZiP1ury5rWJMfS4ocgRa/aXSUCvrMmD5kkBfra1AwMotjhEjjbKmxOmG6YjlDicmbE
 5m6yvmAP/8lGBveUReOTDR9376csZ3s8mK8fTAWO8G0VUOYIZqjgJZmRhB1n+vOkqGSr
 /kqgBoRAr5RcdI3afcbOdSJqQLs+qKL2NixR7ISKWw+3kfNoFh7BGJfh0pzsFQWI8W3m
 mheV+cYCmqWXlP5c1d/67P27Pf66FpD6Nkr8eEOF15j12BfBOV9w61Ik8GlCjRsOuVsJ
 NThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7MSOrzKW9De/OsPUl8FUotcZQZzHLy31adv2QBBK3xM=;
 b=KxNKKsVjI0eq0gtxvxw4DxstURq/bwCo5dZKOU5rCqJESOUcwHCSErZGP6MSIWGFaF
 INkP9NX0GpT/g9joya49jJsi+FgbMD4eKWx+WXVrIXFMNSpOY44NiKAFDur4rtTmd7Wg
 VjvdkbQbFoifO1wX/WJyHPCRfSJPsq5TNAln3JWNKUYH/UpA2qF8HFWBjEhqvlgkRDSH
 wL4fcAFqQFIe8r4CtshMGCywIWrCzac6uB0WXIV9ESa/RHrrvET+nL8kCnHJbkbQQcbR
 DNqrlKQEQhFXo661C6aGogDJ7YxvJU7DMQjAXYLcJlzvHiI35uEo0GoNFbZLqgc39Z4g
 g+QA==
X-Gm-Message-State: ACgBeo2ge2eckqX3IQNDBRPYIdDcpdQrmkpVJ1cCN5pYgMVukhjkoT/J
 VUARq0Oz/+IHS4xijrRxdscpaZa2EbW9Fw==
X-Google-Smtp-Source: AA6agR6rJAsu7eRr4U7L4uiVFX7iF58qpdV3S2YKiGjuTFEf07wjpSdF8r6VjbNq/HKQg9Hcp8kxhQ==
X-Received: by 2002:a05:6122:11a4:b0:377:d5aa:6f4e with SMTP id
 y4-20020a05612211a400b00377d5aa6f4emr9532912vkn.33.1660671323291; 
 Tue, 16 Aug 2022 10:35:23 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:35:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 19/20] device_tree.c: add fdt_format_property()
 helper
Date: Tue, 16 Aug 2022 14:34:27 -0300
Message-Id: <20220816173428.157304-20-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa34.google.com
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

We want to be able to also print properties with 'info fdt'.

Create a helper to format properties based on the already existing code
from fdt_format_node().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 softmmu/device_tree.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index a6bfbc0617..9e681739bd 100644
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


