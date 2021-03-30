Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9834E7D7
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:49:36 +0200 (CEST)
Received: from localhost ([::1]:59220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDoO-0007dJ-0C
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfd-000147-14
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfS-0003QL-4F
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617108019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BcV7OFirmTsF/6Vx4L9qORemtTd4108boUdPewlJ840=;
 b=YY55cID8R2/up8Fk/5VTWClUcMUF7DMjd/Dy25JccsAd1uPvF1Csx96W4ldG/um5NoGvg6
 6+wsx9fXhmyckb40hLqfyWyko7LK3eucxzy0tyivPzy3mY5qSF87Tz/Os6lRLlzvZ96/az
 QDUqw/cpgc+kXLt5GkzHet1PETpKQqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-HEDJC3NRNueQFDhhwveYdg-1; Tue, 30 Mar 2021 08:40:15 -0400
X-MC-Unique: HEDJC3NRNueQFDhhwveYdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5499DF8A9;
 Tue, 30 Mar 2021 12:40:14 +0000 (UTC)
Received: from localhost (ovpn-113-220.ams2.redhat.com [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 799E12AC85;
 Tue, 30 Mar 2021 12:40:14 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 7/9] qsd: Document FUSE exports
Date: Tue, 30 Mar 2021 14:39:55 +0200
Message-Id: <20210330123957.826170-8-mreitz@redhat.com>
In-Reply-To: <20210330123957.826170-1-mreitz@redhat.com>
References: <20210330123957.826170-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implementing FUSE exports required no changes to the storage daemon, so
we forgot to document them there.  Considering that both NBD and
vhost-user-blk exports are documented in its man page (and NBD exports
in its --help text), we should probably do the same for FUSE.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210217115844.62661-1-mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 docs/tools/qemu-storage-daemon.rst   | 19 +++++++++++++++++++
 storage-daemon/qemu-storage-daemon.c |  4 ++++
 2 files changed, 23 insertions(+)

diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index 086493ebb3..3ec4bdd914 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -74,6 +74,7 @@ Standard options:
 .. option:: --export [type=]nbd,id=<id>,node-name=<node-name>[,name=<export-name>][,writable=on|off][,bitmap=<name>]
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=fd,addr.str=<fd>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
+  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>[,growable=on|off][,writable=on|off]
 
   is a block export definition. ``node-name`` is the block node that should be
   exported. ``writable`` determines whether or not the export allows write
@@ -92,6 +93,16 @@ Standard options:
   ``logical-block-size`` sets the logical block size in bytes (the default is
   512). ``num-queues`` sets the number of virtqueues (the default is 1).
 
+  The ``fuse`` export type takes a mount point, which must be a regular file,
+  on which to export the given block node. That file will not be changed, it
+  will just appear to have the block node's content while the export is active
+  (very much like mounting a filesystem on a directory does not change what the
+  directory contains, it only shows a different content while the filesystem is
+  mounted). Consequently, applications that have opened the given file before
+  the export became active will continue to see its original content. If
+  ``growable`` is set, writes after the end of the exported file will grow the
+  block node to fit.
+
 .. option:: --monitor MONITORDEF
 
   is a QMP monitor definition. See the :manpage:`qemu(1)` manual page for
@@ -196,6 +207,14 @@ domain socket ``vhost-user-blk.sock``::
       --blockdev driver=qcow2,node-name=qcow2,file=file \
       --export type=vhost-user-blk,id=export,addr.type=unix,addr.path=vhost-user-blk.sock,node-name=qcow2
 
+Export a qcow2 image file ``disk.qcow2`` via FUSE on itself, so the disk image
+file will then appear as a raw image::
+
+  $ qemu-storage-daemon \
+      --blockdev driver=file,node-name=file,filename=disk.qcow2 \
+      --blockdev driver=qcow2,node-name=qcow2,file=file \
+      --export type=fuse,id=export,node-name=qcow2,mountpoint=disk.qcow2,writable=on
+
 See also
 --------
 
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 72900dc2ec..fc8b150629 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -98,6 +98,10 @@ static void help(void)
 "                         export the specified block node over NBD\n"
 "                         (requires --nbd-server)\n"
 "\n"
+"  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>\n"
+"           [,growable=on|off][,writable=on|off]\n"
+"                         export the specified block node over FUSE\n"
+"\n"
 "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
 "                         configure a QMP monitor\n"
 "\n"
-- 
2.29.2


