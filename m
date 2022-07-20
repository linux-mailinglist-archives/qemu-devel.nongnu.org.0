Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A0C57B3AE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:21:54 +0200 (CEST)
Received: from localhost ([::1]:53438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5tx-0005MV-5z
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5dE-0000dj-1D
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5dC-0001X2-G8
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658307873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P6BRjPpkfZnXsZ7yFJhmm/w2iJrsMZynRt2UannPfqA=;
 b=T4kIbpD43uydp1DVYwYKe5iiMlMcXQzLn4mjadi7Jzc215UFC1IQDlVFskOA2RreBbndsc
 bxgmYNxJiGDfjDYvAc6pvSckLzwQpxLMar0f77tWf+zva8uhxuLo9VyV2bOqNQJJXYCYGr
 15sU3Q1YgdZlp+daTXoQh4RTKvlaRL4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-zJvNfq9YPQivAjf0rClURg-1; Wed, 20 Jul 2022 05:04:30 -0400
X-MC-Unique: zJvNfq9YPQivAjf0rClURg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D39C804191;
 Wed, 20 Jul 2022 09:04:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-110.pek2.redhat.com
 [10.72.13.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E37F2492C3B;
 Wed, 20 Jul 2022 09:04:27 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Zhang Chen <chen.zhang@intel.com>, Like Xu <like.xu@linux.intel.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 23/25] net/colo: Fix a "double free" crash to clear the
 conn_list
Date: Wed, 20 Jul 2022 17:03:11 +0800
Message-Id: <20220720090313.55169-24-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-1-jasowang@redhat.com>
References: <20220720090313.55169-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

We notice the QEMU may crash when the guest has too many
incoming network connections with the following log:

15197@1593578622.668573:colo_proxy_main : colo proxy connection hashtable full, clear it
free(): invalid pointer
[1]    15195 abort (core dumped)  qemu-system-x86_64 ....

This is because we create the s->connection_track_table with
g_hash_table_new_full() which is defined as:

GHashTable * g_hash_table_new_full (GHashFunc hash_func,
                       GEqualFunc key_equal_func,
                       GDestroyNotify key_destroy_func,
                       GDestroyNotify value_destroy_func);

The fourth parameter connection_destroy() will be called to free the
memory allocated for all 'Connection' values in the hashtable when
we call g_hash_table_remove_all() in the connection_hashtable_reset().

But both connection_track_table and conn_list reference to the same
conn instance. It will trigger double free in conn_list clear. So this
patch remove free action on hash table side to avoid double free the
conn.

Signed-off-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo-compare.c    | 2 +-
 net/filter-rewriter.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index d5d0965..787c740 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1323,7 +1323,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
     s->connection_track_table = g_hash_table_new_full(connection_key_hash,
                                                       connection_key_equal,
                                                       g_free,
-                                                      connection_destroy);
+                                                      NULL);
 
     colo_compare_iothread(s);
 
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index bf05023..c18c4c2 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -383,7 +383,7 @@ static void colo_rewriter_setup(NetFilterState *nf, Error **errp)
     s->connection_track_table = g_hash_table_new_full(connection_key_hash,
                                                       connection_key_equal,
                                                       g_free,
-                                                      connection_destroy);
+                                                      NULL);
     s->incoming_queue = qemu_new_net_queue(qemu_netfilter_pass_to_next, nf);
 }
 
-- 
2.7.4


