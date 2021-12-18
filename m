Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33E479B7C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 15:58:18 +0100 (CET)
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mybA9-0004x4-0j
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 09:58:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myb3c-0005bA-MG
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 09:51:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myb3b-0001Aw-9r
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 09:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639839090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z0wxGg120YyeF7AD5AshLrhx/8IEHK5hXeX4znVMwbA=;
 b=Uwvkr9K6vph35vCJbZmZhH7kARqp2nGyMyDsqA0NVoHQfgUjTA8kKkCEQI+MQ0BUs9+WAs
 7q20B2bcMrhkfXO5XQYDU6TcCn8iwrtkrvhS8K6OE83DTfUxB84RXpmAs0V0U98KO0n+gj
 c0Vqg/eyzb4DlRmDgnAh1s2ssI+arKk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-VEb5Tkf8Pg2AlsuuexFlWg-1; Sat, 18 Dec 2021 09:51:29 -0500
X-MC-Unique: VEb5Tkf8Pg2AlsuuexFlWg-1
Received: by mail-wr1-f72.google.com with SMTP id
 q21-20020adfab15000000b001a24b36e47eso1482994wrc.2
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 06:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z0wxGg120YyeF7AD5AshLrhx/8IEHK5hXeX4znVMwbA=;
 b=VoSbVyz8lalymqMAZ424S4Xk2sDDCmlormUyuCvvtpj7tLrwCDjwSuCygFVi+ro4tG
 wBVJfRlRtPCtSK185rNu33fe1qanLhso3xRE03dVEmaY2oIgeMDruZvoW0XnFm88bamc
 tXS+de6J+/+USxNEREMxRliDMMIXQcghHuOWidDKtiOeyaY8tJFLFo8NDDUPaPI8HjDZ
 lx78EMB3IYL/kcRkTICyP3s+wpFLVUx7gK61mKyn1layhC6QmJRSZChAbNKlONWiNR7a
 gp4iBgme8DksLrwkkqPoxiDvZ3exEq/rNP98rBoDyd4M3M0kVx6ulMenw68zfvyUuj1Q
 yhrA==
X-Gm-Message-State: AOAM531ekSkGY+Zxvi2gDTLcKmCeth45+YkkRrjEqAJgWDbbbVQEdql4
 JV9DuD6M0lW5/JG/BQhTTUImptscVaoiaysDyvaszqHCboA981VKjYhB2tp3pms/WSlzts3fhss
 xvRDhm2DP3EjmVLjL42xukvapTbR0amsBeakxlrpb/rJwEneI1YR1gJOg82Dl92Pa
X-Received: by 2002:a5d:460d:: with SMTP id t13mr6667425wrq.44.1639839088311; 
 Sat, 18 Dec 2021 06:51:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTUALNby17VArSwVhgi2Rd5e5bePTtubSqB/nhxUQypN3GuJLWE13uk2WnAO47OERY/aFYUg==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr6667399wrq.44.1639839088080; 
 Sat, 18 Dec 2021 06:51:28 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o64sm10566299wme.28.2021.12.18.06.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 06:51:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] dma: Let st*_dma() propagate MemTxResult
Date: Sat, 18 Dec 2021 15:51:10 +0100
Message-Id: <20211218145111.1540114-4-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218145111.1540114-1-philmd@redhat.com>
References: <20211218145111.1540114-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dma_memory_write() returns a MemTxResult type. Do not discard
it, return it to the caller.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index b711d390a4f..191cf0b271a 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -249,13 +249,13 @@ static inline void dma_memory_unmap(AddressSpace *as,
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
@@ -266,10 +266,10 @@ static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs att
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


