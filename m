Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B407D189E5B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 15:55:30 +0100 (CET)
Received: from localhost ([::1]:51900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEa6T-0004lJ-Ny
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 10:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1jEa3p-00011e-K5
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 10:52:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1jEa3o-0001V0-CC
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 10:52:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:44591)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1jEa3o-0001Ph-7i
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 10:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584543164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b1oCVeZb++ei9QW/imFlLqu3DPHPBQd8uhwODtMq3p0=;
 b=XVm3ArBCmxADGEBRTjDfMgY5X+EUqv8Mv0vIuOqYmMRxRznyWlIAE05aVpe1OzkXsWcTMc
 FDx5lLKr8+Qpvm1TQykXdUGGpqRuM2w85hC/aV5wwWkT1bK9fj1E0OtqzGK4AxxuN2HpTo
 5NXb7ZceFOQ3reQuj5XGUua/beBnhIc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-YKd1cCIOMI25KgAS26AqAA-1; Wed, 18 Mar 2020 10:52:42 -0400
X-MC-Unique: YKd1cCIOMI25KgAS26AqAA-1
Received: by mail-wr1-f70.google.com with SMTP id i18so1381262wrx.17
 for <qemu-devel@nongnu.org>; Wed, 18 Mar 2020 07:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LHmsRV7ZmhvcUhHr2NAWuHWG1aMUUMRa55QpQL82/MA=;
 b=bXxPw7unoprC6yOuuPlmnUHfIqf7WM7vBxuL7qOQfERtBHRx19avwazQuWcK7pMlcx
 j9WLZ5bdEXhV7ju+veETsB1ZiXXhwCUNvYMTecG+AoO4HJUaKBnqXbZvX/MK10xDODoL
 VcrVb2wKm4RZTzX5o+1bbMZtILBsMgZyAJjonaamBkU6wIamMubEpXnDlaHcTKdWYqO5
 QG2SHfLbgcee5cNjTZ9Z61bm3F52BKC2EfDqA4d6LI/qqMvTAfVFjHHvvbXA16BNiv2E
 x1MAtjayZhWPHfYFdVSmbGAy4g+WQWfaBBfMB0SHz5+MdqKLB+LGwKeWzm0fcuy7GG9T
 +NeQ==
X-Gm-Message-State: ANhLgQ0NIQFOarluYP0FeMI9Uo1/HaibIUG1U6KfrwhMj+JND8JuH2Qn
 aiYFX3zXFRHozSsm7sPCS4fQ+IxR3PbI/KTEtRH3ro8jQ6EAGno8LsTXRF0F87O1HEJDy/EPRYI
 PwVIIO5CPkJhOZzc=
X-Received: by 2002:a05:600c:298:: with SMTP id
 24mr5654072wmk.70.1584543158118; 
 Wed, 18 Mar 2020 07:52:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuuhoDMe3Dj7YmPnBNjuj0ZIW+mqZR9GgcG3sFIgixDMLhdnvvHk3AcJ4IzVse6RPUUgg7CGw==
X-Received: by 2002:a05:600c:298:: with SMTP id
 24mr5654060wmk.70.1584543157939; 
 Wed, 18 Mar 2020 07:52:37 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id x17sm4215681wmi.28.2020.03.18.07.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 07:52:37 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] Revert "vfio/pci: Disable INTx fast path if using
 split irqchip"
Date: Wed, 18 Mar 2020 10:52:04 -0400
Message-Id: <20200318145204.74483-6-peterx@redhat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200318145204.74483-1-peterx@redhat.com>
References: <20200318145204.74483-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, peterx@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the resamplefd list introduced, we can savely enable VFIO INTx
fast path again with split irqchip so it can still be faster than the
complete slow path.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/vfio/pci.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 09703362df..1c0aa27386 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -124,18 +124,6 @@ static void vfio_intx_enable_kvm(VFIOPCIDevice *vdev, =
Error **errp)
         return;
     }
=20
-    if (kvm_irqchip_is_split()) {
-        /*
-         * VFIO INTx is currently not working with split kernel
-         * irqchip for level triggered interrupts.  Go the slow path
-         * as long as split is enabled so we can be at least
-         * functional (even with poor performance).
-         *
-         * TODO: Remove this after all things fixed up.
-         */
-        return;
-    }
-
     /* Get to a known interrupt state */
     qemu_set_fd_handler(irq_fd, NULL, NULL, vdev);
     vfio_mask_single_irqindex(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX);
--=20
2.24.1


