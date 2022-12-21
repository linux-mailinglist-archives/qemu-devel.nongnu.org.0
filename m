Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B636534A1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:10:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82Tz-0003ca-Hq; Wed, 21 Dec 2022 12:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sf-0002nL-KA; Wed, 21 Dec 2022 12:00:57 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Se-0008Cn-22; Wed, 21 Dec 2022 12:00:57 -0500
Received: by mail-ed1-x52a.google.com with SMTP id s5so22801021edc.12;
 Wed, 21 Dec 2022 09:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bOHpkY4rlVOhMVGS6KIQqt0kXIRKlk2N7IpLlS0V+FM=;
 b=pxoCsBvrcpF2JyeUjFYbcImYIVf4A05Fd+5Ui0c1djR/aDe2pV465NKnJTiDi4YVuW
 Q4v9iQ0VgW/72bv4V0sJQhq2RbF1fMCH2UsFe0nAkOkvU3xEp9k4fo8l8HttaM8iu1tz
 tPhLmHNpcw2P4870sEVWZZ21RRZVZwxXoPS3i85PuhMEMQBr5mq9HGZz0EHoqpjWE/oL
 r0A19OVIudq3KKrFuQ3vZv0LJyUEgpG7zi+Vs+I7tROB2CMSCvG4DLbMFX+xJTYWakFg
 h9P3fdc0fPIeMPKNFJHv6MkBoQByLGtup6kt994RTbxZGS78cgdCiBBezyg/orUU5wTB
 2dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bOHpkY4rlVOhMVGS6KIQqt0kXIRKlk2N7IpLlS0V+FM=;
 b=CdCKZccNWna3FDwWNS83HbtYzqEvyvSs/Yw0ndOljJk7LIYnyxLDTlCl9O9MrmgsIE
 HPWTdPqUpQ34dSVnZIyjRmA5x4MCPYAjoKiyBPCf5teEIsoWGPQ+7iliwBo7YFsiyRvP
 Y8Hc59KE7kQOJIMNJbUr6fKymkO8EJJwmcS4fzRBHYeHgpMad1ebupPLgtrTWI7wHZos
 JD15N11WpFVr6HeiruVybkTWK599EUi4nmEW2cw05DQ8wof1nH0qaBadERGB8NnvdS1z
 xtgW1K01ko3s0zGcxGuhyvOmoX1n+KMggrCyh3bGRgxqk35gu3igv/kVzL6YZDtXQmV4
 h58g==
X-Gm-Message-State: AFqh2koR7aX8SZzN3OyHUjNb54hoAgg88CAYeNoSFZGg0iIT8VimPIT+
 2MU6UUUtpyup4IDck7zf0ReEd74pRDY=
X-Google-Smtp-Source: AMrXdXvdoCi2cc86ga0TArJGqmuByPwUeKzb9+pr6EwEGdGxtEGQrJLQDn/je1Lovh5l5Eak+PUO5g==
X-Received: by 2002:aa7:c709:0:b0:46c:d5e8:2fc9 with SMTP id
 i9-20020aa7c709000000b0046cd5e82fc9mr2047748edq.13.1671642053693; 
 Wed, 21 Dec 2022 09:00:53 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:00:53 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 07/30] hw/i386/pc_piix: Allow for setting properties before
 realizing PIIX3 south bridge
Date: Wed, 21 Dec 2022 17:59:40 +0100
Message-Id: <20221221170003.2929-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

The next patches will need to take advantage of it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-3-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index bfa7cb513b..0689b7d3f7 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -234,7 +234,8 @@ static void pc_init1(MachineState *machine,
                                        : pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        pci_dev = pci_new_multifunction(-1, true, type);
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
-- 
2.39.0


