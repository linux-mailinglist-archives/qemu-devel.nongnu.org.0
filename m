Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC19958A93C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:09:58 +0200 (CEST)
Received: from localhost ([::1]:50034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuHF-0007vL-RP
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoq-0007bz-T7
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:38 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932]:34387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoo-0001iX-B3
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:36 -0400
Received: by mail-ua1-x932.google.com with SMTP id y22so848468uay.1
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0EH6/SU6+KuKxZ3ZaeY746PUfa8wkEHLaOit3NDDzxk=;
 b=VbeSKg7FQvmJOjfKi0eCowhLdzDWOD8pfvW3apDlAMQfKhMf+C0hmh/XG+0Y6tBPul
 7oT+It6AKD9W7xaZ9URFK0FAVbCx4m8v6n9FeVwm3TNExnLWmpkfHmCJ8FHc+zezKTgw
 +mKblxfF7bAORTw2rW/dLtCkvU5kOS5HPxz/nS616isT9MvNle6N2Mu+E8O9iAtzI24X
 QNahaEy1KfPtXXRfzmyA0adnXntX9/legm1GHEnIZmrVgth628946fiq2ozSbm3nbQpx
 3r2drWEMB6uAuRBrJlKwcn+vkXR3EZqKnn1NIV4eKpyVlWtEdSNFrDmmC64O8/2b7yjz
 rUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0EH6/SU6+KuKxZ3ZaeY746PUfa8wkEHLaOit3NDDzxk=;
 b=F7IhqnNuDRbmk+fshfKOaw8N/WFa5XMsPYrVpl1O71pDK313TGKUQ7V9jEP8xmhYQJ
 Yl8DNjHLkEguU+3iOxT7Nr4egExyyXdifld/5Cd5rLkVBEuDaBWaeeY9FTnZYA78Iwpy
 RnOQL+ce8weYspQGq16P0dwWwHWH7PcD75txo9iAAe/iwPe7D1d1Tg+pLXtBhCcIF9t/
 Y1onqX7ORYZ5m78lEux1mwcH5nEG70u1oFAgVctt6vpNW7TDcPrIu7afdx4ajYCdoxAs
 gBrA/dVIo3oJ7tiCX82Xxn9uVEcf7HNza0Y6U9q/3pQmKtHOxZjsJceaWf5I5+Bsuk+/
 RBhA==
X-Gm-Message-State: ACgBeo0Ey4hQjmJsLmyEO3sw/8VHuhviWkFHhCzM0PAkmnEv9cDE7QMm
 zBrlmAqnwBG6rCOcaP2rJ6nIt0cLfXA=
X-Google-Smtp-Source: AA6agR7u0xk/ukDsrpv0byIbW4dP6wSdCYoeSqem485u1OtJFdxmzKAYUUeQvXWZjZOtfc3Rzyyk0Q==
X-Received: by 2002:ab0:15ed:0:b0:365:f250:7384 with SMTP id
 j42-20020ab015ed000000b00365f2507384mr2688894uae.44.1659692431963; 
 Fri, 05 Aug 2022 02:40:31 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v2 18/20] device_node.c: enable 'info fdt' to print
 subnodes
Date: Fri,  5 Aug 2022 06:39:46 -0300
Message-Id: <20220805093948.82561-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x932.google.com
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

Printing subnodes of a given node will allow us to show a whole subtree,
which the additional perk of 'info fdt /' being able to print the whole
FDT.

Since we're now printing more than one subnode, change 'fdt_info' to
print the full path of the first node. This small tweak helps
identifying which node or subnode are being displayed.

To demostrate this capability without printing the whole FDT, the
'/cpus/cpu-map' node from the ARM 'virt' machine has a lot of subnodes:

(qemu) info fdt /cpus/cpu-map
/cpus/cpu-map {
    socket0 {
        cluster0 {
            core0 {
                cpu = <0x8001>
            }
        }
    }
}

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 softmmu/device_tree.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 9d95e4120b..99d95c1cb9 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -728,17 +728,26 @@ static void fdt_prop_format_val(GString *buf, const char *propname,
     g_string_append_printf(buf, "]\n");
 }
 
-static void fdt_format_node(GString *buf, int node, int depth)
+
+static void fdt_format_node(GString *buf, int node, int depth,
+                            const char *fullpath)
 {
     const struct fdt_property *prop = NULL;
+    const char *nodename = NULL;
     const char *propname = NULL;
     void *fdt = current_machine->fdt;
     int padding = depth * 4;
     int property = 0;
+    int parent = node;
     int prop_size;
 
-    g_string_append_printf(buf, "%*s%s {\n", padding, "",
-                           fdt_get_name(fdt, node, NULL));
+    if (fullpath != NULL) {
+        nodename = fullpath;
+    } else {
+        nodename = fdt_get_name(fdt, node, NULL);
+    }
+
+    g_string_append_printf(buf, "%*s%s {\n", padding, "", nodename);
 
     padding += 4;
 
@@ -763,6 +772,10 @@ static void fdt_format_node(GString *buf, int node, int depth)
         }
     }
 
+    fdt_for_each_subnode(node, fdt, parent) {
+        fdt_format_node(buf, node, depth + 1, NULL);
+    }
+
     padding -= 4;
     g_string_append_printf(buf, "%*s}\n", padding, "");
 }
@@ -783,7 +796,7 @@ HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Error **errp)
         return NULL;
     }
 
-    fdt_format_node(buf, node, 0);
+    fdt_format_node(buf, node, 0, nodepath);
 
     return human_readable_text_from_str(buf);
 }
-- 
2.36.1


