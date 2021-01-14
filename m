Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDEF2F63F8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:14:36 +0100 (CET)
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04KZ-0000dr-OO
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04Fs-0005Lx-2P; Thu, 14 Jan 2021 10:09:45 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04Fp-0003mM-4L; Thu, 14 Jan 2021 10:09:43 -0500
Received: by mail-pj1-x1036.google.com with SMTP id b5so3357332pjl.0;
 Thu, 14 Jan 2021 07:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FfB23SnNfNBOgiYxokOcghI0Q+ia/hscI8/Az4dXuB8=;
 b=Fn+dJNZY1iW18yB3SckoQ1wrxWk5favlIHkAYZR0qXfj6Sgs28cTy1Yo6KHsjKfzsH
 QJRDMjYVXztJutQM/GnRRL98/cvbQFXTZJ2Eqfr/1Z/YbMvM8JL6d25J6k5hywUkOzy5
 aU6mk1xgQr8AxhReVzzEKYavuHAB6npKL+c0FCLzZFK7lDL876pMFHo3BVH2JUWctooX
 /UbR6MoYHoZU4mmHH9d8S/RQDooCM13KOzWwtugOTnoQR152DtRM7ZKRsnjqp5ayfAYs
 wN6QH1AgnbECgCEVsBiKh0DgXxsM78LvYcH9BZ1+GlE5p0POBwyxd8RLzI6Nf9w5TpIF
 zOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FfB23SnNfNBOgiYxokOcghI0Q+ia/hscI8/Az4dXuB8=;
 b=J97Z9432ldfA+vgyPF104qfgdDrgpLAx6PH6Ik9TpajcFbeOo1TeYfR9vZ/UGf+lug
 B35VMhP1JV0Pu0s55ejB1cdxNvN8OixAHtzHf1KRfLw3P+zR9sL4+xnPL/PS+bUXMNbm
 QoZtrlPU4R71rf/hFHfM3gOlVs1ueejMQa9SraJYGPdby+9J81slJyxTX4qYAgVEporj
 LliAEb+0yWI9eLjzH5VuqicRg9OJMi3LTSsTfDubL/Xh7m93z95LWtvkqJf47MRAkm1Y
 fc8VW5JZwR9M0ICxHLzKy5IYEdZOC53MIs+7WhBDWsJZh2saZ17Hgq7yTvTAp7tOirQP
 KDeg==
X-Gm-Message-State: AOAM531vwguCSuOg2VrL7S8KUInm7Iwq6cD8al4x6pq6eFcDGZ+vfBka
 dGd3oUoIHMbHYNA9wkCBb+U=
X-Google-Smtp-Source: ABdhPJx23JxUTfUhk7rk901jxYeJ0+dD8mEiLT0ff1dVV+9rlUMrwRvRg7bplcsTAiqmCxkgO6xMEg==
X-Received: by 2002:a17:902:c1cc:b029:da:dd7c:2ac7 with SMTP id
 c12-20020a170902c1ccb02900dadd7c2ac7mr7852021plc.25.1610636978595; 
 Thu, 14 Jan 2021 07:09:38 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id w21sm5372051pfq.67.2021.01.14.07.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:09:38 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH 1/9] hw/block: m25p80: Fix the number of dummy bytes needed
 for Windbond flashes
Date: Thu, 14 Jan 2021 23:08:54 +0800
Message-Id: <20210114150902.11515-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114150902.11515-1-bmeng.cn@gmail.com>
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Marcin Krzeminski <marcin.krzeminski@nokia.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The m25p80 model uses s->needed_bytes to indicate how many follow-up
bytes are expected to be received after it receives a command. For
example, depending on the address mode, either 3-byte address or
4-byte address is needed.

For fast read family commands, some dummy cycles are required after
sending the address bytes, and the dummy cycles need to be counted
in s->needed_bytes. This is where the mess began.

As the variable name (needed_bytes) indicates, the unit is in byte.
It is not in bit, or cycle. However for some reason the model has
been using the number of dummy cycles for s->needed_bytes. The right
approach is to convert the number of dummy cycles to bytes based on
the SPI protocol, for example, 6 dummy cycles for the Fast Read Quad
I/O (EBh) should be converted to 3 bytes per the formula (6 * 4 / 8).

Things get complicated when interacting with different SPI or QSPI
flash controllers. There are major two cases:

- Dummy bytes prepared by drivers, and wrote to the controller fifo.
  For such case, driver will calculate the correct number of dummy
  bytes and write them into the tx fifo. Fixing the m25p80 model will
  fix flashes working with such controllers.
- Dummy bytes not prepared by drivers. Drivers just tell the hardware
  the dummy cycle configuration via some registers, and hardware will
  automatically generate dummy cycles for us. Fixing the m25p80 model
  is not enough, and we will need to fix the SPI/QSPI models for such
  controllers.

Let's fix the mess from the flash side first. We start from a easy one,
the Winbond flashes.

Per the Windbond W25Q256JV datasheet [1] instrunction set table
(chapter 8.1.2, 8.1.3, 8.1.4, 8.1.5), fix the wrong number of
dummy bytes needed for fast read commands.

[1] https://www.winbond.com/resource-files/w25q256jv%20spi%20revb%2009202016.pdf

Fixes: fe8477052831 ("m25p80: Fix QIOR/DIOR handling for Winbond")
Fixes: 3830c7a460b8 ("m25p80: Fix WINBOND fast read command handling")
Fixes: cf6f1efe0b57 ("m25p80: Fast read commands family changes")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/block/m25p80.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b744a58d1c..c947716f99 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -875,9 +875,22 @@ static void decode_fast_read_cmd(Flash *s)
 {
     s->needed_bytes = get_addr_length(s);
     switch (get_man(s)) {
-    /* Dummy cycles - modeled with bytes writes instead of bits */
+    /* Dummy cycles - modeled with bytes writes */
     case MAN_WINBOND:
-        s->needed_bytes += 8;
+        switch (s->cmd_in_progress) {
+        case FAST_READ:
+        case FAST_READ4:
+            s->needed_bytes += 1;
+            break;
+        case DOR:
+        case DOR4:
+            s->needed_bytes += 2;
+            break;
+        case QOR:
+        case QOR4:
+            s->needed_bytes += 4;
+            break;
+        }
         break;
     case MAN_NUMONYX:
         s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
@@ -906,7 +919,7 @@ static void decode_fast_read_cmd(Flash *s)
 static void decode_dio_read_cmd(Flash *s)
 {
     s->needed_bytes = get_addr_length(s);
-    /* Dummy cycles modeled with bytes writes instead of bits */
+    /* Dummy cycles modeled with bytes writes */
     switch (get_man(s)) {
     case MAN_WINBOND:
         s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
@@ -945,11 +958,10 @@ static void decode_dio_read_cmd(Flash *s)
 static void decode_qio_read_cmd(Flash *s)
 {
     s->needed_bytes = get_addr_length(s);
-    /* Dummy cycles modeled with bytes writes instead of bits */
+    /* Dummy cycles modeled with bytes writes */
     switch (get_man(s)) {
     case MAN_WINBOND:
-        s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN;
-        s->needed_bytes += 4;
+        s->needed_bytes += WINBOND_CONTINUOUS_READ_MODE_CMD_LEN + 2;
         break;
     case MAN_SPANSION:
         s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
-- 
2.25.1


