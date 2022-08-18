Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D0D597EF7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 09:09:10 +0200 (CEST)
Received: from localhost ([::1]:50900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZeN-0007a0-02
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 03:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oOZSQ-0007uk-9D
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:56:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oOZSN-0001hJ-PE
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660805802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xe9XchB5CPZpmY83ZNGM6EgF0I3CDUZ/FQKGsh6frYQ=;
 b=h5VBmiKDDqvz3FJfjtWSGnOeWiKldoYtRO2qxX9wEuC0IkfWzC9PRB0+gowIcOJCrCMP5W
 J2/0Gg/WS19Jvfn/Tt68AYIHw+jym37PvJQ/hfr6Y8CQqJHF3yK6Cjxrioz+8zfG1qbFkg
 fvkQojcdPCciQZDEKexRYiel6baMylk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-CYoUFNY_Nl2ts5gkcp8rtQ-1; Thu, 18 Aug 2022 02:56:39 -0400
X-MC-Unique: CYoUFNY_Nl2ts5gkcp8rtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 742188032F6;
 Thu, 18 Aug 2022 06:56:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACFF1C15BBA;
 Thu, 18 Aug 2022 06:56:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, qemu-s390x@nongnu.org,
 Priyankar Jain <priyankar.jain@nutanix.com>
Subject: [PULL 1/3] dbus-vmstate: Restrict error checks to registered proxies
 in dbus_get_proxies
Date: Thu, 18 Aug 2022 10:56:29 +0400
Message-Id: <20220818065631.324170-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220818065631.324170-1-marcandre.lureau@redhat.com>
References: <20220818065631.324170-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Priyankar Jain <priyankar.jain@nutanix.com>

The purpose of dbus_get_proxies to construct the proxies corresponding to the
IDs registered to dbus-vmstate.

Currenty, this function returns an error in case there is any failure
while instantiating proxy for "all" the names on dbus.

Ideally this function should error out only if it is not able to find and
validate the proxies registered to the backend otherwise any offending
process(for eg: the process purposefully may not export its Id property on
the dbus) may connect to the dbus and can lead to migration failures.

This commit ensures that dbus_get_proxies returns an error if it is not
able to find and validate the proxies of interest(the IDs registered
during the dbus-vmstate instantiation).

Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <1637936117-37977-1-git-send-email-priyankar.jain@nutanix.com>
---
 backends/dbus-vmstate.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index 9cfd758c42..57369ec0f2 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -114,14 +114,19 @@ dbus_get_proxies(DBusVMState *self, GError **err)
                     "org.qemu.VMState1",
                     NULL, err);
         if (!proxy) {
-            return NULL;
+            if (err != NULL && *err != NULL) {
+                warn_report("%s: Failed to create proxy: %s",
+                            __func__, (*err)->message);
+                g_clear_error(err);
+            }
+            continue;
         }
 
         result = g_dbus_proxy_get_cached_property(proxy, "Id");
         if (!result) {
-            g_set_error_literal(err, G_IO_ERROR, G_IO_ERROR_FAILED,
-                                "VMState Id property is missing.");
-            return NULL;
+            warn_report("%s: VMState Id property is missing.", __func__);
+            g_clear_object(&proxy);
+            continue;
         }
 
         id = g_variant_dup_string(result, &size);
-- 
2.37.1


