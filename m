Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9229440AA5
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:35:18 +0200 (CEST)
Received: from localhost ([::1]:44864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsGD-0000G8-VM
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrq6-0004jn-8r
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrq4-0004tr-3Z
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:17 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso4878071wmc.2
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zdtWOhzx37PNAX2KAYyhiLp1hBth6UjYAyx1ff21Cv8=;
 b=R52H7jJy2pHfllcwQ1+jWeD1l1PAWASXMbQGcvlOu9MARomTNmKwtO/IK5z1/puKui
 m7972ywHBi+NgzdELSHMO5vo1/EssLS1aZnrk45EVMMTnw7dvqtMrl6XIP6Wo0+qhOl1
 saxIKl3GSTEyEUqEAb78nRnFC4Cy8Nu3TrFEVsweN1/VnR91d/cOL6JCeuhHjnYToBpV
 Bl5BHFFwqxCojoEerKFdrbb++9Jg8ti6Mg+jq0gG0qIMvI3jiUBmNbtai6qF4a83PRGk
 AB8s9qqNbDM1o68RyJBUsuppbX5FhpWCp4riopLWLcwho3uuWuyRmsunEqUvEEL6yS5O
 Uocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zdtWOhzx37PNAX2KAYyhiLp1hBth6UjYAyx1ff21Cv8=;
 b=m3KlewsfispGHkUzd9QZ+f8HaRbF7CmkhCZge1JqgOGEf6vVSxBx0EfztYf6ID9r6h
 MGS+s7jJvPAlAqYqkAfjSEBKfzhLXtYcwvDHGHxkLddmdrsf6NjJIQY0adDOCoMeFwb3
 ao4+WauuIzsQ/90KAi47CtZPxJf2LQR6Bsz8c4kyPH6XzI77XSzNkzzxQii8lny3wQ6b
 4Px78sTDXpsQOOhaglR6rRJibA2DxQc1mjbdTVnDR/Tli7c7n2tltkAP0Sz7q/6HLJ9Q
 a4mLaOI2WpMeWdu+4N2uZvmBQWmFQj2iOkhv2K8LlkJYJOeLvMmhPR/tsSvgOHnAh1gj
 Rs1w==
X-Gm-Message-State: AOAM533yZ5dHoL1ABg3w3p77cXq7BSj7OTjNEAa1iearUUU4v02HHHVx
 Uda5IoPbKtZv7BLOrGCH+3ZbmQIj6Gg=
X-Google-Smtp-Source: ABdhPJyhkkylZxro1fulKkXwxR0jhFZipuNBIKD/XYK8pSUjnOuz3Xx0E+Wcpjx/xDNMYPFtnOP7pg==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr27643535wmi.131.1635613694485; 
 Sat, 30 Oct 2021 10:08:14 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 y6sm8469908wrh.18.2021.10.30.10.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:08:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/30] hw/intc/sh_intc: Avoid using continue in loops
Date: Sat, 30 Oct 2021 19:06:09 +0200
Message-Id: <20211030170615.2636436-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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

Instead of if !expr continue else do something it is more straight
forward to say if expr then do something, especially if the action is
just a few lines. Remove such uses of continue to make the code easier
to follow.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <0efaa5e7a1a3ee11f82b3bb1942c287576c67f8b.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 44 ++++++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index a0db742d75d..1a363d49622 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -139,15 +139,14 @@ static void sh_intc_locate(struct intc_desc *desc,
             struct intc_mask_reg *mr = &desc->mask_regs[i];
 
             mode = sh_intc_mode(address, mr->set_reg, mr->clr_reg);
-            if (mode == INTC_MODE_NONE) {
-                continue;
+            if (mode != INTC_MODE_NONE) {
+                *modep = mode;
+                *datap = &mr->value;
+                *enums = mr->enum_ids;
+                *first = mr->reg_width - 1;
+                *width = 1;
+                return;
             }
-            *modep = mode;
-            *datap = &mr->value;
-            *enums = mr->enum_ids;
-            *first = mr->reg_width - 1;
-            *width = 1;
-            return;
         }
     }
 
@@ -156,15 +155,14 @@ static void sh_intc_locate(struct intc_desc *desc,
             struct intc_prio_reg *pr = &desc->prio_regs[i];
 
             mode = sh_intc_mode(address, pr->set_reg, pr->clr_reg);
-            if (mode == INTC_MODE_NONE) {
-                continue;
+            if (mode != INTC_MODE_NONE) {
+                *modep = mode | INTC_MODE_IS_PRIO;
+                *datap = &pr->value;
+                *enums = pr->enum_ids;
+                *first = pr->reg_width / pr->field_width - 1;
+                *width = pr->field_width;
+                return;
             }
-            *modep = mode | INTC_MODE_IS_PRIO;
-            *datap = &pr->value;
-            *enums = pr->enum_ids;
-            *first = pr->reg_width / pr->field_width - 1;
-            *width = pr->field_width;
-            return;
         }
     }
     g_assert_not_reached();
@@ -245,10 +243,9 @@ static void sh_intc_write(void *opaque, hwaddr offset,
         mask = (1 << width) - 1;
         mask <<= (first - k) * width;
 
-        if ((*valuep & mask) == (value & mask)) {
-            continue;
+        if ((*valuep & mask) != (value & mask)) {
+            sh_intc_toggle_mask(desc, enum_ids[k], value & mask, 0);
         }
-        sh_intc_toggle_mask(desc, enum_ids[k], value & mask, 0);
     }
 
     *valuep = value;
@@ -341,12 +338,11 @@ void sh_intc_register_sources(struct intc_desc *desc,
             s->next_enum_id = gr->enum_ids[0];
 
             for (k = 1; k < ARRAY_SIZE(gr->enum_ids); k++) {
-                if (!gr->enum_ids[k]) {
-                    continue;
+                if (gr->enum_ids[k]) {
+                    id = gr->enum_ids[k - 1];
+                    s = &desc->sources[id];
+                    s->next_enum_id = gr->enum_ids[k];
                 }
-                id = gr->enum_ids[k - 1];
-                s = &desc->sources[id];
-                s->next_enum_id = gr->enum_ids[k];
             }
             trace_sh_intc_register("group", gr->enum_id, 0xffff,
                                    s->enable_count, s->enable_max);
-- 
2.31.1


