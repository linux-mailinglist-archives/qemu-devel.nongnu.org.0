Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD185F107E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:04:50 +0200 (CEST)
Received: from localhost ([::1]:50100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJRR-0004LI-5y
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFm-0006XQ-LX
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFk-0006e9-Cg
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0OP/YCnMAst7Ev33t3y4TPD65HHLbD4KS+txjnlQXqo=;
 b=U/prbKxydUNxR9VfgZzNq6y7pUNkoRqJVehO4gOhVIoHZQclF5/iykpuXflKuSDR0idmnB
 A2hUc+zCq2xIOb9ud69AoJi7w9LdFh14Rh7FqT89NSNSE3c8K7vDZCyqoXMD3eKRrdBWPv
 Y+K1cRWTAoltj//i4O6faqHuzlPVA1I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-j8AIZDwnNcGGpSHr9T1ViA-1; Fri, 30 Sep 2022 12:52:42 -0400
X-MC-Unique: j8AIZDwnNcGGpSHr9T1ViA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA2513C1022A;
 Fri, 30 Sep 2022 16:52:41 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3617817582;
 Fri, 30 Sep 2022 16:52:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 08/18] gluster: stop using .bdrv_needs_filename
Date: Fri, 30 Sep 2022 18:52:12 +0200
Message-Id: <20220930165222.249716-9-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

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
Message-Id: <20220811164905.430834-1-stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
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
2.37.3


