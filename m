Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76E363E14
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 10:59:31 +0200 (CEST)
Received: from localhost ([::1]:41286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYPkg-0005bX-GK
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 04:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhP-0000ny-L4
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhN-0000yl-Uf
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618822565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q7e3ACKik/9Tt3fAfsgsQlAWRQdjxhC03g6iQjWjbOg=;
 b=Zs1MADo7T9lfMfLbZAxiNlTswSWSFsmmRJfzdIXGxDHWKl18epEAafr/XGcBEPTJJu3yEA
 3VJyYUh/ddhXSnwCAqdHj7LS7ne2kPLRNJk2zu9WWkG9FMQ3OV8A3f6jhiqPtYUJSiu/HJ
 dH8zTj3L+IpmciHPQ2beWZJJoz8c3Fg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-37hii6YUNGyykaSM_9xJtw-1; Mon, 19 Apr 2021 04:56:01 -0400
X-MC-Unique: 37hii6YUNGyykaSM_9xJtw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E36387A82A;
 Mon, 19 Apr 2021 08:56:00 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-195.ams2.redhat.com
 [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF93C5D742;
 Mon, 19 Apr 2021 08:55:57 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 3/8] util: use RCU accessors for notifiers
Date: Mon, 19 Apr 2021 10:55:36 +0200
Message-Id: <20210419085541.22310-4-eesposit@redhat.com>
In-Reply-To: <20210419085541.22310-1-eesposit@redhat.com>
References: <20210419085541.22310-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that calling rcu_read_lock() is left to the caller.  In fact,
if the notifier is really only used within the BQL, it's unnecessary.

Even outside the BQL, RCU accessors can also be used with any API that has
the same contract as synchronize_rcu, i.e. it stops until all concurrent
readers complete, no matter how "readers" are defined.  In the next patch,
for example, synchronize_rcu's role is taken by bdrv_drain (which is a
superset of synchronize_rcu, since it also blocks new incoming readers).

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 util/notify.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/util/notify.c b/util/notify.c
index 76bab212ae..529f1d121e 100644
--- a/util/notify.c
+++ b/util/notify.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/notify.h"
+#include "qemu/rcu_queue.h"
 
 void notifier_list_init(NotifierList *list)
 {
@@ -23,19 +24,19 @@ void notifier_list_init(NotifierList *list)
 
 void notifier_list_add(NotifierList *list, Notifier *notifier)
 {
-    QLIST_INSERT_HEAD(&list->notifiers, notifier, node);
+    QLIST_INSERT_HEAD_RCU(&list->notifiers, notifier, node);
 }
 
 void notifier_remove(Notifier *notifier)
 {
-    QLIST_REMOVE(notifier, node);
+    QLIST_REMOVE_RCU(notifier, node);
 }
 
 void notifier_list_notify(NotifierList *list, void *data)
 {
     Notifier *notifier, *next;
 
-    QLIST_FOREACH_SAFE(notifier, &list->notifiers, node, next) {
+    QLIST_FOREACH_SAFE_RCU(notifier, &list->notifiers, node, next) {
         notifier->notify(notifier, data);
     }
 }
@@ -53,12 +54,12 @@ void notifier_with_return_list_init(NotifierWithReturnList *list)
 void notifier_with_return_list_add(NotifierWithReturnList *list,
                                    NotifierWithReturn *notifier)
 {
-    QLIST_INSERT_HEAD(&list->notifiers, notifier, node);
+    QLIST_INSERT_HEAD_RCU(&list->notifiers, notifier, node);
 }
 
 void notifier_with_return_remove(NotifierWithReturn *notifier)
 {
-    QLIST_REMOVE(notifier, node);
+    QLIST_REMOVE_RCU(notifier, node);
 }
 
 int notifier_with_return_list_notify(NotifierWithReturnList *list, void *data)
@@ -66,7 +67,7 @@ int notifier_with_return_list_notify(NotifierWithReturnList *list, void *data)
     NotifierWithReturn *notifier, *next;
     int ret = 0;
 
-    QLIST_FOREACH_SAFE(notifier, &list->notifiers, node, next) {
+    QLIST_FOREACH_SAFE_RCU(notifier, &list->notifiers, node, next) {
         ret = notifier->notify(notifier, data);
         if (ret != 0) {
             break;
-- 
2.30.2


