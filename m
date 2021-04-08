Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C8357FD5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:48:34 +0200 (CEST)
Received: from localhost ([::1]:41212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURH7-0006ux-Lo
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lURBK-0002Bo-SC
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:42:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lURBG-0006f5-Ru
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617874950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=g9wLeVhAmi7YFvv8w5bNwWrNKJYxTRwIV8410P0iNJA=;
 b=A/w9H7VIQkbauik6rLth+sNR9s1dHOvBvxAyrNWnPUf+1dWRj5ZJ3BlDrnmS+nbZJXNoa0
 q5H+riA/MHt7JTe/9XlPvB0aqzFA6XoTWHtdI3EhHu7IFcvlxHvD6/f6xpGaLVKF9ak4f1
 HHp8oUOXqRZ+dQwpCTPuyg9DrCHz3Qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-b93KfVuJPcqDWJ6k5P0LLQ-1; Thu, 08 Apr 2021 05:42:28 -0400
X-MC-Unique: b93KfVuJPcqDWJ6k5P0LLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACF813F09;
 Thu,  8 Apr 2021 09:42:27 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-61.pek2.redhat.com
 [10.72.13.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5226510013C1;
 Thu,  8 Apr 2021 09:42:26 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 6/6] tap-win32: correctly recycle buffers
Date: Thu,  8 Apr 2021 17:42:11 +0800
Message-Id: <1617874931-4437-7-git-send-email-jasowang@redhat.com>
In-Reply-To: <1617874931-4437-1-git-send-email-jasowang@redhat.com>
References: <1617874931-4437-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 969e50b61a28 ("net: Pad short frames to minimum size before
sending from SLiRP/TAP") tries to pad frames but try to recyle the
local array that is used for padding to tap thread. This patch fixes
this by recyling the original buffer.

Fixes: 969e50b61a28 ("net: Pad short frames to minimum size before sending from SLiRP/TAP")
Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/tap-win32.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/tap-win32.c b/net/tap-win32.c
index fb92b55..897bd18 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -686,7 +686,7 @@ static ssize_t tap_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 static void tap_win32_send(void *opaque)
 {
     TAPState *s = opaque;
-    uint8_t *buf;
+    uint8_t *buf, *orig_buf;
     int max_size = 4096;
     int size;
     uint8_t min_pkt[ETH_ZLEN];
@@ -694,6 +694,8 @@ static void tap_win32_send(void *opaque)
 
     size = tap_win32_read(s->handle, &buf, max_size);
     if (size > 0) {
+        orig_buf = buf;
+
         if (!s->nc.peer->do_not_pad) {
             if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) {
                 buf = min_pkt;
@@ -702,7 +704,7 @@ static void tap_win32_send(void *opaque)
         }
 
         qemu_send_packet(&s->nc, buf, size);
-        tap_win32_free_buffer(s->handle, buf);
+        tap_win32_free_buffer(s->handle, orig_buf);
     }
 }
 
-- 
2.7.4


