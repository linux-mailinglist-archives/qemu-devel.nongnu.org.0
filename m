Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2846521E3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:01:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3i-0004Lt-Pb; Tue, 20 Dec 2022 08:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3g-0004Ki-06; Tue, 20 Dec 2022 08:53:28 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3e-00013o-Gq; Tue, 20 Dec 2022 08:53:27 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-142b72a728fso15415440fac.9; 
 Tue, 20 Dec 2022 05:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=37wcK39IH790uEINkU4OGea3CBZ8gkITTYDDBIzhz9g=;
 b=gc6iJ5jUzgAS+XcXkgUh8Srbb0xWFs8a+g6gHq0hdCJdxHJt1UQNtR2qUV3BIjEHjF
 h1GImluEKvL00bwc30oB14zoGmh26zB0+rPJvgOOvOkE46A+G/hzzrVht4ViMnYklmap
 3xjTMSPXrZd4zW6GX0Qo0yCoGIE3O2x2lOubP1LOOLnur/GQkLnLh0daKFicmn0Tn5rF
 FBxfaEtmldCuO5fDGoVgRRdoRkdKfrb06wnL+e9/AY/BgHx6FvDTXcNLewpnh2Tabz3N
 3CZv6oez2XLHG85TNR21J3kgzjc2oC0LEHXprmk44ek2N2kieFsg6OO3UBdcqNsV1a+K
 Eabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=37wcK39IH790uEINkU4OGea3CBZ8gkITTYDDBIzhz9g=;
 b=MiwhutnXDMdV6SbI4IXn6v1I8fUZdxl5XrOjlbB1OO6xmB6ZenDompg/REm0tinjtK
 IYQ3jV64SOTWHy0z4o8+dPVcfWweqsIl+PBIhYS+k7njwPUlamoDEytBXEOEnuZdZdaz
 3LDuK85fCaoEN7GlUbLju1zo0VXbH+2MqhoI16wwAx6Xsn8n17eXkpqTbxyf4brauJbP
 JvQMxRMvTm4NlWEkywu1Gs87EpXGoyoosEaExsKNaIKYdqfw0uf/CNBmRIrO1wC7mqVg
 Zh5SBtKC5g8dfu/Gcve6PjYybnG/DnGya6zM/yJ+PAUIzVuYt6aCHnOMQHhhrR31LCqm
 IHmA==
X-Gm-Message-State: ANoB5pkFJy5r1xAaNnquDVoaKaInGesjyyCO38x1yqq3LikJX8/KGtJq
 e6/DAcWxP/ZrEQn5/b48587Y9Fl58Xo=
X-Google-Smtp-Source: AA0mqf5XE8B778Ka0JnubHub5+yzu41WAagtICRiaud9fE54J1BfuTrFIZ+IcP9XuigQ9z0zFj75JA==
X-Received: by 2002:a05:6871:4209:b0:14b:7e0a:eef1 with SMTP id
 li9-20020a056871420900b0014b7e0aeef1mr13481777oab.44.1671544404097; 
 Tue, 20 Dec 2022 05:53:24 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:23 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Bernhard Beschow <shentey@gmail.com>,
 "Edgar E . Iglesias" <edgar@zeroasic.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/15] hw/ppc/virtex_ml507: Prefer local over global variable
Date: Tue, 20 Dec 2022 10:52:46 -0300
Message-Id: <20221220135251.155176-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221216145709.271940-4-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/virtex_ml507.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 13cace229b..f2f81bd425 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -157,7 +157,7 @@ static int xilinx_load_device_tree(MachineState *machine,
     int r;
     const char *dtb_filename;
 
-    dtb_filename = current_machine->dtb;
+    dtb_filename = machine->dtb;
     if (dtb_filename) {
         fdt = load_device_tree(dtb_filename, &fdt_size);
         if (!fdt) {
-- 
2.38.1


