Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF7D320B28
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:56:36 +0100 (CET)
Received: from localhost ([::1]:58360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq9z-0007c8-Nk
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprN-0008NE-Qn
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:21 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprM-0003Oh-3y
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h98so11535292wrh.11
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x9cE1zBzoVv13k5JjDSc8/IbSReFDXfoX7UFR/I2zeM=;
 b=Jxyly28LjAA+m7WMXz3VkeZJKj+1I0IQILxbwMnJLTLSwc0gGlcfAJHKjxJVpW2R1m
 up3Fu8Wv2yqnTqi5kRorauIxv5pvDISvYsAKnuNvknZ3lqlBHjgklFsiGBZ8p5mLRpGI
 I5uif8hmVoLt+DDSvfoLjfG+E4nAspYFDKPhh5U9gpkbc6E98L/8CYRTAjjl2V77JTvt
 KGD4ma1MKXPmUPb8OI/DhflAQAYp47ScjQksCVHkc6J18wPP+NlwFox9cu6eLivqYb3g
 SziggGdTJpE8chov4qIm+qs7C4V43QxVWPoW2OxvlZRncq0KTPolbVHifrzSOKNAN/aO
 jE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x9cE1zBzoVv13k5JjDSc8/IbSReFDXfoX7UFR/I2zeM=;
 b=B7VpEqNJtvWe9RBi33wwjpZk2BW1zytZswzam69JGFLHZjQLMFlOkmKa1GlNkJ4JqM
 HCvAtIaO/EdL/xQSIqXFxjvE+wpFQU7sjHokCjdLT+aXMTRQdHW96DxLloDdZ8hY2Nvu
 ENtSNUvzOzaYH99CEKlXScN/fOJ9Yupklcg7xuP2OfjMgyy5d04QHg83AVPljLXfjenZ
 kLl2z0Qkm2m7LDzSIIknxRN2TH7PDpEQVYrJhkNFqHF35bEx+FbhdhJoFtj6t/rg/sih
 r94r3p4tvTvzm5lene1xYpGJf63kPVw+LVphPjV18l/OLfRQDO9F8jC/b0zbkyD1VDZy
 UsQA==
X-Gm-Message-State: AOAM532AfLkUPlWgD+sorkE1VmD4vD+t4/ARAxA9Ds4pD1pazX6xLpBK
 cR+GN48o2Dl96dMkGpcH74xUkkcH5PQ=
X-Google-Smtp-Source: ABdhPJxxZFdQWjQL50Uep4LIQyICYd6ny+mTU3AnDBKR+HTZrROuGqmbD2TRDX8sKW8JDwnd49FM4w==
X-Received: by 2002:adf:fe0d:: with SMTP id n13mr1414282wrr.224.1613918238691; 
 Sun, 21 Feb 2021 06:37:18 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n5sm20626459wmq.7.2021.02.21.06.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:37:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/43] vt82c686: Correctly reset all registers to default
 values on reset
Date: Sun, 21 Feb 2021 15:34:22 +0100
Message-Id: <20210221143432.2468220-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Reset the registers in the DeviceReset() handler which is called
on each device reset, not in DeviceRealize() which is called once.

Bit 0 of 'Power Mgmt I/O Base' register (offset 0x48) is always set.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <cff9b2442d3e2e1cfbdcbc2dfbb559031b4b1cc1.1610223397.git.balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Split original patch, this is part 3/4 (move to reset), document]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index fe8ae24c421..48ead5af551 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -149,9 +149,12 @@ static void vt82c686b_pm_reset(DeviceState *d)
 {
     VT686PMState *s = VT82C686B_PM(d);
 
+    memset(s->dev.config + PCI_CONFIG_HEADER_SIZE, 0,
+           PCI_CONFIG_SPACE_SIZE - PCI_CONFIG_HEADER_SIZE);
+    /* Power Management IO base */
+    pci_set_long(s->dev.config + 0x48, 1);
     /* SMBus IO base */
     pci_set_long(s->dev.config + 0x90, 1);
-    s->dev.config[0xd2] = 0;
 
     smb_io_space_update(s);
 }
@@ -166,9 +169,6 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
     pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_FAST_BACK |
                  PCI_STATUS_DEVSEL_MEDIUM);
 
-    /* 0x48-0x4B is Power Management I/O Base */
-    pci_set_long(pci_conf + 0x48, 0x00000001);
-
     pm_smbus_init(DEVICE(s), &s->smb, false);
     memory_region_add_subregion(pci_address_space_io(dev), 0, &s->smb.io);
     memory_region_set_enabled(&s->smb.io, false);
-- 
2.26.2


