Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1623342F6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:22:14 +0100 (CET)
Received: from localhost ([::1]:40646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1bB-0007nS-Gq
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1I0-0005T7-NK
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:02:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1Hu-0003b9-Ag
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615392137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zxcBphhiOETeSJ3HAp76zLwbki6XNRBCYQIOVB2vCU=;
 b=STeJDMAOb6yLnRz1QBvV5bIjuu13o3ljNzz48aptdSQ8dSd/Qlv2Iwoh0MsxQBnPMphwjg
 vX0h/doKrifHIGwyu7h0Cg127CeVC079+UuFufjsfdDctn19GP/JzBUwcwqE3YoBvHu3ZR
 BPO3IAVZz6SJ57s5ef0Gn1BeJcEMH2Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-Pzn0xth5MTOKRtGqA0BOOQ-1; Wed, 10 Mar 2021 11:02:15 -0500
X-MC-Unique: Pzn0xth5MTOKRtGqA0BOOQ-1
Received: by mail-ed1-f72.google.com with SMTP id v27so8597100edx.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0zxcBphhiOETeSJ3HAp76zLwbki6XNRBCYQIOVB2vCU=;
 b=ukQdfnpPRBGMgTz0ho97m2TRgE28w8B9nndjR/SVtCBqIndaPD8+f4YrgZ1FoAyoDk
 g7tNGvNLPRCSmMNfyy9wXkfXx95TNUanunxQXVvZe+VbO4P8dX+Y1u5MdLsrSPjZslVX
 0b/fiWug3f099wZHgtogGoGMtlr9N3lnovOOyegX+7p4kCY52I+PO71nGS5Zm9vl9uBO
 UqkkT8iZkG5xGbw8F8wCuOjfJMpi3NSTiVUGqe749CWttoIYNyJxMl7B1XlvxylX9eg3
 nnG1SB/e2fMwFTEdit0HjlzAlaeiCvjRa6GXEDhap5We6VMA+thAqYS+xGiyDAUJ4BD5
 ytIA==
X-Gm-Message-State: AOAM5332KXe8lp0nbcspMISSag7GL0/Vc+BWDpvPgYXsGBOEFLtd22i1
 rNlFAvQ4GrCH9BZMIwq6boUTc3AYIUuB1a6ARtyiQXodpnHJarE1kCcsqCyZanAbFaNIBCTnUO7
 +rmgnJ+bJJAf6TkzLpWgE4vsZfMwwUaXKv3aMmLoP4lIk2gM0OC6ZIAsvS+1ugGff
X-Received: by 2002:a17:906:94ca:: with SMTP id
 d10mr4372147ejy.107.1615392129649; 
 Wed, 10 Mar 2021 08:02:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQDDoDqFQvJ/MhGgNGsJegguM7SM+nDrBu9m6mmuFSl9OYZYU6/QgAPFOGYMuO6YxPmbEjFg==
X-Received: by 2002:a17:906:94ca:: with SMTP id
 d10mr4371599ejy.107.1615392124499; 
 Wed, 10 Mar 2021 08:02:04 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w18sm10194493ejn.23.2021.03.10.08.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:02:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/7] net/eth: Check iovec has enough data earlier
Date: Wed, 10 Mar 2021 17:01:33 +0100
Message-Id: <20210310160135.1148272-6-philmd@redhat.com>
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

We want to check fields from ip6_ext_hdr_routing structure
and if correct read the full in6_address. Let's directly check
if our iovec contains enough data for everything, else return
early.

Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/eth.c b/net/eth.c
index e870d02b0df..28cdc843a69 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -409,7 +409,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
     size_t input_size = iov_size(pkt, pkt_frags);
     size_t bytes_read;
 
-    if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
+    if (input_size < ext_hdr_offset + sizeof(*rthdr) + sizeof(*dst_addr)) {
         return false;
     }
 
-- 
2.26.2


