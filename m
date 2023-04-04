Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01716D5FC3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:00:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjfJz-0002Pr-Hc; Tue, 04 Apr 2023 07:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjfJr-0002MJ-Rb
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjfJo-0007we-5V
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680609559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhvl9rrotO69VrDhfA4ZYprWFxPcsrYVHoTpoADIwmY=;
 b=SXC3hwU9aTdD1rC5ufE2L2T+VDUBI+zm66mAPB1GDqbV81hY3mkXIvogT16JXP/fZWL+tg
 bgUtUL7kf7G5CMfEbIt+roFf7A4Mv3GE9AGszahK3fzHb7KH9XNHTMwAV38KG+v2Oc+k+n
 p/nRv7HO29sWGV26RB5Cffts6bpPz9Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-jWkXDOnaNziTBFvHdK7PZg-1; Tue, 04 Apr 2023 07:59:16 -0400
X-MC-Unique: jWkXDOnaNziTBFvHdK7PZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82CF32808E73;
 Tue,  4 Apr 2023 11:59:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60CFC40C6EC4;
 Tue,  4 Apr 2023 11:59:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CE6C621E6696; Tue,  4 Apr 2023 13:59:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org
Subject: [PATCH 06/16] qapi: @foo should be used to reference, not ``foo``
Date: Tue,  4 Apr 2023 13:59:02 +0200
Message-Id: <20230404115912.2829251-7-armbru@redhat.com>
In-Reply-To: <20230404115912.2829251-1-armbru@redhat.com>
References: <20230404115912.2829251-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


