Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5743C35EA
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 19:51:57 +0200 (CEST)
Received: from localhost ([::1]:45050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2H8u-0000B3-3f
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 13:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H76-0005sf-Lt
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:43561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H75-0000yg-9G
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:04 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so8330800wmc.2
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 10:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3MSEzATk19r9ft3099Sl+079BzMi8xPFVuglcUqce0A=;
 b=qJkguGvVzi7FEApAaAcgwMnwJaM9Vpjt04icrlx4661EiitfEp6IsvHs7EzpBBdWAe
 IELhp0gF+CbsDnasAJsvaoK+kV0creI2ZzfCUT/SfLVqEIlcu30ME25zMnZLUAKOr/0A
 9FnmzCwnUOrd4ILHwzrb9Tx9Knc+glaW/3Q4jlNErjKsyeRNGk5xte6+WQwWOQfhN6vN
 45xZM4GFdW2hRZ1Gh18poxesxaMaTWv6jrKEa15tCdWsDddo3Ed3M1hgcBuQ9wG1ICg9
 wso3biWogGNuAD0hccDE5CLNrQUCRGWG71Ljq9cxnfUnPWoyyOYJm5bIRyfRJEt5sAyM
 eYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3MSEzATk19r9ft3099Sl+079BzMi8xPFVuglcUqce0A=;
 b=Y+cTkvhr8bc4K5WoJZepe8yhfQIeirEEdFMtztC8JehGW9jbZ7NbxQHMckLQxqzyD6
 z9+9zwskgf2I5tqpCuhMvOpqNR1b8kxSKTlo6jYgHXawuwiBqrSGSrRBi6TAPgCBtnfq
 lMbvIBLXYGQfalmLUA9o2dAyCCCTZdESF0ZbWD2zq8nA8n+0Bkoi8mkWBeIhNAjAnsfN
 ZIJLNAUiqZUG0iQ881KwfB+kW75fgUFbz6mstt3X2GB+Db4a3r/V2RIuKuQyKQ/kUhuq
 Ms5ffGOfFABsA6aJiGoC+vJhhiyJdZubaMgvrecfHA4+LjxiDU023P41t6rRIq5wh4v7
 gW9Q==
X-Gm-Message-State: AOAM532CxZQEcdL7le+zQpMjQrexseF90OHVWSDD3+vm3TdYgoogXR2E
 TOTJrh9x04c4odqlJQVBepqhymzlX3XR+g==
X-Google-Smtp-Source: ABdhPJz8LMWAQ6yp3Yim3aNFMwk23UJNcecX/C8uTCr1uKeSJ7ArKDW72RZysUefPQOSM/Il/TWdGQ==
X-Received: by 2002:a1c:f616:: with SMTP id w22mr5401227wmc.73.1625939401220; 
 Sat, 10 Jul 2021 10:50:01 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id d24sm15256012wmb.42.2021.07.10.10.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 10:50:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/8] dp8393x: Replace address_space_rw(is_write=1) by
 address_space_write()
Date: Sat, 10 Jul 2021 19:49:47 +0200
Message-Id: <20210710174954.2577195-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210710174954.2577195-1-f4bug@amsat.org>
References: <20210710174954.2577195-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace address_space_rw(is_write=1) by address_space_write()
and remove pointless cast.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 11810c9b600..9118364aa33 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -816,8 +816,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         size = sizeof(uint16_t) * width;
         address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
         dp8393x_put(s, width, 0, 0);
-        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                         (uint8_t *)s->data, size, 1);
+        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
+                            s->data, size);
 
         /* Move to next descriptor */
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
@@ -846,8 +846,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     /* Pad short packets to keep pointers aligned */
     if (rx_len < padded_len) {
         size = padded_len - rx_len;
-        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-            (uint8_t *)"\xFF\xFF\xFF", size, 1);
+        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
+                            "\xFF\xFF\xFF", size);
         address += size;
     }
 
-- 
2.31.1


