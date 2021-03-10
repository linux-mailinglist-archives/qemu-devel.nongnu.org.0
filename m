Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150D03346FF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:42:59 +0100 (CET)
Received: from localhost ([::1]:45154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3nO-0005yt-3T
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3cj-0005lF-Kt
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:31:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3ci-0003Bh-4D
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:31:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615401115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlY0Kaoccpxu0Z7znINrHN6ufu6pyEGXYRMIKp0FRTw=;
 b=dbmA3P1jvIQFSix0hI8fCPaT0WAw7X30/eoHSHLQZcPmMvYKT+z348RCY8HFFvkx07ZPT6
 SHN1Z2zhQSAOPsKNv9kNXDer8/3NnJx/p7BsIDAWYqw4MApG4rLJ5L+APaOr1bsf42kTPY
 Ms6wg4UK1/RVKyDO5AgYPNPFS1hMCXU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-Yxik7aF7OXy3xmWXovStAA-1; Wed, 10 Mar 2021 13:31:54 -0500
X-MC-Unique: Yxik7aF7OXy3xmWXovStAA-1
Received: by mail-ej1-f72.google.com with SMTP id gv58so7594832ejc.6
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 10:31:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlY0Kaoccpxu0Z7znINrHN6ufu6pyEGXYRMIKp0FRTw=;
 b=oZ8EvF58fW2NmGxKOXn5wsOREFRsFGTiM1lkfWBtUFCiS9tRjTCC9PucL1R85fuZPt
 ZT3o6g6x/N4RT2Wg3me/rDx6HnOjLom/q88r2KTZ0f78T/Za9ZUYg5xPVAMQ5qvXANrM
 mVSrUahXxslkzjMUd2A8mD9XkZ6BxOXFUjtEofir5KTB5HE95r2M+O3zV8d4zImvkZs3
 Oo7PTZWMC6WwzFq9elWJzbPx5+mNJ+Z9SD65OP1BEhhhFlWbOOfeS3ZMb94FHPYtRham
 Rlmoo229L+o1LQBYQhIdBF0U7IlwOzKAK0ytxdLwR1T6viq9wvaBxVcQ5mu0gJt8GNAc
 yvCg==
X-Gm-Message-State: AOAM533d1BCwdA6KAu/0GiHlxTYlBekAjWM0LXHIm/UQszfz8VVqzGvN
 Z1CrlqCclv2ft4zvvcoM9gMdXF1E0PzOQAAOiCygqJIfWIQrDHP76FF7KSIPXPGPpmg1/A9z2br
 c8LLRNMmqYrOZG8UDwGmTcoltwWcpWcvNzMbjtKNvmChBH2tK7UTzcOYbpaFo+Ylo
X-Received: by 2002:a17:906:565a:: with SMTP id
 v26mr5145594ejr.516.1615401111559; 
 Wed, 10 Mar 2021 10:31:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3LpsKoj2p9zOHybiY+Edt4HvewveyE/LAO8x5Rs3XfgqmSr4JgEhs077OfbxaoS+CuxbegQ==
X-Received: by 2002:a17:906:565a:: with SMTP id
 v26mr5145573ejr.516.1615401111432; 
 Wed, 10 Mar 2021 10:31:51 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q11sm144137ejr.36.2021.03.10.10.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 10:31:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/7] net/eth: Check iovec has enough data earlier
Date: Wed, 10 Mar 2021 19:31:21 +0100
Message-Id: <20210310183123.1212612-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310183123.1212612-1-philmd@redhat.com>
References: <20210310183123.1212612-1-philmd@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
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
index 492359afbbb..b78aa526efc 100644
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


