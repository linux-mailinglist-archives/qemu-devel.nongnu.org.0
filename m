Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 048426A8C1C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:44:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXreI-0002vr-Kg; Thu, 02 Mar 2023 17:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrdw-0002kR-VR
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:43:21 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrdt-0000Mb-OQ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:43:20 -0500
Received: by mail-wr1-x430.google.com with SMTP id l25so618876wrb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76WGhaMeuPYXbX/pWJbcrHLrwrtrG1g1D4hmZur00GA=;
 b=iZ+l7xfL/1aNIR07/GVT61XLdWOjC9vj9inShnVEGcn2SL8TMzabaUo+q9kls+6Yor
 upoRAiiycnbd+h8MZJQQAR9Pu0iTaEccnMBa3T4BFoenT+FB7tYJr7Pa86EPOYhs/gh0
 TZTsoFy6IYnJC0352DUKIVKExKJijx4G231iO87Ik+yqxrF18FZeFXoMiyWKo0v3q1nf
 6P8uLflQcn2DqZRh47b5iE+Nawc5bjSX6One1SHOAE/FDtDQGDSC+3XRSYC8LrdPbSIN
 aubb0gL2IHevP8Mml1072IZAgnBK/L7zDERaAMkiI+h/BY+knaFBPUDhYGlWC+0esbpH
 G1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=76WGhaMeuPYXbX/pWJbcrHLrwrtrG1g1D4hmZur00GA=;
 b=MOgC3xKq5rZprR6IK1g36e7553diQ6C6WxbbYqTMX4KbFi4T/RCQkGoj2Z9+oS5YYz
 S3ydfqvh0bJFzIoQyr5yMCGnZGGd5AwAkN8Qgq79fzxHRsHnj8AzDPYt5dNZDbtJqYBx
 VnT+4PsRo3nd49PTmwQkT97xO9xC0WRHj7gBeVEQhl4MWNmoPO3YXn6AKLmTH9zcAp5/
 VA8fGAweB2P6yTzHxhemvArX2c8j0FIYXLyfo2eEfeG41Xo5ERwRrGlmrMRZqS9odOiz
 OeLrTgRH8T2YqcYmJcic4fOGqRN/Xe2ataXi59BFYi5V7kEcM48HBfaPIoQqR87uNj/n
 ajxQ==
X-Gm-Message-State: AO0yUKU1r8G+ODG649qOoXO4zgwbitj8FOI+TesB9OdFkWqARS9uHdqG
 qai/QV5As+Yp4HoX69onxnAJE4uTPz9PzIdQ
X-Google-Smtp-Source: AK7set/IJYEjq/epgGkE/m9+5/R30RsFhzIsMKPihePS9U+Gd/Zr1KhBpK7/C9/vZr3J5ViJs4g0ng==
X-Received: by 2002:adf:f604:0:b0:2cd:8237:345b with SMTP id
 t4-20020adff604000000b002cd8237345bmr2131316wrp.9.1677796996311; 
 Thu, 02 Mar 2023 14:43:16 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 e15-20020a5d594f000000b002c56046a3b5sm481652wri.53.2023.03.02.14.43.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:43:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 18/18] hw/isa/piix: Unify PIIX-ISA QOM type names using
 qdev aliases
Date: Thu,  2 Mar 2023 23:40:58 +0100
Message-Id: <20230302224058.43315-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Unify PIIX ISA (PCI function #0) as:

 pci-piix3 -> piix-isa       (abstract base class)
 PIIX3     -> piix3-isa      (PIIX3 implementation)
 PIIX3-xen -> piix3-isa-xen  (PIIX3 implementation with Xen extensions)
 piix4-isa -> piix4-isa      (PIIX4 implementation)

Alias previous names in the QDevAlias table.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/southbridge/piix.h | 6 +++---
 softmmu/qdev-monitor.c        | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 71a82ef266..cce65e8f44 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -58,9 +58,9 @@ struct PIIX3State {
     MemoryRegion rcr_mem;
 };
 
-#define TYPE_PIIX_ISA       "pci-piix3"
-#define TYPE_PIIX3_ISA      "PIIX3"
-#define TYPE_PIIX3_ISA_XEN  "PIIX3-xen"
+#define TYPE_PIIX_ISA       "piix-isa"
+#define TYPE_PIIX3_ISA      "piix3-isa"
+#define TYPE_PIIX3_ISA_XEN  "piix3-isa-xen"
 #define TYPE_PIIX4_ISA      "piix4-isa"
 
 OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_ISA)
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index b8d2c4dadd..820e7f52ad 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -72,6 +72,9 @@ static const QDevAlias qdev_alias_table[] = {
     { "ES1370", "es1370" }, /* -soundhw name */
     { "ich9-ahci", "ahci" },
     { "lsi53c895a", "lsi" },
+    { "piix-isa", "pci-piix3" },
+    { "piix3-isa", "PIIX3" },
+    { "piix3-isa-xen", "PIIX3-xen" },
     { "virtio-9p-device", "virtio-9p", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_VIRTIO_PCI },
-- 
2.38.1


