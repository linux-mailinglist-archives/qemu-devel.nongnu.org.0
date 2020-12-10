Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B7D2D6A94
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 23:46:38 +0100 (CET)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knUho-0000D0-Io
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 17:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knUdi-0007hM-DU
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 17:42:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knUdg-0001qh-1c
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 17:42:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607640138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcfywAObyBZcxRzXRmg08y3zLHYNWFbpZZoBIhdCEjY=;
 b=igc/YcT8qFyMePBcO5pZsYfRekI6SBn1C/1OVQp/390UWe/zxHXZdtKaK9Jd3WkVhRlogq
 EP70KzL1HukX3jGvfGUt8vo0f4BUcP/8BD4brbMBJo1jf1yqjFilW/TFWr/hB/iveGJ6Sn
 VeKnZKCrjXmKlCNy3YzTDew0vWHa6Ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-Vy5XeawxN6K9L7S-lkvlEg-1; Thu, 10 Dec 2020 17:42:16 -0500
X-MC-Unique: Vy5XeawxN6K9L7S-lkvlEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89E3110054FF;
 Thu, 10 Dec 2020 22:42:15 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F35585D9CC;
 Thu, 10 Dec 2020 22:42:14 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/3] qom: code hardening - have bound checking while looping
 with integer value
Date: Thu, 10 Dec 2020 17:42:10 -0500
Message-Id: <20201210224212.2052368-2-ehabkost@redhat.com>
In-Reply-To: <20201210224212.2052368-1-ehabkost@redhat.com>
References: <20201210224212.2052368-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

Object property insertion code iterates over an integer to get an unused
index that can be used as an unique name for an object property. This loop
increments the integer value indefinitely. Although very unlikely, this can
still cause an integer overflow.
In this change, we fix the above code by checking against INT16_MAX and making
sure that the interger index does not overflow beyond that value. If no
available index is found, the code would cause an assertion failure. This
assertion failure is necessary because the callers of the function do not check
the return value for NULL.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20200921093325.25617-1-ani@anisinha.ca>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qom/object.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 1065355233..e73d70a993 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1196,11 +1196,11 @@ object_property_try_add(Object *obj, const char *name, const char *type,
 
     if (name_len >= 3 && !memcmp(name + name_len - 3, "[*]", 4)) {
         int i;
-        ObjectProperty *ret;
+        ObjectProperty *ret = NULL;
         char *name_no_array = g_strdup(name);
 
         name_no_array[name_len - 3] = '\0';
-        for (i = 0; ; ++i) {
+        for (i = 0; i < INT16_MAX; ++i) {
             char *full_name = g_strdup_printf("%s[%d]", name_no_array, i);
 
             ret = object_property_try_add(obj, full_name, type, get, set,
@@ -1211,6 +1211,7 @@ object_property_try_add(Object *obj, const char *name, const char *type,
             }
         }
         g_free(name_no_array);
+        assert(ret);
         return ret;
     }
 
-- 
2.28.0


