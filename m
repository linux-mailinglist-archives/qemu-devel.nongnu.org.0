Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470E6FC257
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:07:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHZ-0005Fh-4X; Tue, 09 May 2023 05:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHW-0005Er-TA
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHR-0004uO-5b
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7G0JGRJuNzOy08wxI94uhJe0IVFxaXWeMU7b25jAV+E=;
 b=WPsYeXPAOfC4VpF16RGMRY3wXOrYX88bqLAI6qP3KkV8C/pje3CrUc9gqFxGekp5dFavT8
 LYzk9Pxr0axi6nQ9Hd0VOHgo5EWVXUlEGrMk3C3nzGatwzaogUmps7n8dm/dfcrzmQQt60
 YaDXaAPwgPSzbdGGgvct0WT5fULsUrY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-0KkK-_LAMIevSfmMp0YZhA-1; Tue, 09 May 2023 05:05:07 -0400
X-MC-Unique: 0KkK-_LAMIevSfmMp0YZhA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a355cf318so646341566b.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623105; x=1686215105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7G0JGRJuNzOy08wxI94uhJe0IVFxaXWeMU7b25jAV+E=;
 b=PJU0mUvLo4Us+is/YQARfgPjeAHKTZb7YT4rwvxTPyjBc7c4S/7HQarrIT0YoWBLHG
 UmW8jAFsSMsCcFAhfrMlJSxfX0X4b5wmp/3hLC7fJKjKS3+hvWHuQOb1rHpZUO5lfm2y
 LSSH6ALlPIzP0hNsBSVQmz5FSgf1u3KjSVKfc9r5QgE1dJE/tjXvuyY6fdTaDS8PCnQ+
 mAL7f12HbVJiAvaIQMk7ntniJajI3gLCcbWtP21cfne7cMARRMykHfGNhmDPm8yRm/JU
 6jPd2Q6bzs9M5eDju44Eim1BsOvKM6Yy8LrkRFjVJAA2bbjTVXJ+leF3gmiPr5z1GbQS
 FaKQ==
X-Gm-Message-State: AC+VfDygQd/pWT17r6smfY4U3rD4xZXvrGtVDw6V/Da5CAlv3rfqKpRc
 ZzgLXyo/Z/F72w3TV0rD1ziujOsLHwlxG3wknuy5WvflP0jUd4EpFHhE+Z2nIw3a97B3I0znPv/
 k+IFiBtq6Fo3Qomq/v0fuCiXMWQXjLmAILzgBrLNBy1lEvbsDXT/XFwAHlgs457qH5SARSqh76s
 I=
X-Received: by 2002:a17:907:9718:b0:966:c09:1c57 with SMTP id
 jg24-20020a170907971800b009660c091c57mr10250180ejc.65.1683623105598; 
 Tue, 09 May 2023 02:05:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5bMef7WgTQWa7iaG3to+nl5dibZJ8I3YSiY55JUrhGJovmTRs03E0ddAVAvSH4gXeA6NcldQ==
X-Received: by 2002:a17:907:9718:b0:966:c09:1c57 with SMTP id
 jg24-20020a170907971800b009660c091c57mr10250146ejc.65.1683623105216; 
 Tue, 09 May 2023 02:05:05 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a056402089300b0050bd9d3ddf3sm515052edy.42.2023.05.09.02.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 04/16] call_rcu: stop using mb_set/mb_read
Date: Tue,  9 May 2023 11:04:41 +0200
Message-Id: <20230509090453.37884-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/rcu.c | 45 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/util/rcu.c b/util/rcu.c
index e5b6e52be6f8..30a7e220264a 100644
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
+     * In the meantime, try_dequeue() will find a NULL next pointer
+     * and loop.
+     *
+     * Synchronizes with qatomic_load_acquire() in try_dequeue().
+     */
+    qatomic_store_release(old_tail, node);
 }
 
 static struct rcu_head *try_dequeue(void)
@@ -198,26 +212,31 @@ static struct rcu_head *try_dequeue(void)
     struct rcu_head *node, *next;
 
 retry:
-    /* Test for an empty list, which we do not expect.  Note that for
+    /* Head is only written by this thread, so no need for barriers.  */
+    node = head;
+
+    /*
+     * If the head node has NULL in its next pointer, the value is
+     * wrong and we need to wait until its enqueuer finishes the update.
+     */
+    next = qatomic_load_acquire(&node->next);
+    if (!next) {
+        return NULL;
+    }
+
+    /*
+     * Test for an empty list, which we do not expect.  Note that for
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
-    /* Since we are the sole consumer, and we excluded the empty case
+    /*
+     * Since we are the sole consumer, and we excluded the empty case
      * above, the queue will always have at least two nodes: the
      * dummy node, and the one being removed.  So we do not need to update
      * the tail pointer.
-- 
2.40.1


