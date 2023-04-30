Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA716F2892
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 13:27:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pt5BQ-000151-EC; Sun, 30 Apr 2023 07:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pt5BI-00014k-PN
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 07:25:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pt5BE-0000GZ-OW
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 07:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682853923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FXxtWTeH3sT/5toDvHNGDvYE4K9d/YEkc/WGwBKZn9U=;
 b=aiR6pNk8xyCUSfz+W9AtiTavOMXL84rH6CdF5Dgnnw3ojiP0qgrFRqFspu3wiFmBYrDYZ9
 ooe+EO+7nGwIqyMFyLVF6vC83yNHcAF7R+3mnyTblzLJoRRpDn0sJ3AVPseTGoKC94icyd
 ytktQ9jYV0NMafTe8pOyA8xXUgkRzXg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-W3wbdGfPPWGAKHfRIr608A-1; Sun, 30 Apr 2023 07:25:20 -0400
X-MC-Unique: W3wbdGfPPWGAKHfRIr608A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-302cdf5d034so915441f8f.0
 for <qemu-devel@nongnu.org>; Sun, 30 Apr 2023 04:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682853919; x=1685445919;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FXxtWTeH3sT/5toDvHNGDvYE4K9d/YEkc/WGwBKZn9U=;
 b=Ydg7gu+nJRowHmQCNGvNeNjuuJxztOSBYD2Ho4Jn1UxyLBSlq86Mn9CWUv1fieU7BD
 bBR8Uy8UH3qak3YcEeOEupfcRBQpx7zispIvgzuqJPQgo0nToZeQlyRHPqwgElJX1N0K
 FZyR14Ygfi6igwZXfrDKI0mptneIVjTs8LzoK8rK1Aba0DtUAS/LUdIRbJTp1DhvqNKC
 teEUt8w32TpPcmjhDQ2s98rj9Y0tw4qtwa4uSOYtklm73UBQPC6ttXtLUMsR90SVEYax
 loXQgeJYa0t6Z7GKOb+2v2H8Lod0os3r6xy1iPB+YhRE7HfkQ2KCvaRJHDNlg8ScdtYS
 sZnw==
X-Gm-Message-State: AC+VfDyIply1eexc+p4SRwWye5TcZRhqkyIGw9Mpc2uZHk5ZBgc8231S
 53VW0tWGvX07tVsSk2nqJHQrNfrELKiz10Brid7AUWiqxKLCauzoyhctX4wlZelqPVoJ0Mpe90U
 2MH1pVklXka3eUzk6wAo+hMYI+y3qt66NeCGDu5quXUdAT4o7CXKlnmahjmvp8kFaMVfTGjBzse
 A=
X-Received: by 2002:a05:6000:1a52:b0:303:3880:9273 with SMTP id
 t18-20020a0560001a5200b0030338809273mr7181829wry.17.1682853919469; 
 Sun, 30 Apr 2023 04:25:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7RsywQN/1nksKrL3Ro9fq3eDlIiRP334GuInnTOWD/L+amLmymg9kqP9qj7TAUfKvopIDhmg==
X-Received: by 2002:a05:6000:1a52:b0:303:3880:9273 with SMTP id
 t18-20020a0560001a5200b0030338809273mr7181824wry.17.1682853919028; 
 Sun, 30 Apr 2023 04:25:19 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c468500b003f18141a016sm32688302wmo.18.2023.04.30.04.25.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 04:25:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] call_rcu: stop using mb_set/mb_read
Date: Sun, 30 Apr 2023 13:25:15 +0200
Message-Id: <20230430112515.240063-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use a store-release when enqueuing a new call_rcu, and a load-acquire
when dequeuing; and read the tail after checking that node->next is
consistent, which is the standard message passing pattern and it is
clearer than mb_read/mb_set.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/rcu.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/util/rcu.c b/util/rcu.c
index e5b6e52be6f8..867607cd5a1e 100644
--- a/util/rcu.c
+++ b/util/rcu.c
@@ -189,8 +189,22 @@ static void enqueue(struct rcu_head *node)
     struct rcu_head **old_tail;
 
     node->next = NULL;
+
+    /*
+     * Make this node the tail of the list.  The node will be
+     * used by further enqueue operations, but it will not
+     * be dequeued yet...
+     */
     old_tail = qatomic_xchg(&tail, &node->next);
-    qatomic_mb_set(old_tail, node);
+
+    /*
+     * ... until it is pointed to from another item in the list.
+     * In the meanwhile, try_dequeue() will find a NULL next pointer
+     * and loop.
+     *
+     * Synchronizes with qatomic_load_acquire() in try_dequeue().
+     */
+    qatomic_store_release(old_tail, node);
 }
 
 static struct rcu_head *try_dequeue(void)
@@ -198,25 +212,27 @@ static struct rcu_head *try_dequeue(void)
     struct rcu_head *node, *next;
 
 retry:
+    /* Head is only written by this thread, so no need for barriers.  */
+    node = head;
+
+    /* If the head node has NULL in its next pointer, the value is
+     * wrong and we need to wait until its enqueuer finishes the update.
+     */
+    next = qatomic_load_acquire(&node->next);
+    if (!next) {
+        return NULL;
+    }
+
     /* Test for an empty list, which we do not expect.  Note that for
      * the consumer head and tail are always consistent.  The head
      * is consistent because only the consumer reads/writes it.
      * The tail, because it is the first step in the enqueuing.
      * It is only the next pointers that might be inconsistent.
      */
-    if (head == &dummy && qatomic_mb_read(&tail) == &dummy.next) {
+    if (head == &dummy && qatomic_read(&tail) == &dummy.next) {
         abort();
     }
 
-    /* If the head node has NULL in its next pointer, the value is
-     * wrong and we need to wait until its enqueuer finishes the update.
-     */
-    node = head;
-    next = qatomic_mb_read(&head->next);
-    if (!next) {
-        return NULL;
-    }
-
     /* Since we are the sole consumer, and we excluded the empty case
      * above, the queue will always have at least two nodes: the
      * dummy node, and the one being removed.  So we do not need to update
-- 
2.40.0


