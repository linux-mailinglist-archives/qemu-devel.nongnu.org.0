Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF2C662CE9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:36:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtN-0002RW-Uh; Mon, 09 Jan 2023 12:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtL-0002QB-IM; Mon, 09 Jan 2023 12:24:59 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtJ-0000zU-Qg; Mon, 09 Jan 2023 12:24:59 -0500
Received: by mail-ej1-x62e.google.com with SMTP id vm8so21929901ejc.2;
 Mon, 09 Jan 2023 09:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0zxx8tPOrJ/ctNq1xpYzBZctNT1tt/hlM+VII09Kv0=;
 b=kkzw6B3nRxuYOqc/yTzkpiBdmJyV10/4N+ZerMGcBuZRyRqPPktKdeLn7ZCZVdcWPj
 RiUnKOyil+l01ReNuYR65u2m3J+xEOOkEhgYSTDXa57ADHYo81n/qu7xZyJy706vtYYo
 vlXhYFERbrztGYUSjjKxphwfXfGMhT5eNFqfMe9FffBUBdSGyck+n6vBtKA/x/2l+LE0
 zzKA3zhvWkWS2BCjLUc+6FYIB/fy/d/er4tFWconfMz5ThUCNU0IQiYCwVxrYvEfcT+n
 cXRG2qPjcqCJkihYVnhpf8dIwvseytFMUvAIESBcixb/BennOwigiovyFN6obU9WmU8R
 N6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b0zxx8tPOrJ/ctNq1xpYzBZctNT1tt/hlM+VII09Kv0=;
 b=QJcvCk97QZheRCjeEU4+hHO9GSJQdxjVCbEASaRuwqwahD7aJeyLTrH8wKaq91HkWk
 om4gZfbFcIWCb3OuR86ntWpKqfwv0ZgmEnGArqZX0Nz+iyrDJSbu/fpDU4FTEb8a6lvl
 9LwsUzNFIMFbTq7A3mph54jlFvTcMQHB0ivRNONt1W2zr8iOtJZ+fZdV6zEWHrm3N5rW
 pG8E3zJ8sMkYsqbwmJodPFQq+KRjWQvBRjl9hBvu+/tpXE1h62LzJBUvhGLN480DtErl
 5ePzfkEPNLk05YnZmlZLCi5cLmAX8VoEavHcj3J68TvpFenUQLKbTFHN1ksi69F2JvA5
 BXqA==
X-Gm-Message-State: AFqh2ko72ztoluiu3bHy2MZ33/RX2+TXlaveVI3cP0UHfuCxQze7omwM
 naapKCuwja8fJo0AViqBOjT2F+Wk36kRIQ==
X-Google-Smtp-Source: AMrXdXsto3AR/MQrel/7a+WN88ezHA68mlWDh/5bPgLhFIPZQiuKwT4CShUjKknQYEbqsdEC4ddawA==
X-Received: by 2002:a17:906:3c0d:b0:84d:34f0:f766 with SMTP id
 h13-20020a1709063c0d00b0084d34f0f766mr9004178ejg.75.1673285095184; 
 Mon, 09 Jan 2023 09:24:55 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:24:54 -0800 (PST)
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
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v6 03/33] hw/isa/piix4: Correct IRQRC[A:D] reset values
Date: Mon,  9 Jan 2023 18:23:16 +0100
Message-Id: <20230109172347.1830-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

IRQRC[A:D] registers reset value is 0x80. We were forcing
the MIPS Malta machine routing to be able to boot a Linux
kernel without any bootloader.
We now have these registers initialized in the Malta machine
write_bootloader(), so we can use the correct reset values.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221027204720.33611-4-philmd@linaro.org>
---
 hw/isa/piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 8fc1db6dc9..0d23e11a39 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -116,10 +116,10 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0x4c] = 0x4d;
     pci_conf[0x4e] = 0x03;
     pci_conf[0x4f] = 0x00;
-    pci_conf[0x60] = 0x0a; // PCI A -> IRQ 10
-    pci_conf[0x61] = 0x0a; // PCI B -> IRQ 10
-    pci_conf[0x62] = 0x0b; // PCI C -> IRQ 11
-    pci_conf[0x63] = 0x0b; // PCI D -> IRQ 11
+    pci_conf[0x60] = 0x80;
+    pci_conf[0x61] = 0x80;
+    pci_conf[0x62] = 0x80;
+    pci_conf[0x63] = 0x80;
     pci_conf[0x69] = 0x02;
     pci_conf[0x70] = 0x80;
     pci_conf[0x76] = 0x0c;
-- 
2.39.0


