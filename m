Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1926097F5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 03:49:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhdt-0001VX-4i
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5o-0007OO-Ve; Sat, 22 Oct 2022 11:07:20 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5n-0002N2-H9; Sat, 22 Oct 2022 11:07:20 -0400
Received: by mail-ed1-x535.google.com with SMTP id a13so16199973edj.0;
 Sat, 22 Oct 2022 08:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SFbd++xa2DU9bFufAS2KUldQztSNRiFISYkcnazU4Uo=;
 b=XmWbZDzoyn1a/1zi/BJW0YSC3BDYRvYXTmxRWIqgWRftgidxYo0x7ANG+DbubSQO0C
 STUnHEXBiSY4ObAQci2cwQDqrb79c0At5mjD+LmiXzgeSfMRY84fq1FIAi29bUVxYbIy
 rhI5p59HJlLgBydZArV+Vr7qkv7DiwEMDgF84feEGXAnvw7Y7kA6H4t0K7DsBsjEULjo
 XHs7s1K2QoUAussiEu1Ei+nwhrwFtyiMfrMUsQ7VRBEpcQI49Txj6hzmTxhlHfVAFOw+
 KccgDYucSCq8EdAoDaNaTv0qzPIP9ZiKhgdUhdyc9132AxPc0Ja9NUoHLH3tRVK3o2To
 5b3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SFbd++xa2DU9bFufAS2KUldQztSNRiFISYkcnazU4Uo=;
 b=Pp5B13eFbRLJ4MoyEsRUtzSFyV5gPVshL+7E84owZG0b8ctPIagUH4XT2JC1NPMvgX
 RLaNkYSeiIHE1ix6zkJQMzVoycGutFR2HRlthUrPuogy3foB6NJkTSk7JuXFH/sIbC2D
 DkS2vO04NhsF8YtYlsGpoSmE6O/LVbI8HaU5gyWlZsPj4DY0WIULWK7porJVIkLlUbYo
 NprZqFSQYaESr1kmhhzWlyP2v47V3b2pRJFHMSLgn6HsKAKnee6mqMNMP9D9lO9AXGe0
 7Ko2gWExhHIIlMbuiPkFaSNO3z3zJYusvdEQEr7+igOxMVjHR1Xvo82fT7qHDP1d+qX/
 uH2A==
X-Gm-Message-State: ACrzQf3vo885q5jZ0OORs73vv+aATAiwfJR3ecL1FQ4hrAWzeK7olR7+
 rTMDPO2bj3GXx5/PZivf2eeCK9vqU4Uehw==
X-Google-Smtp-Source: AMsMyM5crq2lxtvj4J0t6dUpzBS0iEdW3KgK+TEnU3ceSm4HEpxvER3FrnrySIdkNlDlLmsNY1zFKg==
X-Received: by 2002:a17:906:844f:b0:78d:8bd1:ee8c with SMTP id
 e15-20020a170906844f00b0078d8bd1ee8cmr21107065ejy.262.1666451237500; 
 Sat, 22 Oct 2022 08:07:17 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:16 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 34/43] hw/isa/piix4: Rename reset control operations to
 match PIIX3
Date: Sat, 22 Oct 2022 17:04:59 +0200
Message-Id: <20221022150508.26830-35-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both implementations are the same and will be shared upon merging.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index a7d52c5294..2f5b6fc934 100644
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


