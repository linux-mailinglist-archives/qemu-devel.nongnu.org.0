Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0DA5A9D92
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:55:31 +0200 (CEST)
Received: from localhost ([::1]:44788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnTW-0001YT-ND
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2N-0002K0-Ry
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:28 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2C-0001X5-Rn
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:25 -0400
Received: by mail-ej1-x62a.google.com with SMTP id gb36so14948887ejc.10
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=flJhmj1mVtPxCWsWTmyIV/EcY9Xpv178z4KV987U64Y=;
 b=LYVMxoj6SR9vuPB8lJ0EvwiXFL9k/knXZOvGXAaxYyF/E8rxBfb2bc4uu4cPrmvyLz
 7Rps1y8BAjuWdHaGE/AWugLzxjdJyaGkJJtpj2Tjz6h92EW/sht41kAhN43VKUGcJ2zi
 NYK72eN+eecxbXh3VARd+RCtMoEUKRkAQtpj+U/pkfFZLYZ8IG3k8YDOdR57+YIA8Hod
 HPFS66EZ3nrL+IYaRd+S8Y/4UdBOlsqIjOwkoLm9aOGj+NLh4+CeVQLADdLsNS9w2lHu
 L0qYO3Wndg0jDyuIIl6NB4gShu9uMS+tU2oJUxJFkf/VGPmd1MLARAJMF5QVLg70CAIr
 HNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=flJhmj1mVtPxCWsWTmyIV/EcY9Xpv178z4KV987U64Y=;
 b=UiP+IuMFZN+4HZrZeVG+gGd3vVQcnD7D902w8biqnm1hKPoMCt9dV1CiPFoW/g7owa
 zEjfwmrPSp8+V5J1gq2TdToq2TE0pnNsbsi7bBYZGXs2r37wJxzjdjFAUQ3vi5kM5VAY
 Ti4eqa6Vqc+YpbR98QL5wBtrlumVZ0dViAPtKQEXI19mw7DFU0gkDQipbyMRg+ixq8wh
 uq95/7N3VnGYrS5gz0mUeFp5ajO2zGdF3TCH1TKANCMaZLnIIiF18tKI0WmBkfhD19WH
 gpkoqrNkTM7HBbmJTozrGDH+jCN3z7YCYcjXFwxRyFsLrQKn77MsTchkrETa1z/TYSpR
 QM1g==
X-Gm-Message-State: ACgBeo3BiLaj6VvXlE2/Iz5iLQdtdvGfqjVLO4tQYoqSGwVdH5WmfWQs
 vm3WLmWIUepVWlH7sT8auupOkOdPqaA=
X-Google-Smtp-Source: AA6agR4JtQpp6/PDeCFcv9d9kValFMQiQ/IPtM1gzHth7JhsrS3yBNopcWSIqCmUiHq9GWIp6kHYuQ==
X-Received: by 2002:a17:907:1c1e:b0:741:8abe:320e with SMTP id
 nc30-20020a1709071c1e00b007418abe320emr14518374ejc.123.1662049634309; 
 Thu, 01 Sep 2022 09:27:14 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:14 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 28/42] hw/isa/piix4: Remove unused code
Date: Thu,  1 Sep 2022 18:25:59 +0200
Message-Id: <20220901162613.6939-29-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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

The Malta board, which is the only user of PIIX4, doesn't connect to the
exported interrupt lines.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 763c98b565..3e9a84de8b 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -181,12 +181,6 @@ static void piix4_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
-static void piix4_set_i8259_irq(void *opaque, int irq, int level)
-{
-    PIIX4State *s = opaque;
-    qemu_set_irq(s->isa[irq], level);
-}
-
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
@@ -230,8 +224,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    qdev_init_gpio_in_named(DEVICE(dev), piix4_set_i8259_irq,
-                            "isa", ISA_NUM_IRQS);
     qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
                              "intr", 1);
 
-- 
2.37.3


