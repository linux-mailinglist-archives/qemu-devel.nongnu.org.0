Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E657E7E8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:07:53 +0200 (CEST)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEywC-0005uc-O9
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyp0-00031z-Tg
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:26 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyoz-0005D4-92
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:26 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so7547627fac.9
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 13:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sKtgH6N152/Ky0OYbTdVV9FFZLyxA0EDEz3bCdDiuZQ=;
 b=gcmC7zlDFZg5TN+DMQ9F9lTHJWmYGJ1LxVApfunk+KdAE+V+7m+mfxkThaA7Z4G6X7
 7ZR7gY0SiGHPcZhfda0DqoiQw5eG6Qt60ZX3Rg4mDULdLRYzMKFr7lrzYlpNmqxd6xUI
 4EAs04GxcOrGbdDtPcC2u59cruHID7kla5Gh3sCJpHINoDGwum7ZCzbSlXxLlxtnu8K0
 TAEF8qREolECDZmwZUOK2HyVGZuVt/0Z1odI53NH5K9jLJiERoMGeYyRxeTr/bNmjpiM
 EH2uUZ0cuB09vrVi9PQArOTx7cTudDH8/HWUAvEiD8vGJdvR6CPoYGLiDcNuuL8+MYYm
 Nv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sKtgH6N152/Ky0OYbTdVV9FFZLyxA0EDEz3bCdDiuZQ=;
 b=gR2wojzzFcB7RGVUn4TGmMR440WBmwFrgoRsIarnc7Uj7XB1clEtGgvW9bi2QzaY91
 7q1sJmef2Ho3E4Q1rJ0999yFT3a2Qaz1rjC4PtnPRJs8mhpCOqIDVtYbz+k6/N27DLm8
 YvScnZDGaa3T5NE+dBugTwnAaernIBBv8IwSoRKu8paYm8uOvD2Jf4sjkr+Z8qlzthvd
 mY7WdUyScRqHje+7Y8fRbgbQBokwtzObQp6hpHu4BTkQUSW8uG0ltTfNJuqbMihhnHiX
 YInzu86a5uWUszkD1JCUcu4wVohl8CSoSKgvMSLh58AT1zlJGYA3MnPYIsrvKh6IqJq8
 QeSg==
X-Gm-Message-State: AJIora9WoxP5BhzsMFBFkzarjGVmW3U2Sr3gmQqZTeJj4RvFebXdtRz1
 AHBW431OEjiegGczuOtT4CaBNx3RuY0=
X-Google-Smtp-Source: AGRyM1uF68HNVztTRcubA755ydDHemi7PC7o/hR73TcrMI4iPu7pIZt5nEGTSzC6vYU2UXb37tzTIw==
X-Received: by 2002:a05:6870:15c9:b0:101:e18b:d12d with SMTP id
 k9-20020a05687015c900b00101e18bd12dmr8506716oad.51.1658520024480; 
 Fri, 22 Jul 2022 13:00:24 -0700 (PDT)
Received: from balboa.COMFAST ([152.254.206.198])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a9d740e000000b0061cae62aafcsm2388218otk.20.2022.07.22.13.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 13:00:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 06/10] device_tree.c: support printing of strings props
Date: Fri, 22 Jul 2022 17:00:03 -0300
Message-Id: <20220722200007.1602174-7-danielhb413@gmail.com>
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

To support printing string properties in 'info fdt' we need to determine
whether a void data might contain a string.

We do that by casting the void data to a string array and:

- check if the array finishes with a null character
- check if all characters are printable

If both conditions are met, we'll consider it to be a string data type
and print it accordingly. After this change, 'info fdt' is now able to
print string properties. Here's an example with the ARM 'virt' machine:

(qemu) info fdt /chosen
chosen {
    stdout-path = '/pl011@9000000'
    rng-seed;
    kaslr-seed;
}

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 softmmu/device_tree.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 899c239c5c..3c070acc0d 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -663,6 +663,24 @@ void fdt_save(const char *filename, Error **errp)
     error_setg(errp, "Error when saving machine FDT to file %s", filename);
 }
 
+static bool fdt_prop_is_string(const void *data, int size)
+{
+    const char *str = data;
+    int i;
+
+    if (size <= 0 || str[size - 1] != '\0') {
+        return false;
+    }
+
+    for (i = 0; i < size - 1; i++) {
+        if (!g_ascii_isprint(str[i])) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
 static void fdt_print_node(int node, int depth)
 {
     const struct fdt_property *prop = NULL;
@@ -680,7 +698,11 @@ static void fdt_print_node(int node, int depth)
         prop = fdt_get_property_by_offset(fdt, property, &prop_size);
         propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
 
-        qemu_printf("%*s%s;\n", padding, "", propname);
+        if (fdt_prop_is_string(prop->data, prop_size)) {
+            qemu_printf("%*s%s = '%s'\n", padding, "", propname, prop->data);
+        } else {
+            qemu_printf("%*s%s;\n", padding, "", propname);
+        }
     }
 
     padding -= 4;
-- 
2.36.1


