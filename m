Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3829D51A240
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:33:07 +0200 (CEST)
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmG3u-0002pb-B0
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwf-0000os-J2
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwe-0007Ei-1g
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651674335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+TE5ouz8KL2A8BCyvOWgUnAQIXdkz1rfzvortdhYEs=;
 b=aupcs/UPMNwqNnX35Einiu94/kVOdE+kN8ZNRaBn8zCPxulCGeG475N+r95sIba71tOSXN
 UhbGxg4W9253DeeIoB+Mg5vgCUV89OtN23JfFgqYGBzJZ0IWRNa0uvrVePCWXmNdU3X3x6
 O+QyjZ8C034DoRRFgltpgL3ioaC3twc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-a4qbZ0RgP56mXEf7bli40A-1; Wed, 04 May 2022 10:25:32 -0400
X-MC-Unique: a4qbZ0RgP56mXEf7bli40A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDDCF1C3E981;
 Wed,  4 May 2022 14:25:31 +0000 (UTC)
Received: from merkur.str.redhat.com (dhcp-192-180.str.redhat.com
 [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F4F54021A2;
 Wed,  4 May 2022 14:25:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 03/13] libvhost-user: Fix extra vu_add/rem_mem_reg reply
Date: Wed,  4 May 2022 16:25:12 +0200
Message-Id: <20220504142522.167506-4-kwolf@redhat.com>
In-Reply-To: <20220504142522.167506-1-kwolf@redhat.com>
References: <20220504142522.167506-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Outside of postcopy mode, neither VHOST_USER_ADD_MEM_REG nor
VHOST_USER_REM_MEM_REG are supposed to send a reply unless explicitly
requested with the need_reply flag. Their current implementation always
sends a reply, even if it isn't requested. This confuses the master
because it will interpret the reply as a reply for the next message for
which it actually expects a reply.

need_reply is already handled correctly by vu_dispatch(), so just don't
send a reply in the non-postcopy part of the message handler for these
two commands.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220407133657.155281-3-kwolf@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 47d2efc60f..eccaff5168 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -800,8 +800,7 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
 
         DPRINT("Successfully added new region\n");
         dev->nregions++;
-        vmsg_set_reply_u64(vmsg, 0);
-        return true;
+        return false;
     }
 }
 
@@ -874,15 +873,13 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
         }
     }
 
-    if (found) {
-        vmsg_set_reply_u64(vmsg, 0);
-    } else {
+    if (!found) {
         vu_panic(dev, "Specified region not found\n");
     }
 
     close(vmsg->fds[0]);
 
-    return true;
+    return false;
 }
 
 static bool
-- 
2.35.1


