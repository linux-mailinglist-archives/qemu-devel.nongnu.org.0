Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF876A8C0F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:43:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrcn-0007bK-KZ; Thu, 02 Mar 2023 17:42:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrck-0007YM-Dm
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:06 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrch-0008WJ-8c
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:05 -0500
Received: by mail-wm1-x334.google.com with SMTP id j3so580307wms.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3AoU626teyyuqy/kOKhaATOA10AmPEd2CLo0HeKY7iM=;
 b=AvtpbScbEToTeZttg2AmvmKP8tEir63YdYgxtnadOqpZXqEJLmnnU6nr3PyWAvDLLc
 YZJ10TM1jrBSwVGMMkT3vAA5v8O1bc3fk6DN0Y9fvGqGV1aM7HQT//yDqqFxjQ+9XQ1Y
 u8MMGpShwf6fR+hvmQsisPdViffVDm/ni4wA4tlSOFZfjrRBbJwdk8NNeJ6hxBisoz/3
 gQ83QP+ESO9earPBETvudL7W/B+eH7DdOMrdI9QXBJfTHV62fvAI29A65z/Rn9OYhlCc
 CuvZJxjfLzxpSoOeeFEa+M/tJrgC2wmoYe+R7iB19ikSftaw4lIssuwc4ZaC+YKY12gt
 4txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3AoU626teyyuqy/kOKhaATOA10AmPEd2CLo0HeKY7iM=;
 b=2/fRgbvkx7xB1k/lWON8fwLA8P6HLpC9XbhDwFT/R6R0dn2h0PffE4Ej4eucYgztDL
 mV6MarDdiDdsRNM8BXYOymqvNl1vf6q7YGHOMNoe8JexkTawnfJjw+PXQO2drRuh910N
 uFOt6dR3oF8bqiBIE3t2SYRGpUufnzwnpa0cWCBZOKpj+T5zi0Z2/jeO6nK6WTP9mU9L
 apN3SSCHonM00zOGoIoPppiCbb0DBWhcLiGcl4/9nKN+ujKxsaIZ8p/llk5GzcmnG2S4
 FyrWxzrgh2GLO/qO439o+PEwTJB8+5bSfWsCMoVk+lZrFXC7jmtQqedYv/eKU5Kh5mgE
 PdFg==
X-Gm-Message-State: AO0yUKWPAub+2W4HehiTDfbomJOGHthabCU+l4gwniOA7wMJtH7zN1dq
 iYz15Iv4tT0WmW+SoEaj7OvVax1ZNoxkhs6r
X-Google-Smtp-Source: AK7set8ZzvM1oxwciMrSCJi/O5P01GnKohqIBPNIvwAPR01kZOMh6P906R3XRXtDd0KaUdw8Vn/xUQ==
X-Received: by 2002:a05:600c:a293:b0:3eb:3e24:59e2 with SMTP id
 hu19-20020a05600ca29300b003eb3e2459e2mr8719217wmb.25.1677796921709; 
 Thu, 02 Mar 2023 14:42:01 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003dc49e0132asm4955231wmo.1.2023.03.02.14.41.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:42:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Subject: [PATCH v3 08/18] hw/ide: Introduce generic ide_init_ioport()
Date: Thu,  2 Mar 2023 23:40:48 +0100
Message-Id: <20230302224058.43315-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add ide_init_ioport() which is not restricted to the ISA bus.
(Next commit will use it for a PCI device).

Inspired-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ioport.c           | 12 ++++++++++--
 include/hw/ide/internal.h |  2 ++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index d869f8018a..ed7957dbae 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -46,8 +46,6 @@ int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *dev,
 {
     int ret;
 
-    /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
-       bridge has been setup properly to always register with ISA.  */
     ret = isa_register_portio_list(dev, &bus->portio_list,
                                    iobase, ide_portio_list, bus, "ide");
 
@@ -58,3 +56,13 @@ int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *dev,
 
     return ret;
 }
+
+void ide_bus_init_ioport(IDEBus *bus, Object *owner, MemoryRegion *io,
+                         int iobase, int iobase2)
+{
+    portio_list_init(&bus->portio_list, owner, ide_portio_list, bus, "ide");
+    portio_list_add(&bus->portio_list, io, iobase);
+
+    portio_list_init(&bus->portio2_list, owner, ide_portio2_list, bus, "ide");
+    portio_list_add(&bus->portio_list, io, iobase2);
+}
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index d3b7fdc504..6967ca13e0 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -617,6 +617,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    uint32_t cylinders, uint32_t heads, uint32_t secs,
                    int chs_trans, Error **errp);
 void ide_exit(IDEState *s);
+void ide_bus_init_ioport(IDEBus *bus, Object *owner, MemoryRegion *io,
+                         int iobase, int iobase2);
 void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out);
 void ide_bus_set_irq(IDEBus *bus);
 void ide_bus_register_restart_cb(IDEBus *bus);
-- 
2.38.1


