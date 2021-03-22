Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603FD3449AB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:50:54 +0100 (CET)
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMpR-0002Oy-DH
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjo-00058b-Bd
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:45:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjm-00070m-BV
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rgx2b4hotD874Fv3WV8HN6GkDJ+ooCQJj6fWc2UZp24=;
 b=Q/Ks0t1/NGyNUelPb0qxLU/3ATYo8QYGO4czzIUutDtj7wQzRjE68NXSYbxGnubpxWsOly
 tmn/RoGvQszR1tvkAW+K7imNcICXqJK/Px4xPjFk8iTitb2zIZmF9iZN0Y8WptKko1QNFS
 6VV8UVnIGGJjG7JoITU0b5DHV+nC3zw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-oT8Ut9zdOg2Z6LRd8rJuAw-1; Mon, 22 Mar 2021 11:44:59 -0400
X-MC-Unique: oT8Ut9zdOg2Z6LRd8rJuAw-1
Received: by mail-wm1-f72.google.com with SMTP id f9so15059500wml.0
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rgx2b4hotD874Fv3WV8HN6GkDJ+ooCQJj6fWc2UZp24=;
 b=CJnn4m8m2ChJ6ftvFyZz03KIx9pwIOym4/rgesyeWw2pCzWGnwoJVDJfD6XnLjd36j
 Tf//jHABEM0zgBBh+NrKLOcaom8LbFouOIi8aiNg56USq6HlvLHMNgO85dxSAr/qbHLw
 fnbpWHpKwoCmAGaq1olxC1eBHl2D2Juh9H0bDL8AkUqAlW5Wo5wNSMlLtQ/BKrDwS/C8
 oGU4uD4Lly1pVC+CyznzIxReQ8IQMcFtE3X1YaufHDO8mb4w3j80u6zHjDOKpUL9iQoQ
 nxGMdAoaG7HYqa101kXhgTGp3/eSVmA25Moys3wCB3E8KhlTa4OPib8D5DgPROBb04fi
 noww==
X-Gm-Message-State: AOAM533J4cLzhsV/1uyiCZjPInQPfeQMgcc3zD8iLrpkrnst6l2XRmVK
 +dqCt0Ml1Y4uW0tAiE09mdL1dJHSfSqn0NpddVM/KFdYruRMTi1C+xj6DX8S1uU+Pxu1QhKT0ya
 I/MaCsS53qlkRa7rjA9PuwcHaURX3E/mQPnV+c4t8dmXdwCXrOt9QMHhKYyOJ
X-Received: by 2002:a1c:7916:: with SMTP id l22mr440499wme.86.1616427896843;
 Mon, 22 Mar 2021 08:44:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuz0xyE2He/xk2+vA+HsmRAeZerraIRvlZSNqgivsJG94SSDMRRwzV3vVa/3kcvH4BHdz5Dw==
X-Received: by 2002:a1c:7916:: with SMTP id l22mr440479wme.86.1616427896547;
 Mon, 22 Mar 2021 08:44:56 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id y16sm20451935wrh.3.2021.03.22.08.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:44:56 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:44:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/20] acpi:piix4, vt82c686: reinitialize acpi PM device on
 reset
Message-ID: <20210322154417.524229-10-mst@redhat.com>
References: <20210322154417.524229-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322154417.524229-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen <chenhuacai@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Commit 6be8cf56bc8b made sure that SCI is enabled in PM1.CNT
on reset in acpi_only mode by modifying acpi_pm1_cnt_reset() and
that worked for q35 as expected.

The function was introduced by commit
  eaba51c573a (acpi, acpi_piix, vt82c686: factor out PM1_CNT logic)
that forgot to actually call it at piix4 reset time and as result
SCI_EN wasn't set as was expected by 6be8cf56bc8b in acpi_only mode.

So Windows crashes when it notices that SCI_EN is not set and FADT is
not providing information about how to enable it anymore.
Reproducer:
   qemu-system-x86_64 -enable-kvm -M pc-i440fx-6.0,smm=off -cdrom any_windows_10x64.iso

Fix it by calling acpi_pm1_cnt_reset() at piix4 reset time.

Occasionally this patch adds reset acpi PM related registers on
piix4/vt582c686 reset time and de-assert sci.
piix4_pm_realize() initializes acpi pm tmr, evt, cnt and gpe.
via_pm_realize() initializes acpi pm tmr, evt and cnt.
reset them on device reset. pm_reset() in ich9.c correctly calls
corresponding reset functions.

Fixes: 6be8cf56bc8b (acpi/core: always set SCI_EN when SMM isn't supported)
Reported-by: Reinoud Zandijk <reinoud@NetBSD.org>
Co-developed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <1ceb31c6782f701674d3b907a419f5a82adb37bc.1616012290.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/piix4.c   | 7 +++++++
 hw/isa/vt82c686.c | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 1efc0ded9f..a00525025b 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -325,6 +325,13 @@ static void piix4_pm_reset(DeviceState *dev)
         /* Mark SMM as already inited (until KVM supports SMM). */
         pci_conf[0x5B] = 0x02;
     }
+
+    acpi_pm1_evt_reset(&s->ar);
+    acpi_pm1_cnt_reset(&s->ar);
+    acpi_pm_tmr_reset(&s->ar);
+    acpi_gpe_reset(&s->ar);
+    acpi_update_sci(&s->ar, s->irq);
+
     pm_io_space_update(s);
     acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
 }
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 05d084f698..7bacad03e2 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -167,6 +167,11 @@ static void via_pm_reset(DeviceState *d)
     /* SMBus IO base */
     pci_set_long(s->dev.config + 0x90, 1);
 
+    acpi_pm1_evt_reset(&s->ar);
+    acpi_pm1_cnt_reset(&s->ar);
+    acpi_pm_tmr_reset(&s->ar);
+    pm_update_sci(s);
+
     pm_io_space_update(s);
     smb_io_space_update(s);
 }
-- 
MST


