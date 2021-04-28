Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E58D36D65A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:19:25 +0200 (CEST)
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbiE0-0000RT-1S
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxW-0006ic-Pu
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxS-0005HG-Hw
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8na2bOxdY/VLZkOrn2sxiTwzvGhxfXPf2bRe3dzl5MA=;
 b=Zyv/Q5OggwCKdaW9cMPTFoXwiAW/cCHg+5EncLpW2wcR3oaftBy7xHrx6F6ncK5GdbxX2v
 QT3hS6IfBek+NUfFNyic6wGOpnLw0xo2NrXG8YJrEB0Hbk6nmaL7NzX52KC/OKOeHkTFBJ
 JkURGP7IGSQQt068iCAcQSxjtoLu81Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-SL5CcGrVPPComWLo6i6lqg-1; Wed, 28 Apr 2021 07:02:15 -0400
X-MC-Unique: SL5CcGrVPPComWLo6i6lqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9234781840C;
 Wed, 28 Apr 2021 11:02:14 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 570F410016FC;
 Wed, 28 Apr 2021 11:02:13 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 21/26] DAX/unmap virtiofsd: Route unmappable reads
Date: Wed, 28 Apr 2021 12:00:55 +0100
Message-Id: <20210428110100.27757-22-dgilbert@redhat.com>
In-Reply-To: <20210428110100.27757-1-dgilbert@redhat.com>
References: <20210428110100.27757-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

When a read with unmappable buffers is found, map it to a slave
read command.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index f8fd158bb2..c6ea2bd2a1 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -459,6 +459,43 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
         in_sg_left -= ret;
         len -= ret;
     } while (in_sg_left);
+
+    if (bad_in_num) {
+        /* TODO: Rework to send in fewer messages */
+        VhostUserFSSlaveMsg *msg = g_malloc0(sizeof(VhostUserFSSlaveMsg) +
+                                             sizeof(VhostUserFSSlaveMsgEntry));
+        while (len && bad_in_num) {
+            msg->count = 1;
+            msg->entries[0].flags = VHOST_USER_FS_FLAG_MAP_R;
+            msg->entries[0].fd_offset = buf->buf[0].pos;
+            msg->entries[0].c_offset =
+                (uint64_t)(uintptr_t)in_sg_ptr[0].iov_base;
+            msg->entries[0].len = in_sg_ptr[0].iov_len;
+            if (len < msg->entries[0].len) {
+                msg->entries[0].len = len;
+             }
+            int64_t req_res = fuse_virtio_io(se, msg, buf->buf[0].fd);
+            fuse_log(FUSE_LOG_DEBUG,
+                     "%s: bad loop; len=%zd bad_in_num=%d fd_offset=%jd "
+                     "c_offset=%p req_res=%" PRId64 "\n",
+                     __func__, len, bad_in_num, (intmax_t)(buf->buf[0].pos),
+                     in_sg_ptr[0].iov_base, req_res);
+            if (req_res > 0) {
+                len -= msg->entries[0].len;
+                buf->buf[0].pos += msg->entries[0].len;
+                in_sg_ptr++;
+                bad_in_num--;
+            } else if (req_res == 0) {
+                break;
+            } else {
+                ret = req_res;
+                free(in_sg_cpy);
+                g_free(msg);
+                goto err;
+            }
+        }
+        g_free(msg);
+    }
     free(in_sg_cpy);
 
     /* Need to fix out->len on EOF */
-- 
2.31.1


