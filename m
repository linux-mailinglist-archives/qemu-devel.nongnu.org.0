Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A524F80F1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:47:40 +0200 (CEST)
Received: from localhost ([::1]:40424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncSU7-0001Ge-86
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ncSKr-000214-Hd
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:38:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ncSKq-0001ET-4t
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649338683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cu53vvn5A8LnUt/5E7opHp5vpQBFC/LwNhTarutxcNg=;
 b=NZ3cAqKHR612RXOGAzp40RC/OQFO0KsTOdGI67yQYa+/wqHEtwBW09LSC4PDYm0EST4Eny
 V288PGEcKc7VWbtBYVfTI8vRWfUDezUSji0nkljg38VpWayWLfFGheMH55T/5X7tP6V6dG
 7m5079n4JFumhQj3OVl2XVqu9pBnMwc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-UDQcOXwmMv2eoXz8_2THlg-1; Thu, 07 Apr 2022 09:38:00 -0400
X-MC-Unique: UDQcOXwmMv2eoXz8_2THlg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 208C6899EEC;
 Thu,  7 Apr 2022 13:38:00 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00B9F482CD2;
 Thu,  7 Apr 2022 13:37:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] vhost-user: Don't pass file descriptor for
 VHOST_USER_REM_MEM_REG
Date: Thu,  7 Apr 2022 15:36:57 +0200
Message-Id: <20220407133657.155281-4-kwolf@redhat.com>
In-Reply-To: <20220407133657.155281-1-kwolf@redhat.com>
References: <20220407133657.155281-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, raphael.norwitz@nutanix.com, qemu-block@nongnu.org,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The spec clarifies now that QEMU should not send a file descriptor in a
request to remove a memory region. Change it accordingly.

For libvhost-user, this is a bug fix that makes it compatible with
rust-vmm's implementation that doesn't send a file descriptor. Keep
accepting, but ignoring a file descriptor for compatibility with older
QEMU versions.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/virtio/vhost-user.c                    | 2 +-
 subprojects/libvhost-user/libvhost-user.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 6abbc9da32..82caf607e5 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -751,7 +751,7 @@ static int send_remove_regions(struct vhost_dev *dev,
             vhost_user_fill_msg_region(&region_buffer, shadow_reg, 0);
             msg->payload.mem_reg.region = region_buffer;
 
-            ret = vhost_user_write(dev, msg, &fd, 1);
+            ret = vhost_user_write(dev, msg, NULL, 0);
             if (ret < 0) {
                 return ret;
             }
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index eccaff5168..d0041c864b 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -822,15 +822,15 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     int i;
     bool found = false;
 
-    if (vmsg->fd_num != 1) {
+    if (vmsg->fd_num > 1) {
         vmsg_close_fds(vmsg);
-        vu_panic(dev, "VHOST_USER_REM_MEM_REG received %d fds - only 1 fd "
+        vu_panic(dev, "VHOST_USER_REM_MEM_REG received %d fds - at most 1 fd "
                       "should be sent for this message type", vmsg->fd_num);
         return false;
     }
 
     if (vmsg->size < VHOST_USER_MEM_REG_SIZE) {
-        close(vmsg->fds[0]);
+        vmsg_close_fds(vmsg);
         vu_panic(dev, "VHOST_USER_REM_MEM_REG requires a message size of at "
                       "least %d bytes and only %d bytes were received",
                       VHOST_USER_MEM_REG_SIZE, vmsg->size);
@@ -877,7 +877,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
         vu_panic(dev, "Specified region not found\n");
     }
 
-    close(vmsg->fds[0]);
+    vmsg_close_fds(vmsg);
 
     return false;
 }
-- 
2.35.1


