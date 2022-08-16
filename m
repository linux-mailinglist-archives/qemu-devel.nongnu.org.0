Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8037A59620F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:11:30 +0200 (CEST)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO12H-0001gs-AW
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TL-0005aq-SO; Tue, 16 Aug 2022 13:35:42 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:37686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0TK-0002c2-B6; Tue, 16 Aug 2022 13:35:23 -0400
Received: by mail-vs1-xe29.google.com with SMTP id z185so1298660vsb.4;
 Tue, 16 Aug 2022 10:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4AhWXgQdV5UWDVBCcSs+Nih3/2pGxsNfFI9o/brjnD8=;
 b=j7K41OYUQCM+uTFrfvan+mXV7+xyNw3hywcg/Df9ypjLdi/z+5WTqcTckPguSuvS3r
 YJLuNq5e24/Sc1Xipd/emafXvseA33R01pCvJt5Ry4pzW26h5W8qB0E0+TpSLSQ/MqqL
 1VS/LsWfXjK1+xfG1TSq9oLUhR0kwE/Bxu8LhnEPUKACo3xdkrkc4NCmBJWf2i/usfyO
 8JIoSFcNwa7QzB/G2yT3qElU7hDSAvtrWkmp1QCkgOlOXKGj4oJpXkoR/RrLlGbS4A9N
 KTTH11nN8uUzL0OK32mAD3C6OITnA2Z0pVoY5UfWc/Ge1UEg40kX30qUZqLAgQuxGJsK
 q+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4AhWXgQdV5UWDVBCcSs+Nih3/2pGxsNfFI9o/brjnD8=;
 b=c7TzARfZLhqqqiZVBHtGw/flAooItc4mwnF++Jb/hdiGAJLDTh6NyDu1FHabJGnEog
 535W+Z+JlId56RqZjy6H2PH+mQETYxWxVeduCJaLliiH5CPCNhNt+SqqU6GOPzlzinm+
 nihCy88YXQsCDfrX2smCVcRUy3alh7cj3PdoiB69rrKXN9rHPFUrjsD2SjSm6kk+1ALI
 UIFV8EXAuCnVPBbv2fYpvTQj96ulw1J4/adoUzlPLcBkVNH8oXx4KYhORRbK31pSu8Cf
 +IoPYy66qMSh8Xbub0TxBx0H5G9y+bfzGQx1n5Y5tpN5neiemH3QyhARpqlak2ZvdDk8
 r+mw==
X-Gm-Message-State: ACgBeo2tHjLRUHSKWA5bE/3xmEXWaXC2Bepf4gumJm1xXGT2v3BilJwa
 0gwd9tbGMkAkWlR521xI9JJLhIXnNdxRZw==
X-Google-Smtp-Source: AA6agR5jATQcARJlPDeEb4gEsap3HNuu8HeXPHMv+7xGsRblTPlJb1PfpXG4peqw9GNgCgl8JuSmYQ==
X-Received: by 2002:a05:6102:822:b0:385:48e2:a16f with SMTP id
 k2-20020a056102082200b0038548e2a16fmr8193755vsb.45.1660671321028; 
 Tue, 16 Aug 2022 10:35:21 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:35:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 18/20] device_node.c: enable 'info fdt' to print
 subnodes
Date: Tue, 16 Aug 2022 14:34:26 -0300
Message-Id: <20220816173428.157304-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe29.google.com
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
index 43f96e371b..a6bfbc0617 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -766,17 +766,26 @@ static void fdt_prop_format_val(GString *buf, const char *propname,
     g_string_append_printf(buf, "];\n");
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
 
@@ -801,6 +810,10 @@ static void fdt_format_node(GString *buf, int node, int depth)
         }
     }
 
+    fdt_for_each_subnode(node, fdt, parent) {
+        fdt_format_node(buf, node, depth + 1, NULL);
+    }
+
     padding -= 4;
     g_string_append_printf(buf, "%*s}\n", padding, "");
 }
@@ -821,7 +834,7 @@ HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Error **errp)
         return NULL;
     }
 
-    fdt_format_node(buf, node, 0);
+    fdt_format_node(buf, node, 0, nodepath);
 
     return human_readable_text_from_str(buf);
 }
-- 
2.37.2


