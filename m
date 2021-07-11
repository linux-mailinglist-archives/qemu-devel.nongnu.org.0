Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97343C3F77
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:19:24 +0200 (CEST)
Received: from localhost ([::1]:55798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2grD-0004ve-PS
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2ga7-0007vI-Tp
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:43 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2ga5-0001FG-Ku
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:43 -0400
Received: by mail-wr1-x434.google.com with SMTP id g16so12172453wrw.5
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufOeAaz2SqyjCt5TYUAiTb6MTzHNseUPG7GdwxXaEHQ=;
 b=jCc+Wf4wmfZiNHvQRU7I4bkPnu8HBrFoqN+k2aUn9A8vy2Caas/WGoWPqIyvlArWiD
 8cDDMYYjEKtRhiPK89cn/PInFzgfSo3qsXog+isZF1MpU18wM0I05NNl/aN7tPn7G7Ep
 KT5qtgLqQCb+C9cjZlhcmXCW9bwivbBCZHr399tYyZ8D/9KYXjMtjv5UvTeXoIHyg3h2
 Z1lIFv9EPBhd80C2cEZNe5KdgDaXf/giRJj8bNKU4lu6IEu0CYh+XKdlJlXmuZL48tA4
 YN58fGuA1TR0M8GNDxbr/bUhMaXVljRKbJqpH/VC/Yxl15fodsVY2BLczirbwifXufUX
 jVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ufOeAaz2SqyjCt5TYUAiTb6MTzHNseUPG7GdwxXaEHQ=;
 b=oIJgzyw1fVovYdogR1EMLl+BIEwt5Wkf+MOVX8vNTgGdmM5bIwox+It9kD/QtpwcH3
 yvM9brUiDSfZW+vXhVGG2dCFidcVv3dQVMYPA7VE2OahxkF1/w8fXqoBSmnr06wQAX7v
 n8pgtf3C3YnXE4xpQbDF66GQ4pnUmvAybpouRjge+5aeFy1UgfUmmUqzJVaKNE8OLjEM
 JSFXcCvIxTix4pZIUtCMx70N+WrduEzApEDcyHH6OOqhj4xPykyhyU/za1wHCr9+e/gQ
 hGLj54F864CN8xm6sIm9CDIX1o8oVK24Q/8NpGF7q87428uHNd+VHoWMAar9bAdFaN74
 ZN1w==
X-Gm-Message-State: AOAM5317P9Pa1/1RuAcExzoLELY//Le6zzeejGtUG2gZf/gv4S5mzaiE
 tZIeK61AwIoB78pleLjSj55jCw23JjWuQFGj
X-Google-Smtp-Source: ABdhPJykLlvg9iVC+r17E+KeynZm7MXU6rsaIce1SbNGgIVJrF2EmTLFv3YfxsYuEtaXCGE6AyuZew==
X-Received: by 2002:a5d:4086:: with SMTP id o6mr27490882wrp.379.1626037300007; 
 Sun, 11 Jul 2021 14:01:40 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id n18sm1763321wrt.89.2021.07.11.14.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:01:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/19] dp8393x: Replace address_space_rw(is_write=1) by
 address_space_write()
Date: Sun, 11 Jul 2021 23:00:12 +0200
Message-Id: <20210711210016.2710100-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace address_space_rw(is_write=1) by address_space_write()
and remove pointless cast.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Message-Id: <20210710174954.2577195-2-f4bug@amsat.org>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


