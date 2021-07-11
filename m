Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDC3C3B8F
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 12:39:37 +0200 (CEST)
Received: from localhost ([::1]:33992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Ws3-0003FK-26
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 06:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2Wow-0006DI-TS
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:36:22 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2Wov-00043i-IF
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:36:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id g16so10175201wrw.5
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 03:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mTZV+n/oh33t5seqMlDVWHULoEHrUF2lMDudl7/Bh6s=;
 b=bA0pK6Bf+Y3nBimW4sJ28eCDZm5DWog5sFVgr4LKRSNLkBOs0OLEdo2K5rmer2l7B8
 Q301sZ6NAAK6I/tKKh4GkjagC59u/dnY7yHI2G3arsgZuICzbMN64i0mlorF5xQN0zYu
 W+bwG5SN7i3G+Kw+QTLVPzJLwizq5CQIfsPKkZRD1wVmmy3NtaHsH2205edbborJ6nFy
 js4xgmqZaOxEKqw6aAGDQTYvDooQOQcckdrF93HiqScStfqpeWNU05ZUZTF3N19gig92
 gq2L3rsC0R0gwkRtgHbcQ37LMwfbExZtSM2W0EZejozpVGu64PGBaVubZVtBfe1wmwNp
 VlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mTZV+n/oh33t5seqMlDVWHULoEHrUF2lMDudl7/Bh6s=;
 b=t+Cguknw70Yuq+eiH3/15q6zmEGepMsbtRaiBiaOUbqHr4oO9iizChwCMYbG+11CIp
 hWEOiUQW8qGfvOYM4Yuiqd7iLrwYmu5qfCC0Ttt9BTYwaY6+7+VyI4V3Scmyd5YXIdDl
 8AnbaoeL+r9T8GirwJ6pRueCHBIjJemOsZzKUCrjD7L6QunfCWdFCZuLPyIts3uhwb0U
 Gq1l2UwBz2ZxSl7s1NbLGeiB8150H2xNcoyLsGEB9GEHIb22eP2OZrP/zmUXFiBYsbAR
 wnR8k05VjwgNbkRImKLnP40z1fiQrFGpwyWAA/b0UfPSvgExbLq3yBc8uFfyggOt/i0w
 6ELA==
X-Gm-Message-State: AOAM530lJVwRbWqhoCwcJB51bnSNcznOBQOtA+VhXpxLUiUOl6DmeWV2
 4JS6xqQZ/wWxA6397H1xXF91psa76vZDnA==
X-Google-Smtp-Source: ABdhPJyPfz0EbqyyVcD2WyIpJdL4gi52TxHGQXdgohCh98ZHVCNyxIspaWll1VI27Bjj/Nv/pfQA/Q==
X-Received: by 2002:a5d:4449:: with SMTP id x9mr27022000wrr.52.1625999780052; 
 Sun, 11 Jul 2021 03:36:20 -0700 (PDT)
Received: from x1w.. (static-189-95-145-212.ipcom.comunitel.net.
 [212.145.95.189])
 by smtp.gmail.com with ESMTPSA id j17sm20194210wmq.9.2021.07.11.03.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 03:36:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] dp8393x: Replace address_space_rw(is_write=1) by
 address_space_write()
Date: Sun, 11 Jul 2021 12:36:08 +0200
Message-Id: <20210711103612.2661521-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711103612.2661521-1-f4bug@amsat.org>
References: <20210711103612.2661521-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Finn Thain <fthain@linux-m68k.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace address_space_rw(is_write=1) by address_space_write()
and remove pointless cast.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Message-Id: <20210710174954.2577195-2-f4bug@amsat.org>
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


