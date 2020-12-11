Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B99E2D8197
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 23:09:56 +0100 (CET)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knqbq-0003Pa-DQ
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 17:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqXx-0001bU-3B
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:05:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqXr-0006DI-9U
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607724345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Phk3lo4bzx8IV8gpStB5TCCGVdAThN5k/nbEt7JmcM=;
 b=LTW8EASnFBLyjVP2KnxnDX0M47o7lxfUz/0z038lwYuqo1LRGIZeThHDsrSddC4oLDvSI+
 duV46FEMdV5g6JZrTChicr3Q87YdNEnOB1MMrZdKF+zqDbSETIft1wh9jFLGiJ2/GEtzgY
 e4yjQyX2zt0PKV9AwvGN7Q9JqBNRS4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-EMkkuT45PkGP4-JpngWD8Q-1; Fri, 11 Dec 2020 17:05:43 -0500
X-MC-Unique: EMkkuT45PkGP4-JpngWD8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99B6319251A0;
 Fri, 11 Dec 2020 22:05:42 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9715C19C78;
 Fri, 11 Dec 2020 22:05:35 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/32] cs4231: Get rid of empty property array
Date: Fri, 11 Dec 2020 17:04:58 -0500
Message-Id: <20201211220529.2290218-2-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-1-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An empty props array is unnecessary, we can just not call
device_class_set_props().

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/audio/cs4231.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/audio/cs4231.c b/hw/audio/cs4231.c
index 8e9554ce9b..209c05a0a0 100644
--- a/hw/audio/cs4231.c
+++ b/hw/audio/cs4231.c
@@ -160,17 +160,12 @@ static void cs4231_init(Object *obj)
     sysbus_init_irq(dev, &s->irq);
 }
 
-static Property cs4231_properties[] = {
-    {.name = NULL},
-};
-
 static void cs4231_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->reset = cs_reset;
     dc->vmsd = &vmstate_cs4231;
-    device_class_set_props(dc, cs4231_properties);
 }
 
 static const TypeInfo cs4231_info = {
-- 
2.28.0


