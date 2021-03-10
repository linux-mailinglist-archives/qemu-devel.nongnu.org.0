Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5354E3342F8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:23:35 +0100 (CET)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1cU-0000mU-Aj
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1I1-0005U2-E5
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:02:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1Hy-0003bX-55
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dWqF+QRXjws0etT3d7idRupG4kdERl+87BNUQyCGg08=;
 b=GaSJnrLGNPRo0kgDQDohq/cQR3xHOJCHiE6hfsvmv2Xz1GCi63A9fNbjIhz54WkFsJ8f+w
 T2ZI+pW39xZ8ZIrIdjYKPbnuIDD0OEqfVHI0SK/KFEoQL7wNnQIMrgFjNjt8tApKK8uzqP
 JId61JCyblf6ChYSIAXwy/yNWPB6oQw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-ro--kQiQPQqUu84Y6Rm7ng-1; Wed, 10 Mar 2021 11:02:18 -0500
X-MC-Unique: ro--kQiQPQqUu84Y6Rm7ng-1
Received: by mail-ed1-f69.google.com with SMTP id o15so8617154edv.7
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dWqF+QRXjws0etT3d7idRupG4kdERl+87BNUQyCGg08=;
 b=GoFOvHOLdVR0FoWPuT7RW7OFl9X4UHQepjayvcsiBUIBsgwRLsuCoMZU+qWa9zReg3
 SjjUNSQ1xTRKw+OJPK2cV43CsuC9X8kKwp5rAhUNSwSw5QAmFGxXyWApbSbNeLQj3c4h
 saKM9CBscR+Ed8TsG0Siez/D7puafuf0uBCRcjLOQPBo+qcP6729GQML6bFujzCM4PY6
 96nR6pu9IvpdMuTaD+eSbqO4xdo0tQVYa7+Cto0TJrBi+rRzxhCZzqIVHjhmKN5oyQd5
 mLvq+dVQ/LiU+RuvWC4Wv3Uz+Y38DEBWtvZ43hNpdzpuMcDvaaArqSK5iabe+B996ubD
 aUzQ==
X-Gm-Message-State: AOAM531sGThedIaw8R8IIpDJ2Vytqpvvx07jlt9GO9IuDkmRHg0gQyb+
 Z54X0KGQ4wnJZ5XHMhitv7hJwynfgO5p0DosABO+D5yFUA9Q0WQQKnfXBiobBDOnC+J2YujhKnB
 2d7/++1ybiPvEQpNWevBfgRzHPZR2+WBew74M6iZGy0RW/i5e3cw9jCBn4d6x3d8+
X-Received: by 2002:a17:906:5797:: with SMTP id
 k23mr4526774ejq.515.1615392135712; 
 Wed, 10 Mar 2021 08:02:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyodObdZLcjX2jXPfIqYovta4vHSS15YC8kxw0WH9M25h2VAUIToiumsK9emk+Cwym6tF58WA==
X-Received: by 2002:a17:906:5797:: with SMTP id
 k23mr4526749ejq.515.1615392135546; 
 Wed, 10 Mar 2021 08:02:15 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p9sm1225756eds.66.2021.03.10.08.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:02:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 7/7] net/eth: Add an assert() and invert if() statement to
 simplify code
Date: Wed, 10 Mar 2021 17:01:35 +0100
Message-Id: <20210310160135.1148272-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310160135.1148272-1-philmd@redhat.com>
References: <20210310160135.1148272-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To simplify the function body, invert the if() statement, returning
earlier.
Since we already checked there is enough data in the iovec buffer,
simply add an assert() call to consume the bytes_read variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index b150d73c13a..c0a5ca12be2 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -416,16 +416,14 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
     bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset,
                             &rt_hdr, sizeof(rt_hdr));
     assert(bytes_read == sizeof(rt_hdr));
-
-    if ((rt_hdr.rtype == 2) && (rt_hdr.segleft == 1)) {
-        bytes_read = iov_to_buf(pkt, pkt_frags,
-                                ext_hdr_offset + sizeof(*ext_hdr),
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
2.26.2


