Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D02E828A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:53:53 +0100 (CET)
Received: from localhost ([::1]:55758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6pM-0006KO-B9
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lE-0000zT-Pz
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:36 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:56012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lD-0006Lg-Fh
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:36 -0500
Received: by mail-wm1-x330.google.com with SMTP id c124so8138289wma.5
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HCV6hM+D7eP0IiKfRG2kbILOOq4+o/HRgbbPJbxLHKY=;
 b=qrQIJXU5zI+od83uHpIwGReSAKMqujZWIDkpoYJvIKqm7ofx79Yd69un4MwrmyNnZO
 bqL4dmhX+eNeKenj/f+wFAg8ywHck9ANSrCmegZ7ghV4fy+/Te91EG96Se/lzEvpXlgt
 jIv/rFkoam/nI6UhNfUt7bSfQ9bj1Ifb8whDoH2ScXqNaufYaipFBxZ4KwlqIul7hn2r
 F7XAA8kw+rEKDMMUwygXKkAku1PR3KXLjGlaJdL3Sj2F3ucvkNWAtwik9fBcTbgKSxfl
 VBhbgA+UeOV9PtbJjI6QzOWhbx1u8uoIRsxZf38sgTLn/qQo5S2458SpbCT/lEvxQvkN
 4m/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HCV6hM+D7eP0IiKfRG2kbILOOq4+o/HRgbbPJbxLHKY=;
 b=rCuwDoT/ks7wGr1RuD14j5QsCzx3cRedwhv/ZYqAz3OZdl9z5KCtpg5aFDD27ZeK2u
 fir3348dlRpyHfJAxOkTUGjN1jDhyk265PqiqApFpB0BnmVfWieZBjjcFgxYo3LAEfDP
 /tcjmD8eVst4mQXJux6Y1RVwvPCaGei8dRSPkjcyWIm5YLK2O0kChsh2RRT2/MGBxh6r
 rTQyxdV9rbaszcwWJCEkw1gLhbtSpT3hyKB2flZDpiXp2DVbyriGhmIdeHOTcLdEo/e4
 kKanDZYNHLRqNWYAFjOIaKkLFKDNksHY2KEPA3Pa9CDUnfwRc0WKIrTxg9UfkjZNCuJg
 ubZw==
X-Gm-Message-State: AOAM530IkeWMkXWZKMrzJBjknWNLbC7HtIbN3iQfqM/QKeQzi+XDF/XE
 AGHzvD25SpreAt6MR75cyk0z69nhnTI=
X-Google-Smtp-Source: ABdhPJwb+22KqIXjUg51dPk2CF7bVRFAnblDdwgi/CnnwgSMXGL+KYIQbVY5P9mSo2CUMoelDzLFtQ==
X-Received: by 2002:a1c:9e86:: with SMTP id
 h128mr13817940wme.171.1609454974071; 
 Thu, 31 Dec 2020 14:49:34 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id n16sm33339556wrj.26.2020.12.31.14.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:49:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/18] hw/pci-host/bonito: Use pci_config_set_interrupt_pin()
Date: Thu, 31 Dec 2020 23:48:57 +0100
Message-Id: <20201231224911.1467352-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace pci_set_byte(PCI_INTERRUPT_PIN) by
pci_config_set_interrupt_pin().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 4c903d4f682..fe94e6740b5 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -723,7 +723,8 @@ static void bonito_realize(PCIDevice *dev, Error **errp)
     pci_set_word(dev->config + PCI_SUBSYSTEM_ID, 0x0000);
 
     pci_set_byte(dev->config + PCI_INTERRUPT_LINE, 0x00);
-    pci_set_byte(dev->config + PCI_INTERRUPT_PIN, 0x01);
+    pci_config_set_interrupt_pin(dev->config, 0x01); /* interrupt pin A */
+
     pci_set_byte(dev->config + PCI_MIN_GNT, 0x3c);
     pci_set_byte(dev->config + PCI_MAX_LAT, 0x00);
 
-- 
2.26.2


