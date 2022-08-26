Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FA25A29E1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:46:02 +0200 (CEST)
Received: from localhost ([::1]:53232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaat-0003W0-Il
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4p-0008Pf-1u; Fri, 26 Aug 2022 10:12:51 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:41651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4n-000421-Hn; Fri, 26 Aug 2022 10:12:50 -0400
Received: by mail-oi1-x236.google.com with SMTP id t140so2112625oie.8;
 Fri, 26 Aug 2022 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3ddj5V0F6lf315I2M7vwNy6gZ2IdsGWlN//eiaxj3pk=;
 b=HCPiBCFFEbilSkda3/yk+mvVSJmnUEkyPnUMnEMu3hApGRd8W94XP3qLgQPBivNsM5
 K4jCZRRCQ8EIQf7iZKIJc1PgsTKlPgTt//EyodyRrAyTjuBFAzzmhMZi7kfWsCQyHzh4
 HKZ1q1OKZnNejdzFPI3MGVCV0kdkZOKm0e/wSv5e78OlbKVY1udgCSka3pAf3TqaE2Dq
 3AsYsAuA4gO2+97BRxoNKKCpfa3F9TegKncbYBwomuKXFHGutbrDHnbazMOS/eNfoBWd
 x/wnZAXt8FXUgGMSCwRTAMcKNh1wViW71dav5dOoCPh6Jqe2O0SCeELCiud9k+Pw4n2D
 hAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3ddj5V0F6lf315I2M7vwNy6gZ2IdsGWlN//eiaxj3pk=;
 b=NXuA4FTj0MKSw45F2iLauS029IR1QfFc2x1fa8n/yzXdNNyMEeYyPyBNDHL4xq/guw
 Y4YPNQHKDIPzk7dblSi3rM2LZcz9jF25MOboaP9pB6r6SOQQvD6/gQbiQ/TRr/Lj9NlM
 dgH7pBu5rwTzeuavTT1UuHouiLVCafGGGpi0x44w9nkHbonxk8XGBuVfM2eHHim9Rogv
 CcX+oCrDPf/Z2noUkn+N0PXF3JYGumaq6QLbHnwmwcrstrxN9W4eVbvRpR6F8081uQYQ
 sFO5/Ogr8LNheVSTYRPbWmrjOtGlX11VIcTF4GrRYMU/FReLhiXT7Rz7H1txxSQrerTl
 FwYQ==
X-Gm-Message-State: ACgBeo3gXQMP2ueG08FsP2MUUJkC+0xpKYZ89M/ltxY/bjtkm2RxcgNO
 tSzdQfRCZjHe1uFS0QCkMDK0a/DCDL4=
X-Google-Smtp-Source: AA6agR4TRMZjUTw1v4ZPEzXYmsxN4emUROdoghxw+2BJjjf0MfOSKjRE3NXVCn6TPBDO5KYRs2+mwg==
X-Received: by 2002:a05:6808:1b8c:b0:33a:d44f:2169 with SMTP id
 cj12-20020a0568081b8c00b0033ad44f2169mr1734138oib.13.1661523168345; 
 Fri, 26 Aug 2022 07:12:48 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:47 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 18/21] device_node.c: enable 'info fdt' to print
 subnodes
Date: Fri, 26 Aug 2022 11:11:47 -0300
Message-Id: <20220826141150.7201-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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
index a770c6c1cc..5e4cb119f2 100644
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
     g_string_append_printf(buf, "%*s};\n", padding, "");
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


