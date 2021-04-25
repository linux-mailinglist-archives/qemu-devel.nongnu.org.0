Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2672636A8CF
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 20:23:23 +0200 (CEST)
Received: from localhost ([::1]:39726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lajPe-0001cf-82
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 14:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lajNp-00015v-Um
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 14:21:29 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:56030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lajNo-0001yM-7W
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 14:21:29 -0400
Received: by mail-wm1-x335.google.com with SMTP id n127so16935157wmb.5
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 11:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+qXnCeZ8SXvCXhTdH8MnT6llOvMv70z+YtJ8m7AeDwQ=;
 b=Bl244YUIvOW91J2wpXygXvSlAx/s22x/LBkZjXkj33N7Jdh76pf8V2tzYAvs9Qpc6f
 wb0NcLTKcDaCbmpZZc5HedNIRQxaYKzq/7btCtBtlOnDnrMKCBLB44dVcAGbxNqUANzL
 yGbIB7AKL07F57f2jZaGSbiney+jqRxucm1IlPn/rfvzNT1w7rn1qGvuGJ4cgkqY0KId
 YVugytDpMTe7abQa+ck1wzuYltIKlg8VyPTV7fKgHX8HhPzURJaR9aYCYFKe7ruyfeHX
 k8z1zIUHQMcXwNgfmUNgEGS3nAz+lbHRCibKa8LIugIsjVt6dlJEF+xYl/baPSYfxZP5
 TqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+qXnCeZ8SXvCXhTdH8MnT6llOvMv70z+YtJ8m7AeDwQ=;
 b=nfXBa6jUpsVFT0tT3j/tdGtmiKfOrltibfIsNS/oiWSwd7JcqnptWNfcb+Lx8uy+d+
 CKPM6Lek+8z3AP39EKBK9/Tb/QC12whkKFV4mDTBhVq5x+Dt/vsJBt1Nluj+KKHYtX0N
 RopEwWSBOWLpoQFCImJei+OwiKEaMQqzOG55TZn9wBO1JgbcD9Fvtc7BXr+uS6MsnLqy
 X/DznNEmnBoQGTi/TmXqqLlRh3I6LHkYxG13zJTklYRGaOhahs1EAhrd+5SYtqFArRB0
 2Seyem4JEO2KdvVgfsVzqJkGye+Ul+2j8mNXIhXv1rxGC5cd8ZJQ0hSKcqxiO5gtwV6X
 l8uw==
X-Gm-Message-State: AOAM531Qysdi4PdCdQSdojGSZOHybgNfZ2Wcqqr42RnBjCzQ+2tjRV83
 J3VU66Lk8UBad3lbARB8TNFTFrWlzAzyeA==
X-Google-Smtp-Source: ABdhPJy3jKjtDXLVtsnyoKdd1qLjqsD8TKPN/w+iAc19/LFwE2HpnaU8H1sPVNFXbHAb7kwBo2Hmqw==
X-Received: by 2002:a7b:cd85:: with SMTP id y5mr16658325wmj.93.1619374886586; 
 Sun, 25 Apr 2021 11:21:26 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q128sm2336043wma.39.2021.04.25.11.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 11:21:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/pci-host: Do not build gpex-acpi.c if GPEX is not selected
Date: Sun, 25 Apr 2021 20:21:24 +0200
Message-Id: <20210425182124.3735214-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>, Xingang Wang <wangxingang5@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jiahui Cen <cenjiahui@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yubo Miao <miaoyubo@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since its introduction in commit 5b85eabe68f ("acpi: add
acpi_dsdt_add_gpex") we build gpex-acpi.c if ACPI is selected,
even if the GPEX_HOST device isn't build. Add the missing
Kconfig dependency.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
The gpex*.c files aren't covered by any MAINTAINERS section:

$ ./scripts/get_maintainer.pl -f hw/pci-host/gpex.c -f hw/pci-host/gpex-acpi.c
get_maintainer.pl: No maintainers found, printing recent contributors.
get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.

Markus Armbruster <armbru@redhat.com> (commit_signer:2/2=100%)
Paolo Bonzini <pbonzini@redhat.com> (commit_signer:2/2=100%)
Alistair Francis <alistair.francis@wdc.com> (commit_signer:1/2=50%)
"Philippe Mathieu-Daudé" <philmd@redhat.com> (commit_signer:1/2=50%)
"Michael S. Tsirkin" <mst@redhat.com> (commit_signer:14/8=100%)
Jiahui Cen <cenjiahui@huawei.com> (commit_signer:6/8=75%)
Igor Mammedov <imammedo@redhat.com> (commit_signer:4/8=50%)
Gerd Hoffmann <kraxel@redhat.com> (commit_signer:2/8=25%)
Yubo Miao <miaoyubo@huawei.com> (commit_signer:2/8=25%)
qemu-devel@nongnu.org (open list:All patches CC here)
---
 hw/pci-host/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index 87a896973e7..d52dce77cbd 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -3,7 +3,7 @@
 pci_ss.add(when: 'CONFIG_PCI_BONITO', if_true: files('bonito.c'))
 pci_ss.add(when: 'CONFIG_PCI_EXPRESS_DESIGNWARE', if_true: files('designware.c'))
 pci_ss.add(when: 'CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', if_true: files('gpex.c'))
-pci_ss.add(when: 'CONFIG_ACPI', if_true: files('gpex-acpi.c'))
+pci_ss.add(when: ['CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', 'CONFIG_ACPI'], if_true: files('gpex-acpi.c'))
 pci_ss.add(when: 'CONFIG_PCI_EXPRESS_Q35', if_true: files('q35.c'))
 pci_ss.add(when: 'CONFIG_PCI_EXPRESS_XILINX', if_true: files('xilinx-pcie.c'))
 pci_ss.add(when: 'CONFIG_PCI_I440FX', if_true: files('i440fx.c'))
-- 
2.26.3


