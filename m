Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124C3320B46
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:10:22 +0100 (CET)
Received: from localhost ([::1]:40806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqNJ-0007vV-4m
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpsC-0001Ax-5D
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:38:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpsA-0003jc-TD
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:38:11 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l30so658086wrb.12
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zw4iTXqwCfmL83vCtQL4WiNjLhPBYSVn760ReNY3gcU=;
 b=KfzZeD4dTJh9SvhGBrddSTUkMr9pLjmbd6mWrRnFp+W8JyYJVqcK9EG+w45hkZaIQZ
 yfvsAp/VaWQUdGZg2BMzvpQFZKsBhbgFbVqthuFGeQLxzUIhaAIm9Lwrv4JH6BSgetJn
 gDEacxYtvEg3yo+MHnP6MVzQ0Wt/GfLi6yEoRlAm1CJP1gdHeuFIuzLoGaDaQWmRkTOm
 mx8gPNGd8qgxMLBKXdV2xe8vJ+XiUQx5M6rbuAZZcsre8IhJx+d4eaU/h+RHXt3iAf7b
 KKRlBLl+PiKaqLNDPi88GvzdN1GIrE9NkaIp9lSJCR0PMumnIzNdsHyexE/43EoaycC8
 ZtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zw4iTXqwCfmL83vCtQL4WiNjLhPBYSVn760ReNY3gcU=;
 b=bG27uHUeL/kXPy7kbOpyhX8X9vsrt7JztDqbYJVtTAmy19YH40h4uWpBtuSp6hqz+B
 QG/QvVQkZ4vteyVcHuFoeYRxLxHA16pdtFEvy7Alj3foxjiBNbaEBODq39DyVBXR31Ij
 I+m1aO26WGcUX3AXnLEHVjsa8fhEQlIb52TB8xPmNt+ht+KXQuTCG42TpTIcCDwafaQ4
 s2MkKCstRy3KLxFWA9XSJTu/eBKOqmTwtiWQpBLvqYAl8RJ+v00GWpmiN4G8gLAjs0rP
 QyxE4oDkuolP00GL+CTz/z41pyv8COIvE03S9tDVjRh9R5w3YZFxb467QAHEMxhVOWeS
 z74A==
X-Gm-Message-State: AOAM5304nhvJTqQ2vRwQPbYUA+f98cMrUJgy/1M8oGdao4pJGHcLppIp
 fGYKXdtBNvYWnzwkQAmvh6Nmm3nw0yc=
X-Google-Smtp-Source: ABdhPJzo4kuxSgDrnorUsaeLvfyCIQFxVqaqeyXZKzLkz6MISUhVuRiCU56M5fh7uMAbpksTIHiZlw==
X-Received: by 2002:adf:fe09:: with SMTP id n9mr6659141wrr.104.1613918288998; 
 Sun, 21 Feb 2021 06:38:08 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z5sm25577308wrn.8.2021.02.21.06.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:38:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/43] vt82c686: Fix superio_cfg_{read,write}() functions
Date: Sun, 21 Feb 2021 15:34:32 +0100
Message-Id: <20210221143432.2468220-44-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

These functions are memory region callbacks so we have to check
against relative address not the mapped address.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <15b2968fd300a12d06b42368d084f6f80d3c3be5.1610223397.git.balaton@eik.bme.hu>
[PMD: Split original patch in 5, this is part 5/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 766584cabd0..5db9b1706c8 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -260,12 +260,13 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
     SuperIOConfig *sc = opaque;
     uint8_t idx = sc->regs[0];
 
-    if (addr == 0x3f0) { /* config index register */
-        idx = data & 0xff;
+    if (addr == 0) { /* config index register */
+        sc->regs[0] = data;
         return;
     }
-    /* 0x3f1, config data register */
-    trace_via_superio_write(idx, data & 0xff);
+
+    /* config data register */
+    trace_via_superio_write(idx, data);
     switch (idx) {
     case 0x00 ... 0xdf:
     case 0xe4:
@@ -284,7 +285,7 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
                       "via_superio_cfg: unimplemented register 0x%x\n", idx);
         break;
     }
-    sc->regs[idx] = data & 0xff;
+    sc->regs[idx] = data;
 }
 
 static uint64_t superio_cfg_read(void *opaque, hwaddr addr, unsigned size)
-- 
2.26.2


