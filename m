Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73CD334349
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:42:28 +0100 (CET)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1ul-00020p-Iy
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1Hb-0005K1-Hm
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:01:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1HZ-0003U8-QS
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o4IDrBOrBdc79jZ9ab97ouOR74cgvk509Hp9kOypaec=;
 b=R41fxkyimM+t6Bq+fkdTMXk9phS58vuHDJh0CYPAQAhN/SaRVLUqiHcqlrUGjHMtsWKyS9
 tCLcr/jNwr5qRZ4Hmw5EWM7TdxXK9nNCFvkkz9+990LYCDx8Cq5oyAkZ3rB7NUl74jJjiq
 9MAGHvkd1CfSDCJwnWjW/b9WuY6YdQE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-XRT6jzuZPo6XlPdAU4H2nA-1; Wed, 10 Mar 2021 11:01:55 -0500
X-MC-Unique: XRT6jzuZPo6XlPdAU4H2nA-1
Received: by mail-ej1-f70.google.com with SMTP id fy8so7410156ejb.19
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o4IDrBOrBdc79jZ9ab97ouOR74cgvk509Hp9kOypaec=;
 b=bDekjW0Ev89AdK46lRDNWaCNNZ8NRszh8Zm51ONy6WurfJNWkIG43sYlPazL47q9vX
 l1eotZvEK0HjHZvIq6JwVnKRS8vhJohbOyH+BqrFs+LuZAVrRSHoOxfI6g9oHTpDTBGD
 TPM5JQ7DK68kMVp9TQ9ifD0hFIpci5zweyuF7Keom4ziw69bKnLcl1THg2U+q2SJoNwR
 Rb4CV9cLAmlYhcEKI40CbX34GDs7zAyroznYp/lcKMnVB9ubdG+1QND2yYPC0pOy5kFJ
 4p4QCS3V2i/QKyEJg97gRMfHJBAh+oF6Ir58RbldoiWQq1IYe2ge7kLr9IaRtbPMW1kV
 VmYg==
X-Gm-Message-State: AOAM533HqBUI1HRCftz78VZcYKJD3v2HnCv/db+cGJQemi6Gfq5wiLaZ
 4XolDcOGOuhNI4KGjY7lMWUKn8zkFFwOMXZc6SPBXVQK/lxJpnAkEYhQPcspslRQv+pv5RQ64cF
 VvSoTmqfWl80zbRbUlV/JmNt2xNWz6va34ogSJuB7GsZryqlQdsLYQoSmAEeGC4hf
X-Received: by 2002:a17:906:9243:: with SMTP id
 c3mr4582135ejx.388.1615392110264; 
 Wed, 10 Mar 2021 08:01:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwshEyQD5OOAxhL+9S0JWpdZzEgb6dt3if4I7T53s82MWq/jTX5P6wVuUr755mnoZ1LPnzDMg==
X-Received: by 2002:a17:906:9243:: with SMTP id
 c3mr4582008ejx.388.1615392108920; 
 Wed, 10 Mar 2021 08:01:48 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ho11sm9907130ejc.112.2021.03.10.08.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:01:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/7] net/eth: Better describe _eth_get_rss_ex_dst_addr's
 offset argument
Date: Wed, 10 Mar 2021 17:01:30 +0100
Message-Id: <20210310160135.1148272-3-philmd@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'offset' argument represents the offset to the ip6_ext_hdr
header, rename it as 'ext_hdr_offset'.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
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


