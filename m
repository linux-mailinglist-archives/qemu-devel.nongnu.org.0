Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169132DE1B5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:04:49 +0100 (CET)
Received: from localhost ([::1]:54786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDZ2-0004tW-2R
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCt-0003aH-E4
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCr-0004e5-IT
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpyPVaY74FgLMjBqYw7cDckFWoP7kVFPc/zHYU0Hjf0=;
 b=a8jbvJecwF7H4vjONbD+tOqmf31vIm2lgINoCaigJCgT7qGOLYsysddZvFt+d6O0pARVEF
 rCSlULHxaTb2jonRwO1JCGjAXwqjBxlPbSBQCKaFTrwwyLhrNQrGXhP46AAN07zoMrtIAV
 VVa926J0Q83Hb8KkepD8JGMLQB4+LS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-WbMB-LHQPf2uocNqfx6pgQ-1; Fri, 18 Dec 2020 05:41:50 -0500
X-MC-Unique: WbMB-LHQPf2uocNqfx6pgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 758C7801B14;
 Fri, 18 Dec 2020 10:41:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6ADF360C15;
 Fri, 18 Dec 2020 10:41:47 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 09/15] virtiofsd: Check file type in lo_flush()
Date: Fri, 18 Dec 2020 10:41:11 +0000
Message-Id: <20201218104117.199096-10-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

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
Message-Id: <20201211142544.GB3285@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 4f805cbb82..b00be648d3 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1961,6 +1961,12 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
         return;
     }
 
+    if (!S_ISREG(inode->filetype)) {
+        lo_inode_put(lo, &inode);
+        fuse_reply_err(req, EBADF);
+        return;
+    }
+
     /* An fd is going away. Cleanup associated posix locks */
     if (lo->posix_lock) {
         pthread_mutex_lock(&inode->plock_mutex);
-- 
2.29.2


