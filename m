Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FAB57E7D9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:04:23 +0200 (CEST)
Received: from localhost ([::1]:50542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEysn-0000Ap-3A
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyp4-000389-Tw
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:30 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:40723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyp3-0005Gl-BZ
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:30 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-10d6e8990b9so7547659fac.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 13:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6H1vwOGrBVg5tfAahc7TWhOpLEIjth6n4BeX2NpIabU=;
 b=UMa18Az1uShjRtVCu9TM/5aBnT3hI9cyUcFR8ruqC3AbVyyHBnJtX71W1LGSD2WULO
 gUHrYxX9+EgfcdQK1rVdnmwpEBBsFYzO3V1g0+QSvfOpk+mgJhY/Hkyrsy7QIQGbJOXo
 NnY8qM2lvKPHYnYKrzkkcZGNOrhhEnxJJwxtR0obrT1LYf0cWD4ybw/otlanDwG0BlJ0
 VjVQq068O3ut82U2ntuxBNZzPdezFESXvYJ0wGpWU8C5qzrxPRVfJPBqwnQsxe3AFX4e
 jJ9357AWqRh6DwNJ1GC6xudpEAF4217NIlYFotUIJowSnbeykDZRmivd7MZRvf4Gx+63
 ou/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6H1vwOGrBVg5tfAahc7TWhOpLEIjth6n4BeX2NpIabU=;
 b=3wPEyPAKmpzqYWoN7f5A1crSKQpEKdvHnqXsDkeNrvXlNpY2zTxAA4lrRelBaysnhY
 z+k2JH8vEY427j2iVwL9nlvO1u4rlIJGfTgVP/wnzpbTYNZU24E0deGrxap0v5ApMT0Y
 Y/YTeT3oJxpJHcdo6cEN9d4ql1g+zq3WqzVIr6EBRpSlWVDS551WjxE6hR81f4FrsAwX
 wNXBoDNRVhXlzSwMwHRwwaMq3amhAUGPBp5oZ7w50i/uEmJ0nFI/fW8HHG6pvorhJpnD
 t6HE2fjp13BAtnp93Mwx1quEu7Dkh91OClrQYyfaVrrc1kqJXSsVEoVcZuDMmSOymkYL
 bIxg==
X-Gm-Message-State: AJIora+pO3RU2Tv5x1WFYixU9gACQDzMnHpxTMdGG3Vc+Kl07PazcmHA
 lQc+OoKBUPfyP5+mQx3L5U477JFJ74k=
X-Google-Smtp-Source: AGRyM1s9Hmw/Njzptw0G5l207V0ygJovfpp4C1Zm1xvdLKSL0RVJsrBFYSeCZA5P//yRe8AOH/4b9w==
X-Received: by 2002:a05:6870:51ce:b0:10d:4691:7bd9 with SMTP id
 b14-20020a05687051ce00b0010d46917bd9mr8272548oaj.185.1658520028230; 
 Fri, 22 Jul 2022 13:00:28 -0700 (PDT)
Received: from balboa.COMFAST ([152.254.206.198])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a9d740e000000b0061cae62aafcsm2388218otk.20.2022.07.22.13.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 13:00:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 08/10] device_node.c: enable 'info fdt' to print
 subnodes
Date: Fri, 22 Jul 2022 17:00:05 -0300
Message-Id: <20220722200007.1602174-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722200007.1602174-1-danielhb413@gmail.com>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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
 softmmu/device_tree.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 3a4d09483b..88b6a0c902 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -721,16 +721,24 @@ static void fdt_prop_print_val(const char *propname, const void *data,
     qemu_printf("]\n");
 }
 
-static void fdt_print_node(int node, int depth)
+static void fdt_print_node(int node, int depth, const char *fullpath)
 {
     const struct fdt_property *prop = NULL;
+    const char *nodename = NULL;
     const char *propname = NULL;
     void *fdt = current_machine->fdt;
     int padding = depth * 4;
     int property = 0;
+    int parent = node;
     int prop_size;
 
-    qemu_printf("%*s%s {\n", padding, "", fdt_get_name(fdt, node, NULL));
+    if (fullpath != NULL) {
+        nodename = fullpath;
+    } else {
+        nodename = fdt_get_name(fdt, node, NULL);
+    }
+
+    qemu_printf("%*s%s {\n", padding, "", nodename);
 
     padding += 4;
 
@@ -754,6 +762,10 @@ static void fdt_print_node(int node, int depth)
         }
     }
 
+    fdt_for_each_subnode(node, fdt, parent) {
+        fdt_print_node(node, depth + 1, NULL);
+    }
+
     padding -= 4;
     qemu_printf("%*s}\n", padding, "");
 }
@@ -773,5 +785,5 @@ void fdt_info(const char *fullpath, Error **errp)
         return;
     }
 
-    fdt_print_node(node, 0);
+    fdt_print_node(node, 0, fullpath);
 }
-- 
2.36.1


