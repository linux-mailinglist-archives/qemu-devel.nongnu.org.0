Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9425B080B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 17:09:03 +0200 (CEST)
Received: from localhost ([::1]:43672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVwfn-0005r2-1j
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 11:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwaV-0004AB-Ed
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:03:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVwaS-0004SZ-8s
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 11:03:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662563011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWuiAcaFUEx6ChP5+VTlvssJgkKQfZz39HkG6D9i7/c=;
 b=RWCgtUay+5Es2J4oFIrheeKl6Cd3sRVSZmh10rF5MlnLQ/XFNuE9ulLWoushuBnY78LPF5
 Ag3oZtjGo3gHyaM7NcHre6dplNYmHri/OpDocXzr0JIXnBYJMJD0shTD3iicHCil8eU5tM
 2Q48UmvqEB7Qk1YV0+RfRul6Z0XC5Jk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-z5SkgGcLOm2aq_gBoId7IA-1; Wed, 07 Sep 2022 11:03:30 -0400
X-MC-Unique: z5SkgGcLOm2aq_gBoId7IA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB7D8101AA64
 for <qemu-devel@nongnu.org>; Wed,  7 Sep 2022 15:03:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C34314010E4D;
 Wed,  7 Sep 2022 15:03:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4E1AC21E675B; Wed,  7 Sep 2022 17:03:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Victor Toso <victortoso@redhat.com>
Subject: [PULL 08/10] qapi: fix examples of blockdev-add with qcow2
Date: Wed,  7 Sep 2022 17:03:25 +0200
Message-Id: <20220907150327.538464-9-armbru@redhat.com>
In-Reply-To: <20220907150327.538464-1-armbru@redhat.com>
References: <20220907150327.538464-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Victor Toso <victortoso@redhat.com>

The examples use "qcow2" driver with the wrong member name for
BlockdevRef alternate type. This patch changes all wrong member names
from "file" to "data-file" which is the correct member name in
BlockdevOptionsQcow2 for the BlockdevRef field.

Problem was noticed when using the example as a test case for Go
bindings.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Message-Id: <20220901085840.22520-9-victortoso@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 882b266532..f21fa235f2 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1541,8 +1541,8 @@
 # -> { "execute": "blockdev-add",
 #      "arguments": { "driver": "qcow2",
 #                     "node-name": "node1534",
-#                     "file": { "driver": "file",
-#                               "filename": "hd1.qcow2" },
+#                     "data-file": { "driver": "file",
+#                                    "filename": "hd1.qcow2" },
 #                     "backing": null } }
 #
 # <- { "return": {} }
@@ -4378,7 +4378,7 @@
 #      "arguments": {
 #           "driver": "qcow2",
 #           "node-name": "test1",
-#           "file": {
+#           "data-file": {
 #               "driver": "file",
 #               "filename": "test.qcow2"
 #            }
@@ -4395,7 +4395,7 @@
 #           "cache": {
 #              "direct": true
 #            },
-#            "file": {
+#           "data-file": {
 #              "driver": "file",
 #              "filename": "/tmp/test.qcow2"
 #            },
@@ -4477,7 +4477,7 @@
 #      "arguments": {
 #           "driver": "qcow2",
 #           "node-name": "node0",
-#           "file": {
+#           "data-file": {
 #               "driver": "file",
 #               "filename": "test.qcow2"
 #           }
-- 
2.37.2


