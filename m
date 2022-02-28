Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA594C760C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:58:58 +0100 (CET)
Received: from localhost ([::1]:53612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkIT-0000ye-OE
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAM-0002L6-Ou; Mon, 28 Feb 2022 12:50:34 -0500
Received: from [2607:f8b0:4864:20::229] (port=39868
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOkAL-0007vv-7p; Mon, 28 Feb 2022 12:50:34 -0500
Received: by mail-oi1-x229.google.com with SMTP id q5so13916914oij.6;
 Mon, 28 Feb 2022 09:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cKCiBrKTpz0FpPLTRoThOF+LwZQzRV6UTVC7peKxeeQ=;
 b=jsRNjT/gueV+der7gW9FbvOeiLSJlOcbiwDEQuGaLJbNrixB4M7oBbkWBtIexb8GaV
 cA8uQcFJIPSIfAsCuwc/25B/1SK6YJjkpYNyKOEPBxUY2Yvod7QwgKkv9bUDuPvcgXGY
 ua+ue5Axyn+n5Gjo6/vYmZ/oEfArNYEr5urqA41JB4dJDui2q36tF8gs/fno9NRQIHJl
 /pbUjbw2uircknOaA2wZ/ooR8W1sMoXFtKkYqNwySTA6/1UU/0wpTdlwM4wR92a+IHRy
 GVjXExKAU2QONK08a6XHiJK8VE/lcNEW4KyMI91polT0Ysu7ZZGKWcD/OXhJyowalwvp
 7q/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cKCiBrKTpz0FpPLTRoThOF+LwZQzRV6UTVC7peKxeeQ=;
 b=pqFB2v1YtLkRfIiNfYoaglKcuuS/96S+RIQbLGEMWKslEBNUVPbCcE3zDbgEh5ccLL
 cI59htUV2uNv3cZ0zEq602X8pZkFOLI26GDdRqq2WlC5dh/oGrSR9C4qL++Gtp3yrcWX
 Lj4h3jIJBxpDi7ryI+6QXBII/XFSMJOxz72GZyITiYdse80tO+KZzFYVHO+Rdo04BpIL
 3/YMjMo/JfWjZrCj3db4VeXAZ/FAEpHGeJtVZl9dZZXHp0IDK9Tlm1G6aT0nStz+mB4R
 HC9DADV8QVF3bkP1KlfV24t9PeEx9H05913PFE3s91NaS+gODcBQC/oV2fbL/OeYlKxf
 /8XQ==
X-Gm-Message-State: AOAM533k/q9lF+KU7zlr3fRCTzM7o3m7nS+9YSoWFyD5KRuT15r74nav
 dM5YdUUu9OrliNlrSwlqfwNUAJeMg38=
X-Google-Smtp-Source: ABdhPJyYX2RXsxKt3TFBuwQWu9Y4SbpKrD2kCFrgPC1IwRWCSSvT+oGyMjI/JbwTdXrB5g/o3K/f5w==
X-Received: by 2002:a05:6808:13d6:b0:2d6:7f1a:9390 with SMTP id
 d22-20020a05680813d600b002d67f1a9390mr9592351oiw.159.1646070631649; 
 Mon, 28 Feb 2022 09:50:31 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a9d5c8c000000b005ad51592bd8sm5368481oti.49.2022.02.28.09.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 09:50:31 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/14] hw/ppc/spapr_drc.c: use g_auto in spapr_dt_drc()
Date: Mon, 28 Feb 2022 14:49:56 -0300
Message-Id: <20220228175004.8862-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
References: <20220228175004.8862-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use g_autoptr() with GArray* and GString* pointers to avoid calling
g_free() and the need for the 'out' label.

'drc_name' can also be g_autofreed to avoid a g_free() call at the end
of the while() loop.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index f8ac0a10df..0ba84063aa 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -841,8 +841,14 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask)
     ObjectProperty *prop;
     ObjectPropertyIterator iter;
     uint32_t drc_count = 0;
-    GArray *drc_indexes, *drc_power_domains;
-    GString *drc_names, *drc_types;
+    g_autoptr(GArray) drc_indexes = g_array_new(false, true,
+                                                sizeof(uint32_t));
+    g_autoptr(GArray) drc_power_domains = g_array_new(false, true,
+                                                      sizeof(uint32_t));
+    g_autoptr(GString) drc_names = g_string_set_size(g_string_new(NULL),
+                                                     sizeof(uint32_t));
+    g_autoptr(GString) drc_types = g_string_set_size(g_string_new(NULL),
+                                                     sizeof(uint32_t));
     int ret;
 
     /*
@@ -857,12 +863,8 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask)
      * reserve the space now and set the offsets accordingly so we
      * can fill them in later.
      */
-    drc_indexes = g_array_new(false, true, sizeof(uint32_t));
     drc_indexes = g_array_set_size(drc_indexes, 1);
-    drc_power_domains = g_array_new(false, true, sizeof(uint32_t));
     drc_power_domains = g_array_set_size(drc_power_domains, 1);
-    drc_names = g_string_set_size(g_string_new(NULL), sizeof(uint32_t));
-    drc_types = g_string_set_size(g_string_new(NULL), sizeof(uint32_t));
 
     /* aliases for all DRConnector objects will be rooted in QOM
      * composition tree at DRC_CONTAINER_PATH
@@ -874,7 +876,7 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask)
         Object *obj;
         SpaprDrc *drc;
         SpaprDrcClass *drck;
-        char *drc_name = NULL;
+        g_autofree char *drc_name = NULL;
         uint32_t drc_index, drc_power_domain;
 
         if (!strstart(prop->type, "link<", NULL)) {
@@ -908,7 +910,6 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask)
         drc_name = spapr_drc_name(drc);
         drc_names = g_string_append(drc_names, drc_name);
         drc_names = g_string_insert_len(drc_names, -1, "\0", 1);
-        g_free(drc_name);
 
         /* ibm,drc-types */
         drc_types = g_string_append(drc_types, drck->typename);
@@ -928,7 +929,7 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask)
                       drc_indexes->len * sizeof(uint32_t));
     if (ret) {
         error_report("Couldn't create ibm,drc-indexes property");
-        goto out;
+        return ret;
     }
 
     ret = fdt_setprop(fdt, offset, "ibm,drc-power-domains",
@@ -936,29 +937,22 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask)
                       drc_power_domains->len * sizeof(uint32_t));
     if (ret) {
         error_report("Couldn't finalize ibm,drc-power-domains property");
-        goto out;
+        return ret;
     }
 
     ret = fdt_setprop(fdt, offset, "ibm,drc-names",
                       drc_names->str, drc_names->len);
     if (ret) {
         error_report("Couldn't finalize ibm,drc-names property");
-        goto out;
+        return ret;
     }
 
     ret = fdt_setprop(fdt, offset, "ibm,drc-types",
                       drc_types->str, drc_types->len);
     if (ret) {
         error_report("Couldn't finalize ibm,drc-types property");
-        goto out;
     }
 
-out:
-    g_array_free(drc_indexes, true);
-    g_array_free(drc_power_domains, true);
-    g_string_free(drc_names, true);
-    g_string_free(drc_types, true);
-
     return ret;
 }
 
-- 
2.35.1


