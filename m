Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D4840693D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 11:44:07 +0200 (CEST)
Received: from localhost ([::1]:51618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOd4o-0001y4-Ib
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 05:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOd32-0001HW-MQ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:42:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mOd30-0004ND-4K
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631266932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=guoMKgRqcCh97YtRhZnLBRv0Gf2+iAoypueZnxB2dnw=;
 b=ND5p1SJz9PbKhq5mSmhORQ8rKOQmnt04CGa06N4tbQZ4lURpTL4xCRwYYzLf/V67lG3wac
 FOZBt4zr34+Gl/3ZIPmjoKPxyC59uH3DrKJQRc0NnHMSBL9purG/fQ+cjUElZ8qCBU8jmF
 +Skbdu+6Hl9pkk07Z77Z95OmioqACnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-6xX925nnMcW-FpyLxDxErQ-1; Fri, 10 Sep 2021 05:42:10 -0400
X-MC-Unique: 6xX925nnMcW-FpyLxDxErQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 766FC801B3D
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 09:42:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7165B4BC;
 Fri, 10 Sep 2021 09:42:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1862718000AA; Fri, 10 Sep 2021 11:42:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qxl: fix pre-save logic
Date: Fri, 10 Sep 2021 11:42:03 +0200
Message-Id: <20210910094203.3582378-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Oops.  Logic is backwards.

Fixes: 39b8a183e2f3 ("qxl: remove assert in qxl_pre_save.")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/610
Resolves: https://bugzilla.redhat.com//show_bug.cgi?id=2002907
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/qxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 43482d4364ba..29c80b4289b7 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2252,7 +2252,7 @@ static int qxl_pre_save(void *opaque)
     } else {
         d->last_release_offset = (uint8_t *)d->last_release - ram_start;
     }
-    if (d->last_release_offset < d->vga.vram_size) {
+    if (d->last_release_offset >= d->vga.vram_size) {
         return 1;
     }
 
-- 
2.31.1


