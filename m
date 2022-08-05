Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6A158A96D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:24:12 +0200 (CEST)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuV1-0006IY-Mx
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoq-0007c0-Sw
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:38 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d]:33444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoo-0001h4-AD
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:35 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id r4so1028514vkf.0
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5dDI8QuLLiahAitilTZUUqiS0BVok6v1BxvdogHOtKE=;
 b=ELmFz9gIo4L1QlSvm7eIGe9i7EVax1lMsrtxhx2UGeaPBerfvKTS6gdDSuVhuVoO9+
 oUzIqIQDtNj1AP/3C0aNfI3PI1c4wLfqV0raL2kw80glqL1EWKWTLl5SlvSrTEr2WQbi
 ile3QbgpwY005LxT1s1zqMYkGZT4Aa0fH0g+80UudV4/ZUkTuc/GPgPmeYYnfBqbv/00
 sobV/bV3Ar7WulvTUY7P81ZIDYV6GWwNs49Mfw4O77EpKJIhs21ZpPSBOG18dVpzAHQd
 PM51+4VaDngFSj0woVGauzGURUtIScXe5806S+v/SXxlWZm0CaZfbfSElSocRHYY+DpY
 e+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5dDI8QuLLiahAitilTZUUqiS0BVok6v1BxvdogHOtKE=;
 b=PPbrQ31YM3wSlDirC9rVjDBPQFCDBhi3aseD7mm62hXEtntx4n1F0O3Xhei0kYcIIC
 a+r+TgbHmS2dGhqlyJ+MHkODBR7f4uGyHykBX+/WfGuU/s9k1lxCzJ78KoEL1J48FA2B
 O7pxaYLXlrZqMqxvEqpCV0lMjBNQQaTRftrxmsv16bU2BCTssg9dSqlJRq6oq7xiY5qb
 +XOj6CeaAROiMjExjvY+6mI522Tlmck6lFufxSg+9nsIDrZ1XTZfpEJ4mTjdgsn11ml9
 yONSHww5y2BkriI470QNacbAujZuoUwDjixvIau7bZxo4YP+QO7qqJjzqw/WmqDbegDH
 9h8w==
X-Gm-Message-State: ACgBeo1sVISVDNHJii0aMEUbZx9G410qzwt9KIsi79og4Lg/oN4j/0Q2
 T2fLfmCz45gilLn5b99elSHsvcg5cPY=
X-Google-Smtp-Source: AA6agR75UgSpX0o5ff+29FEV3OT5qTqAruxjvffi18RNufPH0QVRVxMt6GtrtfXu0r49QNZAMgHLAw==
X-Received: by 2002:a05:6122:4c6:b0:377:ee81:893e with SMTP id
 s6-20020a05612204c600b00377ee81893emr2555573vkn.13.1659692427679; 
 Fri, 05 Aug 2022 02:40:27 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v2 16/20] device_tree.c: support string props in
 fdt_format_node()
Date: Fri,  5 Aug 2022 06:39:44 -0300
Message-Id: <20220805093948.82561-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2d.google.com
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
 softmmu/device_tree.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 3fb07b537f..8691c3ccc0 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -663,6 +663,24 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
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
 static void fdt_format_node(GString *buf, int node, int depth)
 {
     const struct fdt_property *prop = NULL;
@@ -681,7 +699,12 @@ static void fdt_format_node(GString *buf, int node, int depth)
         prop = fdt_get_property_by_offset(fdt, property, &prop_size);
         propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
 
-        g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
+        if (fdt_prop_is_string(prop->data, prop_size)) {
+            g_string_append_printf(buf, "%*s%s = '%s'\n",
+                                   padding, "", propname, prop->data);
+        } else {
+            g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
+        }
     }
 
     padding -= 4;
-- 
2.36.1


