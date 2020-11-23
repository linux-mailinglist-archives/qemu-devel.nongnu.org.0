Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150EC2C14CE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:55:07 +0100 (CET)
Received: from localhost ([::1]:34992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHvW-0003Bg-2M
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:55:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpU-0006LU-Ks
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpS-0007oQ-U7
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cncQvyDF3qST/A6nlydMpiZQm6aE4PDxnshRSm7PJcw=;
 b=LyhvHISgRXCaZXbrpvdSR3ZfqoClxsXDgPQYWc3T0KjlFofTqjRA7wdvfJ8y2N25A0wYgQ
 /MzjLxdCp6oKWY76H4aZ/eLTE/O7825ZdmTh9WwXD0ymdUwro01VW4EsqG+h3rjhfFWulm
 AlNACv78pTlb4/oakegZMbIrUG+IkmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-A75gBqMFP1OfzjuQU3aU_g-1; Mon, 23 Nov 2020 14:48:48 -0500
X-MC-Unique: A75gBqMFP1OfzjuQU3aU_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E1508030D3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:48:47 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0980C60C04;
 Mon, 23 Nov 2020 19:48:46 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/19] qlit: Support all types of QNums
Date: Mon, 23 Nov 2020 14:48:09 -0500
Message-Id: <20201123194818.2773508-11-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two new macros to support other types of QNums:
QLIT_QNUM_UINT, and QLIT_QNUM_DOUBLE, and include them
in the qlit_equal_qobject_test() test case.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* QLIT_QNUM macro doesn't exist anymore
* Addition of the QNumValue field to QLitObject is
  now in a separate patch ("qlit: Use QNumValue to represent QNums")
* check-qjson test case changes dropped.
  Instead, I'm only extending the qlit_equal_qobject_test() test
  case.

Changes v1 -> v2:
* Coding style fix at qlit_equal_qobject()
---
 include/qapi/qmp/qlit.h | 4 ++++
 tests/check-qlit.c      | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/include/qapi/qmp/qlit.h b/include/qapi/qmp/qlit.h
index a240cdd299..a2881b7f42 100644
--- a/include/qapi/qmp/qlit.h
+++ b/include/qapi/qmp/qlit.h
@@ -42,6 +42,10 @@ struct QLitDictEntry {
     { .type = QTYPE_QBOOL, .value.qbool = (val) }
 #define QLIT_QNUM_INT(val) \
     { .type = QTYPE_QNUM, .value.qnum = QNUM_VAL_INT(val) }
+#define QLIT_QNUM_UINT(val) \
+    { .type = QTYPE_QNUM, .value.qnum = QNUM_VAL_UINT(val) }
+#define QLIT_QNUM_DOUBLE(val) \
+    { .type = QTYPE_QNUM, .value.qnum = QNUM_VAL_DOUBLE(val) }
 #define QLIT_QSTR(val) \
     { .type = QTYPE_QSTRING, .value.qstr = (val) }
 #define QLIT_QDICT(val) \
diff --git a/tests/check-qlit.c b/tests/check-qlit.c
index 5a9260b93f..31e90f8965 100644
--- a/tests/check-qlit.c
+++ b/tests/check-qlit.c
@@ -58,6 +58,11 @@ static void qlit_equal_qobject_test(void)
         QLIT_QNUM_INT(1),
         QLIT_QNUM_INT(INT64_MIN),
         QLIT_QNUM_INT(INT64_MAX),
+        QLIT_QNUM_UINT(UINT64_MAX),
+        /* Larger than UINT64_MAX: */
+        QLIT_QNUM_DOUBLE(18446744073709552e3),
+        /* Smaller than INT64_MIN: */
+        QLIT_QNUM_DOUBLE(-92233720368547758e2),
         QLIT_QSTR(""),
         QLIT_QSTR("foo"),
         qlit,
-- 
2.28.0


