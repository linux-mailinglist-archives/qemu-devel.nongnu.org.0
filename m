Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E673B693C55
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROb1-0001XI-IO; Sun, 12 Feb 2023 21:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROax-0001Wp-Le
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROaw-00033s-3r
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLDENILmbbXHoQfh+JsgdVt2FdytPOKPN5jSF0gsIbE=;
 b=bSBSnCDLGVJ5tq737X+kZX+ENLk2y9Kvtq1iQp7ykEQstn6mC1vrZ9mN0c2LS/2zGVSImz
 fWscSt6RFVdPqZ+jxnFDXdEGXn+2cxYMgaWlLbB0xz3LsbYeOGffFj9pyaPKfmUA8ta2ea
 gx7MADuYM5Xqe/l+OaPLxHyOZ2hoY08=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-SFStxAt4PSO7ol5_GBgpIQ-1; Sun, 12 Feb 2023 21:29:26 -0500
X-MC-Unique: SFStxAt4PSO7ol5_GBgpIQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o31-20020a05600c511f00b003dc53da325dso8356323wms.8
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wLDENILmbbXHoQfh+JsgdVt2FdytPOKPN5jSF0gsIbE=;
 b=cHcVrumOE4rovX9jrQrMnPyf30Y9jXIVgGneeSiGuArQTPPSUkF1StXZRGJC2qXQ3r
 24M/ScFb62bUml8M0ejoz/6Z/oTjpYmC3ztEolTTPBYZFe9jrhyHoxXzxbnMCWgHkfhC
 Hclxa4+zDJzFoo43WlUVRXCt7pe2tFOILMqoCkMLOPrbexFgj4HrCcogag3THTgKQ7DV
 EZPk0BvM5Lf6q6jLAqVU/ZOgyNAi7l5NJzea3SDVOM1BHvv9L1D322kkNZFwvd8/4oqp
 uODNlA5e0ZLLwQYelpngFClWAtzvWB3wCdbtNT5zkujGix3N6pHm2rNczHmyR7ZsvIBg
 jWOg==
X-Gm-Message-State: AO0yUKVJknlt6j3dKfBOtIfHBZoafrSTCOEnL+4DCFjSCt/2ACMYoHFO
 5/5tD66BjxBzDHc/G1xdObtBkAJ0Nr1nIjUYLLl7WeQI3sfvoC24LiqDJN1iaso0TPK2DzpRB7R
 TASyEdPp20lvgcypCC8oqaksKAAm7umoWaLNeZxYTpA5u/IQVrvlvylnakbqGdI45/T7McNp6
X-Received: by 2002:a5d:4690:0:b0:2c5:4659:3e76 with SMTP id
 u16-20020a5d4690000000b002c546593e76mr6850626wrq.18.1676255365260; 
 Sun, 12 Feb 2023 18:29:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/AkBoA8CyAL0GJ1g2wkOw3Cz9udImTmfN8gkOPL2DMEdstXcGyRw9TWI/l2tbPukHMj6LEEQ==
X-Received: by 2002:a5d:4690:0:b0:2c5:4659:3e76 with SMTP id
 u16-20020a5d4690000000b002c546593e76mr6850609wrq.18.1676255364971; 
 Sun, 12 Feb 2023 18:29:24 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 s11-20020adfdb0b000000b002c3e1e1dcd7sm9351257wri.104.2023.02.12.18.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:24 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 07/22] migration: Make find_dirty_block() return a single
 parameter
Date: Mon, 13 Feb 2023 03:28:56 +0100
Message-Id: <20230213022911.68490-8-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Juan Quintela <quintela@redhat.com>

We used to return two bools, just return a single int with the
following meaning:

old return / again / new return
false        false   PAGE_ALL_CLEAN
false        true    PAGE_TRY_AGAIN
true         true    PAGE_DIRTY_FOUND  /* We don't care about again at all */

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index dd809fec1f..cf577fce5c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1546,17 +1546,23 @@ retry:
     return pages;
 }
 
+#define PAGE_ALL_CLEAN 0
+#define PAGE_TRY_AGAIN 1
+#define PAGE_DIRTY_FOUND 2
 /**
  * find_dirty_block: find the next dirty page and update any state
  * associated with the search process.
  *
- * Returns true if a page is found
+ * Returns:
+ *         PAGE_ALL_CLEAN: no dirty page found, give up
+ *         PAGE_TRY_AGAIN: no dirty page found, retry for next block
+ *         PAGE_DIRTY_FOUND: dirty page found
  *
  * @rs: current RAM state
  * @pss: data about the state of the current dirty page scan
  * @again: set to false if the search has scanned the whole of RAM
  */
-static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
+static int find_dirty_block(RAMState *rs, PageSearchStatus *pss)
 {
     /* Update pss->page for the next dirty bit in ramblock */
     pss_find_next_dirty(pss);
@@ -1567,8 +1573,7 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
          * We've been once around the RAM and haven't found anything.
          * Give up.
          */
-        *again = false;
-        return false;
+        return PAGE_ALL_CLEAN;
     }
     if (!offset_in_ramblock(pss->block,
                             ((ram_addr_t)pss->page) << TARGET_PAGE_BITS)) {
@@ -1597,13 +1602,10 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
             }
         }
         /* Didn't find anything this time, but try again on the new block */
-        *again = true;
-        return false;
+        return PAGE_TRY_AGAIN;
     } else {
-        /* Can go around again, but... */
-        *again = true;
-        /* We've found something so probably don't need to */
-        return true;
+        /* We've found something */
+        return PAGE_DIRTY_FOUND;
     }
 }
 
@@ -2562,18 +2564,23 @@ static int ram_find_and_save_block(RAMState *rs)
 
     pss_init(pss, rs->last_seen_block, rs->last_page);
 
-    do {
+    while (true){
         if (!get_queued_page(rs, pss)) {
             /* priority queue empty, so just search for something dirty */
-            bool again = true;
-            if (!find_dirty_block(rs, pss, &again)) {
-                if (!again) {
+            int res = find_dirty_block(rs, pss);
+            if (res != PAGE_DIRTY_FOUND) {
+                if (res == PAGE_ALL_CLEAN) {
                     break;
+                } else if (res == PAGE_TRY_AGAIN) {
+                    continue;
                 }
             }
         }
         pages = ram_save_host_page(rs, pss);
-    } while (!pages);
+        if (pages) {
+            break;
+        }
+    }
 
     rs->last_seen_block = pss->block;
     rs->last_page = pss->page;
-- 
2.39.1


