Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C7536C898
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:23:58 +0200 (CEST)
Received: from localhost ([::1]:54018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPZ7-00019A-CZ
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbPKO-0003bQ-7j
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:08:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbPKM-0002Dv-JY
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619536122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tGtLRcou7w646gJIecBnONIv70Cq5Znx9rTrZUtWjOs=;
 b=TJPx5B0uPt9erP1i1ehM5r7GQVj7ZA9FZUZbJqNueGb+qkwXyX81jRhYKR/2rG9Al+JoYs
 Ir0vnoHsBeHPWkmMldr2NDp89Js69gQqCF7aCmpIYqv4ZPIHoRkBv7F9ASna49dhq8x+lg
 tqeytp04EGFeAg+ou/qaeoGou4CaO/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-GJpLYe5aOa6o8ueKIzuEyw-1; Tue, 27 Apr 2021 11:08:40 -0400
X-MC-Unique: GJpLYe5aOa6o8ueKIzuEyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74D1B80362E
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 15:08:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33B3E60C0F;
 Tue, 27 Apr 2021 15:08:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1F22C18003B3; Tue, 27 Apr 2021 17:08:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] edid: use dta extension block descriptors
Date: Tue, 27 Apr 2021 17:08:20 +0200
Message-Id: <20210427150824.638359-5-kraxel@redhat.com>
In-Reply-To: <20210427150824.638359-1-kraxel@redhat.com>
References: <20210427150824.638359-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the 4 descriptors in the base edid block are filled, jump to the
dta extension block.  This allows for more than four descriptors.
Happens for example when generating an edid blob with a serial number
(qemu-edid -s $serial).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/edid-generate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 25f790c7bd85..42a130f0ff5c 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -152,6 +152,14 @@ static uint8_t *edid_desc_next(uint8_t *edid, uint8_t *dta, uint8_t *desc)
     if (desc + 18 + 18 < edid + 127) {
         return desc + 18;
     }
+    if (dta) {
+        if (desc < edid + 127) {
+            return dta + dta[2];
+        }
+        if (desc + 18 + 18 < dta + 127) {
+            return desc + 18;
+        }
+    }
     return NULL;
 }
 
-- 
2.30.2


