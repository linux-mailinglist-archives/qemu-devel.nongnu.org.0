Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BCE33D5F0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:40:38 +0100 (CET)
Received: from localhost ([::1]:59018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAs8-0005JH-VW
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMApy-0003dm-Gz
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMApw-0002Ab-O5
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615905500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HenKwa4hoM0V49zGIkl82eGf1JLIKcUT10BtqC1W4jo=;
 b=VK2SwZZdXL8aNZWZL/toMRkPAVysjEFvhYdLjeSORo9/21DObjbw3t29nbNHtJ/+4FYd6+
 vmZi0t1xzOhd0ahFsheuquGMXZ5QFeVqQdCVwNvBiCnsAqW3qYHV7xvxZ1mi+drVA3KsNI
 z90PsF2dqckOYTCc27n0Oz1mqG1G8lI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-zfOeyHqxMzyW8l_gOTzJBw-1; Tue, 16 Mar 2021 10:38:18 -0400
X-MC-Unique: zfOeyHqxMzyW8l_gOTzJBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8175C100C665
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:38:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA04C5B4B6;
 Tue, 16 Mar 2021 14:38:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 579CF180062A; Tue, 16 Mar 2021 15:38:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] edid: move xtra3 descriptor
Date: Tue, 16 Mar 2021 15:38:06 +0100
Message-Id: <20210316143812.2363588-4-kraxel@redhat.com>
In-Reply-To: <20210316143812.2363588-1-kraxel@redhat.com>
References: <20210316143812.2363588-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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

Initialize the "Established timings III" block earlier.  Also move up
edid_fill_modes().  That'll make sure the offset for the additional
descriptors in the dta block don't move any more, which in turn makes it
easier to actually use them.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/edid-generate.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index ef7a70fc9654..259ef7315217 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -415,25 +415,28 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
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
@@ -441,7 +444,6 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     /* =============== finish up =============== */
 
-    edid_fill_modes(edid, xtra3, dta, info->maxx, info->maxy);
     edid_checksum(edid);
     if (dta) {
         edid_checksum(dta);
-- 
2.30.2


