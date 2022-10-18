Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63496025C5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:32:50 +0200 (CEST)
Received: from localhost ([::1]:33976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okh5l-0006Uf-KT
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okgBw-0005iZ-HZ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okgBs-00024F-Nr
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0E5hr9rhYA7n1mvGi0I1IN6V3RIF46oyr7ifz0WlrP8=;
 b=WpIN4hmKMDEl/F3oolJ0KeLZdYTk8jJZWTicEEoaqOtuUPfnsm3VpsPUqMHkv8198xkHz8
 h6CDmcRac/6VVzYQGzTlB5offdLMEggqO8PhLarv+fhyzBpieHpLn5Z2U8DHJ4KxUAPuTz
 SN19Dzr0JwNpPphHFhgGF+VQIOfz0ao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-rMvjEPqfPKS9okTkngD95Q-1; Tue, 18 Oct 2022 02:28:52 -0400
X-MC-Unique: rMvjEPqfPKS9okTkngD95Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C518F800186;
 Tue, 18 Oct 2022 06:28:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CACF1468208;
 Tue, 18 Oct 2022 06:28:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 42F4921E669D; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 11/28] qapi dump: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:32 +0200
Message-Id: <20221018062849.3420573-12-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/dump.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
2.37.2


