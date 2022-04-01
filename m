Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAB54EE9B7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:26:23 +0200 (CEST)
Received: from localhost ([::1]:53254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naCbu-0006sQ-NR
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:26:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naCWJ-0000gY-0x
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:20:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1naCWG-00071e-HT
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648801231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lp9GJ3zVcRvh1J7N+aY3VmwH1KDBUvJglDRLbfH4eC8=;
 b=Fa4Aq0U1ef5oOfykg/EeSzm64lCYhk+7sw+0/9jXw/MaCdj5UQC0iO4/KmKqa73vEQlohb
 eVcIxUgAtn9MrG/SEgSyXaf3OlVbhNHSD8h7REMHyZqy+wFkfrcAzRUn5dosBbaNFYxNVR
 hnKGqfDurKLmoQdfY4CVlAxCEMt9z+E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-Ci6f3l2iN5SGaJn_um_yCg-1; Fri, 01 Apr 2022 04:20:30 -0400
X-MC-Unique: Ci6f3l2iN5SGaJn_um_yCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3CED3C11C6C
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 08:20:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE29F1454536;
 Fri,  1 Apr 2022 08:20:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 88E8C21E691D; Fri,  1 Apr 2022 10:20:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/9] qapi: Fix calc-dirty-rate example
Date: Fri,  1 Apr 2022 10:20:28 +0200
Message-Id: <20220401082028.3583296-1-armbru@redhat.com>
In-Reply-To: <20220331190633.121077-1-victortoso@redhat.com>
References: <20220331190633.121077-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, eblake@redhat.com, victortoso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The example shows {"command": ...}, which is wrong.  Fix it to
{"execute": ...}.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/migration.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index f74777608a..27d7b28158 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1845,7 +1845,7 @@
 # Since: 5.2
 #
 # Example:
-#   {"command": "calc-dirty-rate", "arguments": {"calc-time": 1,
+#   {"execute": "calc-dirty-rate", "arguments": {"calc-time": 1,
 #                                                'sample-pages': 512} }
 #
 ##
-- 
2.35.1


