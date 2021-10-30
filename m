Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1902D440A97
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:27:58 +0200 (CEST)
Received: from localhost ([::1]:55904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgs97-0005P2-5U
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrph-0003jF-7u
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:53 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpf-0004s4-DZ
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:52 -0400
Received: by mail-wr1-x430.google.com with SMTP id k7so21545705wrd.13
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p7bJRN4ZOfCVNtZFFg00y8FB3usZUZC2d+MVd9Rc13o=;
 b=Us/i3AufC/1h50YW3XmPMB43ifquFUbo08Gs+4c3K0kOhLOIglxbM/XuFTEauCKYcx
 y/RKkr9K+jBEOlOal5yuf2l85TUtmpgCPqIzaJMJmie+8IbFuGjJcp12N2oZo8EpVNXf
 WCOt4jaxafN1oG9DYdMwVRwD8/qVeZOFVQ3MpyZbJV2LazeHV0HiT8CF5wxQWwXnQ/y2
 QFP0IGOK3aXDU4FuoVLMlZ3cYwdVVfXlVPycP+3WN9R7viVASeMo952Y016WeCjzPovJ
 sPFWTAD4VXN3LRha/5dyyEQAzmy9tms2v2CcYFk5TcTVIVA6ZDAb05LIE7x+fdX8SZP1
 J3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p7bJRN4ZOfCVNtZFFg00y8FB3usZUZC2d+MVd9Rc13o=;
 b=ocQquHT7/m0AOF1P+7ERvVLPA8axE6ypX1rPsN1VjjiXCXxxbz2ckL59omIBLLdH5W
 3lux3kIwdMPOqekHT5qUgj0W53kVdy/NOw4bdvBeblDGXj2r4DG6Z4Z9Sd44lThiiTsa
 6ybJmVtk4wc1N0P8czwL+Ox5UzSOZRYNDraQXoeomgcYI7AdL7ZBNxPx04eT6N0iN23U
 YNjKSRZnZhNBIzmCQKLVSNSqPIyj5NDBw7sVr7VAym5Wh7eHFyyiUo+/+FqcIAozmSrk
 nXMV31bn30GJvWZfWdelBKI92j16b6nC2civAyBvxghCPZw424pfO955zFoDoPrjW6EY
 reYg==
X-Gm-Message-State: AOAM5311vy3hd5VVJAygeM2CHGOVX1nVuGYu/CeYiMb4Bc0zf+kXoIGL
 XH6i/QbT2DK3BWli9v7cCe1bXM6pp4w=
X-Google-Smtp-Source: ABdhPJxBMxkpuE77ll0tUG/9xgMPEWKfzbWOQ3Wuo6mNfbQ/Mfe2UBmTvG/Oy2lCUf/vz73kS/M5+g==
X-Received: by 2002:a5d:6c62:: with SMTP id r2mr23087052wrz.284.1635613670067; 
 Sat, 30 Oct 2021 10:07:50 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 126sm11331814wmz.28.2021.10.30.10.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/30] hw/intc/sh_intc: Move sh_intc_register() closer to its
 only user
Date: Sat, 30 Oct 2021 19:06:04 +0200
Message-Id: <20211030170615.2636436-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The sh_intc_register() function is only used at one place. Move them
together so it's easier to see what's going on.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <49f2742bc67cba7164385fafad204ab1e1bd3a0b.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 60 +++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index b908be0ff5b..1a2824f8e0c 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -269,36 +269,6 @@ struct intc_source *sh_intc_source(struct intc_desc *desc, intc_enum id)
     return NULL;
 }
 
-static unsigned int sh_intc_register(MemoryRegion *sysmem,
-                                     struct intc_desc *desc,
-                                     const unsigned long address,
-                                     const char *type,
-                                     const char *action,
-                                     const unsigned int index)
-{
-    char name[60];
-    MemoryRegion *iomem, *iomem_p4, *iomem_a7;
-
-    if (!address) {
-        return 0;
-    }
-
-    iomem = &desc->iomem;
-    iomem_p4 = desc->iomem_aliases + index;
-    iomem_a7 = iomem_p4 + 1;
-
-    snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "p4");
-    memory_region_init_alias(iomem_p4, NULL, name, iomem, A7ADDR(address), 4);
-    memory_region_add_subregion(sysmem, P4ADDR(address), iomem_p4);
-
-    snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "a7");
-    memory_region_init_alias(iomem_a7, NULL, name, iomem, A7ADDR(address), 4);
-    memory_region_add_subregion(sysmem, A7ADDR(address), iomem_a7);
-
-    /* used to increment aliases index */
-    return 2;
-}
-
 static void sh_intc_register_source(struct intc_desc *desc,
                                     intc_enum source,
                                     struct intc_group *groups,
@@ -398,6 +368,36 @@ void sh_intc_register_sources(struct intc_desc *desc,
     }
 }
 
+static unsigned int sh_intc_register(MemoryRegion *sysmem,
+                                     struct intc_desc *desc,
+                                     const unsigned long address,
+                                     const char *type,
+                                     const char *action,
+                                     const unsigned int index)
+{
+    char name[60];
+    MemoryRegion *iomem, *iomem_p4, *iomem_a7;
+
+    if (!address) {
+        return 0;
+    }
+
+    iomem = &desc->iomem;
+    iomem_p4 = desc->iomem_aliases + index;
+    iomem_a7 = iomem_p4 + 1;
+
+    snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "p4");
+    memory_region_init_alias(iomem_p4, NULL, name, iomem, A7ADDR(address), 4);
+    memory_region_add_subregion(sysmem, P4ADDR(address), iomem_p4);
+
+    snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "a7");
+    memory_region_init_alias(iomem_a7, NULL, name, iomem, A7ADDR(address), 4);
+    memory_region_add_subregion(sysmem, A7ADDR(address), iomem_a7);
+
+    /* used to increment aliases index */
+    return 2;
+}
+
 int sh_intc_init(MemoryRegion *sysmem,
                  struct intc_desc *desc,
                  int nr_sources,
-- 
2.31.1


