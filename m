Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EEC3E4DA9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 22:11:56 +0200 (CEST)
Received: from localhost ([::1]:38052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDBcp-0002uC-41
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 16:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDBYq-0004xr-MV
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDBYm-00006h-Hq
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628539664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIgbnmAk1MTxgh1VMrYDNcufmzWSLnnJHxV07hJlPK4=;
 b=RCGuQaXMEo6iIYkPgGmbwa4GK/gz/l4+nbluH1liJ6pKC1RDuMlEiexS09HJOMXmFRl91E
 U6xDXd2FkQssnQraKHx50khvz0vVxtQ1CMV0wsN5nzoqE1eS1uOtU9Ul8NAFWw7dlBUzvx
 OSzexU8hKQqhd0bnbE+yP5MMjup8ozQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-yIInA9JOM76EQI_BGR19jg-1; Mon, 09 Aug 2021 16:07:42 -0400
X-MC-Unique: yIInA9JOM76EQI_BGR19jg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F5191020C20;
 Mon,  9 Aug 2021 20:07:41 +0000 (UTC)
Received: from localhost (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6248A60854;
 Mon,  9 Aug 2021 20:07:41 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v3 1/2] qom: DECLARE_INTERFACE_CHECKER macro
Date: Mon,  9 Aug 2021 16:07:13 -0400
Message-Id: <20210809200714.887337-2-ehabkost@redhat.com>
In-Reply-To: <20210809200714.887337-1-ehabkost@redhat.com>
References: <20210809200714.887337-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new macro will be similar to DECLARE_INSTANCE_CHECKER,
but for interface types (that use INTEFACE_CHECK instead of
OBJECT_CHECK).

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes series v1 -> v2: none
Change series v2 -> v3:
* Rebased on top of
  [PATCH for-6.2 00/12] qom: Get rid of all manual usage of OBJECT_CHECK & friends
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/qom/object.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index faae0d841fe..4a9d7017d9f 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -178,6 +178,20 @@ struct Object
     OBJ_NAME(const void *obj) \
     { return OBJECT_CHECK(InstanceType, obj, TYPENAME); }
 
+/**
+ * DECLARE_INTERFACE_CHECKER:
+ * @InstanceType: instance type
+ * @OBJ_NAME: the object name in uppercase with underscore separators
+ * @TYPENAME: type name
+ *
+ * This macro will provide the instance type cast functions for a
+ * QOM interface type.
+ */
+#define DECLARE_INTERFACE_CHECKER(InstanceType, OBJ_NAME, TYPENAME) \
+    static inline G_GNUC_UNUSED InstanceType * \
+    OBJ_NAME(const void *obj) \
+    { return INTERFACE_CHECK(InstanceType, obj, TYPENAME); }
+
 /**
  * DECLARE_CLASS_CHECKERS:
  * @ClassType: class struct name
-- 
2.31.1


