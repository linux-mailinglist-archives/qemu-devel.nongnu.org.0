Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFD0430CD5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 01:08:19 +0200 (CEST)
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcFGM-0006La-Jg
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 19:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2k-0005sW-O0
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:54:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2j-0000sk-75
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:54:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id p21so7143141wmq.1
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cAlFbLE9wEpuh6Lb0mTS+p4wTMdHmTaWF5EoIoUfJp4=;
 b=LcMHtS2NLYBgKbbJDnucsTIEwbiSYGW6a1OgF/VztCro4kj1MwU7CcVajezRk4R0yV
 RnvcrwLaNC6gugouQf7JBWWciBbcB1ifV43vXwO+HI+LD+OuNH99SN9Qb3b7znh+OatS
 /ZuMqsFD5GCoYAUaQVrGhhIWz9OQorf3/OCQCKlDMcOfZiFbqhsv2KCf5AjrBSJadYNF
 QoWOCrAt5Slm6cDD0k528Q//WIT+ic9PMR+gwoZwiDc/knnGr2j7LGDgK0oDFXduJDj+
 HPA26aCzUjbnXmXzKXCuwZ4lWpefHTj81Gd7kZkp8xOacQm1MbC6rYHQ9B52BjdAhvLj
 3fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cAlFbLE9wEpuh6Lb0mTS+p4wTMdHmTaWF5EoIoUfJp4=;
 b=Ac4WHNzyaSn5HCHHdUBTvol+vhAg7GrD0K+d+6J+e75SBkOBPQOUlCgFK4BGae8GyQ
 XTLXQMORPaQU6a9ajtyNqyIwHvRbajZvwOdH+FGJDnDW1q5AbSKrBRbhq1M/byIK6F09
 5gE29sf+u+HzQcDRhFdRCkCv50AFC/fb2icl4Anpn0C5xTzsvUymjAVKAVL4si+hB6jF
 EwarBFxkwDJSYkAk+wgVEywekNJjWL60ZHGl+gDs4QDxHtx1hLgFqzrCAehogZlHQ0yO
 vEV0QKLMsuzvn2jIQ0fSEjL3Pk/5RtHyY19YkU8690W8NHas4PO3qDHvQPWT61HPshB1
 PX+Q==
X-Gm-Message-State: AOAM532Zk8c0sAD3xTIF5h+c5TXrWa6wYLv76vX4h31I8kgIBAEXYG7x
 LpangPNUEWZVmy4/BUufaNvj81O393o=
X-Google-Smtp-Source: ABdhPJyj6inFirO95zb/Hm0mYjH7e4EQubGQ75m7F35xXVQ7UsbfYvabVtp3w26Y8vNADgQgh6XGOA==
X-Received: by 2002:a7b:c386:: with SMTP id s6mr41152667wmj.183.1634511251578; 
 Sun, 17 Oct 2021 15:54:11 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c15sm10875404wrs.19.2021.10.17.15.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:54:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/17] via-ide: Avoid using isa_get_irq()
Date: Mon, 18 Oct 2021 00:52:45 +0200
Message-Id: <20211017225245.2618892-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Use via_isa_set_irq() which better encapsulates irq handling in the
vt82xx model and avoids using isa_get_irq() that has a comment saying
it should not be used.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <26cb1848c9fc0360df7a57c2c9ba5e03c4a692b5.1634259980.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/via.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index e91dad632a9..82def819c41 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -29,7 +29,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/dma.h"
-
+#include "hw/isa/vt82c686.h"
 #include "hw/ide/pci.h"
 #include "trace.h"
 
@@ -112,7 +112,7 @@ static void via_ide_set_irq(void *opaque, int n, int level)
         d->config[0x70 + n * 8] &= ~0x80;
     }
 
-    qemu_set_irq(isa_get_irq(NULL, 14 + n), level);
+    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);
 }
 
 static void via_ide_reset(DeviceState *dev)
-- 
2.31.1


