Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44A332F95
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:06:49 +0100 (CET)
Received: from localhost ([::1]:44210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJicy-0000qP-3e
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJh4x-0000T3-Jq
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:27:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJh4q-00019D-Pb
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615314447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZa/iUsT9VQagkte3HBQwGL7dr2S/uC8iYuWuLSPUy0=;
 b=T7xkZBMHc5l4G+HaDWMRulr4Ul5kqDcIcHJZS7K8Na98whu1lsm2aB5UpBB4czsRQPC6Il
 pKMjf2eY4IlNM8DE2kTXKILo6GPRxCENfQgJhnf7z2JO4ET3+NPozRkkHAw1e6vcZdvdhj
 N42CuwqpSvZZxWchA8hexFEZ3gr9acY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-8u99C8lSM2Kb675IScMkuQ-1; Tue, 09 Mar 2021 13:27:24 -0500
X-MC-Unique: 8u99C8lSM2Kb675IScMkuQ-1
Received: by mail-ej1-f71.google.com with SMTP id fy8so6026779ejb.19
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JZa/iUsT9VQagkte3HBQwGL7dr2S/uC8iYuWuLSPUy0=;
 b=W0H29pl5SZLRYuS6o7hlQs5WDdixGJ4IxfGNtYv6lFDieKIc/cg2kCP16HgDGs4Ahx
 kYFBdbyeFBCaIGOa8MSNnv3FFwf/Tgd3LUyYcIjwfiNpTA3VLn0EJgNXBuzD1Uu/WWiJ
 SOyWOwLPgMStbs91RlcdA9ENth2LE0Bf8XzvNEejR9onhRTJWZuKgORJ9z5qeRqsrLJQ
 CnpgrdEtYAEjpMbVO01g42x/Jv37i1LuzpNhQCuvpOOzMPfoWirdtmZ2l/LV3pkMdoAd
 UjDMC2Wm5emxowNYKfphkqpzmhMLA3415EGLejxKKIpmvWwsJqfYo5tCaN7tytpX9ril
 40aw==
X-Gm-Message-State: AOAM533DV5tYxS/gQzPNbhWJur8gGezF0ovWvIOBQGgwfLiNNJVfquuo
 b1tXJtovBITuUEqt+hfXu/b2imozTEQIAn1q1G6aSwJJZH4rroCMu19sgtCBNE/QJnYkR06FVKQ
 sKBY9zLsWwhYuqj8CbCAjy5b6oc8pFJg7hez6uaP1XyVJptoKWK9PeSoC1iVGKrK9
X-Received: by 2002:a17:906:5918:: with SMTP id
 h24mr22273170ejq.501.1615314442590; 
 Tue, 09 Mar 2021 10:27:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3sEMTKKT4SaFCXJqzS+fG3uLXd9yFb/u6RpsfKs75PASMey5Whnt69NulDldeWhQvBnv2/Q==
X-Received: by 2002:a17:906:5918:: with SMTP id
 h24mr22273146ejq.501.1615314442454; 
 Tue, 09 Mar 2021 10:27:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id be27sm9769289edb.47.2021.03.09.10.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 10:27:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/6] net/eth: Simplify _eth_get_rss_ex_dst_addr()
Date: Tue,  9 Mar 2021 19:27:04 +0100
Message-Id: <20210309182709.810955-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The length field is already contained in the ip6_ext_hdr structure.
Check it direcly in eth_parse_ipv6_hdr() before calling
_eth_get_rss_ex_dst_addr(), which gets a bit simplified.

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
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


