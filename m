Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F214ED035
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:35:16 +0200 (CEST)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhqN-0004dA-AF
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:35:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsq-0007vA-6r
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:40 -0400
Received: from [2a00:1450:4864:20::22e] (port=44897
 helo=mail-lj1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsn-0003AY-Uw
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:39 -0400
Received: by mail-lj1-x22e.google.com with SMTP id q5so29458798ljb.11
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tJxefvmvICc2d2KjZ05ktJv/JuR+f3W8BBrPMJJ+LrE=;
 b=juuyao2yg6tZjt1NhOmaV65mGIlLe+URlsxEyrT81lBOmN9sUXYFHXuBnfwuKd7bRs
 J9CS8xSek6Weol38Nrt1JkbXnNg9QTZHh1yg9SVMi6JEeRCs38MJn7c6acNeuP/7/SGC
 xR7ghsBcFD8LOireiUXbBYkWmHvfbjkCUTDOqI3G3GQupYo2nSXfA+9nqZ4Wbt6J7LBV
 jUOX9th8dIrlGRZcQXJjvbdzJmDifhePnfGfkKh7ET0S8eFT4nc5tN6gucnX4Q3vOq+g
 sJBcIusrYa91c4BTyq7t10dYxxITexlr3/WTDWJB6LobukLY+mxFugEssnnYGpLkSNPu
 eevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tJxefvmvICc2d2KjZ05ktJv/JuR+f3W8BBrPMJJ+LrE=;
 b=IMqGXVrLgb7MYsSUyVIai8npZr4bCxp8txdWLwUMdWKvSxJx+5w2x/HJzjQk2TWAzg
 pQfLBwaPByQJtMdZoOpfu0DkWAgciMz7Bnybwhz5n7GA0FfExZJaCEMgRTZe/0IJ1Rrf
 yc2O17XKsJHpQfGHP83dGiBsuwd39Mu58kdr56E8obTpPllUQJw7BAZTwuLjL29W9YoY
 wF3uWDw0t19I7bybeQfCZaUrHlPBxSLJT/UhqMUg2bJeQcoddULNVHByV9ejDI5dd1PS
 BcaRBOC8Bi5EEAGOf6wy9EqmlYAC0Y7ThAWEeXIL7uqtAv3wOY6D+Fo5yur9sm0ehYXj
 xkrQ==
X-Gm-Message-State: AOAM530GtfTYDxvnbGCW/ZgodS0tNFxOg9yzu7M9L86/+vg7tsBTEdto
 E78pYr+r0wMCmXh8MS9foqkevp8GY0zGUg==
X-Google-Smtp-Source: ABdhPJz3CLGFWrdZaKdq97h6uPCmnzB9tra7AwMvp+ULVabn0oyzyNu+pqkojUXt1uyMWBGBmGN91Q==
X-Received: by 2002:a2e:96c4:0:b0:249:30d1:77a1 with SMTP id
 d4-20020a2e96c4000000b0024930d177a1mr8164404ljj.264.1648675776420; 
 Wed, 30 Mar 2022 14:29:36 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:36 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 08/45] block/snapshot: stress that we fallback to primary
 child
Date: Thu, 31 Mar 2022 00:28:25 +0300
Message-Id: <20220330212902.590099-9-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:15 -0400
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Actually what we chose is a primary child. Let's stress it in the code.

We are going to drop indirect pointer logic here in future. Actually
this commit simplifies the future work: we drop use of indirection in
the assertion now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/snapshot.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index d6f53c3065..f4ec4f9ef3 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -161,21 +161,14 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
 static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
 {
     BdrvChild **fallback;
-    BdrvChild *child;
+    BdrvChild *child = bdrv_primary_child(bs);
 
-    /*
-     * The only BdrvChild pointers that are safe to modify (and which
-     * we can thus return a reference to) are bs->file and
-     * bs->backing.
-     */
-    fallback = &bs->file;
-    if (!*fallback && bs->drv && bs->drv->is_filter) {
-        fallback = &bs->backing;
-    }
-
-    if (!*fallback) {
+    /* We allow fallback only to primary child */
+    if (!child) {
         return NULL;
     }
+    fallback = (child == bs->file ? &bs->file : &bs->backing);
+    assert(*fallback == child);
 
     /*
      * Check that there are no other children that would need to be
@@ -309,15 +302,12 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         }
 
         /*
-         * fallback_ptr is &bs->file or &bs->backing.  *fallback_ptr
-         * was closed above and set to NULL, but the .bdrv_open() call
-         * has opened it again, because we set the respective option
-         * (with the qdict_put_str() call above).
-         * Assert that .bdrv_open() has attached some child on
-         * *fallback_ptr, and that it has attached the one we wanted
-         * it to (i.e., fallback_bs).
+         * fallback was a primary child. It was closed above and set to NULL,
+         * but the .bdrv_open() call has opened it again, because we set the
+         * respective option (with the qdict_put_str() call above).
+         * Assert that .bdrv_open() has attached some BDS as primary child.
          */
-        assert(*fallback_ptr && fallback_bs == (*fallback_ptr)->bs);
+        assert(bdrv_primary_bs(bs) == fallback_bs);
         bdrv_unref(fallback_bs);
         return ret;
     }
-- 
2.35.1


