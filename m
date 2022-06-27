Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF0655BA1D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 15:48:41 +0200 (CEST)
Received: from localhost ([::1]:33078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5p6W-0006Ix-EF
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 09:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o5p3N-0003a3-SD
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:45:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o5p3K-0004HJ-1v
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656337515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jB6WvilcSZU4ONsEdU/TwlscEGdt4ahmoMpfX6EfkhY=;
 b=QO0RrJk87Qn9erABjmRhAuhruA0Xfvvs9UEgCpltU4tF75VXzHp0zX8qBBsW3+DLnvyl9m
 DDcDnM4hp/NxXSVgy6c/WRFT5Dk8Sdt7+xV97t84WmJam+zk6Zc4irQin274KM08N8kAx2
 UNdnaS3/v+zBAN0onXsSDqlbkQBhHSo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-e4K-SQkUN0qLG4U2BuI8dA-1; Mon, 27 Jun 2022 09:45:11 -0400
X-MC-Unique: e4K-SQkUN0qLG4U2BuI8dA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7E013801151;
 Mon, 27 Jun 2022 13:45:10 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC6309D54;
 Mon, 27 Jun 2022 13:45:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, mst@redhat.com, raphael.norwitz@nutanix.com,
 stefanha@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 3/3] libvhost-user: Fix VHOST_USER_ADD_MEM_REG reply
Date: Mon, 27 Jun 2022 15:45:00 +0200
Message-Id: <20220627134500.94842-4-kwolf@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With REPLY_NEEDED, libvhost-user sends both the acutal result and an
additional ACK reply for VHOST_USER_ADD_MEM_REG. This is incorrect, the
spec mandates that it behave the same with and without REPLY_NEEDED
because it always sends a reply.

Fixes: ec94c8e621de96c50c2d381c8c9ec94f5beec7c1
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index cfa1bcc334..ffed4729a3 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -779,15 +779,9 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
 
         /* Send the message back to qemu with the addresses filled in. */
         vmsg->fd_num = 0;
-        if (!vu_send_reply(dev, dev->sock, vmsg)) {
-            vu_panic(dev, "failed to respond to add-mem-region for postcopy");
-            return false;
-        }
-
         DPRINT("Successfully added new region in postcopy\n");
         dev->nregions++;
-        return false;
-
+        return true;
     } else {
         for (i = 0; i < dev->max_queues; i++) {
             if (dev->vq[i].vring.desc) {
-- 
2.35.3


