Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6403A332F9C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:10:36 +0100 (CET)
Received: from localhost ([::1]:52506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJigd-0004Ui-0e
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJh50-0000V4-Mw
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:27:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJh4w-0001Al-Vp
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615314454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHs02CwzRBs33Sh0xyloFVVfVxuoFsSy6sEOJItTgcA=;
 b=Z1Vf4uyWvNvQkZj1kLHfhC3RSdrpWrb9Iti4nkRzr+RAsSwOgbPPYAqA6o/Es0XxaZbMG6
 Y9prOLgOKy3OGL09ou7lv5CPJkR/ST6RHacroL4c3XNU3edx31TN1WLAZEiqB6qBxqhBJM
 GTwdZ9X65dwZ2QH2x+N0lQom81BDNCA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-oJ1wERrXMK2G4rttRHsbww-1; Tue, 09 Mar 2021 13:27:29 -0500
X-MC-Unique: oJ1wERrXMK2G4rttRHsbww-1
Received: by mail-ej1-f69.google.com with SMTP id v19so6069487ejc.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xHs02CwzRBs33Sh0xyloFVVfVxuoFsSy6sEOJItTgcA=;
 b=RfRUeiJnVPus1AoDllmV0WZrrU6YmRmnzl+vMK1Z0a18HM8tdSOQgCHqFSrYxF55U/
 GKhRJoofMtPp0yilerDmqidMGrs89Xkoi0MPj6SKdreCYaGHk6t45cSUNMQbZ11MXV80
 3ds76Gk/+RGUWsm9x+pQd92u+Nu85dkrrNWjKuOW2IASZdIY3N3YTZU+qsjCrg67GWG9
 N56KQ9bZOqM+meNWnbkVI/gkSkWPwrSru3yg0Rj2xz0XXDBr5XD7hrJxiJRoWe0hEnRi
 wBXJoeVCGzQCH6BlCndR+O/jy41XF4obf16zAuOMwdSdUaQkPI+VG2Y9Kv3u3z23oNig
 Cybw==
X-Gm-Message-State: AOAM5323dJI6/v3+uKt9AIbwrx4SUFQqftvb1R4RED7h5TXRb4hYtdd2
 vAtMNqngnGwli8y9TsitUfWRwgpjowEuIlg+DIyZetOlTKzOhTNsxuJol3xjgTS2DmCrK++2iFj
 qqRcZ2Y6MMfEP3hmd1BF3UJDiyS+ZddozWzL7zEGPOVlH1o4Z8+labjvx/B3l7X2t
X-Received: by 2002:a17:906:32d1:: with SMTP id
 k17mr21202203ejk.94.1615314448008; 
 Tue, 09 Mar 2021 10:27:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfjbc7NAUdXEPV35+w5oXbtAfHPBJtmvy6MDYIojGumPSCU8ujdHGtBaMQmJO8ESj00duX2w==
X-Received: by 2002:a17:906:32d1:: with SMTP id
 k17mr21202177ejk.94.1615314447825; 
 Tue, 09 Mar 2021 10:27:27 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id fi11sm8640199ejb.73.2021.03.09.10.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 10:27:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/6] net/eth: Better describe _eth_get_rss_ex_dst_addr's
 offset argument
Date: Tue,  9 Mar 2021 19:27:05 +0100
Message-Id: <20210309182709.810955-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309182709.810955-1-philmd@redhat.com>
References: <20210309182709.810955-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'offset' argument represents the offset to the ip6_ext_hdr
header, rename it as 'ext_hdr_offset'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index 7d4dd48c1ff..6a5a1d04e0b 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -401,7 +401,7 @@ eth_is_ip6_extension_header_type(uint8_t hdr_type)
 
 static bool
 _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
-                        size_t rthdr_offset,
+                        size_t ext_hdr_offset,
                         struct ip6_ext_hdr *ext_hdr,
                         struct in6_address *dst_addr)
 {
@@ -412,12 +412,12 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
         size_t input_size = iov_size(pkt, pkt_frags);
         size_t bytes_read;
 
-        if (input_size < rthdr_offset + sizeof(*ext_hdr)) {
+        if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
             return false;
         }
 
         bytes_read = iov_to_buf(pkt, pkt_frags,
-                                rthdr_offset + sizeof(*ext_hdr),
+                                ext_hdr_offset + sizeof(*ext_hdr),
                                 dst_addr, sizeof(*dst_addr));
 
         return bytes_read == sizeof(*dst_addr);
-- 
2.26.2


