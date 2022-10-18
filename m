Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781B76024E1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:01:05 +0200 (CEST)
Received: from localhost ([::1]:38866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgb2-0001P2-4w
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg6L-0005k0-G9
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg66-0001FF-FC
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahYzZHNGM8Cvohvllup/AO20TUJYHk6tF4byX5Qn49U=;
 b=a3agFyA7O0XxtXHZSKkluh8caBq4d0+q9yXvjBfl+d6Cmp3zkfjWEyWXIxcqYKnm82ruU7
 uDqv5FWb0dX9U1fN20RHngXScRE4GagwNRoZuOUh/Y1OlR7ybShRpGyN8N8OUSz+VkBbpF
 rCxg+w80Qa5YjKKV9Le/CCu15M6u2r8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-WGsg4Jw6N9C3_8cGfd0xUQ-1; Tue, 18 Oct 2022 02:28:52 -0400
X-MC-Unique: WGsg4Jw6N9C3_8cGfd0xUQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B92E1C087A1;
 Tue, 18 Oct 2022 06:28:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DC71492B0E;
 Tue, 18 Oct 2022 06:28:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4520121E66A0; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Subject: [PATCH v2 12/28] qapi job: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:33 +0200
Message-Id: <20221018062849.3420573-13-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
them step by step.  This is the step for qapi/job.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: John Snow <jsnow@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 job-qmp.c              | 3 +--
 scripts/qapi/schema.py | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/job-qmp.c b/job-qmp.c
index d498fc89c0..9e26fa899f 100644
--- a/job-qmp.c
+++ b/job-qmp.c
@@ -156,8 +156,7 @@ static JobInfo *job_query_single_locked(Job *job, Error **errp)
         .status             = job->status,
         .current_progress   = progress_current,
         .total_progress     = progress_total,
-        .has_error          = !!job->err,
-        .error              = job->err ? \
+        .error              = job->err ?
                               g_strdup(error_get_pretty(job->err)) : NULL,
     };
 
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 07e2a0f263..ff73fdb0b3 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/job.json',
             'qapi/machine.json',
             'qapi/machine-target.json',
             'qapi/migration.json',
-- 
2.37.2


