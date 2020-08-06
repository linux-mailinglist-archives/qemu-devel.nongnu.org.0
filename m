Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42E23DA8A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 15:05:36 +0200 (CEST)
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3faR-0003ZF-PR
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 09:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3fYh-0001yp-EC
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 09:03:47 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3fYf-00075Y-Ig
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 09:03:47 -0400
Received: by mail-wr1-x42e.google.com with SMTP id p20so9025367wrf.0
 for <qemu-devel@nongnu.org>; Thu, 06 Aug 2020 06:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JPJZIC6+INx85XXFh6H5vaAGpImRMQUrGLjtvHHxslE=;
 b=TGCvQOZ6YusWMBPtoYADDGjSpGqoa4CDAUITpXH6clMirt8oDFkD1FyuwVD9K0jiQ4
 7ci7FlWkTnUoAPix3e0A07HGkFaBWp8E5ie1rlwO5PZZL1WqgWpuF+zUufDxp3zehJJ1
 S6TkLIhHtF5x2agTSMgSLiChxoQxp0LkMs89w7Elfmv3ZF2rLr05OdLfVkV2cDyg+vk5
 OARGhDJ8nNbTZlazPuPGijDBUqnfCKqPqU7vyRj7ZVRdFamZb5QCdY5l/HAE96qks/wb
 VFi7VAzZAMM4qcd7bXOaygG1ncU61tUIn4B7JJhSl2pcSglt5s5ChFzgBHje45f+2JCp
 M/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JPJZIC6+INx85XXFh6H5vaAGpImRMQUrGLjtvHHxslE=;
 b=BWe3dCgeo6KBEZ96RXGIbyooUFta7Jkp62YKuamfz7vwH2NtMDeHXSvWXz7M+LAgKB
 ca77dLxrTwZp3knOHs7QypFzT/ST3d3i/Vb51M1+lztXoS9gmv02W2gdW+qtFTOBFJFx
 w6Pn83etUl4OLFQILbO0aH5zD42VAXRaidmdvrLbst+BZxcOKT3dTCb3HleUrKNJvlWu
 FJ0eXzUy8dy+6BUeb+y3D33egcS9bZiCCp4320jphPFrm8XZlHOgnsRJnrZEyLlQJsK1
 K/6SwgJKZ4hOpr7HR/B6UOjg7zheYcVo+HQnej/E+Qn+n+gx5IWo5ccMSwa1f0Zmx9Xn
 NFJw==
X-Gm-Message-State: AOAM532CAvaH4xyD8Pe55MnHVsoLycP5P2IHetcGadyEWvC8Hn+gnSoI
 e2rPq6t123sKPREicdPFQwHeFNY7
X-Google-Smtp-Source: ABdhPJywascbo0wAyURK6AAbrMrxXY2lymgjZsX+QRFMzK/wnml+VUqfPAq8eCu8Cw5waFxvEFTyiA==
X-Received: by 2002:adf:f488:: with SMTP id l8mr7184330wro.123.1596719023478; 
 Thu, 06 Aug 2020 06:03:43 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id e16sm6409113wrx.30.2020.08.06.06.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 06:03:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 1/4] hw/char/serial: Replace commented DPRINTF() by
 trace event
Date: Thu,  6 Aug 2020 15:03:37 +0200
Message-Id: <20200806130340.17316-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200806130340.17316-1-f4bug@amsat.org>
References: <20200806130340.17316-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the old debug PRINTF() call to display the UART
baudrate to a trace event.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/serial.c     | 4 +---
 hw/char/trace-events | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index fd80ae5592..3e903d5fad 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -187,9 +187,7 @@ static void serial_update_parameters(SerialState *s)
     ssp.stop_bits = stop_bits;
     s->char_transmit_time =  (NANOSECONDS_PER_SECOND / speed) * frame_size;
     qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
-
-    DPRINTF("speed=%.2f parity=%c data=%d stop=%d\n",
-           speed, parity, data_bits, stop_bits);
+    trace_serial_update_parameters(speed, parity, data_bits, stop_bits);
 }
 
 static void serial_update_msl(SerialState *s)
diff --git a/hw/char/trace-events b/hw/char/trace-events
index d20eafd56f..85e39d9d62 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -7,6 +7,7 @@ parallel_ioport_write(const char *desc, uint16_t addr, uint8_t value) "write [%s
 # serial.c
 serial_ioport_read(uint16_t addr, uint8_t value) "read addr 0x%02x val 0x%02x"
 serial_ioport_write(uint16_t addr, uint8_t value) "write addr 0x%02x val 0x%02x"
+serial_update_parameters(uint64_t baudrate, char parity, int data_bits, int stop_bits) "baudrate=%"PRIu64" parity='%c' data=%d stop=%d"
 
 # virtio-serial-bus.c
 virtio_serial_send_control_event(unsigned int port, uint16_t event, uint16_t value) "port %u, event %u, value %u"
-- 
2.21.3


