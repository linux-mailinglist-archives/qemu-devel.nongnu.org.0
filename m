Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3043D0B8A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:42:01 +0200 (CEST)
Received: from localhost ([::1]:58050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68jo-0003t1-69
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m68c1-0001NQ-5i
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m68bz-00061M-Nr
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626860035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0wdBB01ZYqT+b15CQDkjK/qGLoNvPPFNhR+T1tcSMxo=;
 b=Z6L1u5+yDD4p3pZAPKLvd8bKWbL3m/MxaUpGFFPOvPlFm8tmFYpAvQrTtzhUP6MVR/C7/r
 h4bppQeOd5WB3ZQkPZnyYGsj+CfRbLvxzob9zGX2mfT8zbPNmiM142XgrWQB94BqtqS2kt
 bQdU75eUGgEDz3noHSOCGq44KPW3zVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-NUPkRFV6OBKbwFNDr078bg-1; Wed, 21 Jul 2021 05:33:53 -0400
X-MC-Unique: NUPkRFV6OBKbwFNDr078bg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE949107ACF5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:33:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E5F8781EA;
 Wed, 21 Jul 2021 09:33:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8500E18000B4; Wed, 21 Jul 2021 11:33:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] qxl: remove assert in qxl_pre_save.
Date: Wed, 21 Jul 2021 11:33:46 +0200
Message-Id: <20210721093347.338536-2-kraxel@redhat.com>
In-Reply-To: <20210721093347.338536-1-kraxel@redhat.com>
References: <20210721093347.338536-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: armbru@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 551dbd0846d2 ("migration: check pre_save return in
vmstate_save_state") the pre_save hook can fail.  So lets finally
use that to drop the guest-triggerable assert in qxl_pre_save().

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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


