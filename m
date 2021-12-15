Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21D94756F2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:52:55 +0100 (CET)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRu2-00045k-UM
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:52:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRag-00037t-78
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRae-0007Lf-Eg
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PtGbWq8/i50EHzu6nLuJuJMQ4jNbQjwizm+6bN5WzsA=;
 b=h/iU0F9UWw4IcUDbp8NiXMbEpjp7wvrzVb8ekYMGxJlal4sWE+hRSj5vKr5XSkhae7lj4n
 FJL8hcFQrTmRhwAJCbB5+JdVZ+C6lOpgt6I4H+UYZfCmgb/epl4oZCG2Q/M+JNLz22+/TZ
 nO3JfsZk7MvmplUr6NdxWqGlUms7DuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-QSNE8O6PMhql9cMsj-OcuA-1; Wed, 15 Dec 2021 05:32:48 -0500
X-MC-Unique: QSNE8O6PMhql9cMsj-OcuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76E062F24;
 Wed, 15 Dec 2021 10:32:47 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED8936E978;
 Wed, 15 Dec 2021 10:32:45 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/18] multifd: The variable is only used inside the loop
Date: Wed, 15 Dec 2021 11:32:11 +0100
Message-Id: <20211215103218.17527-12-quintela@redhat.com>
In-Reply-To: <20211215103218.17527-1-quintela@redhat.com>
References: <20211215103218.17527-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index cdeffdc4c5..ce7101cf9d 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -629,7 +629,6 @@ static void *multifd_send_thread(void *opaque)
     MultiFDSendParams *p = opaque;
     Error *local_err = NULL;
     int ret = 0;
-    uint32_t flags = 0;
 
     trace_multifd_send_thread_start(p->id);
     rcu_register_thread();
@@ -652,7 +651,7 @@ static void *multifd_send_thread(void *opaque)
         if (p->pending_job) {
             uint32_t used = p->pages->num;
             uint64_t packet_num = p->packet_num;
-            flags = p->flags;
+            uint32_t flags = p->flags;
 
             if (used) {
                 ret = multifd_send_state->ops->send_prepare(p, used,
-- 
2.33.1


