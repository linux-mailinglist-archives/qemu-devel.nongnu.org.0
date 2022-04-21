Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC050A2B5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:37:36 +0200 (CEST)
Received: from localhost ([::1]:50266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXw7-00037x-U5
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXqQ-0002ba-PI
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:31:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXqN-0004KV-KD
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650551498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jKa7yV2+zsvqUdHt1JXcWtUR1qt3zKiPk0YTzvQppbY=;
 b=WMyEwJjGRa1970XpDlEFDoj/TGhed1fgMcxccGWrBEboyMzBW4VQ/vZAvOzxlwfb8W5vS+
 fQK8NAiXk5IKFqaePLaM92Kf9ZiCYLZwUByxbXl42UvNUqOMP1LvrTuKXI1mcBHCuiNafX
 3rLT7PBdg4fyuNu3C+OqtsyYpHBIRWE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-DGqIlNUbOcq2I04BR2-6EA-1; Thu, 21 Apr 2022 10:31:37 -0400
X-MC-Unique: DGqIlNUbOcq2I04BR2-6EA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEDBE1E17362;
 Thu, 21 Apr 2022 14:31:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD4DE572326;
 Thu, 21 Apr 2022 14:31:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A4B6921E6A21; Thu, 21 Apr 2022 16:31:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] qapi-schema: test: add a qapi-schema-test for array
 alternates
Date: Thu, 21 Apr 2022 16:31:30 +0200
Message-Id: <20220421143135.1491256-3-armbru@redhat.com>
In-Reply-To: <20220421143135.1491256-1-armbru@redhat.com>
References: <20220421143135.1491256-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Check that conflicts among array alternates are detected correctly.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220321164243.200569-3-pbonzini@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Expected test output alternate-conflict-lists.json corrected]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/alternate-conflict-lists.err  | 2 ++
 tests/qapi-schema/alternate-conflict-lists.json | 6 ++++++
 tests/qapi-schema/alternate-conflict-lists.out  | 0
 tests/qapi-schema/meson.build                   | 1 +
 4 files changed, 9 insertions(+)
 create mode 100644 tests/qapi-schema/alternate-conflict-lists.err
 create mode 100644 tests/qapi-schema/alternate-conflict-lists.json
 create mode 100644 tests/qapi-schema/alternate-conflict-lists.out

diff --git a/tests/qapi-schema/alternate-conflict-lists.err b/tests/qapi-schema/alternate-conflict-lists.err
new file mode 100644
index 0000000000..f3374ec1e7
--- /dev/null
+++ b/tests/qapi-schema/alternate-conflict-lists.err
@@ -0,0 +1,2 @@
+alternate-conflict-lists.json: In alternate 'Alt':
+alternate-conflict-lists.json:4: branch 'two' can't be distinguished from 'one'
diff --git a/tests/qapi-schema/alternate-conflict-lists.json b/tests/qapi-schema/alternate-conflict-lists.json
new file mode 100644
index 0000000000..a3efd6c501
--- /dev/null
+++ b/tests/qapi-schema/alternate-conflict-lists.json
@@ -0,0 +1,6 @@
+# Two lists conflict even if their inner types would be compatible
+{ 'struct': 'One',
+  'data': { 'name': 'str' } }
+{ 'alternate': 'Alt',
+  'data': { 'one': [ 'int' ],
+            'two': [ 'str' ] } }
diff --git a/tests/qapi-schema/alternate-conflict-lists.out b/tests/qapi-schema/alternate-conflict-lists.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index caf0791ba8..c18dd7d02f 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -11,6 +11,7 @@ schemas = [
   'alternate-conflict-dict.json',
   'alternate-conflict-enum-bool.json',
   'alternate-conflict-enum-int.json',
+  'alternate-conflict-lists.json',
   'alternate-conflict-string.json',
   'alternate-conflict-bool-string.json',
   'alternate-conflict-num-string.json',
-- 
2.35.1


