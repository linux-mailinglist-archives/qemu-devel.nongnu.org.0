Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800BB662CC0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:31:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtY-0002en-3H; Mon, 09 Jan 2023 12:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtT-0002YZ-9u; Mon, 09 Jan 2023 12:25:07 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtR-000131-EN; Mon, 09 Jan 2023 12:25:06 -0500
Received: by mail-ej1-x635.google.com with SMTP id u19so21850666ejm.8;
 Mon, 09 Jan 2023 09:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3VPNcWT0IkTBlW+dRFbpN8NmE5WBffC1A4qiIMiSXg=;
 b=Qnz1Hf2lM7TonokV8eyMb9YtNvEozK1vHItNnPm5u7tIUA2IGAlC7rCNZ4kKqcMrgM
 7ddjkghgaWnwz5uFzEk7tyl3JKmFcf2NPCIV82Fz2fXa1nB1aoiex0Z4r3g9OPfYVo3f
 Q2RvNitQ5iFDtQ5pcILObsD5yqJ84Lu+mrXTwVCOdfDhup4k//whGVIlDPdiAGmUC0n5
 YZHdD42/5bdzzogOd8bgRQb9aAQ1yVPcVqTHHV4un82sXnS0BfedYkH+JSvW890lW8le
 fQ35YnKayn0NNwpXMCTUxP6+BjQSWwUBZIK3Y3i/JrlaBTmbuIGT0Qc8Hr7la3pZOHFo
 H/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I3VPNcWT0IkTBlW+dRFbpN8NmE5WBffC1A4qiIMiSXg=;
 b=LoK2eLJfz8nMNE/X9Wt4DpW1MU1cZGAjfXjZfYmof9HQI92qI2PE05ZA9XeKnT1OXH
 TrGERoJUzWtDTr5j/oCO6hkLbKYmNTNAAn4nMEqz0/m+MeBzn1gJFlTfulrZpwGaR6i+
 KAvipMVrxKXmi937WxtvM7PCsCkFPG+K0h0fSiiZxs3dDXHS+2l4Dhtt2s+MKJ9P2uxa
 KZor33jhO8QxzFPOQ5+y/wZ8f+rarP3tfBy9la5o5YmGRHj03J82OyYD80HASuB05LPb
 ezwEGeXUgQcAq1Vl87OkSZJ9kNVUkUTsgCAGNT3Q2XF/H8GaWa/XngMjuIkS6LEFKm28
 WLXg==
X-Gm-Message-State: AFqh2koYd8suWBIScRS/CawI0qEuuPwOg25ZmlmbrK+85SA+/ACDvDoi
 7s5KCEi+gJo0vqpr3wdepA/xy4Ai8VMdQA==
X-Google-Smtp-Source: AMrXdXurNRYhfEfDoQXKOzXWJSmjmmYw9iDxcjQWAHXdZ0ZgVg5humDwGfAILsO21uL76k9Wfy79uQ==
X-Received: by 2002:a17:907:8b90:b0:84d:207d:c00c with SMTP id
 tb16-20020a1709078b9000b0084d207dc00cmr11800179ejc.25.1673285102212; 
 Mon, 09 Jan 2023 09:25:02 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:01 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v6 09/33] hw/intc/i8259: Make using the isa_pic singleton more
 type-safe
Date: Mon,  9 Jan 2023 18:23:22 +0100
Message-Id: <20230109172347.1830-10-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This even spares some casts in hot code paths along the way.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
Note: The next patch will introduce a class "isa-pic", which is
shall not be confused with the isa_pic singleton.
---
 include/hw/intc/i8259.h |  6 +++---
 include/qemu/typedefs.h |  1 +
 hw/intc/i8259.c         | 11 ++++-------
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/include/hw/intc/i8259.h b/include/hw/intc/i8259.h
index e2b1e8c59a..a0e34dd990 100644
--- a/include/hw/intc/i8259.h
+++ b/include/hw/intc/i8259.h
@@ -3,10 +3,10 @@
 
 /* i8259.c */
 
-extern DeviceState *isa_pic;
+extern PICCommonState *isa_pic;
 qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq);
 qemu_irq *kvm_i8259_init(ISABus *bus);
-int pic_get_output(DeviceState *d);
-int pic_read_irq(DeviceState *d);
+int pic_get_output(PICCommonState *s);
+int pic_read_irq(PICCommonState *s);
 
 #endif
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 073abab998..fba04875c2 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -99,6 +99,7 @@ typedef struct PCIExpressDevice PCIExpressDevice;
 typedef struct PCIExpressHost PCIExpressHost;
 typedef struct PCIHostDeviceAddress PCIHostDeviceAddress;
 typedef struct PCIHostState PCIHostState;
+typedef struct PICCommonState PICCommonState;
 typedef struct PostcopyDiscardState PostcopyDiscardState;
 typedef struct Property Property;
 typedef struct PropertyInfo PropertyInfo;
diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index cc4e21ffec..0261f087b2 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -55,7 +55,7 @@ struct PICClass {
 #ifdef DEBUG_IRQ_LATENCY
 static int64_t irq_time[16];
 #endif
-DeviceState *isa_pic;
+PICCommonState *isa_pic;
 static PICCommonState *slave_pic;
 
 /* return the highest priority found in mask (highest = smallest
@@ -173,9 +173,8 @@ static void pic_intack(PICCommonState *s, int irq)
     pic_update_irq(s);
 }
 
-int pic_read_irq(DeviceState *d)
+int pic_read_irq(PICCommonState *s)
 {
-    PICCommonState *s = PIC_COMMON(d);
     int irq, intno;
 
     irq = pic_get_irq(s);
@@ -354,10 +353,8 @@ static uint64_t pic_ioport_read(void *opaque, hwaddr addr,
     return ret;
 }
 
-int pic_get_output(DeviceState *d)
+int pic_get_output(PICCommonState *s)
 {
-    PICCommonState *s = PIC_COMMON(d);
-
     return (pic_get_irq(s) >= 0);
 }
 
@@ -426,7 +423,7 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
         irq_set[i] = qdev_get_gpio_in(dev, i);
     }
 
-    isa_pic = dev;
+    isa_pic = PIC_COMMON(dev);
 
     isadev = i8259_init_chip(TYPE_I8259, bus, false);
     dev = DEVICE(isadev);
-- 
2.39.0


