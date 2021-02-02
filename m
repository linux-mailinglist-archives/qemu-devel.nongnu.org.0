Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2330D30C531
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:16:58 +0100 (CET)
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yMK-0001Fy-RP
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6y31-00069R-U0
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:57:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6y2w-00023C-3q
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612281413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FIeU5vr6P9ETMb5WrDe1IVgUMo9nsV2GwJpRkYb6CD0=;
 b=UzIapkeEU1SxYG/lEu20y2R2YdcwSNeckq+OcI36h6+uTSA3Bj2VAxRYcELUCqs9dKaDcp
 iXUCi71VtOA4GgsC8+j5koC/JHHe7W74UEx5gs0PGOwC4hzsXYwHk46GJ+egCEy5ifKFpl
 ClIrXAuDwzjOfVzb2DrmdeMlqCvwcqE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-YF4BBc7kNXug3eEgERAWSw-1; Tue, 02 Feb 2021 10:56:51 -0500
X-MC-Unique: YF4BBc7kNXug3eEgERAWSw-1
Received: by mail-wm1-f69.google.com with SMTP id u1so1646104wml.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FIeU5vr6P9ETMb5WrDe1IVgUMo9nsV2GwJpRkYb6CD0=;
 b=HS0AIrIyXdziKspy8flZTdNrK+DYhu5zpQIgKoKvFrZ+8gvK2YMvwN8GmTPy++BKzb
 CroXiIsZ97ua6o9sy3Wa9JTQLUazEhINn9AJp/4TPplJwv5CRYcte3iglt/e17PCKwTg
 AXcVXwdPv5e4gT3jc9KQUTFo2yrvYrHcV/6e37wLJXrLf1WkCDuEOLV8kULs9vz8DqOs
 Z2N0FQ+O04E2EhGmBEfxJhXZdw8KidS/9eCMaLRbKqMw6uHiG3xA/wMf79QF5Lub/vl9
 97r0RZecn0OgqHdU/MbD5kN+yS6CaRKfGPKZ3njYh872sWRm7DIC8DbztSr082blfjhO
 gm4w==
X-Gm-Message-State: AOAM533VhUepoAxlZQ0afs1wU8Zt6L12Z8a2YthKmbi1zsR4x9JxkUA7
 r03sra4KwGs+9jR9QlRDYh1knq0wxieE4sJiOVStGELHT7gaFJ7uxcnYXMTla2yvZzutVH5Z3oQ
 begt7WKnjf7IoldNbn0qGdkegUNIrMZXE2VlZ5p8mJcOI/+VVUFsnGV+YieoXcMn1
X-Received: by 2002:a05:600c:28b:: with SMTP id
 11mr4281532wmk.98.1612281409534; 
 Tue, 02 Feb 2021 07:56:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKYLHerQzAoFfIr5Ish+YXWqEJkYkVd0aR+Ev7o1WaT/vyuU1T9BTgcwcLSBvcLIpm7WrhFg==
X-Received: by 2002:a05:600c:28b:: with SMTP id
 11mr4281362wmk.98.1612281406773; 
 Tue, 02 Feb 2021 07:56:46 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id u206sm3928158wme.12.2021.02.02.07.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:56:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/i386/xen: Remove dead code
Date: Tue,  2 Feb 2021 16:56:44 +0100
Message-Id: <20210202155644.998812-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'drivers_blacklisted' is never accessed, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/xen/xen_platform.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 7c4db35debb..01ae1fb1618 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -60,7 +60,6 @@ struct PCIXenPlatformState {
     MemoryRegion bar;
     MemoryRegion mmio_bar;
     uint8_t flags; /* used only for version_id == 2 */
-    int drivers_blacklisted;
     uint16_t driver_product_version;
 
     /* Log from guest drivers */
@@ -245,18 +244,10 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
 
 static uint32_t platform_fixed_ioport_readw(void *opaque, uint32_t addr)
 {
-    PCIXenPlatformState *s = opaque;
-
     switch (addr) {
     case 0:
-        if (s->drivers_blacklisted) {
-            /* The drivers will recognise this magic number and refuse
-             * to do anything. */
-            return 0xd249;
-        } else {
-            /* Magic value so that you can identify the interface. */
-            return 0x49d2;
-        }
+        /* Magic value so that you can identify the interface. */
+        return 0x49d2;
     default:
         return 0xffff;
     }
-- 
2.26.2


