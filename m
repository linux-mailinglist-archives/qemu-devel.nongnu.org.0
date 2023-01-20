Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF07675A0D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 17:33:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIuJ8-0003WD-UW; Fri, 20 Jan 2023 11:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pIuJ1-0003VR-Du
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 11:31:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pIuIz-0003zQ-3g
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 11:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674232312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TKux9YDB9cwm8NPJSUSyuIvFmbZWx3SXR82CWSjt6SM=;
 b=CMFQoH3cUnXq9+zPsqBkWL5mRASqyWbcxaVcgmeyRDPc+6U8MD7NZsB9Ax4wL9R7nno29Z
 w1gZ9N09qCljnVUYX/pzydmBZRy+NE+KvR9zab2Q1uOXrcmexJ7GlzzxuMRkdFLBh8OG5w
 slATdzV/xYavSRB+jQYYoMflM3YYa10=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-wSnFlgU_NIOxmatFyBhQbA-1; Fri, 20 Jan 2023 11:31:51 -0500
X-MC-Unique: wSnFlgU_NIOxmatFyBhQbA-1
Received: by mail-oo1-f72.google.com with SMTP id
 n1-20020a4a3441000000b004fd2f5e21d5so1302733oof.20
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 08:31:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TKux9YDB9cwm8NPJSUSyuIvFmbZWx3SXR82CWSjt6SM=;
 b=5dSVG38OifxiZeYpAquguJ2Go1fJ9vbq8EZCS60G2P6wGBUanIWKDABo8swAmtGwWq
 YCw997p2s9x6RpprwP0L0obBOvtCFZMUw6uVWn9x64uEYP+uyY/ZC4C3cAfMkJqFDuaC
 D3qG0q45MqCmukaE2SxpeKWBM+IYzHQAd2IYgeL+3t1JNcaHF0vsCPaU1UAzdnDy6pWU
 tvrmDwJc+5g5VatQsOczSASUMATF025/UMMu3eCT5ORbRmtE3niZlrl/J/I/vMb/2HnD
 bd/cARWrIqDqL2Yt1aayb5f03rO+BdHHERq4JVHrNDUSwAQLwd+ilRUQvfmWF95phPn9
 lLWg==
X-Gm-Message-State: AFqh2koDYAYOkoVIRHtmXshy75d9GKU5z9t4dkfBBL3a7ddkNMuF7Swh
 Ge9KY1Cnwv8ap9l3deUZle+np43btydbFdFboMTLwhLbKpniST3b9mZ9RhC+HLQxDOoyCpRTVA3
 F0gidOCpiJ8S4uPHuFGFmUBi1Mg/zVlFqWmvKY7sGqa44dsjaOkPos8jWZUc+Yz4l
X-Received: by 2002:a05:6830:11ca:b0:684:c3e5:edb0 with SMTP id
 v10-20020a05683011ca00b00684c3e5edb0mr7896777otq.21.1674232309573; 
 Fri, 20 Jan 2023 08:31:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtBPWM56g1VtorFnK6b1cavACE+4g56fMB0Z93IijGT7wXomhpvOtQoZCIjo2gcShED8xco2g==
X-Received: by 2002:a05:6830:11ca:b0:684:c3e5:edb0 with SMTP id
 v10-20020a05683011ca00b00684c3e5edb0mr7896756otq.21.1674232309187; 
 Fri, 20 Jan 2023 08:31:49 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05620a04e500b006ee8874f5fasm25679935qkh.53.2023.01.20.08.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 08:31:48 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 qemu-stable@nongnu.org, Thomas Huth <thuth@redhat.com>
Subject: [PATCH] migration: Fix migration crash when target psize larger than
 host
Date: Fri, 20 Jan 2023 11:31:47 -0500
Message-Id: <20230120163147.2343050-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Commit d9e474ea56 overlooked the case where the target psize is even larger
than the host psize.  One example is Alpha has 8K page size and migration
will start to crash the source QEMU when running Alpha migration on x86.

Fix it by detecting that case and set host start/end just to cover the
single page to be migrated.

This will slightly optimize the common case where host psize equals to
guest psize so we don't even need to do the roundups, but that's trivial.

Cc: qemu-stable@nongnu.org
Reported-by: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1456
Fixes: d9e474ea56 ("migration: Teach PSS about host page")
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 334309f1c6..68a45338e3 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2319,8 +2319,25 @@ static void pss_host_page_prepare(PageSearchStatus *pss)
     size_t guest_pfns = qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
 
     pss->host_page_sending = true;
-    pss->host_page_start = ROUND_DOWN(pss->page, guest_pfns);
-    pss->host_page_end = ROUND_UP(pss->page + 1, guest_pfns);
+    if (guest_pfns <= 1) {
+        /*
+         * This covers both when guest psize == host psize, or when guest
+         * has larger psize than the host (guest_pfns==0).
+         *
+         * For the latter, we always send one whole guest page per
+         * iteration of the host page (example: an Alpha VM on x86 host
+         * will have guest psize 8K while host psize 4K).
+         */
+        pss->host_page_start = pss->page;
+        pss->host_page_end = pss->page + 1;
+    } else {
+        /*
+         * The host page spans over multiple guest pages, we send them
+         * within the same host page iteration.
+         */
+        pss->host_page_start = ROUND_DOWN(pss->page, guest_pfns);
+        pss->host_page_end = ROUND_UP(pss->page + 1, guest_pfns);
+    }
 }
 
 /*
-- 
2.37.3


