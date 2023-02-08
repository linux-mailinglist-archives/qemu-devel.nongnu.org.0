Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A0468E4C2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 01:09:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPY0w-0005mH-W4; Tue, 07 Feb 2023 19:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0u-0005kM-H3
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:08:40 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0q-0008TU-B9
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:08:40 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a2so14914714wrd.6
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 16:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=diC00nVev9fo2jzQ51pUVYSS0FWICYuGAlQ1rUUG02E=;
 b=Gi6ehZ2rFEWCzqXwYxBtZp0erXbt0/0kb/eBPAcrI/gBXJbqkoVAsXPeHSYQ9j/LPx
 4LZyVxREXx+xeTSPFr8bgjGdDYPAhWsqoE2xVof+UMJYFDIFX5NxjwWiqMaMh24hWlme
 LuiXJsi6jki4z4qMBScOk30Hrpcz70xV/c+BS53p4rVkARU7AgmH9QZT3l8oKgekdO/p
 w0ePHbjyUSs+G1huhBNtW5/Xukjad5vOBgbfMzMyWg+Uo+9yQ2cGVQ1uMkRHY1yXVb1a
 2qcIezxOKWwKYIsCY+R+PBqMREw5A+EExoHxZs2zTsUsLrH7xIIbmvBdNuqX3KzZYdS+
 l23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=diC00nVev9fo2jzQ51pUVYSS0FWICYuGAlQ1rUUG02E=;
 b=k9uvBhgI0uAvFDlXtw7rK1McHho/v54Gewr0C7/SNBxWIrXmbAdNHYucah10pHz1XQ
 kei0T2+HWP/ZCb93zsbotkVM3U2h6OOo8Hn/eImfJRC/ZMLA+VUxezDo5AHUiPdd3BZe
 1S2CjHXk4zPr4MpBg9uv66HM73VHD3wCWufkY/Tp50DdiALlu2zeAE/naBkKz/P8qdwo
 jmKyZSQoS8ORDHm7rmW8jraQwbBQegQpree5RyKJZjLGtAsPoYXQAAVpIKjlih6TkXP/
 fiqm3Lqb05Y5KR+xaC7IxqEN7XOuoXtaTgVdpdE9J5xnB1MgxHzGxewxMV902+QqeQkK
 6//Q==
X-Gm-Message-State: AO0yUKXxZ2/LkQpHvDyxpMT+LZzKMPKPkuOeJYv+v7c3Q1y8Q18Z0M4k
 8h9mnXR9v11qM0CMf25WqS8U5Wb7PTnJ9a2X
X-Google-Smtp-Source: AK7set/lKornttIik2H3Lgl3uHSa7F5rir9xEG+2MjXGpS9YaQAl+wJ1d1iPl/j3hkSpK2/2QKIduQ==
X-Received: by 2002:a5d:60cb:0:b0:2c3:d65e:d131 with SMTP id
 x11-20020a5d60cb000000b002c3d65ed131mr4163809wrt.63.1675814887832; 
 Tue, 07 Feb 2023 16:08:07 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a5d5002000000b002c3be6ae0b1sm12252120wrt.65.2023.02.07.16.08.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Feb 2023 16:08:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/7] hw/ide: Introduce generic ide_init_ioport()
Date: Wed,  8 Feb 2023 01:07:40 +0100
Message-Id: <20230208000743.79415-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230208000743.79415-1-philmd@linaro.org>
References: <20230208000743.79415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ioport.c           | 11 +++++++++--
 include/hw/ide/internal.h |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index ac804a89e8..494fa88368 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -54,8 +54,6 @@ int ide_init_ioport_isa(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
 {
     int ret;
 
-    /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
-       bridge has been setup properly to always register with ISA.  */
     ret = isa_register_portio_list(dev, &bus->portio_list,
                                    iobase, ide_portio_list, bus, "ide");
 
@@ -66,3 +64,12 @@ int ide_init_ioport_isa(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
 
     return ret;
 }
+
+void ide_init_ioport(IDEBus *bus, Object *owner, MemoryRegion *io,
+                     int iobase, int iobase2)
+{
+    portio_list_register(&bus->portio_list, owner, ide_portio_list,
+                         bus, "ide", io, iobase);
+    portio_list_register(&bus->portio2_list, owner, ide_portio2_list,
+                         bus, "ide", io, iobase2);
+}
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 88a096f9df..79db902505 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -629,6 +629,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
 void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
 int ide_init_ioport_isa(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
+void ide_init_ioport(IDEBus *bus, Object *owner, MemoryRegion *io,
+                     int iobase, int iobase2);
 void ide_register_restart_cb(IDEBus *bus);
 
 void ide_exec_cmd(IDEBus *bus, uint32_t val);
-- 
2.38.1


