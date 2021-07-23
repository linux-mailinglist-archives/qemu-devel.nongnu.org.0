Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C2A3D345A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 07:57:00 +0200 (CEST)
Received: from localhost ([::1]:51994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6oB9-0004wp-Rx
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 01:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6o9Q-0002Du-25
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:55:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6o9O-0006J0-MD
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627019709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Avr0icKd1q26fQ2RBIxX2KC8P3flV1BAFmnXfPtvK84=;
 b=GB5kQvLSovGw2FIkmdjiE8PA2PVbn2bMzc1JdgO6+8bzLPIPjveiz/dfDBvZv7Uizc4DLT
 ei4YjJY9YdMSGd0X3G41TFFmibGgJXaouqF/D2pJC2DiHkusne8h9jhLUuahmzgIgLYhiP
 jJqbd2n3CbyBbLx8F8zper0Wz8VSjU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-Ewf24PnINUGLMKSAyciIEA-1; Fri, 23 Jul 2021 01:55:06 -0400
X-MC-Unique: Ewf24PnINUGLMKSAyciIEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 693561005D4F
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 05:55:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C69AF61095;
 Fri, 23 Jul 2021 05:54:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E7CD01800990; Fri, 23 Jul 2021 07:54:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] qxl: remove assert in qxl_pre_save.
Date: Fri, 23 Jul 2021 07:54:44 +0200
Message-Id: <20210723055448.1032115-3-kraxel@redhat.com>
In-Reply-To: <20210723055448.1032115-1-kraxel@redhat.com>
References: <20210723055448.1032115-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 551dbd0846d2 ("migration: check pre_save return in
vmstate_save_state") the pre_save hook can fail.  So lets finally
use that to drop the guest-triggerable assert in qxl_pre_save().

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210721093347.338536-2-kraxel@redhat.com>
---
 hw/display/qxl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 84f99088e0a0..3867b94fe236 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2283,7 +2283,9 @@ static int qxl_pre_save(void *opaque)
     } else {
         d->last_release_offset = (uint8_t *)d->last_release - ram_start;
     }
-    assert(d->last_release_offset < d->vga.vram_size);
+    if (d->last_release_offset < d->vga.vram_size) {
+        return 1;
+    }
 
     return 0;
 }
-- 
2.31.1


