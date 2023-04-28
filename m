Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C246F1590
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:31:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLLo-0006JC-5R; Fri, 28 Apr 2023 06:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLLe-0006GK-Eg
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLLc-0007KO-Qx
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682677744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A/hJOMk/Yz5xFwvFVqF63mhfdXop8hFTtHP4aX+Zego=;
 b=am9qqorTuM70qa+/VTnVBCJ6oRvKr7wCBtYXwS4OgflzOQBRt+51oxl/3WujVzW88lHoL3
 bLnTOj1F1knMZ1YjPak2osmJLL/LdVLnZ8GqYcLQwD+Qud2vnIX2JgXbf2awl6GTbae88V
 vkYoubGRv4RCXKLU1SJ9GkWr14/wNPU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-7OvGuQPyMdGwUMjqU8aTlA-1; Fri, 28 Apr 2023 06:29:02 -0400
X-MC-Unique: 7OvGuQPyMdGwUMjqU8aTlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E0901C041A8;
 Fri, 28 Apr 2023 10:29:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BC4B35443;
 Fri, 28 Apr 2023 10:29:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4357221F9836; Fri, 28 Apr 2023 12:29:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 04/17] qapi: Fix up references to long gone error classes
Date: Fri, 28 Apr 2023 12:28:48 +0200
Message-Id: <20230428102901.1685375-5-armbru@redhat.com>
In-Reply-To: <20230428102901.1685375-1-armbru@redhat.com>
References: <20230428102901.1685375-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Commit de253f14912e88f4 (qmp: switch to the new error format on the
wire) removed most error classes.  Several later commits mistakenly
mentioned them in documentation.  Replace them by the actual error
class there.

Fixes: 44e3e053af56 (qmp: add interface blockdev-snapshot-delete-internal-sync)
Fixes: f323bc9e8b3b (qmp: add interface blockdev-snapshot-internal-sync)
Fixes: ba1c048a8f9c (qapi: Introduce add-fd, remove-fd, query-fdsets)
Fixes: ed61fc10e8c8 (QAPI: add command for live block commit, 'block-commit')
Fixes: e4c8f004c55d (qapi: convert sendkey)
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230425064223.820979-5-armbru@redhat.com>
---
 qapi/block-core.json | 4 ++--
 qapi/misc.json       | 6 +++---
 qapi/ui.json         | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index c05ad0c07e..75f7c62405 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -5784,7 +5784,7 @@
 #          - If any snapshot matching @name exists, or @name is empty,
 #            GenericError
 #          - If the format of the image used does not support it,
-#            BlockFormatFeatureNotSupported
+#            GenericError
 #
 # Since: 1.7
 #
@@ -5820,7 +5820,7 @@
 #          - If @device is not a valid block device, GenericError
 #          - If snapshot not found, GenericError
 #          - If the format of the image used does not support it,
-#            BlockFormatFeatureNotSupported
+#            GenericError
 #          - If @id and @name are both not specified, GenericError
 #
 # Since: 1.7
diff --git a/qapi/misc.json b/qapi/misc.json
index 6ddd16ea28..7e278ca1eb 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -349,8 +349,8 @@
 # @opaque: A free-form string that can be used to describe the fd.
 #
 # Returns: - @AddfdInfo on success
-#          - If file descriptor was not received, FdNotSupplied
-#          - If @fdset-id is a negative value, InvalidParameterValue
+#          - If file descriptor was not received, GenericError
+#          - If @fdset-id is a negative value, GenericError
 #
 # Notes: The list of fd sets is shared by all monitor connections.
 #
@@ -379,7 +379,7 @@
 # @fd: The file descriptor that is to be removed.
 #
 # Returns: - Nothing on success
-#          - If @fdset-id or @fd is not found, FdNotFound
+#          - If @fdset-id or @fd is not found, GenericError
 #
 # Since: 1.2
 #
diff --git a/qapi/ui.json b/qapi/ui.json
index 7ddd27a932..2d9b34b105 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -985,7 +985,7 @@
 #             to 100
 #
 # Returns: - Nothing on success
-#          - If key is unknown or redundant, InvalidParameter
+#          - If key is unknown or redundant, GenericError
 #
 # Since: 1.3
 #
-- 
2.39.2


