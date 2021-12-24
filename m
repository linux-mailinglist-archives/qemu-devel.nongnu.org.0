Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA14147EC74
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 08:07:13 +0100 (CET)
Received: from localhost ([::1]:55452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0efZ-0004OE-1y
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 02:07:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePY-0001IY-OV
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePX-0005s8-7R
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640328638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+enMLVlcylOm8RcSTo9530m2haG9qkSll4HC4NkeZ3U=;
 b=QC2m0v4zO48WqQbJXct7d72p6SwnoGR8pdhMwC9lEc5bLXetIssmPM+eNcp7XEXfpOvvdS
 EBcWKdL/1VIRhcDqZw99lTzEk+M63TTX2eV4KxYD+qBT9ZQ+djNliThbDfZpyCPOwhhKsk
 /ktnqJfVtiPiM5HBTtqOjanMJRh/yU0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-y40iUgLBPpO3NgLf5o0jeg-1; Fri, 24 Dec 2021 01:50:37 -0500
X-MC-Unique: y40iUgLBPpO3NgLf5o0jeg-1
Received: by mail-wr1-f71.google.com with SMTP id
 l13-20020adfbd8d000000b001a23a990dbfso1469461wrh.5
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 22:50:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+enMLVlcylOm8RcSTo9530m2haG9qkSll4HC4NkeZ3U=;
 b=0/8NnsNUE7QV8fnatBGGzvirUPOyfb7YGofGYwkSKP7h8m9tCevhEccjh1lwGVi2Sq
 Jb3pIBgzVOWABNYaGSb/fLGp0qt0jOq2cNMk4WR7svZXwtOPP8HRxBk2YvmsfgXYQdKi
 Rt8Wl1ORx6Oe8rn/udwwbecnjV22KygwKM5s86zs0oO+r7mBBYcG1cj2HwKC4wMY+NKi
 qjtnbEreUD+TFK87IOMH7WSGlt+uQBlNQsxG6jeb8vkmKZTGj7x4IUeL8A+QWK3dWXwW
 x59j7CEpRNeWg2/6a+j0AxTf60SR5C/uKcoJfKSl4YtVfN9gua9mmLUBvArfG2WD+z9r
 ig3Q==
X-Gm-Message-State: AOAM533pJkzTVLEOonQh+j3NouTRqmp4kIgU5VwFPsWjSGlarUV8uVgP
 GwWMvzNar624r2sAX1Pwt/zwkf7KjqurUCr9UT64BczN8G71GGtK+amzl0TeHiHhjaqwj2PpvuX
 KhtQsR1I94RU0NKACr4aPs/Y+GB3cU0fkLC5wRdwHpmqKGNz9fViuwkW8gxxsgeNm
X-Received: by 2002:a05:600c:1f0c:: with SMTP id
 bd12mr3765762wmb.82.1640328636128; 
 Thu, 23 Dec 2021 22:50:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsBOkfhJZrxOiO3h9psvPKQtNi91Jp3gtQKaWaoLIwO75VMYvRINchx1v8CG2zzbIMqzd41A==
X-Received: by 2002:a05:600c:1f0c:: with SMTP id
 bd12mr3765747wmb.82.1640328635847; 
 Thu, 23 Dec 2021 22:50:35 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id h14sm2174425wmq.16.2021.12.23.22.50.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Dec 2021 22:50:35 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/8] migration: Tracepoint change in postcopy-run bottom
 half
Date: Fri, 24 Dec 2021 14:50:00 +0800
Message-Id: <20211224065000.97572-9-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211224065000.97572-1-peterx@redhat.com>
References: <20211224065000.97572-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the old two tracepoints and they're even near each other:

    trace_loadvm_postcopy_handle_run_cpu_sync()
    trace_loadvm_postcopy_handle_run_vmstart()

Add trace_loadvm_postcopy_handle_run_bh() with a finer granule trace.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/savevm.c     | 12 +++++++++---
 migration/trace-events |  3 +--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 592d550a2f..3b8f565b14 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2005,13 +2005,19 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
     Error *local_err = NULL;
     MigrationIncomingState *mis = opaque;
 
+    trace_loadvm_postcopy_handle_run_bh("enter");
+
     /* TODO we should move all of this lot into postcopy_ram.c or a shared code
      * in migration.c
      */
     cpu_synchronize_all_post_init();
 
+    trace_loadvm_postcopy_handle_run_bh("after cpu sync");
+
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
+    trace_loadvm_postcopy_handle_run_bh("after announce");
+
     /* Make sure all file formats flush their mutable metadata.
      * If we get an error here, just don't restart the VM yet. */
     bdrv_invalidate_cache_all(&local_err);
@@ -2021,9 +2027,7 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
         autostart = false;
     }
 
-    trace_loadvm_postcopy_handle_run_cpu_sync();
-
-    trace_loadvm_postcopy_handle_run_vmstart();
+    trace_loadvm_postcopy_handle_run_bh("after invalidate cache");
 
     dirty_bitmap_mig_before_vm_start();
 
@@ -2036,6 +2040,8 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
     }
 
     qemu_bh_delete(mis->bh);
+
+    trace_loadvm_postcopy_handle_run_bh("return");
 }
 
 /* After all discards we can start running and asking for pages */
diff --git a/migration/trace-events b/migration/trace-events
index 77d1237d89..e165687af2 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -16,8 +16,7 @@ loadvm_handle_recv_bitmap(char *s) "%s"
 loadvm_postcopy_handle_advise(void) ""
 loadvm_postcopy_handle_listen(const char *str) "%s"
 loadvm_postcopy_handle_run(void) ""
-loadvm_postcopy_handle_run_cpu_sync(void) ""
-loadvm_postcopy_handle_run_vmstart(void) ""
+loadvm_postcopy_handle_run_bh(const char *str) "%s"
 loadvm_postcopy_handle_resume(void) ""
 loadvm_postcopy_ram_handle_discard(void) ""
 loadvm_postcopy_ram_handle_discard_end(void) ""
-- 
2.32.0


