Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097BF6195C1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 13:02:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqvOp-0008Bl-61; Fri, 04 Nov 2022 08:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oqvNw-0007gU-J9
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:01:20 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oqvNu-0003kw-7m
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:01:19 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-VpO-cxy7Pwe3M8VpEXY-7A-1; Fri, 04 Nov 2022 08:01:03 -0400
X-MC-Unique: VpO-cxy7Pwe3M8VpEXY-7A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E2EA800B23;
 Fri,  4 Nov 2022 12:01:03 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D1A549BB9A;
 Fri,  4 Nov 2022 12:01:02 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 1/2] util/log: Make the per-thread flag immutable
Date: Fri,  4 Nov 2022 13:00:58 +0100
Message-Id: <20221104120059.678470-2-groug@kaod.org>
In-Reply-To: <20221104120059.678470-1-groug@kaod.org>
References: <20221104120059.678470-1-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Per-thread logging was implemented under the assumption that once
enabled, it is not possible to switch back to single file logging.
This isn't enforced though and it is possible to go through the
global file opening sequence in per-thread mode. The code isn't
ready for this and produces unexpected results as detailed below.

Start QEMU in system emulation mode with `-D ./qemu.log.%d -d tid`
and then change the log level from the monitor to something that
doesn't have tid, e.g. `log cpu_reset`. The value of log_flags
is zero and per_thread is set to false : the rest of the code
then assumes it is running in the global log case and opens a
file named `qemu.log.%d`, which is obviously not an expected
behavior.

Enforce the immutability of the flag early in qemu_set_log_internal()
so that its value is correct for all subsequent users.

Fixes: 4e51069d6793 ("util/log: Support per-thread log files")
Cc: richard.henderson@linaro.org
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 util/log.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/util/log.c b/util/log.c
index 39866bdaf2fa..b7d2b6e09cfe 100644
--- a/util/log.c
+++ b/util/log.c
@@ -206,6 +206,11 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
     QEMU_LOCK_GUARD(&global_mutex);
     logfile = global_file;
 
+    /* The per-thread flag is immutable. */
+    if (log_per_thread) {
+        log_flags |= LOG_PER_THREAD;
+    }
+
     per_thread = log_flags & LOG_PER_THREAD;
 
     if (changed_name) {
-- 
2.38.1


