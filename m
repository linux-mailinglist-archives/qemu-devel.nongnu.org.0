Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F8D28E270
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 16:43:24 +0200 (CEST)
Received: from localhost ([::1]:55482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kShzv-000244-Os
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 10:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kShrD-00018g-Fo
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 10:34:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kShrB-00062d-CT
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 10:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602686060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yX9Atn/oAs+f+aU6AKWDNUDdWC6XOkb1ZXIEyYQiCpU=;
 b=eRhfQlFf/A3Zyjkd7h6l252Xductfz3eOLLYbGd7QV6JRoDbItyB5vFoO7WJUTA5/mGbrf
 cGPOIOpCAlObV4PUD2+OJW4fhRz9xBGKfN+GEWo1ugcV4ow38K4iQ43XtlgltydINB8bmy
 Stx0X3+goUmcItM+5Q5mvA/pa3Mvg8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-nscqqi0KPi-bigkJUDYHdQ-1; Wed, 14 Oct 2020 10:34:18 -0400
X-MC-Unique: nscqqi0KPi-bigkJUDYHdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9524E80EFBF;
 Wed, 14 Oct 2020 14:34:17 +0000 (UTC)
Received: from localhost (ovpn-66-44.rdu2.redhat.com [10.10.66.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 616375C1BD;
 Wed, 14 Oct 2020 14:34:17 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/10] rng-random: register "filename" as class property
Date: Wed, 14 Oct 2020 10:34:07 -0400
Message-Id: <20201014143415.240472-3-ehabkost@redhat.com>
In-Reply-To: <20201014143415.240472-1-ehabkost@redhat.com>
References: <20201014143415.240472-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 01:12:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20200921221045.699690-5-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 backends/rng-random.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/backends/rng-random.c b/backends/rng-random.c
index 245b12ab24..7add272edd 100644
--- a/backends/rng-random.c
+++ b/backends/rng-random.c
@@ -108,10 +108,6 @@ static void rng_random_init(Object *obj)
 {
     RngRandom *s = RNG_RANDOM(obj);
 
-    object_property_add_str(obj, "filename",
-                            rng_random_get_filename,
-                            rng_random_set_filename);
-
     s->filename = g_strdup("/dev/urandom");
     s->fd = -1;
 }
@@ -134,6 +130,10 @@ static void rng_random_class_init(ObjectClass *klass, void *data)
 
     rbc->request_entropy = rng_random_request_entropy;
     rbc->opened = rng_random_opened;
+    object_class_property_add_str(klass, "filename",
+                                  rng_random_get_filename,
+                                  rng_random_set_filename);
+
 }
 
 static const TypeInfo rng_random_info = {
-- 
2.28.0


