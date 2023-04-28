Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840196F1636
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:58:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLkT-0008OK-33; Fri, 28 Apr 2023 06:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkO-0008KQ-Lk
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkL-0003xf-J4
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682679277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3T2JN4V5sTEi3+Atgcwj6xKzuaS7DsV2sipAePiKw64=;
 b=EdJlhWxb7n62dCqMxqTdMtMcS70TpHYtDVJvRrbz2VSDL6FaySc7qg7sNL2/UfFDl/5KJx
 +ipXVMQ1gRsmYS1nEf6oINyC/eJxL7m+YZ1skomseRHJ2vNsopJSqGKkQtRxUiBfE3IQ1n
 fVKUU6d8AUhgXSAtUnwXEtLMnh9rQYg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-qO3W_1rJPnaJQ--dTJ18CA-1; Fri, 28 Apr 2023 06:54:33 -0400
X-MC-Unique: qO3W_1rJPnaJQ--dTJ18CA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B820A885636;
 Fri, 28 Apr 2023 10:54:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90D1C492C13;
 Fri, 28 Apr 2023 10:54:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 90F8621D191A; Fri, 28 Apr 2023 12:54:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, eblake@redhat.com, kraxel@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, arei.gonglei@huawei.com,
 pizhenwei@bytedance.com, jsnow@redhat.com, vsementsov@yandex-team.ru,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 jasowang@redhat.com, yuval.shaia.ml@gmail.com, pavel.dovgaluk@ispras.ru,
 jiri@resnulli.us, stefanb@linux.vnet.ibm.com, stefanha@redhat.com,
 lukasstraub2@web.de, kkostiuk@redhat.com, qemu-block@nongnu.org,
 victortoso@redhat.com
Subject: [PATCH 08/17] qapi/dump: Indent bulleted lists consistently
Date: Fri, 28 Apr 2023 12:54:20 +0200
Message-Id: <20230428105429.1687850-9-armbru@redhat.com>
In-Reply-To: <20230428105429.1687850-1-armbru@redhat.com>
References: <20230428105429.1687850-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Documentation of dump-guest-memory contains two bulleted lists.  The
first one is indented, the second one isn't.  Delete the first one's
indentation for a more consistent look.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/dump.json | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/qapi/dump.json b/qapi/dump.json
index 6fc215dd47..24af1df7db 100644
--- a/qapi/dump.json
+++ b/qapi/dump.json
@@ -44,12 +44,12 @@
 #
 #          Also, paging=true has the following limitations:
 #
-#             1. The guest may be in a catastrophic state or can have corrupted
-#                memory, which cannot be trusted
-#             2. The guest can be in real-mode even if paging is enabled. For
-#                example, the guest uses ACPI to sleep, and ACPI sleep state
-#                goes in real-mode
-#             3. Currently only supported on i386 and x86_64.
+#          1. The guest may be in a catastrophic state or can have corrupted
+#             memory, which cannot be trusted
+#          2. The guest can be in real-mode even if paging is enabled. For
+#             example, the guest uses ACPI to sleep, and ACPI sleep state
+#             goes in real-mode
+#          3. Currently only supported on i386 and x86_64.
 #
 # @protocol: the filename or file descriptor of the vmcore. The supported
 #            protocols are:
-- 
2.39.2


