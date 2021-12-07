Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600746BA7F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 12:56:35 +0100 (CET)
Received: from localhost ([::1]:60590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muZ5G-0000M1-Nd
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 06:56:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzk-0005jq-Jt
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzj-0004qz-0p
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638877849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T09as+BM23dap9ugeHe48STRkXtr+9Qwlc857UXESkg=;
 b=EOUeJdv7h0gbWhaK+BFh9ONj43rDlzHPorLgbkvay6GMVtK+xx9OlOaldSagpeZRDfRUaP
 +iKCWqeim3Xuud9W2ESwDB+erx/HOAYPRXCveubYZbo2EBjAkP+PV2C/R1XNT7sjkE3Gvt
 YA9GrUYtBao9BEw5halsCaw3S5L6mIM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-mVondn6qPOGvJeDhD4fAmQ-1; Tue, 07 Dec 2021 06:50:48 -0500
X-MC-Unique: mVondn6qPOGvJeDhD4fAmQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so2844702wro.21
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 03:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T09as+BM23dap9ugeHe48STRkXtr+9Qwlc857UXESkg=;
 b=4sOzt8328SR1q3yNnDG2ffVsTcqIPfE9Eyjt/3d4sK077Ij9ofCb+Z5NCuhvbT3Zvf
 LNR55SQ4bUovG3fckgFlpley1Hyr6QPQp7EeZZMixU4V0oS3JY7PrGF6ApA3n9pmiLKN
 FBWUD+CE+ReSY3G6jAlrETSyQh1pJcZQAmEdFoNjniKdneYGXDvpR/89/lzcXqK88sx9
 RMhAZlKsECEx579s01iQFoI9fUYUZWqEOO5AKJ0wbTthbDhEt0rB5piql0Z/QobKbbeC
 qDPvF2GWFPUBVbbYrhLbH/1tfGv4AT/RQTVyPJZ5Au3TISr7rX1KcdnVNTolbXpPW8Tz
 FgUg==
X-Gm-Message-State: AOAM531uSrqIr/afG7wp9X98mf5kweEB7ASlF8PFbw8Re/qORlfCqC9j
 E/k8SiQYILd3Qwj2PROkm0S1OsRttqDEKmtwK91ZSATpmXEMZ1uRTaN9axLAb3wzk1FG2u6lwsp
 pluwodKi403XQdcI9naPNuxJUGXYu2QQ6IiZyuYYWuox92qiuDHRqfi8oEgu38huW
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr6465040wmj.84.1638877847350; 
 Tue, 07 Dec 2021 03:50:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRhHKZxznmKE8vs1D/ydUO31XRbRevUOb4EibuxR1ArInxTS9DjyX7IqJ+6eHNN88K6KXN7A==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr6465006wmj.84.1638877847054; 
 Tue, 07 Dec 2021 03:50:47 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.177])
 by smtp.gmail.com with ESMTPSA id g18sm3023551wmq.4.2021.12.07.03.50.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 03:50:46 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] migration: Finer grained tracepoints for POSTCOPY_LISTEN
Date: Tue,  7 Dec 2021 19:50:16 +0800
Message-Id: <20211207115016.73195-8-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207115016.73195-1-peterx@redhat.com>
References: <20211207115016.73195-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The enablement of postcopy listening has a few steps, add a few tracepoints to
be there ready for some basic measurements for them.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/savevm.c     | 5 ++++-
 migration/trace-events | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 17b8e25e00..5b3f31eab2 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1946,7 +1946,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
 static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
 {
     PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_LISTENING);
-    trace_loadvm_postcopy_handle_listen();
+    trace_loadvm_postcopy_handle_listen(1);
     Error *local_err = NULL;
 
     if (ps != POSTCOPY_INCOMING_ADVISE && ps != POSTCOPY_INCOMING_DISCARD) {
@@ -1962,6 +1962,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
             postcopy_ram_prepare_discard(mis);
         }
     }
+    trace_loadvm_postcopy_handle_listen(2);
 
     /*
      * Sensitise RAM - can now generate requests for blocks that don't exist
@@ -1974,6 +1975,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
             return -1;
         }
     }
+    trace_loadvm_postcopy_handle_listen(3);
 
     if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
         error_report_err(local_err);
@@ -1988,6 +1990,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
                        QEMU_THREAD_DETACHED);
     qemu_sem_wait(&mis->listen_thread_sem);
     qemu_sem_destroy(&mis->listen_thread_sem);
+    trace_loadvm_postcopy_handle_listen(4);
 
     return 0;
 }
diff --git a/migration/trace-events b/migration/trace-events
index d63a5915f5..1aa6937dc1 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -14,7 +14,7 @@ loadvm_handle_cmd_packaged_main(int ret) "%d"
 loadvm_handle_cmd_packaged_received(int ret) "%d"
 loadvm_handle_recv_bitmap(char *s) "%s"
 loadvm_postcopy_handle_advise(void) ""
-loadvm_postcopy_handle_listen(void) ""
+loadvm_postcopy_handle_listen(int i) "%d"
 loadvm_postcopy_handle_run(void) ""
 loadvm_postcopy_handle_run_cpu_sync(void) ""
 loadvm_postcopy_handle_run_vmstart(void) ""
-- 
2.32.0


