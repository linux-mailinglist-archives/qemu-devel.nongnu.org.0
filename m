Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB46E527F14
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 10:00:46 +0200 (CEST)
Received: from localhost ([::1]:44724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqVen-0002v9-7p
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 04:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGM-0000pE-RG
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGK-0001tK-Ba
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652686527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nVs0tTWztHs6ZlUgnvC6/5Q8RdDUtZcXV4Z0DzV0zqg=;
 b=CTFYIFg8QeGY3yYVxDAC/jXPTiB0quYYqkohRsIZaFigKHY60ehkFr+UWI6iDsoNvzSJus
 4TQMCn+56XT+rHK7XnGRFYr6uyCHp6B3GoS9HefEJP1UVpC93QJFkOtzJj1MlNPW9JRrjB
 gYJEDIN3NP8IyrY5FcoTNUfaPdzlmgI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-9aO4TQ4-OHCLsLTuOOfuCg-1; Mon, 16 May 2022 03:35:24 -0400
X-MC-Unique: 9aO4TQ4-OHCLsLTuOOfuCg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2093C85A5BE;
 Mon, 16 May 2022 07:35:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F173357038A;
 Mon, 16 May 2022 07:35:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D299D21E690F; Mon, 16 May 2022 09:35:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Andrea Bolognani <abologna@redhat.com>
Subject: [PULL 01/11] qapi: Fix malformed "Since:" section tags
Date: Mon, 16 May 2022 09:35:12 +0200
Message-Id: <20220516073522.3880774-2-armbru@redhat.com>
In-Reply-To: <20220516073522.3880774-1-armbru@redhat.com>
References: <20220516073522.3880774-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Since X.Y" is not recognized as a tagged section, and therefore not
formatted as such in generated documentation.  Fix by adding the
required colon.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220422132807.1704411-1-armbru@redhat.com>
Reviewed-by: Andrea Bolognani <abologna@redhat.com>
---
 qapi/crypto.json     | 3 +--
 qapi/machine.json    | 2 +-
 qapi/misc.json       | 2 +-
 qga/qapi-schema.json | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index 1ec54c15ca..8e0b4764e5 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -357,8 +357,7 @@
 #                 password to use to retrieve current master key.
 #                 Defaults to the same secret that was used to open the image
 #
-#
-# Since 5.1
+# Since: 5.1
 ##
 { 'struct': 'QCryptoBlockAmendOptionsLUKS',
   'data': { 'state': 'QCryptoBlockLUKSKeyslotState',
diff --git a/qapi/machine.json b/qapi/machine.json
index 92480d4044..c9bdae40eb 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -972,7 +972,7 @@
 # preconfigure stage to configure numa mapping before initializing
 # machine.
 #
-# Since 3.0
+# Since: 3.0
 ##
 { 'command': 'set-numa-node', 'boxed': true,
   'data': 'NumaOptions',
diff --git a/qapi/misc.json b/qapi/misc.json
index b83cc39029..f8a9feda30 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -188,7 +188,7 @@
 # Features:
 # @unstable: This command is experimental.
 #
-# Since 3.0
+# Since: 3.0
 #
 # Returns: nothing
 #
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 4d8e506c9e..f989597b0c 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -950,7 +950,7 @@
 #         by device mapper
 # @smart: disk smart information (Since 7.1)
 #
-# Since 5.2
+# Since: 5.2
 ##
 { 'struct': 'GuestDiskInfo',
   'data': {'name': 'str', 'partition': 'bool', '*dependencies': ['str'],
-- 
2.35.3


