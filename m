Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAF41D50AA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 16:37:09 +0200 (CEST)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZbSW-00062w-5Z
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 10:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZbRC-0004HZ-7K
 for qemu-devel@nongnu.org; Fri, 15 May 2020 10:35:47 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47166
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZbR9-0007vm-NJ
 for qemu-devel@nongnu.org; Fri, 15 May 2020 10:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589553342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=03QHXNWGVGD1C4wx+MDVX+yQ3BCHvmKbLpHmsbNssOc=;
 b=X292NWz98vwxMHGISlXRKYwzB8Aba9r9/p9/fwCR+MkT/sajHQzaGi1VL95KTOjx5l1wzR
 U3618BTHnYJL+SVaqymCUvHef5yZeE1RU+HczV2SGnMf5CEQsi43Bj3EUh7cg3c5UZm8CF
 3ElD2A2CG8x7G6FUaCL+PKWhsegefk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-WKWMqqGWMOaOZRxj8RAHig-1; Fri, 15 May 2020 10:35:40 -0400
X-MC-Unique: WKWMqqGWMOaOZRxj8RAHig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0D4D18FF660
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 14:35:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-145.ams2.redhat.com
 [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A0625C241;
 Fri, 15 May 2020 14:35:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 16A399D54; Fri, 15 May 2020 16:35:29 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] audio: deprecate -soundhw gus
Date: Fri, 15 May 2020 16:35:23 +0200
Message-Id: <20200515143528.13591-9-kraxel@redhat.com>
In-Reply-To: <20200515143528.13591-1-kraxel@redhat.com>
References: <20200515143528.13591-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:39:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to deprecated_register_soundhw().
Remove the now obsolete init function.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/gus.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index eb4a803fb53b..61d16fad9ffb 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -292,12 +292,6 @@ static void gus_realizefn (DeviceState *dev, Error **errp)
     AUD_set_active_out (s->voice, 1);
 }
 
-static int GUS_init (ISABus *bus)
-{
-    isa_create_simple (bus, TYPE_GUS);
-    return 0;
-}
-
 static Property gus_properties[] = {
     DEFINE_AUDIO_PROPERTIES(GUSState, card),
     DEFINE_PROP_UINT32 ("freq",    GUSState, freq,        44100),
@@ -328,7 +322,7 @@ static const TypeInfo gus_info = {
 static void gus_register_types (void)
 {
     type_register_static (&gus_info);
-    isa_register_soundhw("gus", "Gravis Ultrasound GF1", GUS_init);
+    deprecated_register_soundhw("gus", "Gravis Ultrasound GF1", 1, TYPE_GUS);
 }
 
 type_init (gus_register_types)
-- 
2.18.4


