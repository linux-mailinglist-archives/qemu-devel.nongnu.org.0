Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7CE65EF17
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:45:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJO-0002xw-1M; Thu, 05 Jan 2023 09:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJJ-0002re-Vu; Thu, 05 Jan 2023 09:33:38 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJH-0006um-TM; Thu, 05 Jan 2023 09:33:37 -0500
Received: by mail-wr1-x430.google.com with SMTP id h16so36266543wrz.12;
 Thu, 05 Jan 2023 06:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rI5ck4pq8f2FtDuchxwBlAR4qaTa9QQd309iHKTmL90=;
 b=lC/zvzeOedB6FK1MBXUnFslXFs57X/jsoo7KuSnbSSIrpDz5xeRJkMia6/0I39t69c
 9f25ghFmWxajZKF0U/fuioQP+JYhGOxFwciIbKQrA4zTu1Cg5EaOT2Im4xCJwTSs39Tn
 Jd6L5jbwdCWdt20By52yfJO3fnUmwhw17KqB1dj1Njv5teRIBwwKOxQgPcmpNcRDjurD
 o4a+7T6cgs4iD+C7B+qt0cMHsxqc8xfUPjS2xll48Vwx3T5pgHrnwmdk/fICp+db6FKg
 hkffxtSe/gpMAqwVUBe8dJRXZibScVJvthEobggt2eJoQbFSfn02IrVO3Mm8G+obkNoJ
 swtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rI5ck4pq8f2FtDuchxwBlAR4qaTa9QQd309iHKTmL90=;
 b=Tad0iWMz0hFrTiFz991XjBRCXV1H6QLRw5ZOO5FoR0hg9/dae+abqDTvyKOiXthQeN
 dqClVaS/XNAlwSWFb1ljEjk2Yvy9ROx0yVgH9S2aZVO2Txk1FIgqulUv/nd72/cCBL8Q
 EywNt4I7LUO83CyTBqxn5kgHSkg8PV1ECvxyhf0LM9xoUMtMy7kObm+YYJuwBwbn52Wv
 3ZKhCPp//4npuF+QKfPeueSBi3lQQJXg12AFnwAh/7TizzuR1OWghrp+DU+/0+KWO8Qw
 E4NAf0tkXRelCBhKrofMOxiAJp2fJDkZXpT7XNssuVerhFCXUX/BoDQ286io2owZwU4H
 55OA==
X-Gm-Message-State: AFqh2kpo3eenKarpVxYkH6uGsa4m74IJzjV29UFDu0FGWW8GTo8Q2FaL
 aglL9NgqbwAQ1HZcplGkRCUvFZgxseMYTg==
X-Google-Smtp-Source: AMrXdXv9QjldrAnXScDIw8GuMrU6ANF/RNuITfjuPmkDn0Ld4WEmedCVRKh4ytLTxR4jtWuGZUOkmA==
X-Received: by 2002:adf:e9d1:0:b0:242:5fe3:b61b with SMTP id
 l17-20020adfe9d1000000b002425fe3b61bmr31190284wrn.23.1672929214646; 
 Thu, 05 Jan 2023 06:33:34 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:34 -0800 (PST)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 25/31] hw/isa/piix4: Rename reset control operations to
 match PIIX3
Date: Thu,  5 Jan 2023 15:32:22 +0100
Message-Id: <20230105143228.244965-26-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x430.google.com
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


