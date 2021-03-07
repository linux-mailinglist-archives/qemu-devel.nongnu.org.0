Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4840E330501
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 23:29:22 +0100 (CET)
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ1tp-0000KT-9g
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 17:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJ1rM-0006pW-72; Sun, 07 Mar 2021 17:26:48 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJ1rK-00072t-R7; Sun, 07 Mar 2021 17:26:47 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so2621102wmj.1; 
 Sun, 07 Mar 2021 14:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BCq3Drp2YKmgjdsiPGLc9i+7eBAXIDTVaKRreDzvDM=;
 b=ZOCdMAD0FzW8aTBJIhDc/isYkoXmf1d90CMtnqiCnakGiu3dEblkp21rP7wUPULtp5
 eVC2b2X7buuSSiLDz8Kd6UTU9wtdOSAIOVVbBBFMAkPA1dSVP0D7mJ5fxMLGtrbzuyN0
 ZFp7jtLpbh+XC+jqOsN3gXFCY9V4BPKx/cDb4QNE/5MM0tntsmWugj7B00DPUJuX70pv
 CUompYNuab/zWBFsnaGywoX7fY/bbfWFPNRuqvIIVMa+YRTF1GEIG46GuoTwnb+P0TSU
 lVSFPvjQuq86xIRfXDvBOK//KFS5xcun9wFcmIr+YiQViu7S5VTF5iU/fpBF9/1noE9l
 UN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0BCq3Drp2YKmgjdsiPGLc9i+7eBAXIDTVaKRreDzvDM=;
 b=SnhtMAu1RQ/KYmeX5byA1JtPuSBroQDluE0hTwp+IZ+yyaEwug3wbuJZkKYNtXXV3U
 wxJ+pw/fDqc9qsgWRvI3CcbijI8FTA7D4bCJScVrj7EVPPg352kZ7GMCFgq/GQZhbHmm
 G8aplZ1ALvSP5ifpqtXXKg83cT+h2C6cneYnijngR9e7x+K0qeUx4FLemtqtsF9NunWK
 ij+kQRFGRYpW/C/BfueZgT1jfXtn9+IrJP2jDKJlRZiOLR4iJZsgZy27RQ6bp2BY3PZp
 D1awXWJ6vn2HFNwQzT9MkLxuCnqsk7Bo9lL1+r6tJFDFkXUP9XNuHElwz+KN74G0pp2X
 dmrg==
X-Gm-Message-State: AOAM532jyj5tKVRYsyMw37IA5efSUeHXO+YKJP2EseyyrqMpztbAuffl
 agOH60u6jkZKOhjaySiotWR4K777PKY=
X-Google-Smtp-Source: ABdhPJzKzD+CBH2r3r8R7pZ5OgsuOXMSOBZDP3SbfQAZ4wu7O1KAPls9taxYfIgn4pxJ3U+oeL4VUA==
X-Received: by 2002:a7b:ce19:: with SMTP id m25mr19442964wmc.74.1615156004792; 
 Sun, 07 Mar 2021 14:26:44 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm16337145wro.15.2021.03.07.14.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 14:26:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] hw/xtensa/xtfpga: Get pflash MemoryRegion with
 sysbus_mmio_get_region()
Date: Sun,  7 Mar 2021 23:26:24 +0100
Message-Id: <20210307222625.347268-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210307222625.347268-1-f4bug@amsat.org>
References: <20210307222625.347268-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_PFLASH_CFI01 is a TYPE_SYS_BUS_DEVICE which registers its romd
MemoryRegion with sysbus_init_mmio(), so we can use the generic
sysbus_mmio_get_region() to get the region, no need for a specific
pflash_cfi01_get_memory() helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/xtensa/xtfpga.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 7be53f1895b..1d15a9aae9f 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -460,10 +460,11 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
         }
     } else {
         if (flash) {
-            MemoryRegion *flash_mr = pflash_cfi01_get_memory(flash);
+            MemoryRegion *flash_mr;
             MemoryRegion *flash_io = g_malloc(sizeof(*flash_io));
             uint32_t size = env->config->sysrom.location[0].size;
 
+            flash_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(flash), 0);
             if (board->flash->size - board->flash->boot_base < size) {
                 size = board->flash->size - board->flash->boot_base;
             }
-- 
2.26.2


