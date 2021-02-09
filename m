Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A52315689
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:11:48 +0100 (CET)
Received: from localhost ([::1]:58230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YQN-00088T-A0
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:11:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YL6-00045c-75
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YKx-0002Qz-2w
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/ejKjFIclrNcqqmohGqfzQuQM1Jg6BBc10aarO0k+4=;
 b=NyVDfytS3WigB8uAJOTHiBupG3QEO4Eb0US2UTyKKLAhK998e+bsTcGwiOKTPFw1aVzX8u
 5qLeY5uuzolb1gVGjcmW+hyrfqYanodiDzQvYVLakgU5sCRJyqRTe1i/tNIjTMq5y/JhFT
 8l9pdURDxxd8pIdw8U+ozaRwHpvHRn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-G70tmIK-OH6TEpCNuI95Ng-1; Tue, 09 Feb 2021 14:06:06 -0500
X-MC-Unique: G70tmIK-OH6TEpCNuI95Ng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3087803F47
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:06:05 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BEF960C04;
 Tue,  9 Feb 2021 19:06:01 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 19/24] DAX/unmap virtiofsd: Route unmappable reads
Date: Tue,  9 Feb 2021 19:02:19 +0000
Message-Id: <20210209190224.62827-20-dgilbert@redhat.com>
In-Reply-To: <20210209190224.62827-1-dgilbert@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 tools/virtiofsd/fuse_virtio.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 8fa438525f..316d1f2463 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -397,6 +397,37 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
         in_sg_left -= ret;
         len -= ret;
     } while (in_sg_left);
+
+    if (bad_in_num) {
+        while (len && bad_in_num) {
+            VhostUserFSSlaveMsg msg = { 0 };
+            msg.flags[0] = VHOST_USER_FS_FLAG_MAP_R;
+            msg.fd_offset[0] = buf->buf[0].pos;
+            msg.c_offset[0] = (uint64_t)(uintptr_t)in_sg_ptr[0].iov_base;
+            msg.len[0] = in_sg_ptr[0].iov_len;
+            if (len < msg.len[0]) {
+                msg.len[0] = len;
+            }
+            int64_t req_res = fuse_virtio_io(se, &msg, buf->buf[0].fd);
+            fuse_log(FUSE_LOG_DEBUG,
+                     "%s: bad loop; len=%zd bad_in_num=%d fd_offset=%zd "
+                     "c_offset=%p req_res=%ld\n",
+                     __func__, len, bad_in_num, buf->buf[0].pos,
+                     in_sg_ptr[0].iov_base, req_res);
+            if (req_res > 0) {
+                len -= msg.len[0];
+                buf->buf[0].pos += msg.len[0];
+                in_sg_ptr++;
+                bad_in_num--;
+            } else if (req_res == 0) {
+                break;
+            } else {
+                ret = req_res;
+                free(in_sg_cpy);
+                goto err;
+            }
+        }
+    }
     free(in_sg_cpy);
 
     /* Need to fix out->len on EOF */
-- 
2.29.2


