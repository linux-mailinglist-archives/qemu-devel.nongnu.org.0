Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEF1263193
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 18:19:54 +0200 (CEST)
Received: from localhost ([::1]:50764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG2p7-0006eF-7j
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 12:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kG2kO-00008v-NI; Wed, 09 Sep 2020 12:15:00 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kG2kN-0006Uo-0S; Wed, 09 Sep 2020 12:15:00 -0400
Received: by mail-pg1-x544.google.com with SMTP id 67so2395260pgd.12;
 Wed, 09 Sep 2020 09:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hrJEqDkxFKpoRhRzMOgEeJejUGbXqPW0+cFjCJrQlA0=;
 b=aGXhSXdyUpsGF1CGQcxlUq5WdzHX26mUdzXTKieMrOOdRDloppsvwv81FmbcijWp/c
 iIGQs2jVbYitSafSCgU6kmnbmQzMVYIiv2/GWMzpjdfb6UjqT1Ge8TlwsCwoXpw6IHRR
 rXo5qDYqT6tJ+KLzE7uPwqEXwgjfp6w8sSOtccS+j3nbgk5vFpm5LMV9sQ0R9fBoTaB3
 IQ/Srjzz1abdsoNcLqRlqPaXLuR6ERKKsTNpg9CUkbQayLkp4fO4xaSOa+nFoms4E8+/
 hcPK2nBkKZePSBVzGFsdbhmNO/S+gCESaOiL76C2KTD5L8FtQ8IuS/3MszVI11ce8cr0
 9yOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hrJEqDkxFKpoRhRzMOgEeJejUGbXqPW0+cFjCJrQlA0=;
 b=Apru4JnfNnpsLOWIgmpDh/dbi5jzOI7X1LK2odAmzlB+5fcd+FuF0EbYn8B5Zk/QxT
 PFdy+f08j2zi9pPQdAICB7n333gZqL3T8WkQO+Tfe0Bg7mHpE9JYTqSQppcoHIhDRUS3
 3DbZDLyrnb29u2ie2un1Dl5VUsNcGtsVtU5Zs7w3gObFFI7FoZwM48kwNV/VFEaG8Vsb
 SeF1cDWfWi/vB+3HW2pZPzATWnV7jofhTYYxn93SNR9aa4sJPh/EQ+rVYwXxCs7vKsIk
 OVUASu6/A9ORF93sWX3KlPmn9ZpJuc8XN2W+/9XqBMTLiknBELlsDq0QIxwPQ0y43hof
 O7Tw==
X-Gm-Message-State: AOAM532005gKBBEJzF/NSJ0fJnnb6jjAqqkXz0XNdtDgHc0d3BofOJuA
 NSFa00xwo9kGFxuVV8AOGTcMyPGG8qij7/K9
X-Google-Smtp-Source: ABdhPJxggBi6puK1NUi7JuZMpNwm/zINgRzMPKjtAvWBAkuj/1dMLMtw4MD5ZQzL4OyUt2qYBvbuxg==
X-Received: by 2002:a17:902:c392:: with SMTP id
 g18mr1523227plg.41.1599668096852; 
 Wed, 09 Sep 2020 09:14:56 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id l123sm2506987pgl.24.2020.09.09.09.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:14:55 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/24] rcu: Implement drain_call_rcu
Date: Thu, 10 Sep 2020 00:14:22 +0800
Message-Id: <20200909161430.1789-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200909161430.1789-1-luoyonggang@gmail.com>
References: <20200909161430.1789-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Lieven <pl@kamp.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

This will allow is to preserve the semantics of hmp_device_del,
that the device is deleted immediatly which was changed by previos
patch that delayed this to RCU callback

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Suggested-by: Stefan Hajnoczi <stefanha@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/rcu.h |  1 +
 util/rcu.c         | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 570aa603eb..0e375ebe13 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -133,6 +133,7 @@ struct rcu_head {
 };
 
 extern void call_rcu1(struct rcu_head *head, RCUCBFunc *func);
+extern void drain_call_rcu(void);
 
 /* The operands of the minus operator must have the same type,
  * which must be the one that we specify in the cast.
diff --git a/util/rcu.c b/util/rcu.c
index 60a37f72c3..c4fefa9333 100644
--- a/util/rcu.c
+++ b/util/rcu.c
@@ -293,6 +293,61 @@ void call_rcu1(struct rcu_head *node, void (*func)(struct rcu_head *node))
     qemu_event_set(&rcu_call_ready_event);
 }
 
+
+struct rcu_drain {
+    struct rcu_head rcu;
+    QemuEvent drain_complete_event;
+};
+
+static void drain_rcu_callback(struct rcu_head *node)
+{
+    struct rcu_drain *event = (struct rcu_drain *)node;
+    qemu_event_set(&event->drain_complete_event);
+}
+
+/*
+ * This function ensures that all pending RCU callbacks
+ * on the current thread are done executing
+
+ * drops big qemu lock during the wait to allow RCU thread
+ * to process the callbacks
+ *
+ */
+
+void drain_call_rcu(void)
+{
+    struct rcu_drain rcu_drain;
+    bool locked = qemu_mutex_iothread_locked();
+
+    memset(&rcu_drain, 0, sizeof(struct rcu_drain));
+    qemu_event_init(&rcu_drain.drain_complete_event, false);
+
+    if (locked) {
+        qemu_mutex_unlock_iothread();
+    }
+
+
+    /*
+     * RCU callbacks are invoked in the same order as in which they
+     * are registered, thus we can be sure that when 'drain_rcu_callback'
+     * is called, all RCU callbacks that were registered on this thread
+     * prior to calling this function are completed.
+     *
+     * Note that since we have only one global queue of the RCU callbacks,
+     * we also end up waiting for most of RCU callbacks that were registered
+     * on the other threads, but this is a side effect that shoudn't be
+     * assumed.
+     */
+
+    call_rcu1(&rcu_drain.rcu, drain_rcu_callback);
+    qemu_event_wait(&rcu_drain.drain_complete_event);
+
+    if (locked) {
+        qemu_mutex_lock_iothread();
+    }
+
+}
+
 void rcu_register_thread(void)
 {
     assert(rcu_reader.ctr == 0);
-- 
2.28.0.windows.1


