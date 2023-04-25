Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F96EDBCF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:44:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCOh-0004Xk-Hi; Tue, 25 Apr 2023 02:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCON-0004BX-2C
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:43:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCOJ-0004RC-Dt
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682404980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnbiJdUqt7Fui63ODoE8sxPsfdATTWND/Bq5Rf7J+zE=;
 b=Ptl13TsI9L9UneEd0xkty+dLiww5SG1N+mtHSnzjhDIpQ3A8fxfC/c6RdXcyLuQwwTJ0ti
 U8WO8B/x+gLXwPyeZ6UQSWlxwhk7y/Avz1mU3qtH1+Hi2sWGbM+6rGMo/6jj/6TVcXRQXZ
 CtbAioubd2PYNfcWu2bwmAsCbNqeadc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-sMtlDMstNfa84TZLFz7JvQ-1; Tue, 25 Apr 2023 02:42:55 -0400
X-MC-Unique: sMtlDMstNfa84TZLFz7JvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5072387A9E3;
 Tue, 25 Apr 2023 06:42:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BED740C2064;
 Tue, 25 Apr 2023 06:42:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C4D9621F9814; Tue, 25 Apr 2023 08:42:23 +0200 (CEST)
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
Subject: [PATCH v2 06/16] qapi: @foo should be used to reference, not ``foo``
Date: Tue, 25 Apr 2023 08:42:13 +0200
Message-Id: <20230425064223.820979-7-armbru@redhat.com>
In-Reply-To: <20230425064223.820979-1-armbru@redhat.com>
References: <20230425064223.820979-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Documentation suggests @foo is merely shorthand for ``foo``.  It's
not, it carries additional meaning: it's a reference to a QAPI schema
name.

Reword the documentation to spell that out.

Fix up the few ``foo`` that should be @foo.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 8 +++++---
 docs/interop/firmware.json   | 6 +++---
 qapi/qom.json                | 2 +-
 qapi/ui.json                 | 2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 23e7f2fb1c..23f9059db2 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -925,9 +925,11 @@ first character of the first line.
 
 The usual ****strong****, *\*emphasized\** and ````literal```` markup
 should be used.  If you need a single literal ``*``, you will need to
-backslash-escape it.  As an extension beyond the usual rST syntax, you
-can also use ``@foo`` to reference a name in the schema; this is rendered
-the same way as ````foo````.
+backslash-escape it.
+
+Use ``@foo`` to reference a name in the schema.  This is an rST
+extension.  It is rendered the same way as ````foo````, but carries
+additional meaning.
 
 Example::
 
diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index 56814f02b3..cc8f869186 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -258,7 +258,7 @@
 #
 # @mode: Describes how the firmware build handles code versus variable
 #        storage. If not present, it must be treated as if it was
-#        configured with value ``split``. Since: 7.0.0
+#        configured with value @split. Since: 7.0.0
 #
 # @executable: Identifies the firmware executable. The @mode
 #              indicates whether there will be an associated
@@ -267,13 +267,13 @@
 #                  -drive if=none,id=pflash0,readonly=on,file=@executable.@filename,format=@executable.@format
 #                  -machine pflash0=pflash0
 #              or equivalent -blockdev instead of -drive. When
-#              @mode is ``combined`` the executable must be
+#              @mode is @combined the executable must be
 #              cloned before use and configured with readonly=off.
 #              With QEMU versions older than 4.0, you have to use
 #                  -drive if=pflash,unit=0,readonly=on,file=@executable.@filename,format=@executable.@format
 #
 # @nvram-template: Identifies the NVRAM template compatible with
-#                  @executable, when @mode is set to ``split``,
+#                  @executable, when @mode is set to @split,
 #                  otherwise it should not be present.
 #                  Management software instantiates an
 #                  individual copy -- a specific NVRAM file -- from
diff --git a/qapi/qom.json b/qapi/qom.json
index a877b879b9..4fe7a93a75 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -637,7 +637,7 @@
 #
 # @discard-data: if true, the file contents can be destroyed when QEMU exits,
 #                to avoid unnecessarily flushing data to the backing file. Note
-#                that ``discard-data`` is only an optimization, and QEMU might
+#                that @discard-data is only an optimization, and QEMU might
 #                not discard file contents if it aborts unexpectedly or is
 #                terminated using SIGKILL. (default: false)
 #
diff --git a/qapi/ui.json b/qapi/ui.json
index 25f9d731df..c383c11097 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1247,7 +1247,7 @@
 #              available node on the host.
 #
 # @p2p: Whether to use peer-to-peer connections (accepted through
-#       ``add_client``).
+#       @add_client).
 #
 # @audiodev: Use the specified DBus audiodev to export audio.
 #
-- 
2.39.2


