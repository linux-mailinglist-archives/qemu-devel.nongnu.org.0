Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3EF47EC5C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 08:01:17 +0100 (CET)
Received: from localhost ([::1]:47394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0eZo-0007F4-1h
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 02:01:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePJ-0001DX-Oy
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePH-0005nu-NE
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640328623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rrllebeXjhwn2QrPCOBd7fyW3DoTWKpL8HkzryqB5PE=;
 b=XwGOHKYIHAd8XZ1beelV532iu86FMKmO1AeyEMRCiYPxo8Wjr9+6DI+eYYFZIq1z1ZLd3L
 3M2hsbfKVymR8796A539F39IwmI8x8+uwakEmzE54cZt7Bj/Qcbxt2ShPwiHvipgZEbQh8
 11GQ3pKbmL7GD6qvv+kXyYSPICtMQEU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-ul1B1V_5MRugxMqZFpzkDA-1; Fri, 24 Dec 2021 01:50:21 -0500
X-MC-Unique: ul1B1V_5MRugxMqZFpzkDA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l13-20020adfbd8d000000b001a23a990dbfso1469196wrh.5
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 22:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rrllebeXjhwn2QrPCOBd7fyW3DoTWKpL8HkzryqB5PE=;
 b=hq2dH+D6XNv5K7ONq6110iIbuFe2TeUo+KjrovB9fcCzkJUDO7Zp2g2MvUbadGIIBj
 j3j4njJCsHEyybIbi8Vy+aUmZF1wc99atrZfCeL8NHzTij35rbVxOaf4vNLLHIb2Z7t1
 HlN687jXwVHN+gMJWlnHxHjnH34utwkjIzqiK65QdsjvDfN2deKEbOKrnDUQUTNOLPCT
 eo5Jnem9+xrKKnXmZzYbjAIiLqlrDqMctjKIC+3Wre7ZqYUceg0671n0KmZZzhU25F8n
 pV+l/+bDvk5cmAQVUmWSCOjtQAmhvmySZX9qS897IJ7eRsASNck5cQy5eudiaMTAFd8v
 aYQQ==
X-Gm-Message-State: AOAM530KNjuM2+TURdg5mtKY9roMMaDyfRXQMfz56XoU9XEaA/re+GGl
 +LfeAiKmlxCUJs4HdGcCROO4MVnspRphZWTNxQZGnXDZ3zM+5AVRbMocnGgSvU36sEC7KZxG/Pb
 /hpA7juswEzB1di98q5Vy6dYA3oKBiOec26JV30XLw0efrHPwuJZiauzJP9GXGfeh
X-Received: by 2002:adf:d1c1:: with SMTP id b1mr3640405wrd.491.1640328619377; 
 Thu, 23 Dec 2021 22:50:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSTfPVGA0gFC+njE7RG4tza0n50ksPk6LBb7B80CyfjOboEtpjKOVpYJFPavipqi9zAgHSBg==
X-Received: by 2002:adf:d1c1:: with SMTP id b1mr3640388wrd.491.1640328619164; 
 Thu, 23 Dec 2021 22:50:19 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id h14sm2174425wmq.16.2021.12.23.22.50.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Dec 2021 22:50:18 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/8] migration: Drop postcopy_chunk_hostpages()
Date: Fri, 24 Dec 2021 14:49:55 +0800
Message-Id: <20211224065000.97572-4-peterx@redhat.com>
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

This function calls three functions:

  - postcopy_discard_send_init(ms, block->idstr);
  - postcopy_chunk_hostpages_pass(ms, block);
  - postcopy_discard_send_finish(ms);

However only the 2nd function call is meaningful.  It's major role is to make
sure dirty bits are applied in host-page-size granule, so there will be no
partial dirty bits set for a whole host page if huge pages are used.

The 1st/3rd call are for latter when we want to send the disgard ranges.
They're mostly no-op here besides some tracepoints (which are misleading!).

Drop them, then we can directly drop postcopy_chunk_hostpages() as a whole
because we can call postcopy_chunk_hostpages_pass() directly.

There're still some nice comments above postcopy_chunk_hostpages() that explain
what it does.  Copy it over to the caller's site.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 33 +++++++--------------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 0ed0f51a09..b22c9e7432 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2571,30 +2571,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
     }
 }
 
-/**
- * postcopy_chunk_hostpages: discard any partially sent host page
- *
- * Utility for the outgoing postcopy code.
- *
- * Discard any partially sent host-page size chunks, mark any partially
- * dirty host-page size chunks as all dirty.  In this case the host-page
- * is the host-page for the particular RAMBlock, i.e. it might be a huge page
- *
- * @ms: current migration state
- * @block: block we want to work with
- */
-static void postcopy_chunk_hostpages(MigrationState *ms, RAMBlock *block)
-{
-    postcopy_discard_send_init(ms, block->idstr);
-
-    /*
-     * Ensure that all partially dirty host pages are made fully dirty.
-     */
-    postcopy_chunk_hostpages_pass(ms, block);
-
-    postcopy_discard_send_finish(ms);
-}
-
 /**
  * ram_postcopy_send_discard_bitmap: transmit the discard bitmap
  *
@@ -2626,8 +2602,13 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
     rs->last_page = 0;
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        /* Deal with TPS != HPS and huge pages */
-        postcopy_chunk_hostpages(ms, block);
+        /*
+         * Deal with TPS != HPS and huge pages.  It discard any partially sent
+         * host-page size chunks, mark any partially dirty host-page size
+         * chunks as all dirty.  In this case the host-page is the host-page
+         * for the particular RAMBlock, i.e. it might be a huge page.
+         */
+        postcopy_chunk_hostpages_pass(ms, block);
     }
     trace_ram_postcopy_send_discard_bitmap();
 
-- 
2.32.0


