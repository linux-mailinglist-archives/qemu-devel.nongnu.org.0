Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FA2343DB0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:24:57 +0100 (CET)
Received: from localhost ([::1]:33218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHjz-0006KA-HS
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOHUu-0000Ob-4Y
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:09:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOHUq-0003EJ-Eq
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616407752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKu0TbXoKOvidXAk/MBHagsiUWfE2nlmZQxzlW+PyTM=;
 b=E1A39rs/6t5DB+j8IrcirH+rywaMWhIsDiRQkFoDCO049DUSNRcrTFS9j12wLYU8usXHSE
 1ZktLUfYZXxbmN+iQ2vVv97Qy/c2CSj+LKrGc2dec+6NsuEPuJu6ignIhpY4Z53DwdRZZX
 RtdP9i3zOneip0hZ89aVmUzT1/iTBjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-9bz8FdzlMDqgAZI_KdMF5A-1; Mon, 22 Mar 2021 06:09:10 -0400
X-MC-Unique: 9bz8FdzlMDqgAZI_KdMF5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E6AC87A83A;
 Mon, 22 Mar 2021 10:09:09 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-83.pek2.redhat.com
 [10.72.12.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C91B35D9CD;
 Mon, 22 Mar 2021 10:09:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 13/13] net/eth: Add an assert() and invert if() statement to
 simplify code
Date: Mon, 22 Mar 2021 18:08:12 +0800
Message-Id: <1616407692-693-14-git-send-email-jasowang@redhat.com>
In-Reply-To: <1616407692-693-1-git-send-email-jasowang@redhat.com>
References: <1616407692-693-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

To simplify the function body, invert the if() statement, returning
earlier.
Since we already checked there is enough data in the iovec buffer,
simply add an assert() call to consume the bytes_read variable.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/eth.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index b2704fb..fe876d1 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -416,15 +416,14 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
     bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset,
                             &rt_hdr, sizeof(rt_hdr));
     assert(bytes_read == sizeof(rt_hdr));
-
-    if ((rt_hdr.rtype == 2) && (rt_hdr.segleft == 1)) {
-        bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset + sizeof(rt_hdr),
-                                dst_addr, sizeof(*dst_addr));
-
-        return bytes_read == sizeof(*dst_addr);
+    if ((rt_hdr.rtype != 2) || (rt_hdr.segleft != 1)) {
+        return false;
     }
+    bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset + sizeof(rt_hdr),
+                            dst_addr, sizeof(*dst_addr));
+    assert(bytes_read == sizeof(*dst_addr));
 
-    return false;
+    return true;
 }
 
 static bool
-- 
2.7.4


