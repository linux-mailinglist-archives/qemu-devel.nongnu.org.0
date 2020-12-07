Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21142D1893
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:34:52 +0100 (CET)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmLLX-0004pr-Ro
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kmLHW-0003No-PZ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:30:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kmLHV-0002Ph-33
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607365838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsA0nvsC/l8SizmieMhIYpgvpY7NkfPzQetvr4Wdf2s=;
 b=gPzcT6Lso5mEgp1nx/1yhGtB/wbp7kZ9HKxKo3Q/GZaYEaYsHLk6uEEgJaDIBYhUAWItA8
 2IVOX+WdRDE3FEwRS/wIO+kZpmVhYxo4Wb7HOzHnyF/fPhuAfx+ztF+EGLWdqTCwOyZKr2
 gAUdBStnrjkfrJZ9DXITH8j5/vMSeQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-aUeNVUAiMH6K8VjyI6zszA-1; Mon, 07 Dec 2020 13:30:37 -0500
X-MC-Unique: aUeNVUAiMH6K8VjyI6zszA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2726110054FF
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 18:30:36 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-41.rdu2.redhat.com [10.10.116.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7D0F646DC;
 Mon,  7 Dec 2020 18:30:27 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 31EC9225FCD; Mon,  7 Dec 2020 13:30:27 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] virtiofsd: Check file type in lo_flush()
Date: Mon,  7 Dec 2020 13:30:21 -0500
Message-Id: <20201207183021.22752-4-vgoyal@redhat.com>
In-Reply-To: <20201207183021.22752-1-vgoyal@redhat.com>
References: <20201207183021.22752-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mszeredi@redhat.com, dgilbert@redhat.com, virtio-fs@redhat.com,
 stefanha@redhat.com, lersek@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently lo_flush() is written in such a way that it expects to receive
a FLUSH requests on a regular file (and not directories). For example,
we call lo_fi_fd() which searches lo->fd_map. If we open directories
using opendir(), we keep don't keep track of these in lo->fd_map instead
we keep them in lo->dir_map. So we expect lo_flush() to be called on
regular files only.

Even linux fuse client calls FLUSH only for regular files and not
directories. So put a check for filetype and return EBADF if
lo_flush() is called on a non-regular file.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 8ba79f503a..48a109d3f6 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1968,7 +1968,7 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
     struct lo_data *lo = lo_data(req);
 
     inode = lo_inode(req, ino);
-    if (!inode) {
+    if (!inode || !S_ISREG(inode->filetype)) {
         fuse_reply_err(req, EBADF);
         return;
     }
-- 
2.25.4


