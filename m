Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFEF560581
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 18:12:30 +0200 (CEST)
Received: from localhost ([::1]:47614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6aIn-0000Z2-2j
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 12:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6aFd-0005kp-Qg
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 12:09:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6aFU-0000kX-8v
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 12:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656518941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hNT1ABywLC2MYuSs8awID0RdEFG5HKVPJo69Dkdd2nY=;
 b=GlQiugaT+cSfWV0hydbVKm3iL7SAqqw2LtBoqZdEhDGvjHk9jQvdOy+bGolV5MHsgu8KMp
 yn5AofnpFbGY3ftthldXrbKKJElYt/bO7l18yZ1ogPkiemp+qeLpWv7UJtDdhqnWuwKWTf
 G+XQT19/U2NmDJPkqF9txnlx9FssZI8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-uLtuj2ixPDy-gWL9ZD2Cww-1; Wed, 29 Jun 2022 12:08:59 -0400
X-MC-Unique: uLtuj2ixPDy-gWL9ZD2Cww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A91D1019CA3
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 16:08:59 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E41161121314;
 Wed, 29 Jun 2022 16:08:58 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] scripts: check if .git exists before checking submodule status
Date: Wed, 29 Jun 2022 17:08:57 +0100
Message-Id: <20220629160857.425400-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we check status of each submodule, before actually checking
if we're in a git repo. These status commands will all fail, but we
are hiding their output so we don't see it currently.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 scripts/git-submodule.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
index e225d3a963..7be41f5948 100755
--- a/scripts/git-submodule.sh
+++ b/scripts/git-submodule.sh
@@ -51,6 +51,12 @@ validate_error() {
     exit 1
 }
 
+if test -n "$maybe_modules" && ! test -e ".git"
+then
+    echo "$0: unexpectedly called with submodules but no git checkout exists"
+    exit 1
+fi
+
 modules=""
 for m in $maybe_modules
 do
@@ -63,12 +69,6 @@ do
     fi
 done
 
-if test -n "$maybe_modules" && ! test -e ".git"
-then
-    echo "$0: unexpectedly called with submodules but no git checkout exists"
-    exit 1
-fi
-
 case "$command" in
 status|validate)
     if test -z "$maybe_modules"
-- 
2.36.1


