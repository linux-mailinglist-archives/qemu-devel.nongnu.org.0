Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AA7303B6B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:21:29 +0100 (CET)
Received: from localhost ([::1]:49920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MPY-00068b-PL
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MNB-0004mb-P7
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:19:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MNA-0000ab-4N
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611659939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3PM3c1hDQViy2jaBMDNzLZyG4cMXsFVA914IRG0X4aE=;
 b=WsZe0FTNxJecFGqTX+ppaa89nSkxlWps7ASOvfCsCRY5VEWX+8EGZM8P8fJ0O2tUQQ+7j5
 Zvv77YtS6F1xKQ2mXR/o5vHoS5uMR4pZJmvby8z2HjSflTbSOoIXcZQPf/WhU7qGsdBAlH
 Xis0+9A2Zpoeso6UmlBFdKgsifN939Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-J6mFiNGLO6qyDLGGph9cLg-1; Tue, 26 Jan 2021 06:18:58 -0500
X-MC-Unique: J6mFiNGLO6qyDLGGph9cLg-1
Received: by mail-ej1-f71.google.com with SMTP id jg11so4834682ejc.23
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PM3c1hDQViy2jaBMDNzLZyG4cMXsFVA914IRG0X4aE=;
 b=LeeY+FpgKEdczelnuAtLyfICUsNrZtA5RntqXpRdO2a1jnRNCLW6DgQzXN3K8ePeFy
 uP/pbp4smm8j/6sT6IOxx18E+/+9TeQpxz4754+N5svb4C80+tCzzNhKltQ2FQl7bvOx
 PbiLsU1wQk48+cAw/GKEIupaZGUd/qrNOiNDfD2N2CS74UuMLxg/RNxtn3/oz8DjIlst
 infuZ2sdr54lrkAYwDec5nPaD3/5geDXZ+e2Z4YZGAT2m0J7WZSlk3G4jw3/gXKLDX6N
 X4CCWVbqgZEPtQ2MMjqf5SD0Bw6kcrx8S8E9ktgnAgk72iHYFt6+tW6Sxo4I7cryJ/3y
 Cuog==
X-Gm-Message-State: AOAM531b2hAiBUHs4meK0ovOxK4OJ9oXq+8eugW2i4yeqo6JCiT+Ahan
 WP+XoaKNtdZRuvkFj5Ud1sxJTBmqlIjRr6CJSERZfVdaN0wG0e3iPPMMJJrQwyBHh7y9WvL0V6t
 FHfPDqbEgBgMROIAWvyYhNei1cTN/9ySItSiIytVbGP+dVWeYtJVJzFpvdQof3+2s
X-Received: by 2002:a17:906:30c4:: with SMTP id
 b4mr3126201ejb.456.1611659936625; 
 Tue, 26 Jan 2021 03:18:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvSBoxvnXEPgW/ums/Xrk2BFCvLj6tGBahGF66yxcNIn88nqcyuRINNn/qwihHL7yGFagU8A==
X-Received: by 2002:a17:906:30c4:: with SMTP id
 b4mr3126180ejb.456.1611659936392; 
 Tue, 26 Jan 2021 03:18:56 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id re19sm9257518ejb.111.2021.01.26.03.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 03:18:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] net/eth: Simplify _eth_get_rss_ex_dst_addr()
Date: Tue, 26 Jan 2021 12:18:46 +0100
Message-Id: <20210126111847.3142636-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126111847.3142636-1-philmd@redhat.com>
References: <20210126111847.3142636-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The length field is already contained in the ip6_ext_hdr structure.
Check it direcly in eth_parse_ipv6_hdr() before calling
_eth_get_rss_ex_dst_addr(), which gets a bit simplified.

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index 1e0821c5f81..7d4dd48c1ff 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -407,9 +407,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
 {
     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
 
-    if ((rthdr->rtype == 2) &&
-        (rthdr->len == sizeof(struct in6_address) / 8) &&
-        (rthdr->segleft == 1)) {
+    if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
 
         size_t input_size = iov_size(pkt, pkt_frags);
         size_t bytes_read;
@@ -528,10 +526,12 @@ bool eth_parse_ipv6_hdr(const struct iovec *pkt, int pkt_frags,
         }
 
         if (curr_ext_hdr_type == IP6_ROUTING) {
-            info->rss_ex_dst_valid =
-                _eth_get_rss_ex_dst_addr(pkt, pkt_frags,
-                                         ip6hdr_off + info->full_hdr_len,
-                                         &ext_hdr, &info->rss_ex_dst);
+            if (ext_hdr.ip6r_len == sizeof(struct in6_address) / 8) {
+                info->rss_ex_dst_valid =
+                    _eth_get_rss_ex_dst_addr(pkt, pkt_frags,
+                                             ip6hdr_off + info->full_hdr_len,
+                                             &ext_hdr, &info->rss_ex_dst);
+            }
         } else if (curr_ext_hdr_type == IP6_DESTINATON) {
             info->rss_ex_src_valid =
                 _eth_get_rss_ex_src_addr(pkt, pkt_frags,
-- 
2.26.2


