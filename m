Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F547EC55
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 07:57:39 +0100 (CET)
Received: from localhost ([::1]:43218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0eWI-0004Fz-A1
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 01:57:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePE-0001BZ-PY
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePD-0005lR-6u
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640328618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VoMC7RjlqJ2CSRkrxYjUsH/v97JY1NqZo29Zh/Eb8IM=;
 b=azlLzCnTtdWw4GgWEt/3xStbgAqgF+9J80W6clnruww8AnCLLirmGnkiMQOgEipQnk/in1
 3eTXybbW3PMm34QUBD9FgfRBWG4I1Yvxdey8YUW9zg1v5i9Xaise4LYdZaKmV0iZXupq9b
 Jfkar5YWP2kBinB9eY6yBa2oYKMPeeg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-SulEh9ZPNwKLxUUhHbvpkQ-1; Fri, 24 Dec 2021 01:50:17 -0500
X-MC-Unique: SulEh9ZPNwKLxUUhHbvpkQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v23-20020a05600c215700b0034566adb612so2920768wml.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 22:50:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VoMC7RjlqJ2CSRkrxYjUsH/v97JY1NqZo29Zh/Eb8IM=;
 b=ecYpOmJuSZFtIhRjLWArkF2nDo+ALlLljWONTeLTqoH+UelthIq1wkbZxmoJyaBJIO
 KY6p3LBOPjCKECK8QTD5ZnaF909XPeaRxbiFox1+zN8C757NnANR+rb4Hd39be7M65Pk
 KRWGEuaRpaQYNYTkYvoAUQnP+vlrmaMwbAE6zKvs/6gsp5UWA91gSSCXJah1FZLg52Am
 7YYdbhmTnHXIva5LwRGNvjzhoSw0AEnGqesQG0nHTh4eF1WgFnFGfoOpYCi3OmE2xp6N
 rvSBYSo2OH6OyxZHB+KiF9ikOsrayg4mXlPLQyGExhhHYnUB/xxNK33Qre+d+CtVC9wz
 kvlQ==
X-Gm-Message-State: AOAM532+f+D0tZwT0FnZTNnuSUEU8O67erDwuObovf8/o2pRmBxcoZ1l
 /cgFFOfhW00VIkCQen9PJgZ+oBd+ha6mi6OEwVME2R7NMUobZ/ixMhWuQ2C3fXRk6r20cjeX4DR
 /9r4X7e0ODFRRhP2RJ7o/ReXFUCbuz0PmkFcl8OgwYoittpsif1SjHTtR332gvZE2
X-Received: by 2002:a5d:4486:: with SMTP id j6mr3576914wrq.160.1640328615828; 
 Thu, 23 Dec 2021 22:50:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnB/V+NKSRJlynLIJFaD0zigyJl2SJSRQ+vylJjh/EbE14JEDzdTC1gs9zrjD94P80yiZTrw==
X-Received: by 2002:a5d:4486:: with SMTP id j6mr3576896wrq.160.1640328615575; 
 Thu, 23 Dec 2021 22:50:15 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id h14sm2174425wmq.16.2021.12.23.22.50.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Dec 2021 22:50:15 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/8] migration: Don't return for postcopy_chunk_hostpages()
Date: Fri, 24 Dec 2021 14:49:54 +0800
Message-Id: <20211224065000.97572-3-peterx@redhat.com>
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

It always return zero, because it just can't go wrong so far.  Simplify the
code with no functional change.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7d9c8a508b..0ed0f51a09 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2580,12 +2580,10 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
  * dirty host-page size chunks as all dirty.  In this case the host-page
  * is the host-page for the particular RAMBlock, i.e. it might be a huge page
  *
- * Returns zero on success
- *
  * @ms: current migration state
  * @block: block we want to work with
  */
-static int postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
+static void postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
 {
     postcopy_discard_send_init(ms, block->idstr);
 
@@ -2595,7 +2593,6 @@ static int postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
     postcopy_chunk_hostpages_pass(ms, block);
 
     postcopy_discard_send_finish(ms);
-    return 0;
 }
 
 /**
@@ -2617,7 +2614,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 {
     RAMState *rs = ram_state;
     RAMBlock *block;
-    int ret;
 
     RCU_READ_LOCK_GUARD();
 
@@ -2631,10 +2627,7 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         /* Deal with TPS != HPS and huge pages */
-        ret = postcopy_chunk_hostpages(ms, block);
-        if (ret) {
-            return ret;
-        }
+        postcopy_chunk_hostpages(ms, block);
     }
     trace_ram_postcopy_send_discard_bitmap();
 
-- 
2.32.0


