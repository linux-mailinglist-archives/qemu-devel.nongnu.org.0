Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759FD5F707F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 23:44:34 +0200 (CEST)
Received: from localhost ([::1]:38990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogYfR-0001Sb-HB
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 17:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWp-0003HP-90
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ogYWn-0006pQ-2m
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 17:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665092135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulV7x28imj7JCtzVIT5rq6ATqBNvKJ3ly+0N0CL/O7E=;
 b=OwWHKooLNdX9waSRcDYeO4a99WkWTJtb945v3DKAucQT2Rf6eYK8wrmdEgnU5YHoL1o/NN
 DBp55vu8MEdjpN4nOzts8qhHIYWBDC/iiFF1cEHxfePLWGJqpFWSTR3YILFsa48h8K2/04
 DPrjKDX5bTOblTOU6AnC7HefM3NBCmk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-ReA4DR-nM9myQ6Uqk8AjdA-1; Thu, 06 Oct 2022 17:35:32 -0400
X-MC-Unique: ReA4DR-nM9myQ6Uqk8AjdA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7A543C025CB;
 Thu,  6 Oct 2022 21:35:31 +0000 (UTC)
Received: from localhost (unknown [10.39.193.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B4EF111CD4B;
 Thu,  6 Oct 2022 21:35:31 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, sgarzare@redhat.com,
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 integration@gluster.org, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
Subject: [PATCH v6 08/13] numa: use QLIST_FOREACH_SAFE() for RAM block
 notifiers
Date: Thu,  6 Oct 2022 17:35:02 -0400
Message-Id: <20221006213507.645402-9-stefanha@redhat.com>
In-Reply-To: <20221006213507.645402-1-stefanha@redhat.com>
References: <20221006213507.645402-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make list traversal work when a callback removes a notifier
mid-traversal. This is a cleanup to prevent bugs in the future.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/core/numa.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 31e6fe1caa..ea24a5fa8c 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -857,8 +857,9 @@ void ram_block_notifier_remove(RAMBlockNotifier *n)
 void ram_block_notify_add(void *host, size_t size, size_t max_size)
 {
     RAMBlockNotifier *notifier;
+    RAMBlockNotifier *next;
 
-    QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
+    QLIST_FOREACH_SAFE(notifier, &ram_list.ramblock_notifiers, next, next) {
         if (notifier->ram_block_added) {
             notifier->ram_block_added(notifier, host, size, max_size);
         }
@@ -868,8 +869,9 @@ void ram_block_notify_add(void *host, size_t size, size_t max_size)
 void ram_block_notify_remove(void *host, size_t size, size_t max_size)
 {
     RAMBlockNotifier *notifier;
+    RAMBlockNotifier *next;
 
-    QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
+    QLIST_FOREACH_SAFE(notifier, &ram_list.ramblock_notifiers, next, next) {
         if (notifier->ram_block_removed) {
             notifier->ram_block_removed(notifier, host, size, max_size);
         }
@@ -879,8 +881,9 @@ void ram_block_notify_remove(void *host, size_t size, size_t max_size)
 void ram_block_notify_resize(void *host, size_t old_size, size_t new_size)
 {
     RAMBlockNotifier *notifier;
+    RAMBlockNotifier *next;
 
-    QLIST_FOREACH(notifier, &ram_list.ramblock_notifiers, next) {
+    QLIST_FOREACH_SAFE(notifier, &ram_list.ramblock_notifiers, next, next) {
         if (notifier->ram_block_resized) {
             notifier->ram_block_resized(notifier, host, old_size, new_size);
         }
-- 
2.37.3


