Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4CC60C7F9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:25:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onG8F-0006B9-Hp; Tue, 25 Oct 2022 05:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onG7q-0004JN-Rb
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onG7l-00057B-Va
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666689688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ga9m9IXNXR3JW79/k0+o+pMR7WOnjVEePK4If57Obsg=;
 b=UAkKd6dkw/O9kEnAh5HzZG7E8hfN9XYeFaVwSHex8pm4Wb1irsqWcCSHE0y0fFS9Z+1Ptq
 K9RIG237MDBm+kDeQdWCSreuzun2Yr3k6b2D0OZbT/sBTKVl2jSkVQDx4R1gWI6C0kDnO4
 /FEcDag6qEDS5yuA7fz6YVvJww3adMo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-oByVPARqOGCPwVGmf5F25w-1; Tue, 25 Oct 2022 05:21:23 -0400
X-MC-Unique: oByVPARqOGCPwVGmf5F25w-1
Received: by mail-qv1-f70.google.com with SMTP id
 q16-20020a0ce210000000b004ba8976d3aaso6358415qvl.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 02:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ga9m9IXNXR3JW79/k0+o+pMR7WOnjVEePK4If57Obsg=;
 b=mOwCT9zzdCOXH4tV+q3a64BUEUKJDvqjn2vAG9lTuh+kirHR6JL0jpFKmWzacShn3b
 2Wdo0bR0QwH0zYFjzaMwS2137ifPE1wsqpvGs5vofNjf3iceWA8gYn4mfoCdMrarrzIE
 NFUFGKC5ttDT3Xq/93YcUlJDoKWtj1hIvoUYeo+hhTJ1d8qAx5EgGIU+wY9M51yN+BS/
 AKvHB8jh2KiNf7ZqI53b7pT7E04qRyZizhYRDKVNnDUEmiikx2ZEiWZXJnaB2u6FRBtk
 nZA10ZVhVjK7KiV2qV2MKNwgbeZn/s5qZarqM7PAfZYw1gChucEmQzRMixxpVQF8k9sE
 GVZw==
X-Gm-Message-State: ACrzQf2bspdl1oVL3CO8aKk+wnlx+8wbkP7qEg34cVcQa13ldZqEBQUu
 U/SV08XLIbvq1ZtYdZkFVbn2kSrazZymB8kO6mORv08wf0yG5rxsxUlNMZ0kiib3QHW1Tzt+/Ku
 ZAqfVexWsB2/CWnHKD4IhQgVxWKo3GlNL8vNXAo/1u1EoS3hzrv3DZxA70/+Er17r1nY=
X-Received: by 2002:a0c:ab84:0:b0:4b3:f42b:2f18 with SMTP id
 j4-20020a0cab84000000b004b3f42b2f18mr31983424qvb.125.1666689682243; 
 Tue, 25 Oct 2022 02:21:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6R56ky5pgpCTvtxG9C/qr69pepgvHe3dTUicMI/Cd/ivrS+f2d5Jj7gvv+oBeBrwwbKWIVLg==
X-Received: by 2002:a0c:ab84:0:b0:4b3:f42b:2f18 with SMTP id
 j4-20020a0cab84000000b004b3f42b2f18mr31983410qvb.125.1666689681959; 
 Tue, 25 Oct 2022 02:21:21 -0700 (PDT)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 b6-20020ac812c6000000b0039ccbf75f92sm1339944qtj.11.2022.10.25.02.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 02:21:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: groug@kaod.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] util/log: do not close and reopen log files when flags are
 turned off
Date: Tue, 25 Oct 2022 11:21:19 +0200
Message-Id: <20221025092119.236224-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

log_append makes sure that if you turn off the logging (which clears
log_flags and makes need_to_open_file false) the old log is not
overwritten.  The usecase is that if you remove or move the file
QEMU will not keep writing to the old file.  However, this is
not always the desited behavior, in particular having log_append==1
after changing the file name makes little sense.

When qemu_set_log_internal is called from the logfile monitor
command, filename must be non-NULL and therefore changed_name must
be true.  Therefore, the only case where the file is closed and
need_to_open_file == false is indeed when log_flags becomes
zero.  In this case, just flush the file and do not bother
closing it, thus faking the same append behavior as previously.

The behavioral change is that changing the logfile twice, for
example log1 -> log2 -> log1, will cause log1 to be overwritten.
This can simply be documented, since it is not a particularly
surprising behavior.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/log.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/util/log.c b/util/log.c
index d6eb0378c3a3..06d0173788dc 100644
--- a/util/log.c
+++ b/util/log.c
@@ -44,7 +44,6 @@ static FILE *global_file;
 static __thread FILE *thread_file;
 
 int qemu_loglevel;
-static bool log_append;
 static bool log_per_thread;
 static GArray *debug_regions;
 
@@ -259,19 +258,19 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
     daemonized = is_daemonized();
     need_to_open_file = log_flags && !per_thread && (!daemonized || filename);
 
-    if (logfile && (!need_to_open_file || changed_name)) {
-        qatomic_rcu_set(&global_file, NULL);
-        if (logfile != stderr) {
+    if (logfile) {
+        fflush(logfile);
+        if (changed_name && logfile != stderr) {
             RCUCloseFILE *r = g_new0(RCUCloseFILE, 1);
             r->fd = logfile;
             call_rcu(r, rcu_close_file, rcu);
+            logfile = NULL;
         }
-        logfile = NULL;
     }
 
     if (!logfile && need_to_open_file) {
         if (filename) {
-            logfile = fopen(filename, log_append ? "a" : "w");
+            logfile = fopen(filename, "w");
             if (!logfile) {
                 error_setg_errno(errp, errno, "Error opening logfile %s",
                                  filename);
@@ -290,8 +289,6 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             logfile = stderr;
         }
 
-        log_append = 1;
-
         qatomic_rcu_set(&global_file, logfile);
     }
     return true;
-- 
2.37.3


