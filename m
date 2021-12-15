Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C94763D6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:59:32 +0100 (CET)
Received: from localhost ([::1]:46862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbN5-0003qi-Dl
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxbKt-00012C-AO
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxbKr-00058V-Rz
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639601833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OOkRh2MZ/DBLfZ4HT9jmHJS4If0ihWIm6frAMrPlFV0=;
 b=eL83DB4m1h/zV+i9j2aTa2f3ZBZ/VHdKasYchAi305zxkIGmZVpZ7xGFbCqc6Rf9YV7gT9
 4x8hI5El+HURHh9Vi/s2vKPkgDfrikH6GF47iA7dVRntWn3BQrxK8hv6D8gZPnR+z25Dlj
 eZKlsWzKaxOs1GFa/p3fBl3SULblenc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-X8_Ivvs0O_CHfiAmCTK3Pg-1; Wed, 15 Dec 2021 15:57:12 -0500
X-MC-Unique: X8_Ivvs0O_CHfiAmCTK3Pg-1
Received: by mail-wm1-f71.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso164243wme.8
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OOkRh2MZ/DBLfZ4HT9jmHJS4If0ihWIm6frAMrPlFV0=;
 b=AUaByRBpR9Irc0Em5Nk+fCtj9+oFq3xrKE4J2ni1mOTmnQDuxQuJqdL8Oj3vaUXWPP
 j7KH0B9OycQeRf6QzmhJWyQm8vCV70cf/J25ylCkifWa6Bl4RzSleJ0OqfQUleisS8U3
 kyCfU1y2LLMZih1Zv7koHD57gyPuKoU176nqttg/a4jWEeOap7sRqmMkRCfn5fwy6i0c
 IcpkhslCZV4ZZWLVQann72o5epi/awBEjOunUk+KsVu8WJrEs0W/QiBB6ZFVbFDnvvn8
 /+ufaMxjgroNysIXcgaqY4oByxHby2U9feclYM1gBqV7N4kZ65gfMXxNpHDDmT5OM6fn
 beSA==
X-Gm-Message-State: AOAM533Q/Gih0a3yJ0osYZrj0UFDG4sja15o+L6MHLJoc6iNHNyzGaRh
 Jyg+DHBImZrSvzrWJPkBiW8tzGnSt1NT4/+lqHJXchOvnR3SaHjIHIaHreBOJW5wJ5Cd7bCE6VE
 5JbHSBq3nOukNtn4SLwc2Akim4iIe5OWsi4GNkT1GzyU/LTXD42RmKBLRMPG9HtYT
X-Received: by 2002:adf:ec85:: with SMTP id z5mr1529835wrn.568.1639601830695; 
 Wed, 15 Dec 2021 12:57:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgX1cpLtsgJ3wxILAQYLUhqa2o58p5r47g9Uo5MGHKubIQ/xUVRmrWJro6fBZy7QKMDdlylQ==
X-Received: by 2002:adf:ec85:: with SMTP id z5mr1529806wrn.568.1639601830512; 
 Wed, 15 Dec 2021 12:57:10 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id f15sm3521642wmg.30.2021.12.15.12.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:57:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/3] hw/sd/sdhci: Honor failed DMA transactions
Date: Wed, 15 Dec 2021 21:56:54 +0100
Message-Id: <20211215205656.488940-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215205656.488940-1-philmd@redhat.com>
References: <20211215205656.488940-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

DMA transactions might fail. The DMA API returns a MemTxResult,
indicating such failures. Do not ignore it. On failure, raise
the ADMA error flag and eventually triggering an IRQ (see spec
chapter 1.13.5: "ADMA2 States").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index e0bbc903446..fe2f21f0c37 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -742,6 +742,7 @@ static void sdhci_do_adma(SDHCIState *s)
     unsigned int begin, length;
     const uint16_t block_size = s->blksize & BLOCK_SIZE_MASK;
     ADMADescr dscr = {};
+    MemTxResult res;
     int i;
 
     if (s->trnmod & SDHC_TRNS_BLK_CNT_EN && !s->blkcnt) {
@@ -790,10 +791,13 @@ static void sdhci_do_adma(SDHCIState *s)
                         s->data_count = block_size;
                         length -= block_size - begin;
                     }
-                    dma_memory_write(s->dma_as, dscr.addr,
-                                     &s->fifo_buffer[begin],
-                                     s->data_count - begin,
-                                     MEMTXATTRS_UNSPECIFIED);
+                    res = dma_memory_write(s->dma_as, dscr.addr,
+                                           &s->fifo_buffer[begin],
+                                           s->data_count - begin,
+                                           MEMTXATTRS_UNSPECIFIED);
+                    if (res != MEMTX_OK) {
+                        break;
+                    }
                     dscr.addr += s->data_count - begin;
                     if (s->data_count == block_size) {
                         s->data_count = 0;
@@ -816,10 +820,13 @@ static void sdhci_do_adma(SDHCIState *s)
                         s->data_count = block_size;
                         length -= block_size - begin;
                     }
-                    dma_memory_read(s->dma_as, dscr.addr,
-                                    &s->fifo_buffer[begin],
-                                    s->data_count - begin,
-                                    MEMTXATTRS_UNSPECIFIED);
+                    res = dma_memory_read(s->dma_as, dscr.addr,
+                                          &s->fifo_buffer[begin],
+                                          s->data_count - begin,
+                                          MEMTXATTRS_UNSPECIFIED);
+                    if (res != MEMTX_OK) {
+                        break;
+                    }
                     dscr.addr += s->data_count - begin;
                     if (s->data_count == block_size) {
                         sdbus_write_data(&s->sdbus, s->fifo_buffer, block_size);
@@ -833,7 +840,16 @@ static void sdhci_do_adma(SDHCIState *s)
                     }
                 }
             }
-            s->admasysaddr += dscr.incr;
+            if (res != MEMTX_OK) {
+                if (s->errintstsen & SDHC_EISEN_ADMAERR) {
+                    trace_sdhci_error("Set ADMA error flag");
+                    s->errintsts |= SDHC_EIS_ADMAERR;
+                    s->norintsts |= SDHC_NIS_ERR;
+                }
+                sdhci_update_irq(s);
+            } else {
+                s->admasysaddr += dscr.incr;
+            }
             break;
         case SDHC_ADMA_ATTR_ACT_LINK:   /* link to next descriptor table */
             s->admasysaddr = dscr.addr;
-- 
2.33.1


