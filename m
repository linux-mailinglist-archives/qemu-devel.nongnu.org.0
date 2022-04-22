Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B750B8B5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:38:35 +0200 (CEST)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtUX-00013U-PG
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhtKe-0006ou-70
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhtKY-0000rz-WD
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650634094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vCroQEVY0Pw/VX1WufgysZm4LCrJaYGXNL9WklKST/k=;
 b=EeZ3eE4P8xA0eEqatay4bAAmbxC8hk4PbVd+m+osUx6VTDTKb2P23GP66nYyCUCxrVeGRu
 OtwM9kRmxfbcuvU0ZoGMlgbiFJoFkOnlEtWfztPoxvOckHSufsW0/0z5Lw1UD6Ri6V9aab
 G0HJJUZFm5qWIAKcHr1gfAbQprrGWoQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-eQ-ztjgRMC2DVJghSfIWYg-1; Fri, 22 Apr 2022 09:28:11 -0400
X-MC-Unique: eQ-ztjgRMC2DVJghSfIWYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2025A80A0AD;
 Fri, 22 Apr 2022 13:28:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3B2340F4940;
 Fri, 22 Apr 2022 13:28:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B719321E6A1F; Fri, 22 Apr 2022 15:28:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi: Fix malformed "Since:" section tags
Date: Fri, 22 Apr 2022 15:28:07 +0200
Message-Id: <20220422132807.1704411-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: eduardo@habkost.net, berrange@redhat.com, michael.roth@amd.com,
 f4bug@amsat.org, wangyanan55@huawei.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Since X.Y" is not recognized as a tagged section, and therefore not
formatted as such in generated documentation.  Fix by adding the
required colon.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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
index d25a481ce4..84b7fd7c28 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -970,7 +970,7 @@
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
index 94e4aacdcc..1812823d88 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -899,7 +899,7 @@
 # @alias: optional alias assigned to the disk, on Linux this is a name assigned
 #         by device mapper
 #
-# Since 5.2
+# Since: 5.2
 ##
 { 'struct': 'GuestDiskInfo',
   'data': {'name': 'str', 'partition': 'bool', '*dependencies': ['str'],
-- 
2.35.1


