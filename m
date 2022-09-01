Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D85A9DD8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:13:18 +0200 (CEST)
Received: from localhost ([::1]:60744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnki-0007O7-GV
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2R-0002Pc-I8
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:32 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2N-0001WK-FH
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:30 -0400
Received: by mail-ej1-x62c.google.com with SMTP id h5so24265066ejb.3
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=bXJ8wvWe/ChmJ4OdCaLecAAvRLVcjegGXn5B2jOVT1Y=;
 b=aikx94wD6etGjqlDn2yDUbnHYIgLe/drTdHPUDP3HP126++EHDZRgYmGvo5pCcWxDZ
 KSUYKcmeYsQ+4rrWBzxFJIbJm8ZFbbvaTn+jUzl6Dw6gnQEzhU+MVQFBJb9z7hG39ND0
 ETqRIozeEZpFvEvUNpUhgLXbSSq4NxSpdRyKpJYlDqLhM03f9zfCk5PIMSj4TgipwiVO
 66/2eVxNA6r+HKO7fP9fVA2MIV8rYl0hJbIddhp1HsJ7CViB6h3bQNsO7mEQh8SQW/o+
 J3UlGeUOr0HFtVcWgIAOAapBBkJbHRgUN8tj7OzB0IGRhr0GiBSpvREJ8ocAJZx+/Ld3
 D1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bXJ8wvWe/ChmJ4OdCaLecAAvRLVcjegGXn5B2jOVT1Y=;
 b=W3oslXZIRDyT0dsTaqieCqLgQRLxEnv8HmngsAVFQOB0/XbPhbqbHb+EMQCIqm0Hrv
 mDk6fFmR3oTFVHzAbFa/F6gtNNqmcz5VNtsoguKbU5g19AbuluGRJpgu3ikcsxQ01RG7
 1XXOeZIbBG/IA+MD01Zr4w2E5fo+nLTVJ6Jrjw3mBGgvlUBFB9pwJM00qK2uj3qQJF6Y
 NaJCBIm1LJOewtmy31DXDMOAkHZAqx62XrAI3CLJNi49ySDgzPJQ5FKl3j2pKGtLo77I
 nj7Qsug29WIjgsljSMtZtx0ETtSERjhPd0QSp4lDCf+Xcdn39hvAZuRoGLQirUmot0C7
 5IPw==
X-Gm-Message-State: ACgBeo17uC+qANUYBF/1Jqdvs4+0vYpbpUZ4zyygugazD3PzEvrjbZiv
 ZNjz+wdOe3kh/EqGzgdhpNisYf91y8M=
X-Google-Smtp-Source: AA6agR7OlNTxfQwltuF+Hi99AvSWr+2e3r4Oau80QrBvP2Y3Sq/Q910RO7qI8DoNCv5ryQ9gLQQSHQ==
X-Received: by 2002:a17:907:31c7:b0:740:e3e5:c025 with SMTP id
 xf7-20020a17090731c700b00740e3e5c025mr20682822ejb.341.1662049642951; 
 Thu, 01 Sep 2022 09:27:22 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:22 -0700 (PDT)
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
Subject: [PATCH 32/42] hw/isa/piix4: Rename wrongly named method
Date: Thu,  1 Sep 2022 18:26:03 +0200
Message-Id: <20220901162613.6939-33-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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

This method post-loads the southbridge, not the IDE device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index e682370887..72bd9ad74d 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -128,7 +128,7 @@ static void piix4_isa_reset(DeviceState *dev)
     d->rcr = 0;
 }
 
-static int piix4_ide_post_load(void *opaque, int version_id)
+static int piix4_post_load(void *opaque, int version_id)
 {
     PIIXState *s = opaque;
 
@@ -143,7 +143,7 @@ static const VMStateDescription vmstate_piix4 = {
     .name = "PIIX4",
     .version_id = 3,
     .minimum_version_id = 2,
-    .post_load = piix4_ide_post_load,
+    .post_load = piix4_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(dev, PIIXState),
         VMSTATE_UINT8_V(rcr, PIIXState, 3),
-- 
2.37.3


