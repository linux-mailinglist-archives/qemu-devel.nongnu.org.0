Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D840C590563
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:08:27 +0200 (CEST)
Received: from localhost ([::1]:55336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBfW-0006qg-UO
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oMBMx-0005WJ-Rj
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 12:49:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oMBMv-0004sN-5B
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 12:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660236551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ANa8Y6rbCHK9KUdfRFQpoLYrubd8wPge9/QhHk9tjlI=;
 b=gU0xd7XtcD5Y6WT57exAdEmpeSnhYLlSROqJ0mj7Fn0TfQMPmhKuThDo8vnoDJjdr/TAY6
 e9fjSoWkXNFE95B8eOt6Ye0xv4JNEaA7bG9gF57SOaQnQ16FvzLnyZtK+bj2/YUkGboAA2
 uOEN6zwSa6rs34XGt5jQ0Y1QGPMZ9RE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-h_4DnHFpN6KKgfci7YrZOw-1; Thu, 11 Aug 2022 12:49:08 -0400
X-MC-Unique: h_4DnHFpN6KKgfci7YrZOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 466B2294EDE7;
 Thu, 11 Aug 2022 16:49:08 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A09D740679C1;
 Thu, 11 Aug 2022 16:49:07 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hreitz@redhat.com, integration@gluster.org,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
Subject: [PATCH] gluster: stop using .bdrv_needs_filename
Date: Thu, 11 Aug 2022 12:49:05 -0400
Message-Id: <20220811164905.430834-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gluster protocol driver used to parse URIs (filenames) but was
extended with a richer JSON syntax in commit 6c7189bb29de
("block/gluster: add support for multiple gluster servers"). The gluster
drivers that have JSON parsing set .bdrv_needs_filename to false.

The gluster+unix and gluster+rdma drivers still to require a filename
even though the JSON parser is equipped to parse the same
volume/path/sockaddr details as the URI parser. Let's allow JSON parsing
for these drivers too.

Note that the gluster+rdma driver actually uses TCP because RDMA support
is not available, so the JSON server.type field must be "inet".

Drop .bdrv_needs_filename since both the filename and the JSON parsers
can handle gluster+unix and gluster+rdma. This change is in preparation
for eventually removing .bdrv_needs_filename across the entire codebase.

Cc: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
My motivation was to remove .bdrv_needs_filename across the entire
codebase, but my confidence in avoiding regressions is too low so I gave
up. There is too much magic around the filename. Most drivers don't want
a "filename" QDict entry although .bdrv_parse_filename() places the
filename string there temporarily. But file-posix does want a "filename"
QDict entry so it breaks when we remove .bdrv_needs_filename. I'm pretty
sure it's accidental complexity but it's hard to simplify without
breaking block drivers.

This gluster patch can be merged though, so I'm sending it.

 block/gluster.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/gluster.c b/block/gluster.c
index b60213ab80..bb1144cf6a 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -1555,7 +1555,6 @@ static BlockDriver bdrv_gluster = {
     .format_name                  = "gluster",
     .protocol_name                = "gluster",
     .instance_size                = sizeof(BDRVGlusterState),
-    .bdrv_needs_filename          = false,
     .bdrv_file_open               = qemu_gluster_open,
     .bdrv_reopen_prepare          = qemu_gluster_reopen_prepare,
     .bdrv_reopen_commit           = qemu_gluster_reopen_commit,
@@ -1585,7 +1584,6 @@ static BlockDriver bdrv_gluster_tcp = {
     .format_name                  = "gluster",
     .protocol_name                = "gluster+tcp",
     .instance_size                = sizeof(BDRVGlusterState),
-    .bdrv_needs_filename          = false,
     .bdrv_file_open               = qemu_gluster_open,
     .bdrv_reopen_prepare          = qemu_gluster_reopen_prepare,
     .bdrv_reopen_commit           = qemu_gluster_reopen_commit,
@@ -1615,7 +1613,6 @@ static BlockDriver bdrv_gluster_unix = {
     .format_name                  = "gluster",
     .protocol_name                = "gluster+unix",
     .instance_size                = sizeof(BDRVGlusterState),
-    .bdrv_needs_filename          = true,
     .bdrv_file_open               = qemu_gluster_open,
     .bdrv_reopen_prepare          = qemu_gluster_reopen_prepare,
     .bdrv_reopen_commit           = qemu_gluster_reopen_commit,
@@ -1651,7 +1648,6 @@ static BlockDriver bdrv_gluster_rdma = {
     .format_name                  = "gluster",
     .protocol_name                = "gluster+rdma",
     .instance_size                = sizeof(BDRVGlusterState),
-    .bdrv_needs_filename          = true,
     .bdrv_file_open               = qemu_gluster_open,
     .bdrv_reopen_prepare          = qemu_gluster_reopen_prepare,
     .bdrv_reopen_commit           = qemu_gluster_reopen_commit,
-- 
2.37.1


