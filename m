Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398476535C7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:02:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Pv-0000Nm-40; Wed, 21 Dec 2022 13:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pl-0000It-8S
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pi-0004Ew-4a
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qEV568ljp5mMfHH8uRbvJL9dTMC1wyo3LHximeavPI0=;
 b=XTeSw9e4ZOjmsyh0z6U6XEjLHpEy7q6ZOcJDRZ6y/JaFYBXgpfDaX3WDkJiLL+ArDvjSz6
 +QKMICXJV3igHH/TXzFGcn51/V58l2KliZcMTWq/tA143w8TbgX95wCGQ1TGjRJpDts1Wq
 zKCUu6glceXAgPGsMXwKT7e+UQZXuWA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-QJgf4zW7NdySzQzgP-b2gw-1; Wed, 21 Dec 2022 13:01:54 -0500
X-MC-Unique: QJgf4zW7NdySzQzgP-b2gw-1
Received: by mail-ed1-f69.google.com with SMTP id
 h8-20020a056402280800b0046af59e0986so12038577ede.22
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qEV568ljp5mMfHH8uRbvJL9dTMC1wyo3LHximeavPI0=;
 b=A0M2u8nyIMNuZgsS0/lBgsmrXWHNF4OmvXXXuVAma91oqhA+izTQZEyhBKBZMSIokT
 Lv79AhuKYvcxhfs+nHdZWYwNfdRugs/UPO3UosUCqeOTqaX62B+MWwUGzlyhyVRa4cMp
 +6lafn+Kb7iyD8HPhHuvmvfHyBN2QDMlnKY29UKhyhM9PPPi19p2LlhiFwZS6GARroOQ
 XL+IfI9goL+dzcxclitTLzJ9qqG7p46yl5XdCGxlulplRG99qI6X+/t6MFMe9T+TfDm5
 8OW4TXKgGN+95ZgfzSfpBts1cP52PRWx6dHcr0LTcejth4H2qJxNLWtn43P5jNlUssWe
 UYFQ==
X-Gm-Message-State: AFqh2kriruXJKG2LQEPVLRwDvvudB0xjlfPJDjV9XW6qKTWqn2bNuirL
 SzQgNvx5mvZPnJP4J/7fT45Qus1FvsLkyyHnoC9HEbSbPkx3I0h4aa8vcqeb0gPm/hHgIL6Hei4
 Wsax0KTNs08w7jgqPFsK11TADtxpAollqlZxJRya12ITVR6Bylt+lUlwv775hdy+oLZU=
X-Received: by 2002:a17:906:6bc7:b0:7c1:1bc:7fd4 with SMTP id
 t7-20020a1709066bc700b007c101bc7fd4mr5654237ejs.42.1671645712810; 
 Wed, 21 Dec 2022 10:01:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsAtOqHv8BtgZpRPSwST1zjeeLsZfRllq3zD42v7Pfoo6fOLRUyY4TsCE2e4UpVeuVMxYedXA==
X-Received: by 2002:a17:906:6bc7:b0:7c1:1bc:7fd4 with SMTP id
 t7-20020a1709066bc700b007c101bc7fd4mr5654212ejs.42.1671645712590; 
 Wed, 21 Dec 2022 10:01:52 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 27-20020a170906309b00b008369cf730e1sm2511299ejv.187.2022.12.21.10.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:01:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>
Subject: [PULL 03/24] util/log: do not close and reopen log files when flags
 are turned off
Date: Wed, 21 Dec 2022 19:01:20 +0100
Message-Id: <20221221180141.839616-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20221025092119.236224-1-pbonzini@redhat.com>
[groug: nullify global_file before actually closing the file]
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20221108140032.1460307-2-groug@kaod.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/log.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/util/log.c b/util/log.c
index c2198badf240..fb843453dd49 100644
--- a/util/log.c
+++ b/util/log.c
@@ -45,7 +45,6 @@ static __thread FILE *thread_file;
 static __thread Notifier qemu_log_thread_cleanup_notifier;
 
 int qemu_loglevel;
-static bool log_append;
 static bool log_per_thread;
 static GArray *debug_regions;
 
@@ -277,19 +276,20 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
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
+            qatomic_rcu_set(&global_file, NULL);
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
@@ -308,8 +308,6 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             logfile = stderr;
         }
 
-        log_append = 1;
-
         qatomic_rcu_set(&global_file, logfile);
     }
     return true;
-- 
2.38.1


