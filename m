Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D454E641F20
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:10:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLT-0002Ee-Jm; Sun, 04 Dec 2022 14:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLQ-0002Bc-4v; Sun, 04 Dec 2022 14:08:08 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLN-0001dF-KV; Sun, 04 Dec 2022 14:08:07 -0500
Received: by mail-ed1-x52e.google.com with SMTP id c17so4514105edj.13;
 Sun, 04 Dec 2022 11:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6bEoXUi/0cGyemox/YexAdXHKvZb4lgz+qOxjSUJWxU=;
 b=JIe2VzI+/xdLDRNjNpuLHpsXg5JvTHssEMn8r2GVvttcOcrxDQ7pJP2oFTPynq50TV
 pty5SPfAaIfLQES1/hra35YQgfKNOIXDP98nq3PJ+VswLVoUEjlBHWPwm99JAZw8QffQ
 Q00fZc6YNacm+e7yBTWqAf7Mfxrz6NKeINtN6OhIH9UuDxMqKAqLl7cMY+La9MfueBQL
 Xr20W5mj/eaVzbpQ6k67da2QP7kk55/uxxe2pf8y3z5C/lLTAfdXI7Qn3M9tGO67AeYr
 TNyUg4Iozhf3r2t62GB+jtYkoD7wD2YJ8j85pP1Z4D+lNoM1h+EPihBDeepZ2RUMH2Jf
 RzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6bEoXUi/0cGyemox/YexAdXHKvZb4lgz+qOxjSUJWxU=;
 b=jAetG7Y2CqImcyzt11SLv4MOpRSoXG+sBleXikNiWWOEInmx8p/cc+8j9nsjvOV6HO
 m5pTIKIIioUZor2tjxeHW5Z2Whpf/Sm47+/5LMZPLTieXezTlVvyFEN9eOOzRe3DHnOI
 pnF+l8ps9iRZ2Xj7aenjP59irxsztQw9fbPNgyWcQ4GfIPksDslvv5apLWhVqpfSaqvQ
 xUM+89KBo0MwPp7kmK2RVaAot5/RCZke1+ejLZyIm/uGsGpvQoM+lhU5XiQ3I4uDgeaW
 MTBw1cGN7ZTEQAyN49IZxCr8E7eNufvu0D0VyTL5t5DyW04rIO4dK1HLb9tKnjO8tyc5
 DZpw==
X-Gm-Message-State: ANoB5pleuejInq4LTewikMWQu7ryta5Kg3GEm4feXN05fimWvLz66PXX
 Fko7I9mzNPNNf5t3OlLIGVXl68bXPWI=
X-Google-Smtp-Source: AA0mqf7Qj+0Jt+yHAd3ULaMHzk9BKfzRP6/hDABX9gBSpaKSLR/DvBJp71FOsxAr8TFh7Pgnw8VqMA==
X-Received: by 2002:a05:6402:449b:b0:459:2b41:3922 with SMTP id
 er27-20020a056402449b00b004592b413922mr2615093edb.160.1670180880740; 
 Sun, 04 Dec 2022 11:08:00 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:08:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 24/32] hw/isa/piix4: Rename reset control operations to match
 PIIX3
Date: Sun,  4 Dec 2022 20:05:45 +0100
Message-Id: <20221204190553.3274-25-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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
Message-Id: <20221022150508.26830-35-shentey@gmail.com>
---
 hw/isa/piix4.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index c12388ddac..13ec2503d0 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -152,7 +152,7 @@ static const VMStateDescription vmstate_piix4 = {
     }
 };
 
-static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
+static void rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
     PIIXState *s = opaque;
@@ -165,16 +165,16 @@ static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
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
@@ -194,7 +194,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
+    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
                           "reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
-- 
2.38.1


