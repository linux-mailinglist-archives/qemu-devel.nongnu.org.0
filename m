Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390AF604B2C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:23:22 +0200 (CEST)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olAue-0008Lc-Rr
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olAob-00043d-1i
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:17:05 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:35654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1olAoY-00022C-Sf
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:17:04 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-IxPVhthtOTucQyILKEnXCQ-1; Wed, 19 Oct 2022 11:16:55 -0400
X-MC-Unique: IxPVhthtOTucQyILKEnXCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 246F63C0219A;
 Wed, 19 Oct 2022 15:16:55 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 215349459C;
 Wed, 19 Oct 2022 15:16:54 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 1/2] util/log: Derive thread id from getpid() on hosts w/o
 gettid() syscall
Date: Wed, 19 Oct 2022 17:16:50 +0200
Message-Id: <20221019151651.334334-2-groug@kaod.org>
In-Reply-To: <20221019151651.334334-1-groug@kaod.org>
References: <20221019151651.334334-1-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

A subsequent patch needs to be able to differentiate the main QEMU
thread from other threads. An obvious way to do so is to compare
log_thread_id() and getpid(), based on the fact that they are equal
for the main thread on systems that have the gettid() syscall (e.g.
linux).

Adapt the fallback code for systems without gettid() to provide the
same assumption.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 util/log.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/log.c b/util/log.c
index d6eb0378c3a3..e1c2535cfcd2 100644
--- a/util/log.c
+++ b/util/log.c
@@ -72,8 +72,13 @@ static int log_thread_id(void)
 #elif defined(SYS_gettid)
     return syscall(SYS_gettid);
 #else
+    static __thread int my_id = -1;
     static int counter;
-    return qatomic_fetch_inc(&counter);
+
+    if (my_id == -1) {
+        my_id = getpid() + qatomic_fetch_inc(&counter);
+    }
+    return my_id;
 #endif
 }
 
-- 
2.37.3


