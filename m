Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F0346DCF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:18:45 +0100 (CET)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqIO-0005bo-Hk
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqE2-0007w3-KQ; Tue, 23 Mar 2021 19:14:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqE1-0004qj-3C; Tue, 23 Mar 2021 19:14:14 -0400
Received: by mail-wr1-x431.google.com with SMTP id k8so22522989wrc.3;
 Tue, 23 Mar 2021 16:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aApVmQ+rRe6KJFTwqONCwpRpXk9mf0Cx9NTVPhXwmZQ=;
 b=FAOWK156c8X6bAYCfmLOj9zb/yhj9/dNGzugnEzS9aSURMiB65gfvAJt8feRglTehQ
 40YLp8cxknnsw+lR3EN5KmJ2KCGjkEr7hifPMKE3ehcYeUdqxeiSX7KblEYCO3vhrUCJ
 ayEfyR9+wOZT4d02dT66j1bnZ9hnFT0CBtbBt3ROKq2y+Y7UDVG9E93bDGX2up7mW7Qm
 a5FAb/aaTqQ7AMzZ350Qpw6G4VJua9k+WUiqk19HQyHcLcVJDziu2NgqJXmEBTD3JVog
 bUW2sn0BSqsPtmRtdrDHVfbS1cLC90f6BD11vNPcvm9cm4Crh5ScqMG+V17DpybuuGx2
 WPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aApVmQ+rRe6KJFTwqONCwpRpXk9mf0Cx9NTVPhXwmZQ=;
 b=deGx5RmXWMi9v6mQwMHVjKpMUAEPz+T2IJT039XAB8pIiBz+K2lYsDoKhYewWVY5yP
 095rmmlqj8Nea7d3bLNHH2COv96pviaIpw1teqtBhsNOCZz9CWf8WBei0MAommJlV//a
 hp3wzO2f6uqWDJzB3Ea6fBjTn50YSsnWwJ0kRVO3ABErCY4/prCV/iHqi0n+ocJUgt9f
 L779Nxh4LP2r1My3x4CIQjLCVM0ap3MfD6UlMBiSTpBirc4bEpeHwOQmylGLolSk5t9Y
 QaUWFgTSOHvb54btqoTEeptrQ2XbOIog3+EHvyakDZDPI6VqwqHr4ExJC8aN13DzTWK0
 M74g==
X-Gm-Message-State: AOAM530UBZAy08PtstezHXZVXKNrvPfAgj16KGnEpXU7NcgDBl6eC608
 7eP+PjRQQJiR5GQAWzgLlhDUZ+/fO4yG/g==
X-Google-Smtp-Source: ABdhPJyJiWAMOdRW2Y5ORF4pp/hKImvbpD2a4wP/acuHpPB+HlyQLtJFfAOrrouW+n4l2io1+j6rIQ==
X-Received: by 2002:a5d:518c:: with SMTP id k12mr296965wrv.15.1616541251196;
 Tue, 23 Mar 2021 16:14:11 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p16sm552213wrt.54.2021.03.23.16.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 16:14:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] hw/isa/i82378: Simplify removing unuseful
 qemu_allocate_irqs() call
Date: Wed, 24 Mar 2021 00:13:54 +0100
Message-Id: <20210323231358.396520-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323231358.396520-1-f4bug@amsat.org>
References: <20210323231358.396520-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the i82378 model was added in commit a04ff940974 ("prep:
Add i82378 PCI-to-ISA bridge emulation") the i8259 model was
not yet QOM'ified. This happened later in commit 747c70af78f
("i8259: Convert to qdev").

Instead of creating an input IRQ with qemu_allocate_irqs()
to pass it as output IRQ of the PIC, with its handler simply
dispatching into the "intr" output IRQ, we can now simplify
and directly connect the PIC to the "intr" named output.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/i82378.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index fd296c8ed7a..817eca47053 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -47,12 +47,6 @@ static const VMStateDescription vmstate_i82378 = {
     },
 };
 
-static void i82378_request_out0_irq(void *opaque, int irq, int level)
-{
-    I82378State *s = opaque;
-    qemu_set_irq(s->out[0], level);
-}
-
 static void i82378_request_pic_irq(void *opaque, int irq, int level)
 {
     DeviceState *dev = opaque;
@@ -94,8 +88,7 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
      */
 
     /* 2 82C59 (irq) */
-    s->i8259 = i8259_init(isabus,
-                          qemu_allocate_irq(i82378_request_out0_irq, s, 0));
+    s->i8259 = i8259_init(isabus, s->out[0]);
     isa_bus_irqs(isabus, s->i8259);
 
     /* 1 82C54 (pit) */
-- 
2.26.2


