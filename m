Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0675B378CB4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:23:53 +0200 (CEST)
Received: from localhost ([::1]:42048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5t1-00062n-Vc
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5qr-0003Oq-9R
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5qo-0002gS-Sq
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amdMZAqmayIqlvTxqZokkB3fae59JPIzxD24lovZVUQ=;
 b=dQHto0Ik+cdjHn7OSG9TzpFbtLdyN62ZK0DMTo4Pc9n0KgWJfC34ollgDXis2HN3cspDv0
 qVlbB6uhLp19KrCUdxJADKgHR+QFAY7vUPC4siccpuUSHbwiMt5sacAj6QKj2K/KRQgkCw
 8jiwHY/6CJfGuaN67Jfaq2i+yrCtCKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-lMrmfjWaM8aoT7zHJfp_Gw-1; Mon, 10 May 2021 09:21:32 -0400
X-MC-Unique: lMrmfjWaM8aoT7zHJfp_Gw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9129D107ACCD
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:21:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 163BF9F64;
 Mon, 10 May 2021 13:21:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3FDCF1800396; Mon, 10 May 2021 15:20:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/25] edid: use dta extension block descriptors
Date: Mon, 10 May 2021 15:20:30 +0200
Message-Id: <20210510132051.2208563-5-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
References: <20210510132051.2208563-1-kraxel@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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

When the 4 descriptors in the base edid block are filled, jump to the
dta extension block.  This allows for more than four descriptors.
Happens for example when generating an edid blob with a serial number
(qemu-edid -s $serial).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-id: 20210427150824.638359-1-kraxel@redhat.com
Message-Id: <20210427150824.638359-5-kraxel@redhat.com>
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
2.31.1


