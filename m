Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F5C4F2CBA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 13:32:20 +0200 (CEST)
Received: from localhost ([::1]:33530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbhQ2-0000P7-Hq
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 07:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nbhMv-0007VX-Cd; Tue, 05 Apr 2022 07:29:07 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nbhMu-0005dk-13; Tue, 05 Apr 2022 07:29:05 -0400
Received: by mail-ej1-x636.google.com with SMTP id bg10so26070366ejb.4;
 Tue, 05 Apr 2022 04:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSCtYurY6Y3ujiAxlIPVesqQ6HVNrkQwNiorsuyqVkA=;
 b=UPvbaAC5mJh4o0CgFFQii1tnut/sqzFjLwCC44bhB5TfzBoSXUCyiUFtAsfafsn6zg
 p8Bxxm76qIDi82s/y36URu2vkItM5feB7jnkytj4/TXlrpcBPp40B7Li+dkNUKPImVFn
 eDBL2CVLHTjAIdcZuOv2IxPniKwB19Tbzii5KMQ6wQR5b/xWH+cW37Y8a9XBc9eapMot
 wLrIiD60RD57pxcAT+fa3WdVfwz4/ThddkbCl9IGk3hMHwmBKUZ6Ti9zackJ3LCi370S
 V7F0ef4CJSiKGOSFxhCTHwJuvTr9e/+YpKHqWEgzeoMnrbNPQXpkFf6P/WjlcPpNYA0Q
 bplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSCtYurY6Y3ujiAxlIPVesqQ6HVNrkQwNiorsuyqVkA=;
 b=iuqaUL8D+D5089TAOijHm+oGaVH5QDhCM0vLBUCujzK0ty5A7VEWBjiWQV52CzpSgO
 RVArUnddIt3hxm8WgBi+1ycYKQmvLeAbzG7bO2gzepksbXGT4YiqUcyqe4xYBKSflZv2
 xilJnvGFXuii9az0chENV3MAyJy9cagVB51gGvO50FEi3lVe7MRBcrCXz0ADIasjrC9z
 mQGa95Fa6vngFKwHPnHGRuxnteLRKRIox3LEXs/6JrwvDRRXeHJ05B5pjLzZK1mmNME1
 SvNvHyWHYx6Emk/ys3b2hvfZp0q6yLs4E6j+xeg/gL0BhyAsWQw44fmhtFmQaP13EJnm
 hfeg==
X-Gm-Message-State: AOAM532y2enXWIg8GMf8/jBZfy/N+/9zFuusMzmZ4MxYGNkvgP14D9HC
 BB5iBzt5NEppxDbFrAlLeMhtXICMYn8=
X-Google-Smtp-Source: ABdhPJzlkECfHZ0MpHc+7BtZFRGgMYEmjkwKnK5HT8rUcfi0brHZ24hCk+ia8B1eE4SZtH0kyVeMGA==
X-Received: by 2002:a17:907:728e:b0:6e0:5ce7:d7c7 with SMTP id
 dt14-20020a170907728e00b006e05ce7d7c7mr3046218ejc.113.1649158139752; 
 Tue, 05 Apr 2022 04:28:59 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-013-166-174.77.13.pool.telefonica.de. [77.13.166.174])
 by smtp.gmail.com with ESMTPSA id
 sb15-20020a1709076d8f00b006dfe4cda58fsm5384973ejc.95.2022.04.05.04.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 04:28:59 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/ppc/ppc405_boards: Initialize g_autofree pointer
Date: Tue,  5 Apr 2022 13:28:38 +0200
Message-Id: <20220405112838.15360-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 "open list:405 ref405ep and..." <qemu-ppc@nongnu.org>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resolves the only compiler warning when building a full QEMU under Arch Linux:

  Compiling C object libqemu-ppc-softmmu.fa.p/hw_ppc_ppc405_boards.c.o
  In file included from /usr/include/glib-2.0/glib.h:114,
                   from qemu/include/glib-compat.h:32,
                   from qemu/include/qemu/osdep.h:132,
                   from ../src/hw/ppc/ppc405_boards.c:25:
  ../src/hw/ppc/ppc405_boards.c: In function ‘ref405ep_init’:
  /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: warning: ‘filename’ may be used uninitialized in this function [-Wmaybe-uninitialized]
     28 |   g_free (*pp);
        |   ^~~~~~~~~~~~
  ../src/hw/ppc/ppc405_boards.c:265:26: note: ‘filename’ was declared here
    265 |         g_autofree char *filename;
        |                          ^~~~~~~~

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/ppc405_boards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 7e1a4ac955..326353ea25 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -262,7 +262,7 @@ static void ref405ep_init(MachineState *machine)
     /* allocate and load BIOS */
     if (machine->firmware) {
         MemoryRegion *bios = g_new(MemoryRegion, 1);
-        g_autofree char *filename;
+        g_autofree char *filename = NULL;
         long bios_size;
 
         memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,
-- 
2.35.1


