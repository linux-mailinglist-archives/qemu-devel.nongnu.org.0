Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5362359A2BF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:03:30 +0200 (CEST)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5P7-0001RD-F3
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5GF-0006bM-VT
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5GD-0000Zd-H1
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660928049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AkQl3YdAHyUKV2KU5QLoaoaqz7lW4yv5zlw7uXbjozk=;
 b=NKbVb+BlgJVZrBe5LFdh14iXy/9WVPMscN4J8bTq1/sPpoKPCMZc6t1Izbbj4j1ljJpK3H
 gSvM3tkvmmGCvNMhysa0CWBmhoxqsQU4FEJAarOsc5vZWwT4y7zJcW5SxbsOgN55VCXHwv
 r3mnbbskfofmNxCWOXMK4ihSYqNtoYM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-3mYo78DpOYydgTSSy33d1w-1; Fri, 19 Aug 2022 12:54:05 -0400
X-MC-Unique: 3mYo78DpOYydgTSSy33d1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B3CA185A794
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 16:54:05 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55ABD2026D4C;
 Fri, 19 Aug 2022 16:54:04 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 3/7] util: make a copy of iova_tree_remove_parameter
Date: Fri, 19 Aug 2022 18:53:53 +0200
Message-Id: <20220819165357.3591965-4-eperezma@redhat.com>
In-Reply-To: <20220819165357.3591965-1-eperezma@redhat.com>
References: <20220819165357.3591965-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's convenient to call iova_tree_remove from a map returned from
iova_tree_find or iova_tree_find_iova. With the current code this is not
possible, since we will free it, and then we will try to search for it
again.

Fix it making a copy of the argument. Not applying a fixes tag, since
there is no use like that at the moment.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 util/iova-tree.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/util/iova-tree.c b/util/iova-tree.c
index fee530a579..713e3edd7b 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -166,9 +166,11 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
 
 void iova_tree_remove(IOVATree *tree, const DMAMap *map)
 {
+    /* Just in case caller is calling iova_tree_remove from a result of find */
+    const DMAMap needle = *map;
     const DMAMap *overlap;
 
-    while ((overlap = iova_tree_find(tree, map))) {
+    while ((overlap = iova_tree_find(tree, &needle))) {
         g_tree_remove(tree->tree, overlap);
     }
 }
-- 
2.31.1


