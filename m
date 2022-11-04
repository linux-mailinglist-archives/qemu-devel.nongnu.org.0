Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAF46195C6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 13:04:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqvQ7-0000MU-8q; Fri, 04 Nov 2022 08:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oqvPc-0000Eb-7s
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:03:08 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oqvPZ-00044l-OD
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:03:03 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-fYKI456xOoeQGzzuLSfqmg-1; Fri, 04 Nov 2022 08:01:05 -0400
X-MC-Unique: fYKI456xOoeQGzzuLSfqmg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30F16101A56C;
 Fri,  4 Nov 2022 12:01:05 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C16AA403161;
 Fri,  4 Nov 2022 12:01:03 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 2/2] util/log: Ignore per-thread flag if global file already
 there
Date: Fri,  4 Nov 2022 13:00:59 +0100
Message-Id: <20221104120059.678470-3-groug@kaod.org>
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

If QEMU is started with `-D qemu.log.%d` without any `-d` option,
doing `log all` in the monitor fails with:

Filename template with '%d' required for 'tid'

It is confusing since '%d' was actually passed.

This happens because QEMU caches the log file name with %d converted
to getpid() since `tid` wasn't required. This name isn't suitable
for a subsequent enablement of per-thread logs. There's little cause
to change the behavior as `-d tid` is mostly used at user-only startup.

Drop the per-thread from the requested flags in this case : `log all`
will thus enable everything except `tid` instead of failing. This is
preferable over forcing the user to enable each log item individually.

With this patch, `tid` is now truely immutable : it can only be set
or unset from the command line and never changed afterwards.

Fixes: 4e51069d6793 ("util/log: Support per-thread log files")
Cc: richard.henderson@linaro.org
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 util/log.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/util/log.c b/util/log.c
index b7d2b6e09cfe..c2198badf240 100644
--- a/util/log.c
+++ b/util/log.c
@@ -209,6 +209,10 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
     /* The per-thread flag is immutable. */
     if (log_per_thread) {
         log_flags |= LOG_PER_THREAD;
+    } else {
+        if (global_filename) {
+            log_flags &= ~LOG_PER_THREAD;
+        }
     }
 
     per_thread = log_flags & LOG_PER_THREAD;
-- 
2.38.1


