Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9214433D600
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:46:08 +0100 (CET)
Received: from localhost ([::1]:46560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAxT-0003Z5-Hg
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMAq3-0003hI-Es
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMApz-0002Cy-Cs
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615905502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSJsXWasRkayCSP91pEA9yKn6iwqOO3h/LeAuZ+zMH0=;
 b=frnddptCktTd3OZRZrvkNHGvP+BWr7Ws5QdpExjyaCpQkg7m2PtiU49MfAi96MfcGqYQV4
 Z5Rgn9xseHdFNg8YTj2qSKBkqtendDToH/Zh4U6tiArtNtmYP187s7dqlxNf7Rk3/8A1lR
 vPNFPQ9cfjkI5UvOIJd84Sp4fJZj1p8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-cvR_ZsRaMTiKHCsbYSmF8A-1; Tue, 16 Mar 2021 10:38:20 -0400
X-MC-Unique: cvR_ZsRaMTiKHCsbYSmF8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 345E383DD20;
 Tue, 16 Mar 2021 14:38:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0EBA189B6;
 Tue, 16 Mar 2021 14:38:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8ED571800631; Tue, 16 Mar 2021 15:38:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] edid: allow arbitrary-length checksums
Date: Tue, 16 Mar 2021 15:38:11 +0100
Message-Id: <20210316143812.2363588-9-kraxel@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Konstantin Nazarov <mail@knazarov.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Konstantin Nazarov <mail@knazarov.com>

Some of the EDID extensions like DisplayID do checksums of their
subsections. Currently checksums can be only applied to the whole
extension blocks which are 128 bytes.

This patch allows to checksum arbitrary parts of EDID, and not only
whole extension blocks.

Based-on: <20210303152948.59943-2-akihiko.odaki@gmail.com>
Signed-off-by: Konstantin Nazarov <mail@knazarov.com>
Message-Id: <20210315114639.91953-2-mail@knazarov.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/edid-generate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index b70ab1557e50..bdd01571fc9b 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -159,17 +159,17 @@ static void edid_fill_modes(uint8_t *edid, uint8_t *xtra3, uint8_t *dta,
     }
 }
 
-static void edid_checksum(uint8_t *edid)
+static void edid_checksum(uint8_t *edid, size_t len)
 {
     uint32_t sum = 0;
     int i;
 
-    for (i = 0; i < 127; i++) {
+    for (i = 0; i < len; i++) {
         sum += edid[i];
     }
     sum &= 0xff;
     if (sum) {
-        edid[127] = 0x100 - sum;
+        edid[len] = 0x100 - sum;
     }
 }
 
@@ -474,9 +474,9 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     /* =============== finish up =============== */
 
-    edid_checksum(edid);
+    edid_checksum(edid, 127);
     if (dta) {
-        edid_checksum(dta);
+        edid_checksum(dta, 127);
     }
 }
 
-- 
2.30.2


