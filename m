Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A589B58A967
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:20:48 +0200 (CEST)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuRg-0003Ap-M3
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtou-0007fM-OW
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:40 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:36546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoq-0001fk-Jd
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:39 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id o123so1945708vsc.3
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mXJwJLmcRqnXtZhHoo+MfEnHjgdMdXK2oknrWiQwJuA=;
 b=P8K75jELNF1Y+m0gSowPvLQNO4NICdiEuAVD9pdWcZSwwa1Te+tAa5+jGS6cRZCvId
 OOtVqXxmndeJ4sUtCa1WxRZ+5gdtQas96gCymL2g03x4JwlV5DYexX7QZVn3KTNDisi7
 Avs5/kT5AArmEo0dDc6xixIVomXjcaCLHSX0PShT3ILMoW+pZRuFuKkQ2p87rm6FZaZt
 81Zasf1XKdsTNLGyOdlc0aAKvjmwBrjJMD7w43xONInK2HshctWwqHyBDeSXMqPCDT8+
 BTWZrnhfw/lWFxnXAAWo1tLzU59vCkRKu0qesOBpUUc9JigXrggXKfJ6sjfINPH4bp2V
 aLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mXJwJLmcRqnXtZhHoo+MfEnHjgdMdXK2oknrWiQwJuA=;
 b=GTOSRlfT/6NAbNqYBl1pkGp3+8ThSzRJuX87rkw+MjHUq3ZGvaxYwCxOenQe+Ph6AA
 nr9bq5rNPzXOXsmPlzOPGhxPSqzm7N1ZAEBT6j0PSEseMNu4/l4Eg5H+UVRxLWl23ecp
 lwzJGOYrVyWIS1yl/7TmOhrOOb02wTz98yE95iFYfolfylAhcGVBFuVZlKMCW8veli/j
 b1h9uNQXByDr5ZbF+g9TM5WkodTwYYig1iTY08Pfp7ZmD8wEm1t7B7qRvUpRJQZ0XOl1
 qNQsgkmcM8eY1eW1En9ewYjz09/QHbRMkOWFO5eCxW6va6XSbXOA2YCvfdkecsPETZXv
 B+hg==
X-Gm-Message-State: ACgBeo1VgDW8NBAGzSSWHePl4nF+19wK82AHRdeNCT50qGysmK3bpot2
 +Rj9/4JhJqMC+bRbPnPFysGooZLC+Cs=
X-Google-Smtp-Source: AA6agR5iMTnWRedW/b2lCN9NGrwZvvmh6dL+q4fVm4TuHGjpy3H91W5OMGfK3T5gPlbAeAQNO4l0QA==
X-Received: by 2002:a67:fa0f:0:b0:387:de44:b29 with SMTP id
 i15-20020a67fa0f000000b00387de440b29mr2612056vsq.5.1659692433788; 
 Fri, 05 Aug 2022 02:40:33 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v2 19/20] device_tree.c: add fdt_format_property()
 helper
Date: Fri,  5 Aug 2022 06:39:47 -0300
Message-Id: <20220805093948.82561-20-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2f.google.com
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
index 99d95c1cb9..902a7f680b 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -728,6 +728,25 @@ static void fdt_prop_format_val(GString *buf, const char *propname,
     g_string_append_printf(buf, "]\n");
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
+    if (fdt_prop_is_string(data, prop_size)) {
+        g_string_append_printf(buf, "%*s%s = '%s'\n", padding, "",
+                               propname, (char *)data);
+    } else if (fdt_prop_is_uint32_array(prop_size)) {
+        fdt_prop_format_uint32_array(buf, propname, data, prop_size,
+                                     padding);
+    } else {
+        fdt_prop_format_val(buf, propname, data, prop_size, padding);
+    }
+}
 
 static void fdt_format_node(GString *buf, int node, int depth,
                             const char *fullpath)
@@ -755,21 +774,7 @@ static void fdt_format_node(GString *buf, int node, int depth,
         prop = fdt_get_property_by_offset(fdt, property, &prop_size);
         propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
 
-        if (prop_size == 0) {
-            g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
-            continue;
-        }
-
-        if (fdt_prop_is_string(prop->data, prop_size)) {
-            g_string_append_printf(buf, "%*s%s = '%s'\n",
-                                   padding, "", propname, prop->data);
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
2.36.1


