Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21DA5FA38F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:47:14 +0200 (CEST)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxo1-0007Cx-Ke
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdz-0005Ju-5r
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdi-0007dB-Se
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DRZb10+OLNSkM4ALj8UzLa2WATEyeYfJxoFKuX0oSVc=;
 b=G/WoJw96pU8su/SswutzXCRX9I4yyKOE+Wo8T60C1UBuIk2etNUvnI7z6N0IOQ1JV9+Hm2
 iaGIR2RSIeDC9/By9Fxivfq+HfwXdp4qCn52/qNUZbN+ZRAP1GeEzp3KXdm33guQKRbtnt
 yvBLJmomQDGsfmf9qH3dBT1YFmhJFRg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-NdOl9qWrMrygnVZJdMPJNg-1; Mon, 10 Oct 2022 13:32:29 -0400
X-MC-Unique: NdOl9qWrMrygnVZJdMPJNg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h129-20020a1c2187000000b003bf635eac31so4258095wmh.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRZb10+OLNSkM4ALj8UzLa2WATEyeYfJxoFKuX0oSVc=;
 b=CZ6O/6ggvFQOU8HMQNPRzadYezvr4UnKS8YXBagU8AIAUvrLr5qZa9VrjWVOw8DC8e
 ydhJJ+Zb2J3PAZzGzEDCZyRyhNbz079PnS5arrzIYAou2ETGaXmiwjs+WSVbLz03gWHb
 hifTWZKLhcFphyA8pNtn9kMi3vtmSc2625DsO2l+2HQLdDLttc+Gmtx2RX91OgCFetkd
 YIHpV8Ro+sKrFyPXvk3yh51gIQArnL6PgOrIw6UcS999+pmzVt7pph44GKQZn9eCArDn
 o4QcB4lYsHuL4Mtz5mqcq/SmEgy+kdLmcidEb16wKcqhQ3IZtDV4HagRgv8FwY3/oI6y
 xoRA==
X-Gm-Message-State: ACrzQf1zLtP1Dv6dXDzsWjVFO9zsLFuVeOufkmpS+CuitrkE8Y3UlyDS
 OKe3pDahxin2pcgWW+zc5TD1hcML4UX+XS5+/Je7f1/P+2lBzE9NEHL/dw2LhCpuobIa4XYhbU5
 q4ItjSr/+vlAbJT3kv3F7AKiOVF1qPOntyNwCpEyxyahnAp6U5Na7PXymnQH+
X-Received: by 2002:adf:d84a:0:b0:22e:3f73:372c with SMTP id
 k10-20020adfd84a000000b0022e3f73372cmr11998667wrl.500.1665423147840; 
 Mon, 10 Oct 2022 10:32:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM47nBQq2oVgheuXJCFVUVZxxuJ20wPJS3SNlP3WxJrcu033onzxavjApNC8lRqJj9KaeYlH2w==
X-Received: by 2002:adf:d84a:0:b0:22e:3f73:372c with SMTP id
 k10-20020adfd84a000000b0022e3f73372cmr11998648wrl.500.1665423147542; 
 Mon, 10 Oct 2022 10:32:27 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 g13-20020adfe40d000000b0022e3d7c9887sm9120270wrm.101.2022.10.10.10.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:32:27 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:32:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 50/55] x86: pci: acpi: reorder Device's _ADR and _SUN fields
Message-ID: <20221010172813.204597-51-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Igor Mammedov <imammedo@redhat.com>

no functional change, align order of fields in empty slot
descriptor with a populated slot ordering.
Expected diff:
  -                Name (_SUN, 0x0X)  // _SUN: Slot User Number
                   Name (_ADR, 0xY)  // _ADR: Address
  ...
  +                Name (_SUN, 0xX)  // _SUN: Slot User Number

that will eliminate contextual changes (causing test failures)
when follow up patches merge code generating populated and empty
slots descriptors.

Put mandatory _ADR as the 1st field, then ASUN as it can be
present for both pupulated and empty slots and only then _SUN
which is present only when slot is hotpluggable.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-13-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index eb92b05197..6342467af4 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -442,8 +442,8 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                     break;
                 }
                 dev = aml_device("S%.02X", devfn);
-                aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
                 aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
+                aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
                 aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
                 method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
                 aml_append(method,
-- 
MST


