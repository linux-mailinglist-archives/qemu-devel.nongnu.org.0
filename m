Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED39536BEE
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:31:29 +0200 (CEST)
Received: from localhost ([::1]:36174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nusnA-0006Io-9k
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusc8-0005zz-VQ
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusc7-0003nj-FM
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I8zbftgHb0e/b8/5cn+XuPZKrpaiw9PejjdtqmtoVfA=; b=u4pwB6H45wSmnuBhbLH998+kmE
 2JHWRxswC3fGZbYq8tQI3rO74ITTTdmWyyG+E8qiBcQB1hVa0bJaUKDkXSyeW2isB8i/OVcTNKDE7
 hN8y7DvAzg5UgnX5qgYV51QiwfAeQr+RhitJSz0spcYCP3fWKYI2QGb11rK011PjCa0lp9aGmwYWC
 CHaHuaJpC6SWTHwDijyrXAJfy+1qUkwv+UplKtYxne8PPmGQOVrbxxX+fsIsvJAccXfnvEs4evIOu
 Vh78AwTPfQVJC95m/gJjs576tlJwZu9oPoeszrsNaHAomA4JJevx/Q51DaySiaQ3DM9R2yVrNV5Jo
 iylOX9KMdrcUYyhpMd1bM9J6k9qODEwC6r8qvShRwertu+2OBEt2FyGtJi9VyYV9k5ifoMxTutoVX
 Fl4Ny/FQQfp6W57o/BPWOTy3zbHw12AkfyLyh2B5Qr0jhnlvYgEV00ACyTVnD4x+Dj6v0MKG1CIQ7
 eP597VW2syF+aaJtKJV5u5SnHq8T6EF+utzy6xqQCZ53C3nO28sLZeJ61NLE58L3mA2qQy5FPglzG
 xNHEKcgAPOO1DwaUT0zukbFSl5NkMyTlGg/CHzx1HHxsEtOvJm1/ys5KuipFNJ5VBSDfujPPRapfI
 E+eLSTBdktHd9Nbb566UmEUY+IpAL2UeJvb5625yA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusaq-0003JL-TX; Sat, 28 May 2022 10:18:49 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:24 +0100
Message-Id: <20220528091934.15520-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 02/12] hw/acpi/piix4: change smm_enabled from int to bool
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is in preparation for conversion to a qdev property.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/piix4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index bf20fa139b..fcfaafc175 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -74,7 +74,7 @@ struct PIIX4PMState {
 
     qemu_irq irq;
     qemu_irq smi_irq;
-    int smm_enabled;
+    bool smm_enabled;
     bool smm_compat;
     Notifier machine_ready;
     Notifier powerdown_notifier;
-- 
2.20.1


