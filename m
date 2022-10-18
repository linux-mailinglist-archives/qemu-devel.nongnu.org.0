Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BB26024D5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 08:59:48 +0200 (CEST)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgZn-0000SR-3o
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 02:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg6P-0005qA-8E
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg69-0001Eo-9z
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJbeMlbVORzlklCSOckSAH/mUTOUzdazeqW7tCZnAJc=;
 b=TCcAZ7ebTNjkzUCIGRjRioMQgV/OeNhcaJ7k0766Q/p+GM7e71KPSW0yVvorsljzNf6ZiW
 pmmx0IELK9oU/10HuCg2a8PT06rKyTqXIthyAsvFJfP8+SxI44JN4RdPG+lcVpbMJBjQZ8
 Lcj6aBDTi1dimP0g161rHzmTlYUmJ9Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-McBIV0PHNn--UGn4ku-l-Q-1; Tue, 18 Oct 2022 02:28:53 -0400
X-MC-Unique: McBIV0PHNn--UGn4ku-l-Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAA483C0D180;
 Tue, 18 Oct 2022 06:28:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C333A492B0A;
 Tue, 18 Oct 2022 06:28:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5BD7521E6623; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 22/28] qapi stats: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:43 +0200
Message-Id: <20221018062849.3420573-23-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
them step by step.  This is the step for qapi/stats.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Mark Kanda <mark.kanda@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Mark Kanda <mark.kanda@oracle.com>
---
 monitor/qmp-cmds.c     | 5 +----
 scripts/qapi/schema.py | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 2a0c919472..e3734f1946 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -563,10 +563,7 @@ void add_stats_entry(StatsResultList **stats_results, StatsProvider provider,
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
index f405ab7f49..0544037e71 100644
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


