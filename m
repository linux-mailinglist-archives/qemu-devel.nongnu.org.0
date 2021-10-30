Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC62440A77
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:13:44 +0200 (CEST)
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgrvL-0003cv-5i
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrp8-0002l9-O8
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrp6-0004ns-U4
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:18 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d5so6340678wrc.1
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eN5tS9IUiRPYlknYxxUSsbKuotBv9kfi9TXt8NixlX0=;
 b=B4gqrIhEFrq6DkSIVOgzCbwwf1Nwd0DAqy96M7kSgnb5rt8z7cL3mTN/3NF2sxs1in
 O0YOpvEX0xelouTS6q/sHxk5va4/I2xvwVP12V/O5k+T9GZm+bgSxU4itXtHARSVc1YV
 7HjWH3uFFYtRwOZOPOnnLGmnny5apBCNlj0WscrjZG7+CUNb5rrFN2Nu6xdIYf8NEWTj
 rjBYaZo/spry/y7qLwcYFUzBUl8L+fiXpPmEw5jV+DhNpC3c4QJdiBG5gh0OSuXicqDy
 coHQ792AO9JUQBsiVcYrMMvx+n7cww2tzm2nLHnVWvCYNpxk+e/gXmHrQj0XEyOsZpTm
 JznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eN5tS9IUiRPYlknYxxUSsbKuotBv9kfi9TXt8NixlX0=;
 b=5r70COxvpL1xg58ftbZzEh4gmczZnVRsbC10CAFi3Gkr1niF4wu3yUowxkQcv64HK1
 Um8/Q2aHNj0Fb6WIJysy8MQoOXTeeoBAKSBm/uRbz7P3gEcAatTxGjA+ZcQr2cAjfJVa
 NfUnVQWRLs+GPM5Y/XEa54Vsx0aXRgL8pNA94tzcvbkn8B3HSTBo8qEufR7jvRJ9Gghr
 Wtq78wKlaX7vSnp68rvpdDcRjFD3GMbkIQ1gfnAn6DhbHFwPIDeq9vVDGsOsXKVhSsR6
 iOVtwlJdlNB3yliMNHnMs7Ewc+QbBHYUlw+wFU9wIPKBVBymVH3Py1YCGbFuPXWAiitr
 Enpg==
X-Gm-Message-State: AOAM530LNsL2SKwfiX/3EoIH/JI9eK8XyQW4mV+kj9Dx+Xo3eljdckxy
 u3JavLyMaef/QTZ/U+rDTklz32pISmM=
X-Google-Smtp-Source: ABdhPJwVDj6rCTtxCCsT/hsccG2meoegZw7dchhcA7fG4S1yo4VOpc4S8QDSCwN87oTC0pMTBEwrIA==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr20400699wrq.44.1635613635441; 
 Sat, 30 Oct 2021 10:07:15 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 v7sm8655552wrq.25.2021.10.30.10.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/30] hw/char/sh_serial: Split off sh_serial_reset() from
 sh_serial_init()
Date: Sat, 30 Oct 2021 19:05:57 +0200
Message-Id: <20211030170615.2636436-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <ffb46f2814794c8dfc2c5a0cf83086a7bd754e10.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/sh_serial.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 5ee93dc732a..80a548d19d9 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -381,6 +381,25 @@ static const MemoryRegionOps sh_serial_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void sh_serial_reset(SHSerialState *s)
+{
+    s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
+    s->rtrg = 1;
+
+    s->smr = 0;
+    s->brr = 0xff;
+    s->scr = 1 << 5; /* pretend that TX is enabled so early printk works */
+    s->sptr = 0;
+
+    if (s->feat & SH_SERIAL_FEAT_SCIF) {
+        s->fcr = 0;
+    } else {
+        s->dr = 0xff;
+    }
+
+    sh_serial_clear_fifo(s);
+}
+
 void sh_serial_init(MemoryRegion *sysmem,
                     hwaddr base, int feat,
                     uint32_t freq, Chardev *chr,
@@ -393,21 +412,7 @@ void sh_serial_init(MemoryRegion *sysmem,
     SHSerialState *s = g_malloc0(sizeof(*s));
 
     s->feat = feat;
-    s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
-    s->rtrg = 1;
-
-    s->smr = 0;
-    s->brr = 0xff;
-    s->scr = 1 << 5; /* pretend that TX is enabled so early printk works */
-    s->sptr = 0;
-
-    if (feat & SH_SERIAL_FEAT_SCIF) {
-        s->fcr = 0;
-    } else {
-        s->dr = 0xff;
-    }
-
-    sh_serial_clear_fifo(s);
+    sh_serial_reset(s);
 
     memory_region_init_io(&s->iomem, NULL, &sh_serial_ops, s,
                           "serial", 0x100000000ULL);
-- 
2.31.1


