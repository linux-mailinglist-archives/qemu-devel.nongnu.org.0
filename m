Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C853FE9BD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:08:38 +0200 (CEST)
Received: from localhost ([::1]:43556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgpx-0005YW-Hk
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiR-0000aO-1Z
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:00:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiO-00084N-KN
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPZfczG2XQrRC55s69h86ljHzGci8wjhwO3c1XD3j8g=;
 b=IITwbCevMtw4MJR0w919Bmx2M7d8E/cX9VlpG5Qq1mUOWb3yl0m4SGPiNq8QRbCiM1XiYv
 5nc2ii5no6heBitTwVE3WvFvvvr9T6s/S5HVfMPxWxnVzHgQqhOuJKMLO5mNBwsL9KVkOK
 iIHH2ri81fHoODcxoJFu/9euSsQWKP8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-L9LbScfgNPCmcPUhm_KkFg-1; Thu, 02 Sep 2021 03:00:47 -0400
X-MC-Unique: L9LbScfgNPCmcPUhm_KkFg-1
Received: by mail-wm1-f72.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so322840wmc.9
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CPZfczG2XQrRC55s69h86ljHzGci8wjhwO3c1XD3j8g=;
 b=YR9Icu3tD4ma+Iizpdd72FGWYnEFfegCeyGaRrZAIJvaY8c/Sn9E2XPQ9OZGu48AEF
 uVK9H5NPSb+trrHbdtp1NFrLQwl8TwLd4FKaeIQPZUFv37Qq/QWop0MZieyVkOiJAWnB
 It9XZ4VseGaVnbMInd67gPN76lN+Y7fdQeO3hclTRBE955b0GVn1Zd6FoR6NV8k5MoXi
 3UGq7wrz8XlScRVHqnvJ1XJCJugRM3Kx4vx68YJjFzja2X7a3zp8SEOV3pY25lmNN2Jc
 j5otEFSnB1y+AH2XgKJdZnSJZGJraOGN4fa00LFjqOCOGjAVNvv5iji8OTPNvqq7aoGj
 u1RA==
X-Gm-Message-State: AOAM533gxZdkbAGRNH9bT7hCweallQ5yOxzPfKmURJHe52DFIRU+CsS5
 +ZqCFo+Gke0QPDr+PSiJQYIQ+xtJe6HOf67MxAOFYlwHepl7bnzrNFCkJRKjhv3RskQBv0QVwWA
 qFHDt9EacLhkbHvQ8D6CSJrKP4rC2ePvEHmLzPgEPqwowTtuEiWdw1STl+H6vy54G
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr1576162wmc.3.1630566045593;
 Thu, 02 Sep 2021 00:00:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPjBmCiebh+oOlEjgSurjZRRPjR7r/gETyismGSZ6AEUj0xE3V3XA0dCOd/gHkvZcxL9Rqbw==
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr1576141wmc.3.1630566045429;
 Thu, 02 Sep 2021 00:00:45 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k37sm718914wms.18.2021.09.02.00.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:00:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/11] util/vfio-helpers: Remove unreachable code in
 qemu_vfio_dma_map()
Date: Thu,  2 Sep 2021 09:00:18 +0200
Message-Id: <20210902070025.197072-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902070025.197072-1-philmd@redhat.com>
References: <20210902070025.197072-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_vfio_add_mapping() returns a pointer to an indexed entry
in pre-allocated QEMUVFIOState::mappings[], thus can not be NULL.
Remove the pointless check.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index d956866b4e9..e7909222cfd 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -751,10 +751,6 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
             }
 
             mapping = qemu_vfio_add_mapping(s, host, size, index + 1, iova0);
-            if (!mapping) {
-                ret = -ENOMEM;
-                goto out;
-            }
             assert(qemu_vfio_verify_mappings(s));
             ret = qemu_vfio_do_mapping(s, host, size, iova0);
             if (ret) {
-- 
2.31.1


