Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF65F332FAE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:14:25 +0100 (CET)
Received: from localhost ([::1]:35704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJikK-0001KY-UX
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJh5H-0000yZ-LW
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:27:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJh5G-0001IO-0E
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615314473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pz2LHGBFo7rdr0OLuP12qCzCTyCC4J17mZdA7YWW5O8=;
 b=RKEOzBGOryLJjzn05vpUM0O+gM6cpdC611OFPAIYUG99V6E8yCW2rLsBmknUtr6SLViazi
 KsYTmq1YYHx+b49mSwBsRjuEr9J2VCFXroh9BysxHbxiWgSMrFV14xGAm8UV4oSMdBhp1U
 jhQpSdVgnh68YkjyTqk+yTKWrfvAJ3U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-UFHTizKzMcSHEtnqXOMsBQ-1; Tue, 09 Mar 2021 13:27:51 -0500
X-MC-Unique: UFHTizKzMcSHEtnqXOMsBQ-1
Received: by mail-ed1-f70.google.com with SMTP id i6so7231159edq.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:27:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pz2LHGBFo7rdr0OLuP12qCzCTyCC4J17mZdA7YWW5O8=;
 b=AO4ORJf1KVB6NoZSeoI1pHdces4JYh7x9e6WgcJYkF/NdO/0nBKUH7DJf5ukH6UCet
 LffpnS+DQ0ALy3OnWvYQMUz6NC7ew4+SPQ6r8LWGOQc2RNJkA+CXJLPN+UTwcmBGqxna
 kR1n+ovimoavBLKt1Yi1JpqFW4CYTIIRX5ocCgvygv6KKs3QEgA3zP/2duLYdtJEi8/0
 QOJDUnNAtKlEk9MOF8HBGI3Nt4s7cuSBX9Yr0tPRnVKFtN4SHqisLY1ufRjPO2Sj4Hw1
 d+/eLI7bB1CHXZ/lswmgBMz06FPXgoVL27h1wGHjmTWDBT8fqi0faDybj76Nm+THnQjO
 L1qg==
X-Gm-Message-State: AOAM533FEXzclrGQoG8j1dTAISI19l9+gLdgshTNGTU58bwRUPtT8Zm8
 CcXsDxRHZvzlpFW/LPRPCjj5DV4mGQAo+zlXnVMhvX9m/vL/ZnKa92HhWzeh3PdDQn+LJkCjRQH
 trHQBjp8rd1L/WLsHuouAWI59rtXAUtnJE/1p2JZa/OzTowm5fP6blpG9weN4+gLH
X-Received: by 2002:a17:906:a896:: with SMTP id
 ha22mr21606536ejb.503.1615314470318; 
 Tue, 09 Mar 2021 10:27:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyL8ZBx3d5KC/PlT963GamrJPASs8TsG67PMKppdoM+EDRqttqbd2XfBTD0nhHu9UJiKgB42g==
X-Received: by 2002:a17:906:a896:: with SMTP id
 ha22mr21606503ejb.503.1615314470087; 
 Tue, 09 Mar 2021 10:27:50 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id eo22sm8984049ejc.0.2021.03.09.10.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 10:27:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/6] net/eth: Return earlier in _eth_get_rss_ex_dst_addr()
Date: Tue,  9 Mar 2021 19:27:09 +0100
Message-Id: <20210309182709.810955-7-philmd@redhat.com>
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

Slightly simplify _eth_get_rss_ex_dst_addr() by returning earlier.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index e984edcfb0b..b44439d31c5 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -407,23 +407,21 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
 {
     size_t input_size = iov_size(pkt, pkt_frags);
     struct ip6_ext_hdr_routing *rthdr;
+    size_t bytes_read;
 
     if (input_size < ext_hdr_offset + sizeof(*rthdr)) {
         return false;
     }
     rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
 
-    if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
-        size_t bytes_read;
-
-        bytes_read = iov_to_buf(pkt, pkt_frags,
-                                ext_hdr_offset + sizeof(*ext_hdr),
-                                dst_addr, sizeof(*dst_addr));
-
-        return bytes_read == sizeof(*dst_addr);
+    if ((rthdr->rtype != 2) || (rthdr->segleft != 1)) {
+        return false;
     }
 
-    return false;
+    bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset + sizeof(*ext_hdr),
+                            dst_addr, sizeof(*dst_addr));
+
+    return bytes_read == sizeof(*dst_addr);
 }
 
 static bool
-- 
2.26.2


