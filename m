Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F407533439C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:49:49 +0100 (CET)
Received: from localhost ([::1]:36288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK21s-0006nP-Ua
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1Hy-0005Q6-Nn
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:02:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1Hr-0003ZF-0y
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:02:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7STKW13AjGU8of8784VkFijz8VFi7Qj7fyPQfQCuSc=;
 b=ZeQW+ND8FUrM3a7Gv4t21x5NN+l2rXd/afuHf+LgK7kWD0dyFfl0yM1utNPWOlaDDH/ZzP
 W9hjv5GxBewhlxEVesowA+aNWdisrDhQ4smq4UUe6RWygU13+t6XsekBwdL+J+TtPxhS0s
 aRW+rwExVaHODu44GzxvxyT1oFgfr0E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-W0TbeGdFNcGAebqnQlwn9Q-1; Wed, 10 Mar 2021 11:02:10 -0500
X-MC-Unique: W0TbeGdFNcGAebqnQlwn9Q-1
Received: by mail-ed1-f70.google.com with SMTP id p6so8546492edq.21
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z7STKW13AjGU8of8784VkFijz8VFi7Qj7fyPQfQCuSc=;
 b=NnO0F1+2Zxq9CkzWe7c5QBmXmBoKvmG+oyu42LGx5VDcLhWijVZkAdFnoimfOOdZDt
 EnraUfiOXgS40lwSoLHPzPs6YHvE992sCn9hvFFrKoGfcfMcgCaF6ep+D22l0HGOG2my
 auCvvBQVb+Nb+4zdCewTzQ59vPa4blby8TCYw1ejb7Nt9QQvhrfrl5vG41m5gGFERIfF
 +6oYac3R2t64tpn1gw5CcumiboTQVnoymQrLFF5vUtICDrHEFldvpsV/fcdl2lpvN0Ff
 JQFrSGLQQjMXuWIch6kepzJcGhT6f4AG5XLZuwZsOTYTCEkqQCCjEv9CVHS5CyvpiK4q
 FEkA==
X-Gm-Message-State: AOAM532Vbx6tNgT33NkANOXPsn6cKLdXS4Q2NUciMi5j4GvlIcLqZ4GR
 V80BnLE1xSw0qcwbn4FLXKADrOF+oI7+u580lZ4nNwWe/zB7bBCE95OsNqXiHpoKp1Dqh352uSU
 c6d5pBdlC9Ug6i1TdqooU6yWhW8ThCc+B3wUUIKfidi61WJ+az/beeNkQtIzQc9bP
X-Received: by 2002:aa7:cc94:: with SMTP id p20mr4150209edt.353.1615392124252; 
 Wed, 10 Mar 2021 08:02:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOH5owravIZco1LO5HGj2WOFn+55hGHiAodM7YqXyPpnXRdkEZH4mBWKQGs6m+2c/MfM6EOQ==
X-Received: by 2002:aa7:cc94:: with SMTP id p20mr4149664edt.353.1615392119230; 
 Wed, 10 Mar 2021 08:01:59 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g26sm899475ejz.70.2021.03.10.08.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:01:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/7] net/eth: Check the size earlier
Date: Wed, 10 Mar 2021 17:01:32 +0100
Message-Id: <20210310160135.1148272-5-philmd@redhat.com>
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index 7c47a267a7a..e870d02b0df 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -406,16 +406,14 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
                         struct in6_address *dst_addr)
 {
     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
+    size_t input_size = iov_size(pkt, pkt_frags);
+    size_t bytes_read;
+
+    if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
+        return false;
+    }
 
     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
-
-        size_t input_size = iov_size(pkt, pkt_frags);
-        size_t bytes_read;
-
-        if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
-            return false;
-        }
-
         bytes_read = iov_to_buf(pkt, pkt_frags,
                                 ext_hdr_offset + sizeof(*ext_hdr),
                                 dst_addr, sizeof(*dst_addr));
-- 
2.26.2


