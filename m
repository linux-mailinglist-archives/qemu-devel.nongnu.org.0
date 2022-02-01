Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9CD4A622D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:18:33 +0100 (CET)
Received: from localhost ([::1]:46744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwnY-0001DV-Fr
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:18:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyM-0002ik-CP
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyK-0003yG-4A
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643728889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NV83hLgYD6FtCD9SUr4zYxIFzDcCRJJami5/Js2EMHg=;
 b=ITYZx7AJdL/8BazVdubKT6GH5mF6FBJWqJ47QuobRl7Fxy8fPxdMCsCaBgTL/rfd0o3WwG
 RMoiSBp+MdYr2k6DBEbKYkWnSzeRlgtmrj/B0y5ydfRMue3KTHZNviUn2bVuZg/0t83O3L
 UGO9maMz1M/kCjBxDZpsXP26FLivX+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-sYQzYp6mPS-6MJ-Tsk4LUw-1; Tue, 01 Feb 2022 10:21:26 -0500
X-MC-Unique: sYQzYp6mPS-6MJ-Tsk4LUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87CA351081;
 Tue,  1 Feb 2022 15:21:25 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F44374E98;
 Tue,  1 Feb 2022 15:21:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/10] qsd: Document fuse's allow-other option
Date: Tue,  1 Feb 2022 16:21:05 +0100
Message-Id: <20220201152108.171898-8-kwolf@redhat.com>
In-Reply-To: <20220201152108.171898-1-kwolf@redhat.com>
References: <20220201152108.171898-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

We did not add documentation to the storage daemon's man page for fuse's
allow-other option when it was introduced, so do that now.

Fixes: 8fc54f9428b9763f800 ("export/fuse: Add allow-other option")
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220131103124.20325-1-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/tools/qemu-storage-daemon.rst   | 9 +++++++--
 storage-daemon/qemu-storage-daemon.c | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index 9b0eaba6e5..878e6a5c5c 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -76,7 +76,7 @@ Standard options:
 .. option:: --export [type=]nbd,id=<id>,node-name=<node-name>[,name=<export-name>][,writable=on|off][,bitmap=<name>]
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=fd,addr.str=<fd>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
-  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off]
+  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off][,allow-other=on|off|auto]
 
   is a block export definition. ``node-name`` is the block node that should be
   exported. ``writable`` determines whether or not the export allows write
@@ -103,7 +103,12 @@ Standard options:
   mounted). Consequently, applications that have opened the given file before
   the export became active will continue to see its original content. If
   ``growable`` is set, writes after the end of the exported file will grow the
-  block node to fit.
+  block node to fit.  The ``allow-other`` option controls whether users other
+  than the user running the process will be allowed to access the export.  Note
+  that enabling this option as a non-root user requires enabling the
+  user_allow_other option in the global fuse.conf configuration file.  Setting
+  ``allow-other`` to auto (the default) will try enabling this option, and on
+  error fall back to disabling it.
 
 .. option:: --monitor MONITORDEF
 
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index ec9aa79b55..504d33aa91 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -100,7 +100,7 @@ static void help(void)
 "\n"
 #ifdef CONFIG_FUSE
 "  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>\n"
-"           [,growable=on|off][,writable=on|off]\n"
+"           [,growable=on|off][,writable=on|off][,allow-other=on|off|auto]\n"
 "                         export the specified block node over FUSE\n"
 "\n"
 #endif /* CONFIG_FUSE */
-- 
2.31.1


