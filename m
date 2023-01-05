Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3625465EECC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:33:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJF-0002pE-NA; Thu, 05 Jan 2023 09:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRIu-0002ju-UX; Thu, 05 Jan 2023 09:33:26 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRIs-0006tD-Aq; Thu, 05 Jan 2023 09:33:12 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d17so16572247wrs.2;
 Thu, 05 Jan 2023 06:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Gf+reKwkE6jXOJI2HiIZEfL9A4187k5o28S5UxntFc=;
 b=TACBP5NFIjvm4NsaDt/AoSEf3vxiZn/GT/4SV7bN27CGzRNFw08ZZFE2xpUkFYR/Wy
 MDr/V9hkMcBmnMNogURcTbSxq8I5nJkDJLyWVHdCT4trB1Y8Ehz9l1R2f2NUioYxFEr4
 28Z0ix5zVX27u0gASD5967MAmDTKRRxs6YWmvI9kp1Dl58iwG8ksDrT2wuBMyStgLf88
 X+fyGWKIuJEPDhnd/jWc7fpyl4xqi0vO0y+LNwPGjpExY+SkIhtj2Ies6cUtsAnriZ4w
 MqXyhVHfYcFWFFMVrf7f+wn+nZO68B4EEIgtc+GSimx1FRVFQLvxYpvXmeODG6CzOl44
 33oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Gf+reKwkE6jXOJI2HiIZEfL9A4187k5o28S5UxntFc=;
 b=AArqKvoo13iz8JH6fhkPK+cgG9n8sRL5qpH7yRE2BqJFo+zuGJz3gXxIfFeM+NJSOs
 gLuk9+lc5Habdx3Sf6MrtNcnvYVOsC43MuSicJT7suo8H74ivWkVQFvQNNuewvKchG60
 jiTPhzS/tgWxFGNt+JtiN7quXj3SgfDcbrWIP1ROx48FNTsvAy6wqhhPlfPE2HGQ0po4
 jwdXLkoIg5cLBpoiFdyQvFJ7MItw6z+uqy2mQAxgI3BfZL7PiUXZDSFki/twimSNpmYr
 0/STOqbEenzcOez9IMnHxbHEIPyZLOoqUZ79YNIzrgqroIwr1aqBlLgeHCRy1TdlPLW3
 kQxQ==
X-Gm-Message-State: AFqh2krYzQI3XsKEFexZjtRzWnKV6JZgbgFmaeWuL/2OZuvQ+WkQUGzs
 hO/Dyo801gAZwDKIhAsNGhpXTcZp0YzjUQ==
X-Google-Smtp-Source: AMrXdXuyQ/35JXNZssv9zv4i+SMKchRZrPwePjlyl0QW6D1uk3faxhzcffDYlJfBja4+in2V+6RDXw==
X-Received: by 2002:a5d:408c:0:b0:298:5b78:9e0a with SMTP id
 o12-20020a5d408c000000b002985b789e0amr8879136wrp.34.1672929187424; 
 Thu, 05 Jan 2023 06:33:07 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:07 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 01/31] hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
Date: Thu,  5 Jan 2023 15:31:58 +0100
Message-Id: <20230105143228.244965-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42d.google.com
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

The PIIX4 PCI-ISA bridge function is always located at 10:0.
Since we want to re-use its address, add the PIIX4_PCI_DEVFN
definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221027204720.33611-2-philmd@linaro.org>
---
 hw/mips/malta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index e435f80973..2e175741ff 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -72,6 +72,8 @@
 
 #define FLASH_SIZE          0x400000
 
+#define PIIX4_PCI_DEVFN     PCI_DEVFN(10, 0)
+
 typedef struct {
     MemoryRegion iomem;
     MemoryRegion iomem_lo; /* 0 - 0x900 */
@@ -1427,7 +1429,7 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
+    piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
                                             TYPE_PIIX4_PCI_DEVICE);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
 
-- 
2.39.0


