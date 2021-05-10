Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CBA378CBC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:26:30 +0200 (CEST)
Received: from localhost ([::1]:55490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5vZ-0006gD-KH
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5qq-0003LV-13
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5qo-0002gG-Gj
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0bO8RSJ7bdcLngjNX39kWm+/fa8yTU81+qjvWUePQo=;
 b=KpYFICB5btD/htE+GNYRi3brx7+jBYoo07Xfe25D6ZOAEHwhggq6lzxStZJiwKDaP3sOps
 iW1KTR68mwxo6JVZe0SBU0XPe1rp5urPXwPukDpzk5k/TeCPRKMcggvUhJV6DPKRVHOKgR
 foonciFvq4SVtsBJgKJ8eUxjeEy85Gg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-XCeI1V4UNWOKR2q7JcRClg-1; Mon, 10 May 2021 09:21:32 -0400
X-MC-Unique: XCeI1V4UNWOKR2q7JcRClg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75405800FF0
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:21:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7BE760CC5;
 Mon, 10 May 2021 13:21:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 34B431800393; Mon, 10 May 2021 15:20:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/25] edid: move xtra3 descriptor
Date: Mon, 10 May 2021 15:20:29 +0200
Message-Id: <20210510132051.2208563-4-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
References: <20210510132051.2208563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Initialize the "Established timings III" block earlier.  Also move up
edid_fill_modes().  That'll make sure the offset for the additional
descriptors in the dta block don't move any more, which in turn makes it
easier to actually use them.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-id: 20210427150824.638359-1-kraxel@redhat.com
Message-Id: <20210427150824.638359-4-kraxel@redhat.com>
---
 hw/display/edid-generate.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index ae34999f9eb5..25f790c7bd85 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -416,25 +416,28 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
                      width_mm, height_mm);
     desc = edid_desc_next(edid, dta, desc);
 
+    xtra3 = desc;
+    edid_desc_xtra3_std(xtra3);
+    desc = edid_desc_next(edid, dta, desc);
+    edid_fill_modes(edid, xtra3, dta, info->maxx, info->maxy);
+    /*
+     * dta video data block is finished at thus point,
+     * so dta descriptor offsets don't move any more.
+     */
+
     edid_desc_ranges(desc);
     desc = edid_desc_next(edid, dta, desc);
 
-    if (info->name) {
+    if (desc && info->name) {
         edid_desc_text(desc, 0xfc, info->name);
         desc = edid_desc_next(edid, dta, desc);
     }
 
-    if (info->serial) {
+    if (desc && info->serial) {
         edid_desc_text(desc, 0xff, info->serial);
         desc = edid_desc_next(edid, dta, desc);
     }
 
-    if (desc) {
-        xtra3 = desc;
-        edid_desc_xtra3_std(xtra3);
-        desc = edid_desc_next(edid, dta, desc);
-    }
-
     while (desc) {
         edid_desc_dummy(desc);
         desc = edid_desc_next(edid, dta, desc);
@@ -442,7 +445,6 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     /* =============== finish up =============== */
 
-    edid_fill_modes(edid, xtra3, dta, info->maxx, info->maxy);
     edid_checksum(edid);
     if (dta) {
         edid_checksum(dta);
-- 
2.31.1


