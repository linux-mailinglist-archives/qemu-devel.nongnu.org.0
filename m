Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4C836C881
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:18:23 +0200 (CEST)
Received: from localhost ([::1]:39570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPTi-0003HP-Q5
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbPKa-00040t-E0
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:08:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbPKY-0002JH-HH
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619536133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSJsXWasRkayCSP91pEA9yKn6iwqOO3h/LeAuZ+zMH0=;
 b=fSRXak3PGpOhJOctG0Q35ple/ncmU45CxMdnT29b1CAN/JsMHCLTEvPwdO7Y7/M3qKJQxm
 iKmGjmo24H4ax6yABSrZ97QwQtHUo/646UioQcpU29FqX2z0jRkNE7NDX5pZJpe7HpN/NT
 bFck2VKsGcj3GG60Q3amPSgzQWcr+Ts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-hruXWZGwNSGUN9OgLAfA-Q-1; Tue, 27 Apr 2021 11:08:51 -0400
X-MC-Unique: hruXWZGwNSGUN9OgLAfA-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5E19501E1;
 Tue, 27 Apr 2021 15:08:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39EE259472;
 Tue, 27 Apr 2021 15:08:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4195018007AF; Tue, 27 Apr 2021 17:08:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] edid: allow arbitrary-length checksums
Date: Tue, 27 Apr 2021 17:08:23 +0200
Message-Id: <20210427150824.638359-8-kraxel@redhat.com>
In-Reply-To: <20210427150824.638359-1-kraxel@redhat.com>
References: <20210427150824.638359-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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


