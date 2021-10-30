Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED490440A8E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:21:45 +0200 (CEST)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgs37-0001Bk-1t
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrqA-0004zy-HX
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:22 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:56177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrq8-0004vD-Kf
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:22 -0400
Received: by mail-wm1-x332.google.com with SMTP id v127so10395464wme.5
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tPUCl6tyAoq5QzQAt9TOrxU0VGP68fsKRioKfeBbEdE=;
 b=kodKVMZzC5LndVlOuevg09xzswPaRI9W66cxRR9HEY2emjmSnXtav68kydRdR26O69
 BrNFH1quZIKqeVIwyi67CA/CsiY/M7XiFv7y5FL0DxXflblSBqYT5O2sdQkii5yS+f8Q
 p8IX5VLh2ngHc/J7v4+awy+LCTvutlEtsfmDLQzHQKVuTUuA12M8z2EYZGrwktl3QR3K
 m2N6E9yNqxrhYE4tcz+Y6QyvzWXuaDTvEbbH+kmvLqrpATHDStrNiMfzk8ZgKvoIGjiw
 0dH4i7OzKBFnrEUP+KYW1ixBfql6hDq7K76gOQsm2WybBOaDVCPbVmHRNlgyyDGhcVQ0
 me6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tPUCl6tyAoq5QzQAt9TOrxU0VGP68fsKRioKfeBbEdE=;
 b=c9hY9bs49qvr+5ZNDP3MncH/K339wGMhj41GvPvHtWc0hRkfhJXxBkFcbnrnKmMAHB
 DYB2sOddDE0MARAaaNMAPrIOu2HF0fZ8m4et/STJZdpf4BkHvZ7ihQdhlbHrSGmRFBAg
 yKJMlaskmkq0MiDQlCCmDO40p5AN6STXHS8QCgd8e52IJGkf8Rp9JpfzUkEdIaU6mDkI
 /9avg4IIwmjQXIQZ1nl8NFbLvlKDSvRDdNrPzPpBUcoDgoepZPHYUcCKTaKikaKpJa0Z
 4WidSpDIHpFYwplsJuXyE47wmCg7Vs5RllvA/feb5hri6bXVLDiWTtd0ZPd+nJ/kiorO
 O4iA==
X-Gm-Message-State: AOAM532nBwiwI9gx1westy9OfJ7RWZeNyGTyIINjMDMj3orXIG5sdACT
 aztyq0jlicw5smfyGjE4vAvJrVS3fYc=
X-Google-Smtp-Source: ABdhPJwWED5OUCAdtYAG3SpY6yFSmMPplLL3SpG3F/pZn1/NkkeS0iRUvQuHeYOUk/WgmCLPGnCBmA==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr19264754wmg.39.1635613699175; 
 Sat, 30 Oct 2021 10:08:19 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 p3sm8571633wrs.10.2021.10.30.10.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:08:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/30] hw/intc/sh_intc: Simplify allocating sources array
Date: Sat, 30 Oct 2021 19:06:10 +0200
Message-Id: <20211030170615.2636436-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Use g_new0 instead of g_malloc0 and avoid some unneeded temporary
variable assignments.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <72efc4f2c4ff8b96848d03dca08e4541ee4076f6.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 1a363d49622..3356b422022 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -399,21 +399,14 @@ int sh_intc_init(MemoryRegion *sysmem,
     /* Allocate 4 MemoryRegions per register (2 actions * 2 aliases) */
     desc->iomem_aliases = g_new0(MemoryRegion,
                                  (nr_mask_regs + nr_prio_regs) * 4);
-
-    j = 0;
-    i = sizeof(struct intc_source) * nr_sources;
-    desc->sources = g_malloc0(i);
-
-    for (i = 0; i < desc->nr_sources; i++) {
-        struct intc_source *source = &desc->sources[i];
-
-        source->parent = desc;
+    desc->sources = g_new0(struct intc_source, nr_sources);
+    for (i = 0; i < nr_sources; i++) {
+        desc->sources[i].parent = desc;
     }
-
     desc->irqs = qemu_allocate_irqs(sh_intc_set_irq, desc, nr_sources);
     memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc, "intc",
                           0x100000000ULL);
-
+    j = 0;
     if (desc->mask_regs) {
         for (i = 0; i < desc->nr_mask_regs; i++) {
             struct intc_mask_reg *mr = &desc->mask_regs[i];
-- 
2.31.1


