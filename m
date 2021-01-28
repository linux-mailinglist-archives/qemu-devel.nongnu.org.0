Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFF9307007
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 08:48:07 +0100 (CET)
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l522A-0000OZ-Mj
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 02:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l51zO-0007QR-3C
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:45:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l51zM-00016Q-Do
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 02:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611819911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VL+ekJODqxjNaLxnvQu8HRAMYkDrL6rTA8VRg7IS6nY=;
 b=WsIn1Bazyki2HoQ/kQdkqMLtRHotk8CogYdWrT3DkDItrzL0XpTDxOyQL/0chV3ijCJah6
 TCKwshn4BZ11VOEnhcYJbyT2BwYwYiTQY00XEJJ1uTgIKHsMvsdMLGVe3iJrW4MGRfGl+M
 njKn4kBQDWz9NeeOdBsBPKwWPVRmLBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-L6ND5xJsM-21pcTqp02aRg-1; Thu, 28 Jan 2021 02:45:09 -0500
X-MC-Unique: L6ND5xJsM-21pcTqp02aRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2ED41075644;
 Thu, 28 Jan 2021 07:45:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46769779CD;
 Thu, 28 Jan 2021 07:45:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CDADB1138468; Thu, 28 Jan 2021 08:45:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] qapi: Introduce QAPI_LIST_APPEND
Date: Thu, 28 Jan 2021 08:45:04 +0100
Message-Id: <20210128074506.2725379-4-armbru@redhat.com>
In-Reply-To: <20210128074506.2725379-1-armbru@redhat.com>
References: <20210128074506.2725379-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

Similar to the existing QAPI_LIST_PREPEND, but designed for use where
we want to preserve insertion order.  Callers will be added in
upcoming patches.  Note the difference in signature: PREPEND takes
List*, APPEND takes List**.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210113221013.390592-4-eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/util.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 6178e98e97..d7bfb30e25 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -37,4 +37,17 @@ int parse_qapi_name(const char *name, bool complete);
     (list) = _tmp; \
 } while (0)
 
+/*
+ * For any pointer to a GenericList @tail (usually the 'next' member of a
+ * list element), insert @element at the back and update the tail.
+ *
+ * Note that this macro evaluates @element exactly once, so it is safe
+ * to have side-effects with that argument.
+ */
+#define QAPI_LIST_APPEND(tail, element) do { \
+    *(tail) = g_malloc0(sizeof(**(tail))); \
+    (*(tail))->value = (element); \
+    (tail) = &(*(tail))->next; \
+} while (0)
+
 #endif
-- 
2.26.2


