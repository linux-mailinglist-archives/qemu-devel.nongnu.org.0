Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8933156DE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:36:38 +0100 (CET)
Received: from localhost ([::1]:57006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YoP-0008Ge-EK
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YLO-0004KX-JB
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YLI-0002bB-CC
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/oYr2t8mDYWd6w6H+YWFCqSVP+EpinZjBiYU940ang=;
 b=DFF99qXbhF8rbE9GdIOU574lQz+bHEvdgsyA4MhjsulvqE4RvX4NxybMJF+/8+fnTJmlpo
 geixgjI/h6CMRuqLIjp5upYIt2dXl1ZpVuMuYymmaEf16j51KI//DkZATqMaOndP6NSTv+
 YF8U8Te2JgkpWiDq/mH9keWQrCRhkJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128--IputoMYOOS4spQfOpAx8w-1; Tue, 09 Feb 2021 14:06:21 -0500
X-MC-Unique: -IputoMYOOS4spQfOpAx8w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 751CF107ACE3
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:06:20 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0201560C04;
 Tue,  9 Feb 2021 19:06:15 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 22/24] vhost-user-fs: Extend VhostUserFSSlaveMsg to pass
 additional info
Date: Tue,  9 Feb 2021 19:02:22 +0000
Message-Id: <20210209190224.62827-23-dgilbert@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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

From: Vivek Goyal <vgoyal@redhat.com>

Extend VhostUserFSSlaveMsg so that slave can ask it to drop CAP_FSETID
before doing I/O on fd.

In some cases, virtiofsd takes the onus of clearing setuid bit on a file
when WRITE happens. Generally virtiofsd does the WRITE to fd (from guest
memory which is mapped in virtiofsd as well), but if this memory is
unmappable in virtiofsd (like cache window), then virtiofsd asks qemu
to do the I/O instead.

To retain the capability to drop suid bit on write, qemu needs to
drop the CAP_FSETID as well before write to fd. Extend VhostUserFSSlaveMsg
so that virtiofsd can specify in message if CAP_FSETID needs to be
dropped.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 hw/virtio/vhost-user-fs.c                 | 5 +++++
 include/hw/virtio/vhost-user-fs.h         | 6 ++++++
 subprojects/libvhost-user/libvhost-user.h | 6 ++++++
 3 files changed, 17 insertions(+)

diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 357bc1d04e..61e891c82d 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -176,6 +176,11 @@ uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, VhostUserFSSlaveMsg *sm,
         return (uint64_t)-1;
     }
 
+    if (sm->gen_flags & VHOST_USER_FS_GENFLAG_DROP_FSETID) {
+        error_report("Dropping CAP_FSETID is not supported");
+        return (uint64_t)-ENOTSUP;
+    }
+
     for (i = 0; i < VHOST_USER_FS_SLAVE_ENTRIES && !res; i++) {
         if (sm->len[i] == 0) {
             continue;
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index ffd3165c29..e646eb004a 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -30,7 +30,13 @@ OBJECT_DECLARE_SIMPLE_TYPE(VHostUserFS, VHOST_USER_FS)
 #define VHOST_USER_FS_FLAG_MAP_R (1ull << 0)
 #define VHOST_USER_FS_FLAG_MAP_W (1ull << 1)
 
+/* Generic flags for the overall message and not individual ranges */
+/* Drop capability CAP_FSETID during the operation */
+#define VHOST_USER_FS_GENFLAG_DROP_FSETID (1ull << 0)
+
 typedef struct {
+    /* Generic flags for the overall message */
+    uint64_t gen_flags;
     /* Offsets within the file being mapped */
     uint64_t fd_offset[VHOST_USER_FS_SLAVE_ENTRIES];
     /* Offsets within the cache */
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index a398148ed9..f7de8f6387 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -132,7 +132,13 @@ typedef enum VhostUserSlaveRequest {
 #define VHOST_USER_FS_FLAG_MAP_R (1ull << 0)
 #define VHOST_USER_FS_FLAG_MAP_W (1ull << 1)
 
+/* Generic flags for the overall message and not individual ranges */
+/* Drop capability CAP_FSETID during the operation */
+#define VHOST_USER_FS_GENFLAG_DROP_FSETID (1ull << 0)
+
 typedef struct {
+    /* Generic flags for the overall message */
+    uint64_t gen_flags;
     /* Offsets within the file being mapped */
     uint64_t fd_offset[VHOST_USER_FS_SLAVE_ENTRIES];
     /* Offsets within the cache */
-- 
2.29.2


