Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC8734C1EA
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 04:22:13 +0200 (CEST)
Received: from localhost ([::1]:33142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQhXg-0004fV-BK
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 22:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lQhVw-00048r-5P
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 22:20:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lQhVt-0005nk-6N
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 22:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616984418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XEyebLpdd0Wbn7joiPOJyXamZr2ndviXau08KyjElZg=;
 b=bqMeZCyZGuGux339rcJM/1jQzmseGlyjhETVPOlOsl2E0dw/ClY/UHFknkAA+HD+s2lRG7
 NY6gYgvbRQOwH3+hzjt2XL9vYRVeuaLW7IDI/nt1qe0cKkEvjTYaaBHRjtQxkdvjNoBMU2
 PpkNvPkM7YO+pQLkyvmuEbNAMDs9pSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-9Laup5g-N9GzghroI0bdAQ-1; Sun, 28 Mar 2021 22:20:14 -0400
X-MC-Unique: 9Laup5g-N9GzghroI0bdAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA5EC64151;
 Mon, 29 Mar 2021 02:20:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-5.pek2.redhat.com [10.72.13.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 237CF1992D;
 Mon, 29 Mar 2021 02:20:08 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: jasowang@redhat.com,
	sw@weilnetz.de
Subject: [PATCH] tap-win32: correctly recycle buffers
Date: Mon, 29 Mar 2021 10:20:06 +0800
Message-Id: <20210329022006.55532-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, bmeng.cn@gmail.com, hsp.cat7@gmail.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 969e50b61a28 ("net: Pad short frames to minimum size before
sending from SLiRP/TAP") tries to pad frames but try to recyle the
local array that is used for padding to tap thread. This patch fixes
this by recyling the original buffer.

Fixes: 969e50b61a28 ("net: Pad short frames to minimum size before sending from SLiRP/TAP")
Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/tap-win32.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/tap-win32.c b/net/tap-win32.c
index d7c2a8759c..7a6f3d7384 100644
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
2.24.3 (Apple Git-128)


