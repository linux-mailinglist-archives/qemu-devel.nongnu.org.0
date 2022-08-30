Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE95A6D83
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:41:22 +0200 (CEST)
Received: from localhost ([::1]:58216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT76v-00076o-2B
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6U7-0002z7-Pc; Tue, 30 Aug 2022 15:01:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6U6-0008QL-3o; Tue, 30 Aug 2022 15:01:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b5so15438653wrr.5;
 Tue, 30 Aug 2022 12:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Fx1C6ZMee1HHX03173gg4I05UJSTEyK7YG48dW/CDUw=;
 b=WESj1nLkPiMUH8auqlrS4Hpd6POEmL6gR6Y+HZXeMQnH+4InIu3pmGbAKCMTOohnED
 jrny6Kiv81VkeqwwAZSmM+TE3W5E/r62nuxRdtdUeGYdpI3I3PTUUcpJky7qu/We7DNR
 TvI0ee9IxXBSk7JYLO0EJ72He0blr1ggPgJ92Me52d3CSwMwPTZ+TIV63I0Pn4OHK6Zo
 9cHplrFiulIGyOJVv8P7+YBm9IrmJpLfv4382RxD0IoGQ6Ri0/wOelo+FaOLcndqb03O
 Gg4aOC4Vhn/CAktD1DsNvXLNGgextZz2T9ItaGHNj5XLgJI2xPjDuf6r88WSDY4EeqWZ
 Iwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Fx1C6ZMee1HHX03173gg4I05UJSTEyK7YG48dW/CDUw=;
 b=gqe1aKUZJBMGhMr7YoLFyj8LeRQZwipfCr4/T9P1HSe+i3nAmqHRpoxxe+iK0Emqd8
 XZnzdJnC7LX/H7KCthDNiqxdtpQ2n5EjzK2jHImrOFH8kgs+AvfbWtwH657TPF+za/Su
 5CUFlm5vOQ8ssZf4EEm1i4n8b5CWUmd/topRs/SBqOLH7jwXwGGL0s1foDkdxCA53VGD
 uxqkXgdsPyTZx+vbQ/1oIdSNItqTfG15X/nnZcu7eXWhMYE8UkP3UPsFCJn5zUFoP1Ax
 yZIqWc9lzAm8zDBs2hYbBG+GcQPUnnqFcG3WkCdRbCfMIwRIkZNKwnMwI2oMhXnALfBd
 EMzw==
X-Gm-Message-State: ACgBeo3iZPff8VCo+bDYzZkhX7h2pYf5ShpqygEZNhZpxeVSlPe4naoi
 /FZmaICQuWVAfcc/64qe6rVzdtg1gz8=
X-Google-Smtp-Source: AA6agR6GcNPkls9iXaEoi7KaSCPTQCzh22hswsGKfU7udt2Xgd+IMm45gLGRHHx27FryO8ywxt5Fxg==
X-Received: by 2002:a05:6000:2a4:b0:226:da29:2afb with SMTP id
 l4-20020a05600002a400b00226da292afbmr6519637wry.206.1661886072105; 
 Tue, 30 Aug 2022 12:01:12 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm9821285wrn.29.2022.08.30.12.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 12:01:11 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 04/10] hw/isa/vt82c686: Reuse errp
Date: Tue, 30 Aug 2022 21:00:42 +0200
Message-Id: <20220830190048.67448-5-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830190048.67448-1-shentey@gmail.com>
References: <20220830190048.67448-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than terminating abruptly, make use of the already present errp and
propagate the error to the caller.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 5582c0b179..37e37b3855 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -590,7 +590,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
-                          &error_fatal);
+                          errp);
+
+    if (!isa_bus) {
+        return;
+    }
+
     s->isa_irqs = i8259_init(isa_bus, *isa_irq);
     isa_bus_irqs(isa_bus, s->isa_irqs);
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
-- 
2.37.2


