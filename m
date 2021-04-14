Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481E535F8BE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:17:59 +0200 (CEST)
Received: from localhost ([::1]:54884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWiDG-0007Af-7C
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoZ-0008W8-HW
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoX-0000Uk-ON
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618415541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KmW97gh89uTlkuzjcZvaszrVBqCHZdrJdJncDmo04dU=;
 b=Qz1ry0TKVSO47H39IJgOShZxxdVre5B+qsXb5hqht6um2wSv8vANHNY8DPoupaF6za7zjb
 PmbiTMhZcRO87TrkcByKJUba7RkvbbNsBm6tWowiZb1p0YobpXxllMG9NBuMrrICeK5tMx
 xkGdL56cxOzJUQrNKTw87A+F2qV6d98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-lBE9PU3qO52XBzHHjXuNPw-1; Wed, 14 Apr 2021 11:52:17 -0400
X-MC-Unique: lBE9PU3qO52XBzHHjXuNPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C9DDA6864
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 15:52:16 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-158.ams2.redhat.com
 [10.36.115.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C880610A8;
 Wed, 14 Apr 2021 15:52:15 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 23/25] vhost-user-fs: Extend VhostUserFSSlaveMsg to pass
 additional info
Date: Wed, 14 Apr 2021 16:51:35 +0100
Message-Id: <20210414155137.46522-24-dgilbert@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
index 5511838f29..23bb8436e1 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -244,6 +244,11 @@ uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, int message_size,
         return (uint64_t)-1;
     }
 
+    if (sm->flags & VHOST_USER_FS_GENFLAG_DROP_FSETID) {
+        error_report("Dropping CAP_FSETID is not supported");
+        return (uint64_t)-ENOTSUP;
+    }
+
     for (i = 0; i < sm->count && !res; i++) {
         VhostUserFSSlaveMsgEntry *e = &sm->entries[i];
         if (e->len == 0) {
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 2931164e23..bcd797c0cc 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -30,6 +30,10 @@ OBJECT_DECLARE_SIMPLE_TYPE(VHostUserFS, VHOST_USER_FS)
 #define VHOST_USER_FS_FLAG_MAP_R (1u << 0)
 #define VHOST_USER_FS_FLAG_MAP_W (1u << 1)
 
+/* Generic flags for the overall message and not individual ranges */
+/* Drop capability CAP_FSETID during the operation */
+#define VHOST_USER_FS_GENFLAG_DROP_FSETID (1u << 0)
+
 typedef struct {
     /* Offsets within the file being mapped */
     uint64_t fd_offset;
@@ -42,6 +46,8 @@ typedef struct {
 } VhostUserFSSlaveMsgEntry;
 
 typedef struct {
+    /* Generic flags for the overall message */
+    uint32_t flags;
     /* Number of entries */
     uint16_t count;
     /* Spare */
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 42b0833c4b..4dba4321f4 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -132,6 +132,10 @@ typedef enum VhostUserSlaveRequest {
 #define VHOST_USER_FS_FLAG_MAP_R (1u << 0)
 #define VHOST_USER_FS_FLAG_MAP_W (1u << 1)
 
+/* Generic flags for the overall message and not individual ranges */
+/* Drop capability CAP_FSETID during the operation */
+#define VHOST_USER_FS_GENFLAG_DROP_FSETID (1u << 0)
+
 typedef struct {
     /* Offsets within the file being mapped */
     uint64_t fd_offset;
@@ -144,6 +148,8 @@ typedef struct {
 } VhostUserFSSlaveMsgEntry;
 
 typedef struct {
+    /* Generic flags for the overall message */
+    uint32_t flags;
     /* Number of entries */
     uint16_t count;
     /* Spare */
-- 
2.31.1


