Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C59C1F7A4F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 17:05:52 +0200 (CEST)
Received: from localhost ([::1]:57442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjlFf-0005RN-1P
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 11:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl2d-0007Zz-BB
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:52:23 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35597
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjl2b-0001Um-IB
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 10:52:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591973540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYJWosKtNa0YrCdfi+nbmPQlsHhZsqpfDeFMOxFj1JA=;
 b=WewJJ9+QoRES2Me9JANlanMZRywQo8/4+PscGEi8djqwzAftNf5ksz/88ql36iG0UEk9Jb
 JmVPnLaJIzyTJS11eB+F026XyIYtFlSgJm2rgRuDvGVqYmv6K7FWq5wtHgcvumeInw+aQY
 /7Ubx1VHMSFfXWsgKNrDQCo2HEpNQxw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-mWhjM3pVNrabT2no1CwXkQ-1; Fri, 12 Jun 2020 10:52:19 -0400
X-MC-Unique: mWhjM3pVNrabT2no1CwXkQ-1
Received: by mail-wm1-f72.google.com with SMTP id t145so2546280wmt.2
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 07:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XYJWosKtNa0YrCdfi+nbmPQlsHhZsqpfDeFMOxFj1JA=;
 b=k2uijgiO4oFzoG6p+0iwqGFXxB0v8LCUWC8UrjyWl6e9Y4wF/SbYfyHQSbVlerJ/0d
 SiKVAcXrsIO7hlvQHw1a1Cl7sm3ux0RN7xRobjkd7mTBLuN5mh6HoU4NeayvROalXCur
 HJFR5c8L6tx6YA9gZJ7yIPb/f23eVi5TUyXQ92ijvomZNMmuDr3fuJ2C+9Qsse5f1tQP
 PY1kiVaRS6cwWSAES6W3gfq0BCriG18/ZvFGipODorqv4DutaP41TqGokeZ+PJ6gp+nk
 7aUzLTKsYBl3Ss+GwlO2zn8T87jDiEZCXifvnmqPneKx/qXsQ4c8br85uiAuHxLKN9qN
 iC9g==
X-Gm-Message-State: AOAM531l95cZlv0KoGqbJRrua4/TDVpYF6qp2h7WHokbl93EgvbZawvQ
 KbXc0F1VGEvBy5UsUOX85TcRYivR9GjGcy46QKvnrS0zAz0MieR7Nv6T9m/VqybFf6AM4fZfyWt
 5+GnK2Mbb8ghFMhk=
X-Received: by 2002:adf:fc4e:: with SMTP id e14mr15313516wrs.348.1591973537895; 
 Fri, 12 Jun 2020 07:52:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzR0j3QgiKw9ix9SXDk1SqR2xOa3qiy/u2bEGSFuXXqKMvXpTcEf/zzWvP/yEizLNKjqqwHQ==
X-Received: by 2002:adf:fc4e:: with SMTP id e14mr15313498wrs.348.1591973537689; 
 Fri, 12 Jun 2020 07:52:17 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id k64sm9481743wmf.34.2020.06.12.07.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 07:52:17 -0700 (PDT)
Date: Fri, 12 Jun 2020 10:52:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 33/58] hw/pci-host: Use the IEC binary prefix definitions
Message-ID: <20200612141917.9446-34-mst@redhat.com>
References: <20200612141917.9446-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200612141917.9446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 08:07:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200601142930.29408-6-f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/pci-host/i440fx.c    | 3 ++-
 hw/pci-host/q35.c       | 2 +-
 hw/pci-host/versatile.c | 5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 0adbd77553..aefb416c8f 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/range.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
@@ -301,7 +302,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     memory_region_set_enabled(&f->smram_region, true);
 
     /* smram, as seen by SMM CPUs */
-    memory_region_init(&f->smram, OBJECT(d), "smram", 1ull << 32);
+    memory_region_init(&f->smram, OBJECT(d), "smram", 4 * GiB);
     memory_region_set_enabled(&f->smram, true);
     memory_region_init_alias(&f->low_smram, OBJECT(d), "smram-low",
                              f->ram_memory, 0xa0000, 0x20000);
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 352aeecfa7..b788f17b2c 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -589,7 +589,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
     memory_region_set_enabled(&mch->open_high_smram, false);
 
     /* smram, as seen by SMM CPUs */
-    memory_region_init(&mch->smram, OBJECT(mch), "smram", 1ull << 32);
+    memory_region_init(&mch->smram, OBJECT(mch), "smram", 4 * GiB);
     memory_region_set_enabled(&mch->smram, true);
     memory_region_init_alias(&mch->low_smram, OBJECT(mch), "smram-low",
                              mch->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index cfb9a78ea6..8ddfb8772a 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
@@ -399,8 +400,8 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
     pci_map_irq_fn mapfn;
     int i;
 
-    memory_region_init(&s->pci_io_space, OBJECT(s), "pci_io", 1ULL << 32);
-    memory_region_init(&s->pci_mem_space, OBJECT(s), "pci_mem", 1ULL << 32);
+    memory_region_init(&s->pci_io_space, OBJECT(s), "pci_io", 4 * GiB);
+    memory_region_init(&s->pci_mem_space, OBJECT(s), "pci_mem", 4 * GiB);
 
     pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), dev, "pci",
                              &s->pci_mem_space, &s->pci_io_space,
-- 
MST


