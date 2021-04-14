Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AEF35F8B2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:09:56 +0200 (CEST)
Received: from localhost ([::1]:59758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWi5T-0005IH-71
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoR-0008Q6-Sw
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoN-0000SU-QJ
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618415535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOcwNXYhqkABgNUcL/n2UG0DsBjC65kOgntv4sKnI8U=;
 b=QbO2j9lGJD4e4G94YBqdE1+DTa7fNf5vY+q2NprpExjYu1WzDYM+nKrtiW3F+p4oB87OSf
 /4tdXiS+HMNNRmQ6yymGQMwj9tbsy8upEMJAMyYdHI2uhD5U12fz2/Fxd7zhfj8sMkW4SX
 9yDlFbqfjGt6H8Tyng63khffoBXiE6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-ib4jfAR1NRGIys7g90OuPg-1; Wed, 14 Apr 2021 11:52:13 -0400
X-MC-Unique: ib4jfAR1NRGIys7g90OuPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E13FA6882
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 15:52:12 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-158.ams2.redhat.com
 [10.36.115.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 649BA18A49;
 Wed, 14 Apr 2021 15:52:11 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 20/25] DAX/unmap virtiofsd: Route unmappable reads
Date: Wed, 14 Apr 2021 16:51:32 +0100
Message-Id: <20210414155137.46522-21-dgilbert@redhat.com>
In-Reply-To: <20210414155137.46522-1-dgilbert@redhat.com>
References: <20210414155137.46522-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
index 5ed78bd8cf..887e79a126 100644
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
+                     "%s: bad loop; len=%zd bad_in_num=%d fd_offset=%zd "
+                     "c_offset=%p req_res=%ld\n",
+                     __func__, len, bad_in_num, buf->buf[0].pos,
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


