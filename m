Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9431855BA20
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 15:51:21 +0200 (CEST)
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5p96-0003Ng-F7
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 09:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o5p3L-0003Zo-Jo
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:45:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o5p3I-0004Gg-I7
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:45:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656337511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwzEscNtBC5gZJjV2nWFleOOxr6xG8ffHaBS2h+13i4=;
 b=T/q6PTjZCFk6bRDC1WGbiCARE2XzPBXPtlhVaQEVvbcz8bVSxcrcB24rQ0nfZCnGSHyb4W
 KrZ8zPEB66YeBiGzE87pHLrV8gzF5UcohYifLFkp8GEpoQTd0DfetzO7faqh9ZBBvEqJim
 rKHLelW8k8YA3eZ1amu7J76aeLPLpEg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-76dScAmIOCOZ248vrLQbVw-1; Mon, 27 Jun 2022 09:45:10 -0400
X-MC-Unique: 76dScAmIOCOZ248vrLQbVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B32462803020;
 Mon, 27 Jun 2022 13:45:09 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6DEF18EAC;
 Mon, 27 Jun 2022 13:45:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, mst@redhat.com, raphael.norwitz@nutanix.com,
 stefanha@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 2/3] libvhost-user: Fix VHOST_USER_GET_MAX_MEM_SLOTS reply
Date: Mon, 27 Jun 2022 15:44:59 +0200
Message-Id: <20220627134500.94842-3-kwolf@redhat.com>
In-Reply-To: <20220627134500.94842-1-kwolf@redhat.com>
References: <20220627134500.94842-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With REPLY_NEEDED, libvhost-user sends both the acutal result and an
additional ACK reply for VHOST_USER_GET_MAX_MEM_SLOTS. This is
incorrect, the spec mandates that it behave the same with and without
REPLY_NEEDED because it always sends a reply.

Fixes: 6fb2e173d20c9bbb5466183d33a3ad7dcd0375fa
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index b4cc3c2d68..cfa1bcc334 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1827,18 +1827,11 @@ vu_handle_vring_kick(VuDev *dev, VhostUserMsg *vmsg)
 
 static bool vu_handle_get_max_memslots(VuDev *dev, VhostUserMsg *vmsg)
 {
-    vmsg->flags = VHOST_USER_REPLY_MASK | VHOST_USER_VERSION;
-    vmsg->size  = sizeof(vmsg->payload.u64);
-    vmsg->payload.u64 = VHOST_USER_MAX_RAM_SLOTS;
-    vmsg->fd_num = 0;
-
-    if (!vu_message_write(dev, dev->sock, vmsg)) {
-        vu_panic(dev, "Failed to send max ram slots: %s\n", strerror(errno));
-    }
+    vmsg_set_reply_u64(vmsg, VHOST_USER_MAX_RAM_SLOTS);
 
     DPRINT("u64: 0x%016"PRIx64"\n", (uint64_t) VHOST_USER_MAX_RAM_SLOTS);
 
-    return false;
+    return true;
 }
 
 static bool
-- 
2.35.3


