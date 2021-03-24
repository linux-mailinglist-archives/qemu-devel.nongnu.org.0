Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881B347FE6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 18:58:31 +0100 (CET)
Received: from localhost ([::1]:38638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP7m2-0006Cp-Ik
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 13:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7iT-00047g-Ko; Wed, 24 Mar 2021 13:54:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7iS-0008LH-3P; Wed, 24 Mar 2021 13:54:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id x7so2888708wrw.10;
 Wed, 24 Mar 2021 10:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3a+HGyI7KD3Ew+RNtm2N2A+m/+QQ+Xa+aHzvmMpU2j8=;
 b=obyFyfCniTy7/pBwfH+dNXQAw05JjDA3hKtuF5UyCcMbjT33y9TOZBtbOEDTNIIaTW
 JJFdOFqMwiqEBnwpquqsIZWBLE0fzY5rh/zZjY9i0xS9tXBeW9fArB63jbf81elX3R6o
 Jnn3TUGqT9DrVZV8PjmP9MZqlcyNAdV8R+NETmpEIM6eDFLZw1g4omVV+zY9W7P2iM45
 LppeKaup9aah7OgYpQhQH/3caqPZ4QO0WqaLJja1gFy0Exs96ZSrLLLKX0jZF+dbpPFY
 ihe6KbsxkAmyd5Pwm6uiQW6fWYCZY40R2vyQDj1YQ8RIiTumOnMXlmRTNtyQL9x4US3O
 WByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3a+HGyI7KD3Ew+RNtm2N2A+m/+QQ+Xa+aHzvmMpU2j8=;
 b=buP1CH914KVc5qyqBUmHJ7MlmTNWIqil66W+MNGLr0UMXFT8m4zo2KjZ4rU4HEnw04
 +0o7lUSLmyyku/IjhgguP9d1GCPt5F+MDvPa0d7f/WdSadbhRUVpBWee/YXuwMMGKMoE
 59sPmAKxgqSGW/0h/B7ALTUEa5ARHu+U9/T8+7tNOztgA6T4xY7RP1ElY3MLwBF9XeE2
 scpTojyn5U+AvjNGRJeibYGrDBjRxZs5dqVgMRG13qbA+nhZUudXT7e6nnquEz2H0MQj
 hBjiJVAvDLPvAR17FmOtD9UGhZWT0pzHQvqT1hmjX2PcGFKHH8RF9eOrUy398CwRn0PZ
 DcJg==
X-Gm-Message-State: AOAM5307AVV5GmTgo6jvThOvFauF1/FKMDjtIzvQRVCjhO18h1HnGqwq
 U9BmYOkDVV2+sg1zPWeozlEn0ZOkFKRc1Q==
X-Google-Smtp-Source: ABdhPJyzXHJn4Sc24DbLGNsacLXRDQAAXGfl1mC+1wWqnJlJlDa1YC9puiq3tjO3aqZ8xn9w1J5sSQ==
X-Received: by 2002:adf:f3cf:: with SMTP id g15mr4783944wrp.57.1616608486142; 
 Wed, 24 Mar 2021 10:54:46 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x23sm3201661wmi.33.2021.03.24.10.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:54:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] hw/isa/vt82c686: Name output IRQ as 'intr'
Date: Wed, 24 Mar 2021 18:54:33 +0100
Message-Id: <20210324175438.680310-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210324175438.680310-1-f4bug@amsat.org>
References: <20210324175438.680310-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Named IRQs are easier to understand in the monitor.
Name the single output interrupt as 'intr'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c   | 2 +-
 hw/mips/fuloong2e.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 05d084f6982..87473ec121f 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -387,7 +387,7 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
     qemu_irq *isa_irq;
     int i;
 
-    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    qdev_init_gpio_out_named(dev, &s->cpu_intr, "intr", 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
                           &error_fatal);
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 4f61f2c873b..931385c760f 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -206,7 +206,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
 
     dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
                                           TYPE_VT82C686B_ISA);
-    qdev_connect_gpio_out(DEVICE(dev), 0, intc);
+    qdev_connect_gpio_out_named(DEVICE(dev), "intr", 0, intc);
 
     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
     pci_ide_create_devs(dev);
-- 
2.26.2


