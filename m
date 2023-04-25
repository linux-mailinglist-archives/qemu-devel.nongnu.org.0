Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA1A6EDBD5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:45:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCNv-0003wB-6O; Tue, 25 Apr 2023 02:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNp-0003qL-GM
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNj-0004Ln-Jh
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682404950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8OglO1GABAkMbLCBpRQLctyxPtXkCPvT3IrDIiXgx0I=;
 b=RiWi5luW2FLFYikVw5DuOsPDxzfohGsFL8A2ziB/cDMMGcYwWyTYtkCx4nK7cFiW4QsA8b
 DAsBKhdjSi/H+5TozO77b7S47ov7DYHtXRUKodlkID/bB2RVXYkhevfbzHrP5ty9l3lItb
 jKDFD/ZtuR3owSlJNvBFQhjenvkABJk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-UJN9eVifOHOnZaBVpotusg-1; Tue, 25 Apr 2023 02:42:25 -0400
X-MC-Unique: UJN9eVifOHOnZaBVpotusg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 431F13C0ED67;
 Tue, 25 Apr 2023 06:42:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCFF92027046;
 Tue, 25 Apr 2023 06:42:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BBEE421F1678; Tue, 25 Apr 2023 08:42:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org, marcandre.lureau@gmail.com,
 david@redhat.com
Subject: [PATCH v2 03/16] qapi: Fix misspelled references
Date: Tue, 25 Apr 2023 08:42:10 +0200
Message-Id: <20230425064223.820979-4-armbru@redhat.com>
In-Reply-To: <20230425064223.820979-1-armbru@redhat.com>
References: <20230425064223.820979-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

query-cpu-definitions returns a list of CpuDefinitionInfo, but
documentation claims CpuDefInfo, which doesn't exist.

query-migrate-capabilities returns a list of
MigrationCapabilityStatus, but documentation claims
MigrationCapabilitiesStatus, which doesn't exist.

balloon and query-balloon can fail with KVMMissingCap, but
documentation claims KvmMissingCap, which doesn't exist.

Fix the documentation.

Fixes: e4e31c6324af (qapi: add query-cpu-definitions command (v2))
Fixes: bbf6da32b5bd (Add migration capabilities)
Fixes: d72f326431e2 (qapi: Convert balloon)
Fixes: 96637bcdf9e0 (qapi: Convert query-balloon)
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 qapi/machine-target.json | 2 +-
 qapi/machine.json        | 4 ++--
 qapi/migration.json      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 2e267fa458..b94fbdb65e 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -331,7 +331,7 @@
 #
 # Return a list of supported virtual CPU definitions
 #
-# Returns: a list of CpuDefInfo
+# Returns: a list of CpuDefinitionInfo
 #
 # Since: 1.2
 ##
diff --git a/qapi/machine.json b/qapi/machine.json
index 604b686e59..8c3c58c763 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1029,7 +1029,7 @@
 #
 # Returns: - Nothing on success
 #          - If the balloon driver is enabled but not functional because the KVM
-#            kernel module cannot support it, KvmMissingCap
+#            kernel module cannot support it, KVMMissingCap
 #          - If no balloon device is present, DeviceNotActive
 #
 # Notes: This command just issues a request to the guest.  When it returns,
@@ -1067,7 +1067,7 @@
 #
 # Returns: - @BalloonInfo on success
 #          - If the balloon driver is enabled but not functional because the KVM
-#            kernel module cannot support it, KvmMissingCap
+#            kernel module cannot support it, KVMMissingCap
 #          - If no balloon device is present, DeviceNotActive
 #
 # Since: 0.14
diff --git a/qapi/migration.json b/qapi/migration.json
index c84fa10e86..87c174dca2 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -531,7 +531,7 @@
 #
 # Returns information about the current migration capabilities status
 #
-# Returns: @MigrationCapabilitiesStatus
+# Returns: @MigrationCapabilityStatus
 #
 # Since: 1.2
 #
-- 
2.39.2


