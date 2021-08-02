Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1125B3DE34B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 01:57:12 +0200 (CEST)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAhnz-0007ya-5O
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 19:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAhmR-00059P-GB; Mon, 02 Aug 2021 19:55:35 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAhmP-0006PY-VP; Mon, 02 Aug 2021 19:55:35 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l4-20020a05600c1d04b02902506f89ad2dso843421wms.1; 
 Mon, 02 Aug 2021 16:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jTJIDkz/opaUmQQtGDLXaqlkz0dDJ080B0GwYCmbDzM=;
 b=Nstsr3TgYqueMD3Jt8vBFuCUDc9PRuA2kWGeJjCX6LJTbyRJ/Q3WdtIxJY32LzsA+u
 4p8jqAYqVNHgGIAh4P+XUcXyp9wq//4u/k/p43011UggTiet1ny3n4aEzQKc8+Uyspt1
 5UY0zo/O+tACUu5lapM/LohNcyR4s8P6ygNbiZ+XFtC7WLDJuL2JtmnNDvFtEpa9cgkl
 ppdvFI1XRyw2LmXpmYU/jmAM4bC0GMVDAISjf8AsYsji2tUMbz4vQ5fY18fi8Fbz2ueE
 Zcw9BWjM6LAIeWu9tDv7Nb3USNHrnqC8qABk/DZclcvGYmeRObTrlREDLyz3TZjPTXYK
 J9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jTJIDkz/opaUmQQtGDLXaqlkz0dDJ080B0GwYCmbDzM=;
 b=oXKOWVfCPSF5ccPqOTCK0oppj7omIfgownZcTX5JqKy02F3Ymsrf9ffr73YTtqy4KO
 1zQaHFVxkIuCG5y+DkA57XXYjzA7erzO4C5i0Xj403KfPgO2lH7yCRpeYfxFoG4tvkAd
 6Ry+mn6SAxjpXXIcuZpp61g8ZkojgGirkHmwVuVy8dRXmhOuaOXZwkrbMqxlPDlbHy+L
 Y6+L8m0d7ZIwFmCVNjg7R4R2/E6syXgPnFoBiEnkwvsXtrsfmhp16huHw465Mf4GPzDv
 ypolVmzP/TU5pwFNcXl889dyv17hUFa8Byo/U3YkFXZrHXfohgxjnSuUOuTGBONqB2/u
 eNnw==
X-Gm-Message-State: AOAM532IG18PMb6WUg/W8CYQkLZN7eVeuP2Wom5A+Mq77esrqNTEs9rL
 bHTbJb8TyqC6gFZfAg8TKBNXadJJDzhpIQ==
X-Google-Smtp-Source: ABdhPJxB0A47VCOnpiYKeLwvuR/WfjftpC6MRiK+x/6P7kuPVEHI7Yn14/+ukSxlJlC5vVoXeTF/9w==
X-Received: by 2002:a1c:95:: with SMTP id 143mr15891213wma.29.1627948531501;
 Mon, 02 Aug 2021 16:55:31 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j5sm12539632wrs.22.2021.08.02.16.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 16:55:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v2 1/2] hw/sd/sdcard: Document out-of-range addresses
 for SEND_WRITE_PROT
Date: Tue,  3 Aug 2021 01:55:23 +0200
Message-Id: <20210802235524.3417739-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802235524.3417739-1-f4bug@amsat.org>
References: <20210802235524.3417739-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the 'Physical Layer Simplified Specification Version 3.01',
Table 4-22: 'Block Oriented Write Protection Commands'

  SEND_WRITE_PROT (CMD30)

  If the card provides write protection features, this command asks
  the card to send the status of the write protection bits [1].

  [1] 32 write protection bits (representing 32 write protect groups
  starting at the specified address) [...]
  The last (least significant) bit of the protection bits corresponds
  to the first addressed group. If the addresses of the last groups
  are outside the valid range, then the corresponding write protection
  bits shall be set to 0.

Split the if() statement (without changing the behaviour of the code)
to better position the description comment.

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 1f964e022b1..707dcc12a14 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -822,7 +822,14 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
 
     for (i = 0; i < 32; i++, wpnum++, addr += WPGROUP_SIZE) {
         assert(wpnum < sd->wpgrps_size);
-        if (addr < sd->size && test_bit(wpnum, sd->wp_groups)) {
+        if (addr >= sd->size) {
+            /*
+             * If the addresses of the last groups are outside the valid range,
+             * then the corresponding write protection bits shall be set to 0.
+             */
+            continue;
+        }
+        if (test_bit(wpnum, sd->wp_groups)) {
             ret |= (1 << i);
         }
     }
-- 
2.31.1


