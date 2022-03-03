Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE2C4CC127
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:26:10 +0100 (CET)
Received: from localhost ([::1]:47224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnLF-0004Gj-AK
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:26:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnDB-0006O5-OM
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:17:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnD4-0004cO-U1
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y95+N3JSIztIail7ONqot9F002nDEL9u0i8+hpVDIQE=;
 b=XQjUlMgiRaxFpWr0sYnqQ2B/0YvRzMt8D2ZZcozUTIrTWgELjlmj81Vd6nfqC2IKGVbSMv
 tB1MunjNykP07wuX5BQos74r7RyU303bU6t2ELmfStcNsFJGhNWSmIT79sKh+5j+Awcclo
 DdVivGig/g5P233oQRrDU5C1TBco4VY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-9kR138TpO3O8WWDVLNvtfw-1; Thu, 03 Mar 2022 10:17:39 -0500
X-MC-Unique: 9kR138TpO3O8WWDVLNvtfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D74CC801AFE;
 Thu,  3 Mar 2022 15:17:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3575F7BCD7;
 Thu,  3 Mar 2022 15:17:24 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 02/31] main loop: macros to mark GS and I/O functions
Date: Thu,  3 Mar 2022 10:15:47 -0500
Message-Id: <20220303151616.325444-3-eesposit@redhat.com>
In-Reply-To: <20220303151616.325444-1-eesposit@redhat.com>
References: <20220303151616.325444-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Righ now, IO_CODE and IO_OR_GS_CODE are nop, as there isn't
really a way to check that a function is only called in I/O.
On the other side, we can use qemu_in_main_thread() to check if
we are in the main loop.

The usage of macros makes easy to extend them in the future without
making changes in all callers. They will also visually help understanding
in which category each function is, without looking at the header.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/main-loop.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index bc42b5939d..7a4d6a0920 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -269,6 +269,24 @@ bool qemu_mutex_iothread_locked(void);
  */
 bool qemu_in_main_thread(void);
 
+/* Mark and check that the function is part of the global state API. */
+#define GLOBAL_STATE_CODE()                                         \
+    do {                                                            \
+        assert(qemu_in_main_thread());                              \
+    } while (0)
+
+/* Mark and check that the function is part of the I/O API. */
+#define IO_CODE()                                                   \
+    do {                                                            \
+        /* nop */                                                   \
+    } while (0)
+
+/* Mark and check that the function is part of the "I/O OR GS" API. */
+#define IO_OR_GS_CODE()                                             \
+    do {                                                            \
+        /* nop */                                                   \
+    } while (0)
+
 /**
  * qemu_mutex_lock_iothread: Lock the main loop mutex.
  *
-- 
2.31.1


