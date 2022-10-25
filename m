Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E226460C6B6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:42:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFVX-00010V-SN; Tue, 25 Oct 2022 04:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwy-0004iP-OT
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwj-0007uX-L1
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666685145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9aLe/+vdJfukiF2FX5J4SJQPQCe/zKPFVAjYNmyu7d0=;
 b=IPuLuQ7w3udGRC6Sbtvt/w684NkCLETSKrSxPUI967c8C5Ha2qinsi15U1dGFuHsvkukbe
 9ZIXFZJFg330FHKUR8zM+1qdzCM34buQf0zJ2hwHmVpFhzvVW21bvTw9l9dmUTpQ4qCThZ
 v70n6G86FcGso10yn4RQ2R6fe6VgdzY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-kojEwU76MzmDAN_9llZVfw-1; Tue, 25 Oct 2022 04:05:43 -0400
X-MC-Unique: kojEwU76MzmDAN_9llZVfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CECE86F123
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:05:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A8F8202903F;
 Tue, 25 Oct 2022 08:05:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 31EB721E64A4; Tue, 25 Oct 2022 10:05:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 11/28] qapi dump: Elide redundant has_FOO in generated C
Date: Tue, 25 Oct 2022 10:05:24 +0200
Message-Id: <20221025080541.271547-12-armbru@redhat.com>
In-Reply-To: <20221025080541.271547-1-armbru@redhat.com>
References: <20221025080541.271547-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/dump.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221018062849.3420573-12-armbru@redhat.com>
---
 dump/dump.c            | 4 ++--
 scripts/qapi/schema.py | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 236559b03a..3baf625967 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1884,8 +1884,8 @@ static void dump_process(DumpState *s, Error **errp)
     result = qmp_query_dump(NULL);
     /* should never fail */
     assert(result);
-    qapi_event_send_dump_completed(result, !!*errp, (*errp ?
-                                                     error_get_pretty(*errp) : NULL));
+    qapi_event_send_dump_completed(result,
+                                   *errp ? error_get_pretty(*errp) : NULL);
     qapi_free_DumpQueryResult(result);
 
     dump_cleanup(s);
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 21d0b28790..07e2a0f263 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/dump.json',
             'qapi/job.json',
             'qapi/machine.json',
             'qapi/machine-target.json',
-- 
2.37.3


