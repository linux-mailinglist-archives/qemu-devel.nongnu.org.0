Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F995BA1F5
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 22:49:02 +0200 (CEST)
Received: from localhost ([::1]:60048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYvnB-0007py-Qe
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 16:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhz-0002A8-Cl
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124]:41386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhq-0000Lc-Vf
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663274609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOVZrGrT1HcWAvQDoO5Wto9+5Or5tz0oO0SD21/ayLg=;
 b=Xous8Nv6yGv9aIyeXqXRsLlPqoFvUMKKcupI8ngmEcBYFv4dUp3e6ankpWOzD4PFousCg3
 4P6f189/4FaYjjhc6khcfb7efdyubuouiybPzofV8JXPtfK33lSC7pc3n0by4kLLYCYcK9
 PBONCzQnOtzsDh4ui1go9km24U2hxBw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-EoNQkYweM3OKWD-NwvhIeA-1; Thu, 15 Sep 2022 16:43:24 -0400
X-MC-Unique: EoNQkYweM3OKWD-NwvhIeA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEE69862FE7;
 Thu, 15 Sep 2022 20:43:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99A55C15BA5;
 Thu, 15 Sep 2022 20:43:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 179C921E66A4; Thu, 15 Sep 2022 22:43:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 22/27] qapi stats: Elide redundant has_FOO in generated C
Date: Thu, 15 Sep 2022 22:43:12 +0200
Message-Id: <20220915204317.3766007-23-armbru@redhat.com>
In-Reply-To: <20220915204317.3766007-1-armbru@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=armbru@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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
them step by step.  This is the step for qapi/stats.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Mark Kanda <mark.kanda@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/qmp-cmds.c     | 5 +----
 scripts/qapi/schema.py | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 672fc5d1cc..21a21d6171 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -560,10 +560,7 @@ void add_stats_entry(StatsResultList **stats_results, StatsProvider provider,
     StatsResult *entry = g_new0(StatsResult, 1);
 
     entry->provider = provider;
-    if (qom_path) {
-        entry->has_qom_path = true;
-        entry->qom_path = g_strdup(qom_path);
-    }
+    entry->qom_path = g_strdup(qom_path);
     entry->stats = stats_list;
 
     QAPI_LIST_PREPEND(*stats_results, entry);
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 3001b715d0..6f35e57fe2 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/stats.json',
             'qapi/tpm.json',
             'qapi/transaction.json',
             'qapi/ui.json',
-- 
2.37.2


