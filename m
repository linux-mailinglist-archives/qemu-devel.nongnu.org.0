Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C636947EC5B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 08:00:21 +0100 (CET)
Received: from localhost ([::1]:46816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0eYt-0006pw-8X
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 02:00:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePO-0001Ex-SS
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePN-0005qr-66
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640328628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyB9NjacjlViYjX38NHa/38VGrRySbWUkQ8f+Gv2qv8=;
 b=JKATMn6Bo3WshsOotgkT75AQv/PpOwkQZ2elw90C++6Qt0zwywhz5Krek/etbgCJ4XRMUJ
 NVgEyp24oaok2Z9fc1nTmZMceoB0e57lyiK4qdmjBcuanQpfDTZKc5m9KiZrvaMAIhO7Np
 VI2QgKjXCaCqjJWtGE9wiQPNCTb2p54=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-jNcZoPwrPe25UfuRWG1OUA-1; Fri, 24 Dec 2021 01:50:25 -0500
X-MC-Unique: jNcZoPwrPe25UfuRWG1OUA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d6-20020adfa346000000b001a262748c6fso1456461wrb.12
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 22:50:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyB9NjacjlViYjX38NHa/38VGrRySbWUkQ8f+Gv2qv8=;
 b=I053ym8S8DYXfqOpdTmfTTuhnPYBPUWMbunM7NqMkrbEGK1rxGYDP+Op6nqu6h6cET
 7YgFivn3rRq9T+vMSCrV+Dg/Zw3nKr7ftynfDlXRul8SlahUNay5F5as/Lrmj0LM2iM5
 oPRIfKiyCGsyMyssxRHjfrZA0kMjwO/i3M1Zay3G6DWxzMblogaa+lFkmWmkbDtgq//t
 wi25rV8uB0A3rqFzeIut7ZJSyrGMpLRVD9mc3helg2dNRtUSWfHuEkqgEHst2cL4reOy
 ri6FllD/K4p9kIUUPo1lob4+kKxuyBQiCajNMBG1xq4R1cTa+j455hvwE4eM2wRIMgWZ
 /8Eg==
X-Gm-Message-State: AOAM5334ySalqL1dM24pq+5H/O5y7XNocmOOhhE2hLav1K/bNi23N5U5
 2iR5+S9QFUR/7c9kWz7e3g+OJO12QlDKVsQ/YfGphEaGvvPAc/+CHG1U5xxag2PaOF3qYnhAfrp
 EWjgRlbSHwxdXSqrl6bah553r9eb44jrsTJ4IwVhC6AuUslNT1bFMGmyg+n3NXNWb
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr3605167wrd.682.1640328622851; 
 Thu, 23 Dec 2021 22:50:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx16/UczdE0/D19uInJDdFoEimiuvyGmjUSPKqqa2VKuL3o75LMi/V+wWKy/7Eblfbv/S+r0g==
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr3605156wrd.682.1640328622636; 
 Thu, 23 Dec 2021 22:50:22 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id h14sm2174425wmq.16.2021.12.23.22.50.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Dec 2021 22:50:22 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/8] migration: Do chunk page in
 postcopy_each_ram_send_discard()
Date: Fri, 24 Dec 2021 14:49:56 +0800
Message-Id: <20211224065000.97572-5-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Right now we loop ramblocks for twice, the 1st time chunk the dirty bits with
huge page information; the 2nd time we send the discard ranges.  That's not
necessary - we can do them in a single loop.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b22c9e7432..e7107b9790 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2468,6 +2468,8 @@ static int postcopy_send_discard_bm_ram(MigrationState *ms, RAMBlock *block)
     return 0;
 }
 
+static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
+
 /**
  * postcopy_each_ram_send_discard: discard all RAMBlocks
  *
@@ -2489,6 +2491,14 @@ static int postcopy_each_ram_send_discard(MigrationState *ms)
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         postcopy_discard_send_init(ms, block->idstr);
 
+        /*
+         * Deal with TPS != HPS and huge pages.  It discard any partially sent
+         * host-page size chunks, mark any partially dirty host-page size
+         * chunks as all dirty.  In this case the host-page is the host-page
+         * for the particular RAMBlock, i.e. it might be a huge page.
+         */
+        postcopy_chunk_hostpages_pass(ms, block);
+
         /*
          * Postcopy sends chunks of bitmap over the wire, but it
          * just needs indexes at this point, avoids it having
@@ -2589,7 +2599,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
 int ram_postcopy_send_discard_bitmap(MigrationState *ms)
 {
     RAMState *rs = ram_state;
-    RAMBlock *block;
 
     RCU_READ_LOCK_GUARD();
 
@@ -2601,15 +2610,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
     rs->last_sent_block = NULL;
     rs->last_page = 0;
 
-    RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        /*
-         * Deal with TPS != HPS and huge pages.  It discard any partially sent
-         * host-page size chunks, mark any partially dirty host-page size
-         * chunks as all dirty.  In this case the host-page is the host-page
-         * for the particular RAMBlock, i.e. it might be a huge page.
-         */
-        postcopy_chunk_hostpages_pass(ms, block);
-    }
     trace_ram_postcopy_send_discard_bitmap();
 
     return postcopy_each_ram_send_discard(ms);
-- 
2.32.0


