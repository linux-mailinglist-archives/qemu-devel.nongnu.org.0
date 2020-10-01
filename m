Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DE5280592
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 19:38:31 +0200 (CEST)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO2XG-0001Y4-Rw
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 13:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kO2L8-0004Tp-7D
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 13:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kO2L5-0004HW-Bx
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 13:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601573154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llB4vOCcjwlWR9vH+bHBQFNfVDmAnYp9O2qmiiAuZn4=;
 b=RYPhUUJgmvAutUfrVolA354ziS7zf/0EasbOlRZFpFyAYD1jBjFjvcti3RCQ2T6oYII8nS
 IkVUOt/SLk6FWGL7d63ZwiKKbQKRmzUlPyvl5ZXWEgLoXoJxOoim77Cm0/1PVjBlpgHsbm
 zV6tguePB1mQeiBCSKtzzw88+AyYGlE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-gQlDO7AiPQGyS7qQc8AlyQ-1; Thu, 01 Oct 2020 13:25:52 -0400
X-MC-Unique: gQlDO7AiPQGyS7qQc8AlyQ-1
Received: by mail-wr1-f71.google.com with SMTP id s8so2307259wrb.15
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 10:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=llB4vOCcjwlWR9vH+bHBQFNfVDmAnYp9O2qmiiAuZn4=;
 b=IeBGEKAWf8KnilebvbtOmhl/cZ1TaJG04vAkxo7Dor5FvwBfguLi2Llhk7MRkFi9wb
 yvwY6PT6JzK4Jt+X+lDuCLU/fr3XIW0uym5U6QPz3OsjzfFsGs/wyhUuEFuJrVK2Veg7
 Re0OJMNoq3jgKQ+PrrQq/Y45YneuKBPx0AU7leeRJE3hO7EKJkIxNSJy7SuJeqgXj4Xi
 Omnzry5Ep/khQ0Zbo9RlaBUpsoV8fIof8kcDfJwdAMS9C9ocDMgC5+pWg0bLXTUOWHMO
 P0Xp+07HIe2toPXAK1ApTR4Qvwe1NuprL912RfctrmVKpyHdWTa7+2Khz9uvOu7qHnM/
 3UsA==
X-Gm-Message-State: AOAM533VWwXyBYi3E48qih3g3bLdoga4VQ3HBx2rR73zXYvjIJ9R2eLu
 wrpUDpcOGNrC6SvHjq9PSikX+kqYm1HEvK2UNbm7Bs70hERGMtTo2AiCkeq+CVQ4iKd5XwZoGO7
 olurp57uYPpWla6Y=
X-Received: by 2002:a1c:48c3:: with SMTP id v186mr1218511wma.16.1601573151250; 
 Thu, 01 Oct 2020 10:25:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiH9BrvCDzygapUQgoS7+TVvPomrWUpV0pHMapa8C71iR1ww7iiptp7ggFFu2E7lmPTxosbA==
X-Received: by 2002:a1c:48c3:: with SMTP id v186mr1218492wma.16.1601573151065; 
 Thu, 01 Oct 2020 10:25:51 -0700 (PDT)
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id a13sm853119wme.26.2020.10.01.10.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 10:25:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v2 06/16] dma: Let dma_memory_read() propagate
 MemTxResult
Date: Thu,  1 Oct 2020 19:25:09 +0200
Message-Id: <20201001172519.1620782-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201001172519.1620782-1-philmd@redhat.com>
References: <20201001172519.1620782-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 04:25:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dma_memory_rw_relaxed() returns a MemTxResult type.
Do not discard it, return it to the caller.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 04687d8825..df170047eb 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -89,8 +89,9 @@ static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
                             buf, len, dir == DMA_DIRECTION_FROM_DEVICE);
 }
 
-static inline int dma_memory_read_relaxed(AddressSpace *as, dma_addr_t addr,
-                                          void *buf, dma_addr_t len)
+static inline MemTxResult dma_memory_read_relaxed(AddressSpace *as,
+                                                  dma_addr_t addr,
+                                                  void *buf, dma_addr_t len)
 {
     return dma_memory_rw_relaxed(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
 }
@@ -124,8 +125,20 @@ static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
     return dma_memory_rw_relaxed(as, addr, buf, len, dir);
 }
 
-static inline int dma_memory_read(AddressSpace *as, dma_addr_t addr,
-                                  void *buf, dma_addr_t len)
+/**
+ * dma_memory_read: Read from an address space from DMA controller.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).  Called within RCU critical section.
+ *
+ * @as: #AddressSpace to be accessed
+ * @addr: address within that address space
+ * @buf: buffer with the data transferred
+ * @len: length of the data transferred
+ */
+static inline MemTxResult dma_memory_read(AddressSpace *as, dma_addr_t addr,
+                                          void *buf, dma_addr_t len)
 {
     return dma_memory_rw(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
 }
-- 
2.26.2


