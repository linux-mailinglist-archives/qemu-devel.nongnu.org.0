Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B634CD9A5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:04:39 +0100 (CET)
Received: from localhost ([::1]:36148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBM6-00075I-U4
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:04:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5l-0005Dj-GD
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5j-0007O6-Bi
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQ3yX4+TxUQH7ImpbVJ4gb/wFmuNna03REPwdKl9+XQ=;
 b=E1MAPQ602YWV7FTzg/6kcrhy+wRlQbmf4Uu/9NcrVQV5fozUag4BdawP4xzGkj+u0x2h0X
 ArViEcheOapN5l+r/+5k2wJGNtH3NYKW8lqCWaYvU9xbZwGcGFedHjf+3aqTXurPrVuvMK
 7Fdopio4cessVWjKRmKeX0kuhG3MkB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-N5K8W8gNM2-UBly4cMTl9Q-1; Fri, 04 Mar 2022 11:47:38 -0500
X-MC-Unique: N5K8W8gNM2-UBly4cMTl9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EFB71006AB4;
 Fri,  4 Mar 2022 16:47:36 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 739E283BF9;
 Fri,  4 Mar 2022 16:47:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/50] main loop: macros to mark GS and I/O functions
Date: Fri,  4 Mar 2022 17:46:36 +0100
Message-Id: <20220304164711.474713-16-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Righ now, IO_CODE and IO_OR_GS_CODE are nop, as there isn't
really a way to check that a function is only called in I/O.
On the other side, we can use qemu_in_main_thread() to check if
we are in the main loop.

The usage of macros makes easy to extend them in the future without
making changes in all callers. They will also visually help understanding
in which category each function is, without looking at the header.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220303151616.325444-3-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.35.1


