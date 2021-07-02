Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68363BA305
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 18:02:24 +0200 (CEST)
Received: from localhost ([::1]:47986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzLcV-0005xF-OB
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 12:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzLZQ-00034c-8a; Fri, 02 Jul 2021 11:59:12 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzLZO-0004DM-Pu; Fri, 02 Jul 2021 11:59:12 -0400
Received: by mail-wr1-x430.google.com with SMTP id m18so13065332wrv.2;
 Fri, 02 Jul 2021 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g3mXQWSPJFZt6+QzEux1hZKoh5RScSdBLOmydGx074Y=;
 b=oee057xoNxavxbV3w1EcDoSX+iZJ6ApdzqcFjJt1iDHkg9BaqS3Y0X3X+qoGkPesVJ
 kbowZ3I7FrsS9YEMOqH/8WFqYrUu3vAyrcpfYR0bnIz3sPEX+TU3kyVzxrf253FjtfEK
 GcO1fOiZUJziYHy27+Be2czKDowXvuR2O6jh2vF4Iy/G/u15I542+jW2spUXE0Eg10O/
 /gvKEB9tRAzr0uBdfTbBKH/uKPykthQYTwoIL28ksI7lcrz6LC8YglYAYgWhSMGat8IQ
 Je4GbY8P3PWaxfqVBRPwfKYyKrqABYKsEIrfFJDB1gBzzUPf/PkXy5eBbh165pBycIzf
 1Meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g3mXQWSPJFZt6+QzEux1hZKoh5RScSdBLOmydGx074Y=;
 b=p9Vs4AfYlhtlAvvoUtqEqBr8Zp/AxyzHgrkywY3iB87gOBfVDm5qEdyllVIGl/5S32
 WtVBBoO/B/Kd/QeAzIqVnWHAdB5GykMoI8uDH03XRj+O2rQPTbeYblhRrtJgIuUNzZ9c
 PQ0pUQ4aV77DkIFfyiCC7V2TGOC2eEx8sD0+uCaDZaT4Hbm3Zsdq9Jn2ehWzIaKZz64U
 OUhpBCbAu6Q328BM+PGoydLXROlfsYCyQlG4tx0T2DKHtuUUPbl8FJRqs5hkhgASEZVx
 GLTiJ4nfEbCSFMA3sQ4hBm+Lu4aIBI4fyhyvJEtHsqerAP3oW/3RdtNaQQkc+IPkzeaY
 ptnQ==
X-Gm-Message-State: AOAM533v/KEvt6G3s0Gi8YrvuAYUx+/jtQ4+6Nms6WvtkSOq7dpQOGBX
 EOpijgZPGf6XDtnywtx8o+8JQq3vfOaMzQ==
X-Google-Smtp-Source: ABdhPJy2COYHmYt0mzeBI524gpiv2nXVcQmSZd0yi3aOFmCpFANUA1Xfl6iczGHWyzAIDXa389Y3Cg==
X-Received: by 2002:a5d:62c2:: with SMTP id o2mr385964wrv.234.1625241548617;
 Fri, 02 Jul 2021 08:59:08 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id w22sm13164965wmc.4.2021.07.02.08.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 08:59:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/sd: When card is in wrong state, log which state it is
Date: Fri,  2 Jul 2021 17:58:58 +0200
Message-Id: <20210702155900.148665-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702155900.148665-1-f4bug@amsat.org>
References: <20210702155900.148665-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Michael Olbrich <m.olbrich@pengutronix.de>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We report the card is in an inconsistent state, but don't precise
in which state it is. Add this information, as it is useful when
debugging problems.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-2-f4bug@amsat.org>
---
 hw/sd/sd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 282d39a7042..d8fdf84f4db 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1504,7 +1504,8 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
     }
 
-    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state\n", req.cmd);
+    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
+                  req.cmd, sd_state_name(sd->state));
     return sd_illegal;
 }
 
-- 
2.31.1


