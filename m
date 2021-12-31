Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA5048213D
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:21:35 +0100 (CET)
Received: from localhost ([::1]:38584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36bu-0007YW-26
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36EL-0002fY-BC
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36EJ-0003e7-UO
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=74OOiqX2C2ZPRJwdKtKEO75yG3GLUs7TFxrYw/0AG1I=;
 b=LxsVLI/dzpvyfD2Ax0QXYBMrtZUEKQ/nO+FXJRypIrIUXjrNnRbkScLaktCMXVgaUBojV/
 NKile+v5z6zYZlKIRSw08iX8+yjKDEasNxRZqrlaoMcTjNHVPiXZc10XoEqh6bQ0VqoEpQ
 L8hUGYt0rwk/KKPkiikhOwVoH8J0wQM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-eezqj0DEMg27d5T8PuuKug-1; Thu, 30 Dec 2021 19:57:09 -0500
X-MC-Unique: eezqj0DEMg27d5T8PuuKug-1
Received: by mail-ed1-f72.google.com with SMTP id
 b8-20020a056402350800b003f8f42a883dso10809110edd.16
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:57:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=74OOiqX2C2ZPRJwdKtKEO75yG3GLUs7TFxrYw/0AG1I=;
 b=EAbu9Wd1q/8FSVthcoe1SQ8K6ZzW5nLjScwAka/YCc6oe0Jo2wC1+chTttY9CAnsmt
 toE5QiyVsYetoviDxBRGQQXqmJZm19r5GsHYuFwRJqK3F9sS38wOZ1k9aDJHYvo3na3q
 5qMB1tYo32v821ATmyqUHzn1g6FYKKzoeppT3b1vzL8lWbN7JBxTK4vANUqiepQFaQVb
 d6mCZxm3x1JE8Oj2jb6P/aGDrFyXdaqcR2n3J+0kn0Rd/f/9cSqgwBViSdJaBTgMc1Bs
 24PjEuCGxRAA2Wg6zo/FqjdCjKbT4B6YEkLTRXmC9pRAJmVnXVVrDGowXz+XfAbFomMm
 ZYLA==
X-Gm-Message-State: AOAM532uVN4YeGJalOpO+WFZKCRX3E7Vu7KMhvTVSX7rXVMdKbHN8SSM
 lHGmpi1F6HmJJGjAlP9xTr6M3rfW0GmzIjPht0CTtEg/UdMN5qdpSJXaWFB3MvMX8s8+LbIRw8B
 2h6fNAEz8sTYLZtHIUwi4yzSGWGiGDe8QNSmNNWVZHEx4jDLPHozxjaKRzPljTE9h
X-Received: by 2002:aa7:d795:: with SMTP id s21mr988795edq.30.1640912228013;
 Thu, 30 Dec 2021 16:57:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO9MOEJbowYJ6hMSuiR+HX2ZiP/i9IskH9TxDPXUEPluOOVHYkaXf2i+FmlDmSIYCjj84VBA==
X-Received: by 2002:aa7:d795:: with SMTP id s21mr988782edq.30.1640912227876;
 Thu, 30 Dec 2021 16:57:07 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id w11sm6836821edd.21.2021.12.30.16.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:57:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/22] dma: Let st*_dma() propagate MemTxResult
Date: Fri, 31 Dec 2021 01:55:41 +0100
Message-Id: <20211231005546.723396-18-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231005546.723396-1-philmd@redhat.com>
References: <20211231005546.723396-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dma_memory_write() returns a MemTxResult type. Do not discard
it, return it to the caller.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-18-philmd@redhat.com>
---
 include/sysemu/dma.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index d1635f55870..895044d747f 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -248,13 +248,13 @@ static inline void dma_memory_unmap(AddressSpace *as,
         dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
         return _end##_bits##_to_cpu(val);                               \
     }                                                                   \
-    static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
-                                                 dma_addr_t addr,       \
-                                                 uint##_bits##_t val,   \
-                                                 MemTxAttrs attrs)      \
-    {                                                                   \
-        val = cpu_to_##_end##_bits(val);                                \
-        dma_memory_write(as, addr, &val, (_bits) / 8, attrs);           \
+    static inline MemTxResult st##_sname##_##_end##_dma(AddressSpace *as, \
+                                                        dma_addr_t addr, \
+                                                        uint##_bits##_t val, \
+                                                        MemTxAttrs attrs) \
+    { \
+        val = cpu_to_##_end##_bits(val); \
+        return dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
     }
 
 static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs attrs)
@@ -265,10 +265,10 @@ static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs att
     return val;
 }
 
-static inline void stb_dma(AddressSpace *as, dma_addr_t addr,
-                           uint8_t val, MemTxAttrs attrs)
+static inline MemTxResult stb_dma(AddressSpace *as, dma_addr_t addr,
+                                  uint8_t val, MemTxAttrs attrs)
 {
-    dma_memory_write(as, addr, &val, 1, attrs);
+    return dma_memory_write(as, addr, &val, 1, attrs);
 }
 
 DEFINE_LDST_DMA(uw, w, 16, le);
-- 
2.33.1


