Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D32B2E225D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 23:17:43 +0100 (CET)
Received: from localhost ([::1]:42452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksCRy-0001L4-7A
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 17:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCM6-0004cj-3O
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCLy-0001tX-Lk
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608761489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pda4s9a3uiXxOEycJm85IWf06KW2M1U2IPACTKMWJkQ=;
 b=CpAQdnNciZLnrBC9igVme5w+iY+0ONb9L6zbOkOQ2eUKXzAxx3XAvRA6pRxjtoY0rHSCzV
 lt9lUHb7ie10WOFj844kxk/VlddJObPYHofo0is0gu3hcWtWXUPaX1L5QXZjf+Z7zXVj8C
 pyVb8EZaU74S7CbVNpye2qEBzzzASTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-5xh-iE9UN7O1mLDBO39HSw-1; Wed, 23 Dec 2020 17:11:27 -0500
X-MC-Unique: 5xh-iE9UN7O1mLDBO39HSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 710791005504;
 Wed, 23 Dec 2020 22:11:26 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-9.phx2.redhat.com [10.3.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9B475D74C;
 Wed, 23 Dec 2020 22:11:25 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] qapi: Introduce QAPI_LIST_APPEND
Date: Wed, 23 Dec 2020 16:11:00 -0600
Message-Id: <20201223221102.390740-6-eblake@redhat.com>
In-Reply-To: <20201223221102.390740-1-eblake@redhat.com>
References: <20201223221102.390740-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to the existing QAPI_LIST_PREPEND, but designed for use where
we want to preserve insertion order.  Callers will be added in
upcoming patches.  Note the difference in signature: PREPEND takes
List*, APPEND takes List**.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/qapi/util.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 6178e98e97a5..8b4967990c0d 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -37,4 +37,17 @@ int parse_qapi_name(const char *name, bool complete);
     (list) = _tmp; \
 } while (0)

+/*
+ * For any pointer to a GenericList @tail, insert @element at the back and
+ * update the tail.
+ *
+ * Note that this macro evaluates @element exactly once, so it is safe
+ * to have side-effects with that argument.
+ */
+#define QAPI_LIST_APPEND(tail, element) do { \
+    *(tail) = g_malloc0(sizeof(**(tail))); \
+    (*(tail))->value = (element); \
+    (tail) = &(*tail)->next; \
+} while (0)
+
 #endif
-- 
2.29.2


