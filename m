Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78043B9E3D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:29:29 +0200 (CEST)
Received: from localhost ([::1]:58914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFUG-0004S3-NQ
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lzFPx-0005FO-Fb
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:25:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lzFPv-0001h8-N8
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625217898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d94e4cvzy5znF4XYXKjG7KaQl0I03KmgN6PaaJlSi/E=;
 b=GRfuUCK58BLh2JEuTtTvDMxQNT+DDNt+tyVAS+GDRVNROCZuSuweBdzZ9Uj3+DL8RACX2s
 vjlOhI7FYVkzAi5933gpAXvE3KH0PMwSjkb1o7hYI+hHZujyzBwHxXyU8SxmRFKZuLWPpV
 iWem3QSBrS+tReCLkhFbfzHPXhXC2Js=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-5f5DEuIZNA6k0sCFrnlbqw-1; Fri, 02 Jul 2021 05:24:57 -0400
X-MC-Unique: 5f5DEuIZNA6k0sCFrnlbqw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r11-20020a5d52cb0000b02901309f5e7298so342651wrv.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 02:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d94e4cvzy5znF4XYXKjG7KaQl0I03KmgN6PaaJlSi/E=;
 b=ClJR5qAgUyXQAYxi2qdiVvBBjF8f/A8Fg3p9plTBJFu/18GJNmB6XMagp5XxSiG6mK
 RW6WRBt0CdCfFmufyYx4qzt0bpx2K6RT4wDuU+nxs2/08ZNK+/NhDjPTyQl4PKyyg4Yg
 U5qSdc23yI2D4YLJqWtMvOId+XvZsVoJVk2xhcNhxNGeNWMjewnbAWUnhjBcCCKHNcjc
 7VSMFpg2lWF603zf6Dd5PviDKP7naK4H8phtWkeIEKCiQ9LtBbbRq9IIAjrMXiimyN7o
 KNAm6MfZy2qlzDqEg3X9mdDjrk4gTa04YZg8k7/viZ8J39/7QNz0wzkyolFLuLcX/0V6
 PpyA==
X-Gm-Message-State: AOAM530bwBpcAGMg7tuYP7G94d2IFimL75c6YVOBdFzu01nxzhGHIjEv
 3SNceXRTVYf8lRBdpevYZBqoPJkd1wbtYbTNzTKsCnHZESNZFcETDVMxu1eoBTNwwtkmGB0glG5
 i5XOGGNSFgfnlkVMyw24elWxWc1chIKLmcEIHNwklrIquqTirKnXOS2AnLEA3IJkx
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr4773189wrd.228.1625217895950; 
 Fri, 02 Jul 2021 02:24:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJza5wmMSim88cN2MF42/Bamk0G+i1GJ8j15qypJ14oe4tfK3g0gqAQ7h1213P9eITOvYdTWSQ==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr4773161wrd.228.1625217895805; 
 Fri, 02 Jul 2021 02:24:55 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id q19sm11820889wmc.44.2021.07.02.02.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 02:24:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] dma: Let dma_memory_rw_relaxed() take MemTxAttrs
 argument
Date: Fri,  2 Jul 2021 11:24:36 +0200
Message-Id: <20210702092439.989969-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702092439.989969-1-philmd@redhat.com>
References: <20210702092439.989969-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will add the MemTxAttrs argument to dma_memory_rw() in
the next commit. Since dma_memory_rw_relaxed() is only used
by dma_memory_rw(), modify it first in a separate commit to
keep the next commit easier to review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index d23516f020a..3be803cf3ff 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -83,9 +83,10 @@ static inline bool dma_memory_valid(AddressSpace *as,
 static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
                                                 dma_addr_t addr,
                                                 void *buf, dma_addr_t len,
-                                                DMADirection dir)
+                                                DMADirection dir,
+                                                MemTxAttrs attrs)
 {
-    return address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
+    return address_space_rw(as, addr, attrs,
                             buf, len, dir == DMA_DIRECTION_FROM_DEVICE);
 }
 
@@ -93,7 +94,9 @@ static inline MemTxResult dma_memory_read_relaxed(AddressSpace *as,
                                                   dma_addr_t addr,
                                                   void *buf, dma_addr_t len)
 {
-    return dma_memory_rw_relaxed(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
+    return dma_memory_rw_relaxed(as, addr, buf, len,
+                                 DMA_DIRECTION_TO_DEVICE,
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
@@ -102,7 +105,8 @@ static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
                                                    dma_addr_t len)
 {
     return dma_memory_rw_relaxed(as, addr, (void *)buf, len,
-                                 DMA_DIRECTION_FROM_DEVICE);
+                                 DMA_DIRECTION_FROM_DEVICE,
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
@@ -124,7 +128,8 @@ static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
 {
     dma_barrier(as, dir);
 
-    return dma_memory_rw_relaxed(as, addr, buf, len, dir);
+    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
-- 
2.31.1


