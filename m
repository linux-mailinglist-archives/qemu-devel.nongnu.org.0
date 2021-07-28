Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42173D9565
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 20:39:00 +0200 (CEST)
Received: from localhost ([::1]:50974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8oSJ-0002br-QF
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 14:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLk-00063x-Vx
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8oLj-00078t-9h
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 14:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627497130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fb7boGznPNdqHR4r5s4Z41glvCy2kdt/HM9+C0Br1Os=;
 b=YBg4cKUfwwU7mavoillWw2Bl+eGxsiMNrK0JMLT/Ey9GR918tMV6rMEZzt65yrl5jomxv2
 m5W5xOva30MBzvQuX2kD9KKGZm5rqVqwzqirIabzl9cTV3EqHTHOKcEvRqwMsogg+OzL9y
 DMdZ0ws05z1pyF28y+6jYQ+yrpS+AsE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-yMzLitcWPQSYwj5HOtQ-Uw-1; Wed, 28 Jul 2021 14:32:09 -0400
X-MC-Unique: yMzLitcWPQSYwj5HOtQ-Uw-1
Received: by mail-qt1-f198.google.com with SMTP id
 w11-20020ac857cb0000b029024e7e455d67so1466793qta.16
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 11:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fb7boGznPNdqHR4r5s4Z41glvCy2kdt/HM9+C0Br1Os=;
 b=pWslHNx8imVDg+zBInvhBL0xwEBcY6/iCfhVBOEKuDjPlVIhShW21hpI4xhfHX1rUm
 1GnliCUVs98omCT4zQvPLfwBAewMzzktG3KPg+MieeBswGHqEkLeEPWoKI/Y61kG00w9
 t0WeEuzxFx8hKc2A5LBixggA2AN+ETTttv05vRt8ND5mP6160E57OStlCbIkvbGes9Nj
 ou3/cnqpP0NVniNqhHltUL//UdWMwPQnEuuj4VhEtP0Fmrh3+4GYLb5KKEUH8Z8aLZpd
 OZ04LTrXQIRF70iuhqSmFxYWLtdmpWa8Pwb8M4qRFxr3MxjGiZ0V+pXDKLZP47dGe4P5
 ++/Q==
X-Gm-Message-State: AOAM532fY+uPM6sMIFg7Z5c7ghfvVKX4HO0JBdPdPQtoIenkD7nTNKlw
 XBpNh6rywMyLucLnhihvZl3q+6MDLVpj3YmnqdSjNep0VZsChcRLYjbai1AlR6GNp7ooK/YHa2t
 p25a6IluARrlq3zcwGKRa4wFPhJtP58uLXGrkRp1A65zWV5sdjn91RePTEc0x7Fm+
X-Received: by 2002:ac8:7d52:: with SMTP id h18mr805344qtb.179.1627497128694; 
 Wed, 28 Jul 2021 11:32:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGtG+AnCJGQxnn5R1T+o0/0I0mcmwnHL1R/lh3Y6iPzaTOgdIx5QPZSF3dMEQzU+Z/UJkI/g==
X-Received: by 2002:ac8:7d52:: with SMTP id h18mr805315qtb.179.1627497128428; 
 Wed, 28 Jul 2021 11:32:08 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n5sm417528qkp.116.2021.07.28.11.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:32:07 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/8] memory: Delay the transaction pop() until commit
 completed
Date: Wed, 28 Jul 2021 14:31:51 -0400
Message-Id: <20210728183151.195139-9-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728183151.195139-1-peterx@redhat.com>
References: <20210728183151.195139-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 peterx@redhat.com, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This should be functionally the same as before, but this allows the
memory_region_transaction_depth to be non-zero during commit, which can help us
to do sanity check on misuses.

Since at it, fix an indentation issue on the bracket.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 62ec00b52d..e830649011 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1114,8 +1114,7 @@ void memory_region_transaction_commit(void)
     assert(memory_region_transaction_depth);
     assert(qemu_mutex_iothread_locked());
 
-    memory_region_transaction_depth_dec();
-    if (!memory_region_transaction_depth) {
+    if (memory_region_transaction_depth == 1) {
         if (memory_region_update_pending) {
             flatviews_reset();
 
@@ -1134,7 +1133,14 @@ void memory_region_transaction_commit(void)
             }
             ioeventfd_update_pending = false;
         }
-   }
+    }
+
+    /*
+     * Decrease the depth at last, so that memory_region_transaction_depth will
+     * still be non-zero during committing.  This can help us to do some sanity
+     * check within the process of committing.
+     */
+    memory_region_transaction_depth_dec();
 }
 
 static void memory_region_destructor_none(MemoryRegion *mr)
-- 
2.31.1


