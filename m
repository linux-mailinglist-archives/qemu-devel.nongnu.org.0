Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDC7619C8C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:09:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzEo-0000QL-C1; Fri, 04 Nov 2022 12:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzEI-0008Bd-8r
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzDz-0007dP-BE
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667578037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9PVvusvStQ7ygJMAQACSVblekVg3OCjNphQzjw5pTiA=;
 b=V1EF//ae0VQ9LMv3FYP+ADRMFpBQvUG5NPR6RCfwmv+Pic/gH/cEJ4WJ5JAE+rbdGefVlj
 +HIfpuPqItmOjXkxqrpuRSGOZRQVv63fjWskfER+C2lW/gq6HDFHuBOC7jIKVf1cdKFgVL
 Se82kyTTNfH5Zku/552CaxzELhP05w0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-gLZd4tNpO9OXmOQSp503gw-1; Fri, 04 Nov 2022 12:07:15 -0400
X-MC-Unique: gLZd4tNpO9OXmOQSp503gw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC0D83C0D186;
 Fri,  4 Nov 2022 16:07:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A053D40C83EF;
 Fri,  4 Nov 2022 16:07:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5408221E64A4; Fri,  4 Nov 2022 17:07:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 13/30] qapi dump: Elide redundant has_FOO in generated C
Date: Fri,  4 Nov 2022 17:06:55 +0100
Message-Id: <20221104160712.3005652-14-armbru@redhat.com>
In-Reply-To: <20221104160712.3005652-1-armbru@redhat.com>
References: <20221104160712.3005652-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
---
 dump/dump.c            | 4 ++--
 scripts/qapi/schema.py | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index df117c847f..1278dc35f9 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -2044,8 +2044,8 @@ static void dump_process(DumpState *s, Error **errp)
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


