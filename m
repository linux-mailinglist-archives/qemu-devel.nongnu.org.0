Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8520E6FDFD1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 16:18:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkca-00029x-89; Wed, 10 May 2023 10:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwkcX-00029o-Je
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwkcV-000891-Va
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683728202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sMrQ3HlHGsOR2pmk7V/A7t8ZTVswJzn54r6gF2xv/7E=;
 b=C7Rm+ba0inAMOGT7DcsH/BmJxasJvRAnG5T1JiEqDpNCa9OGl3dSh/hvKncB9w02ElJmF8
 LXxSPBtNOb0ZIhJYrY2VPrhHZVU4bdffBH5fFjUW+Rv0mTr/bSDWGHGA03IzwWSX6bBnGb
 ZACpvP4acOn9SAbncokTbiItYTXgbUw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-XylugQbwOXu1H5CJRzAA6w-1; Wed, 10 May 2023 10:16:39 -0400
X-MC-Unique: XylugQbwOXu1H5CJRzAA6w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38E7E28135A2;
 Wed, 10 May 2023 14:16:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D997492C13;
 Wed, 10 May 2023 14:16:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E0C1821E6924; Wed, 10 May 2023 16:16:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com,
	jsnow@redhat.com,
	quintela@redhat.com
Subject: [PATCH] qapi: Improve error message for description following section
Date: Wed, 10 May 2023 16:16:37 +0200
Message-Id: <20230510141637.3685080-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The error message is bad when the section is untagged.  For instance,
test case doc-interleaved-section produces "'@foobar:' can't follow
'Note' section", which is okay, but if we drop the "Note:" tag, we get
"'@foobar:' can't follow 'None' section, which is bad.

Change the error message to "description of '@foobar:' follows a
section".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py                        | 4 ++--
 tests/qapi-schema/doc-interleaved-section.err | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 878f90b458..3de467493f 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -700,8 +700,8 @@ def _append_various_line(self, line: str) -> None:
 
         if name.startswith('@') and name.endswith(':'):
             raise QAPIParseError(self._parser,
-                                 "'%s' can't follow '%s' section"
-                                 % (name, self.sections[0].name))
+                                 "description of '%s' follows a section"
+                                 % name)
         if self._is_section_tag(name):
             # If line is "Section:   first line of description", find
             # the index of 'f', which is the indent we expect for any
diff --git a/tests/qapi-schema/doc-interleaved-section.err b/tests/qapi-schema/doc-interleaved-section.err
index 715d58cd31..e5d1ef54c1 100644
--- a/tests/qapi-schema/doc-interleaved-section.err
+++ b/tests/qapi-schema/doc-interleaved-section.err
@@ -1 +1 @@
-doc-interleaved-section.json:15:1: '@foobar:' can't follow 'Note' section
+doc-interleaved-section.json:15:1: description of '@foobar:' follows a section
-- 
2.39.2


