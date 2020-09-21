Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C857B27358B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 00:16:12 +0200 (CEST)
Received: from localhost ([::1]:49074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKU6V-00051X-Oz
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 18:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU1Y-00087n-Vl
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 18:11:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU1W-0001Xo-Q8
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 18:11:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600726262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cm0wZ96Hx83LamUchOidKAKEg6G6W1l95JZsvlEZw70=;
 b=H3sgafQDjzL0zlGnbOsWU8meW0267bZCg9kXsqHhQOFH2hLiN5Ve0wirBTLawVbKIdrgea
 oOd+zg+W8Y/0QfLgaX3khdRIIvpPykuldtU+/1yz+P3rPdk9dqXHoDww9wzHxAJF1FPBfg
 yTe6yIWsryN8qolMKXR7ehR+ob+vqHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-BvPXWaZfN-eFzZf1hcOhzw-1; Mon, 21 Sep 2020 18:11:00 -0400
X-MC-Unique: BvPXWaZfN-eFzZf1hcOhzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4556C1007465;
 Mon, 21 Sep 2020 22:10:59 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0806A1A925;
 Mon, 21 Sep 2020 22:10:58 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/24] rng: Register "opened" as class property
Date: Mon, 21 Sep 2020 18:10:28 -0400
Message-Id: <20200921221045.699690-8-ehabkost@redhat.com>
In-Reply-To: <20200921221045.699690-1-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:44:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Amit Shah <amit@kernel.org>
Cc: qemu-devel@nongnu.org
---
 backends/rng.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/backends/rng.c b/backends/rng.c
index 484f04e8916..3757b044855 100644
--- a/backends/rng.c
+++ b/backends/rng.c
@@ -105,10 +105,6 @@ static void rng_backend_init(Object *obj)
     RngBackend *s = RNG_BACKEND(obj);
 
     QSIMPLEQ_INIT(&s->requests);
-
-    object_property_add_bool(obj, "opened",
-                             rng_backend_prop_get_opened,
-                             rng_backend_prop_set_opened);
 }
 
 static void rng_backend_finalize(Object *obj)
@@ -123,6 +119,10 @@ static void rng_backend_class_init(ObjectClass *oc, void *data)
     UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
 
     ucc->complete = rng_backend_complete;
+
+    object_class_property_add_bool(oc, "opened",
+                                   rng_backend_prop_get_opened,
+                                   rng_backend_prop_set_opened);
 }
 
 static const TypeInfo rng_backend_info = {
-- 
2.26.2


