Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E2662C9E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:27:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuU-00044Z-K6; Mon, 09 Jan 2023 12:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtp-0002rg-Po; Mon, 09 Jan 2023 12:25:29 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtn-0001T2-Hy; Mon, 09 Jan 2023 12:25:29 -0500
Received: by mail-ej1-x631.google.com with SMTP id hw16so10048557ejc.10;
 Mon, 09 Jan 2023 09:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rI5ck4pq8f2FtDuchxwBlAR4qaTa9QQd309iHKTmL90=;
 b=jWXiHwfhGB1YYretiyigAUEkDEYNBPIkSMws4uCNecH8WwQNXn9fMigAQvGC9l/+tO
 vzpYrmmhAhp9mhPX4/hy7NsK8EfQ0SJDsVbl4iC+kJgz1PWc1aCYjPkq5UMOaFtwEQ/p
 URXhiJIh+GYgV9gmRl6aqUln3duUt/Q7Hfi157uans0rOQrjrdU1PBsgeCIRfViy+mj1
 0BOC2K1FzqhK3dZd1bC9fY5pzNDTY4ndSAszVGDDtGKcmzXc0QS/d6iJAAyQpcqWymam
 kshQbaG8VhF15/UQWfBhzfrqlkb638XT4SU9Eg1zxK/NZY0Nl0PoRHtA45azvjpO/Lh8
 nEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rI5ck4pq8f2FtDuchxwBlAR4qaTa9QQd309iHKTmL90=;
 b=fEJBWfit5nVpn05mgZtkOyK7/oDgqboG4ldV5N7uOpN4z/nYyjYa18hOIWfC2tPdyP
 mQKUQMBApdvD0kY3WeBMl5qK3RMlkwCHDRTVNPpN0wjj8dsuT2SBnniDdsbxuMBErsKn
 P1hFON1GUdSBFMUiCK17jr2oJrtbHV3jj1t1hvffEJuT+wFfxUSadqXqsstLCSFU5YfH
 woqc7z/Nu+sJCC8feYwDrRrK+gEBuCLKylI+WxKw85aA693LYQ/YRGqMUXzGxPNEUusK
 JrKI0xuEw0AvQ31AMVYMrKqrkDa1RvbSrIldu/HFQFBJJvn/CuHFwUGN+0xE4pn74+J5
 tGiA==
X-Gm-Message-State: AFqh2kofCUc5f3ONgtVuOY4H39B14VpgvEB2ScSRFDLB6OnX0QdnKNOu
 M5RXqjIcn1lG+LDaqtALaNQfdnQZfd/zag==
X-Google-Smtp-Source: AMrXdXuPzib97XOUfwa+ghElS2JYfYb+kuL4fMq7bstHZ/IjDHLBC3PN5qzAAFIGAZFWnPcNrj6nDw==
X-Received: by 2002:a17:906:ca10:b0:7c0:a4ae:c542 with SMTP id
 jt16-20020a170906ca1000b007c0a4aec542mr54448846ejb.39.1673285123863; 
 Mon, 09 Jan 2023 09:25:23 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:23 -0800 (PST)
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
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 27/33] hw/isa/piix4: Rename reset control operations to
 match PIIX3
Date: Mon,  9 Jan 2023 18:23:40 +0100
Message-Id: <20230109172347.1830-28-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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

Both implementations are the same and will be shared upon merging.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-35-shentey@gmail.com>
---
 hw/isa/piix4.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index ce88377630..de7cde192f 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -127,7 +127,7 @@ static const VMStateDescription vmstate_piix4 = {
     }
 };
 
-static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
+static void rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
     PIIXState *s = opaque;
@@ -140,16 +140,16 @@ static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
     s->rcr = val & 2; /* keep System Reset type only */
 }
 
-static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int len)
+static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned int len)
 {
     PIIXState *s = opaque;
 
     return s->rcr;
 }
 
-static const MemoryRegionOps piix4_rcr_ops = {
-    .read = piix4_rcr_read,
-    .write = piix4_rcr_write,
+static const MemoryRegionOps rcr_ops = {
+    .read = rcr_read,
+    .write = rcr_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 1,
@@ -169,7 +169,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
+    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
                           "reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
-- 
2.39.0


