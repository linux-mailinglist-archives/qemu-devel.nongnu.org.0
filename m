Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD95440A8F
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:21:58 +0200 (CEST)
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgs3J-00020V-Rt
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpJ-00034w-7Q
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:29 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpG-0004pw-Vo
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:28 -0400
Received: by mail-wr1-x433.google.com with SMTP id p14so21572671wrd.10
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ohXc7eYpDMugIP0Bb3hBeNgUAK1r4bs/uM2nEOBJZ3Q=;
 b=kkErw6C7RE1dh2N29B3XfAcd1BfqRHNcL529e41nDjsYr6XGoedjbabktVCHynaptN
 qD+Pu63ONKsXAZPS+3u96tOYFFeQE1vUatAdSj/WaffX4zNiEhmg/oO5HsoqEwS9UqCi
 6Gpo/mSLLhxlwzIsv0IBxMRgqvNHrXRyeTq5/HMCeL7rad8qUOz6P2uXPXC68jhJmEf7
 3YAmzFfxZL3UA8I0Pj9AKPjWXi5WNEhQVz0ghNguX1JRuFbCDfkvvbgnGEOJ3k4Dgyun
 nlUiAGcgFIQspCYHza01m0uFNK+JXhbOyLYxypfD3xMTJOW9TBDmY0eyjjirCUlvKj0W
 P+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ohXc7eYpDMugIP0Bb3hBeNgUAK1r4bs/uM2nEOBJZ3Q=;
 b=zLJ6iaUfOWrxfD9hmbKP3KIYseIsqj2uud2XfqDJ4W7ENlPifSiGTENueG6q8pUS4N
 791Z2rOF5kvvhMcZofGi2c9VxfrJU8Pf7Ef+MxOg3fkfmui+LbQxpjr0xU3Vql9QOOG4
 X7z7M1Rz7osxU9pKzVpsXxSKHxheWkMYJDaHK2KXIKyBDjlf+LePZM1Znt2dLYReK99v
 gVmSgd83GJt0R5NE0bmN2pjk9qybocfpFx08XAewIAj6CIdEngOeGGndVAqKQW4PIFtD
 faz3MFX7bXkaXjVdVdVqYU55S2E2/I2LB4D/WMw9CBqAKjyj3EOEjU4Z8mLdtQkznAVF
 aRsg==
X-Gm-Message-State: AOAM530rBasAtl8r0ly1/BVuzxEaZpzmaQ4VBvmHN6bqEtgPFqcztxka
 hjmq18V1QvQ7HI+IAFL5xsKf417r7tQ=
X-Google-Smtp-Source: ABdhPJywl9usLV5/wHPBYUBrykxA2pDlIQhZo1blVpnwa6Ny2VW/8eWOQimvNlbjXwaI3ppbWNGauA==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr20401825wrq.44.1635613645462; 
 Sat, 30 Oct 2021 10:07:25 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 l6sm7700883wmq.17.2021.10.30.10.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/30] hw/char/sh_serial: Add device id to trace output
Date: Sat, 30 Oct 2021 19:05:59 +0200
Message-Id: <20211030170615.2636436-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Normally there are at least two sh_serial instances. Add device id to
trace messages to make it clear which instance they belong to
otherwise its not possible to tell which serial device is accessed.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <cc1f9ff9f4259ae799750e452f8871849c7a104c.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/sh_serial.c  | 6 ++++--
 hw/char/trace-events | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 808d4ebae70..355886ee3a1 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -94,9 +94,10 @@ static void sh_serial_write(void *opaque, hwaddr offs,
                             uint64_t val, unsigned size)
 {
     SHSerialState *s = opaque;
+    DeviceState *d = DEVICE(s);
     unsigned char ch;
 
-    trace_sh_serial_write(size, offs, val);
+    trace_sh_serial_write(d->id, size, offs, val);
     switch (offs) {
     case 0x00: /* SMR */
         s->smr = val & ((s->feat & SH_SERIAL_FEAT_SCIF) ? 0x7b : 0xff);
@@ -212,6 +213,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
                                unsigned size)
 {
     SHSerialState *s = opaque;
+    DeviceState *d = DEVICE(s);
     uint32_t ret = UINT32_MAX;
 
 #if 0
@@ -304,7 +306,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
             break;
         }
     }
-    trace_sh_serial_read(size, offs, ret);
+    trace_sh_serial_read(d->id, size, offs, ret);
 
     if (ret > UINT16_MAX) {
         qemu_log_mask(LOG_GUEST_ERROR,
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 4a92e7674a2..2ecb36232e9 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -103,5 +103,5 @@ exynos_uart_rx_timeout(uint32_t channel, uint32_t stat, uint32_t intsp) "UART%d:
 cadence_uart_baudrate(unsigned baudrate) "baudrate %u"
 
 # sh_serial.c
-sh_serial_read(unsigned size, uint64_t offs, uint64_t val) " size %d offs 0x%02" PRIx64 " -> 0x%02" PRIx64
-sh_serial_write(unsigned size, uint64_t offs, uint64_t val) "size %d offs 0x%02" PRIx64 " <- 0x%02" PRIx64
+sh_serial_read(char *id, unsigned size, uint64_t offs, uint64_t val) " %s size %d offs 0x%02" PRIx64 " -> 0x%02" PRIx64
+sh_serial_write(char *id, unsigned size, uint64_t offs, uint64_t val) "%s size %d offs 0x%02" PRIx64 " <- 0x%02" PRIx64
-- 
2.31.1


