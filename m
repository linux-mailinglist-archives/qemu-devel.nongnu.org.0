Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B6E6F43D8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:26:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovT-0004hS-LE; Tue, 02 May 2023 08:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoun-0003qL-Al
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouh-0002zl-J2
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso23995815e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029716; x=1685621716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t26Zipv849X9PCMx5u9NQYkbvFdgca4hd67t8neW/ro=;
 b=ZQfLD/Trv+tY2REWw7UfNu6QFhQPYt2K4HqHIJQ/oWheM2jArWgFdgcjiqHpfrXMDq
 MKVARKxBEnwIPDUyJOSG6m6NLaBO/WgWgPlUgaB2Y5TjnbWvwp5obxQwbQsXMlNrkA+F
 i3hVFxIjfuYh4eEy6sxTbY6Ib2dvwBRshaEX4pu8Yta1COUEg06OF+HyME7DgqEvFsgu
 3p48GhslB9mUbQItjeKbqIYaPvD5NP1Jhl2gKiISUWgQYx3wOz3MstK5JHFXyWGsNCXK
 v5OstmUVV4bWfzIsQD9yfmXd6g30f25lrfBKhf4le5K3cZaQjAG5ZegRS5hTSvCjo6oI
 xD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029716; x=1685621716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t26Zipv849X9PCMx5u9NQYkbvFdgca4hd67t8neW/ro=;
 b=i+CPJDJB+1FJb6EPpepc9BsSlux19jJ43aQ+/s9jwZcSblsnP67i+djBbyLZ25FvQo
 p59HtDHjlwwoOfqseZDm0YeBCLiPg61+pEAE7wxDUGqbLdWskz1AgEBJ+ztEmVTQQ5GJ
 4hsFKEAyEbcrb7flY4sFTuqAZLeHxzwq8WJQL+XG7Ka00ZItddF4ZJXuryUQKfcL6Jwo
 WnF7dmqtkhUSSmMwnG7BUmgKhHVo9a3bAhuZsNOBWQ6Ct1ZaTWQcuuuOjOdmqGnJU9wN
 JJOxMl+0e8s39tfehyrQy3RWNg4uEQ0NvfpJztn9QcMyVZEz8+mispCTssYzOxm2NTmt
 yDdQ==
X-Gm-Message-State: AC+VfDxaSNdl9AdcHq5IcPJ5psQ9yCsKIdTVcR3osHQWFbH9qGVB0SRQ
 EvQJCN6ZgQqsvC9ORBlXB4M2SSUftWwBMNtcyCk=
X-Google-Smtp-Source: ACHHUZ4jr67PQleajgM6G0HFKLeG+0N6a+6mmxjDbLGTrk4x0JNPoNA25nrd0BDcTInrxGCK0H0s6Q==
X-Received: by 2002:a7b:c408:0:b0:3f1:75b6:8c7 with SMTP id
 k8-20020a7bc408000000b003f175b608c7mr11527959wmi.37.1683029716725; 
 Tue, 02 May 2023 05:15:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/35] hw/net/allwinner-sun8i-emac: Correctly byteswap
 descriptor fields
Date: Tue,  2 May 2023 13:14:59 +0100
Message-Id: <20230502121459.2422303-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In allwinner-sun8i-emac we just read directly from guest memory into
a host FrameDescriptor struct and back.  This only works on
little-endian hosts.  Reading and writing of descriptors is already
abstracted into functions; make those functions also handle the
byte-swapping so that TransferDescriptor structs as seen by the rest
of the code are always in host-order, and fix two places that were
doing ad-hoc descriptor reading without using the functions.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230424165053.1428857-3-peter.maydell@linaro.org
---
 hw/net/allwinner-sun8i-emac.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
index b861d8ff352..fac4405f452 100644
--- a/hw/net/allwinner-sun8i-emac.c
+++ b/hw/net/allwinner-sun8i-emac.c
@@ -350,8 +350,13 @@ static void allwinner_sun8i_emac_get_desc(AwSun8iEmacState *s,
                                           FrameDescriptor *desc,
                                           uint32_t phys_addr)
 {
-    dma_memory_read(&s->dma_as, phys_addr, desc, sizeof(*desc),
+    uint32_t desc_words[4];
+    dma_memory_read(&s->dma_as, phys_addr, &desc_words, sizeof(desc_words),
                     MEMTXATTRS_UNSPECIFIED);
+    desc->status = le32_to_cpu(desc_words[0]);
+    desc->status2 = le32_to_cpu(desc_words[1]);
+    desc->addr = le32_to_cpu(desc_words[2]);
+    desc->next = le32_to_cpu(desc_words[3]);
 }
 
 static uint32_t allwinner_sun8i_emac_next_desc(AwSun8iEmacState *s,
@@ -400,10 +405,15 @@ static uint32_t allwinner_sun8i_emac_tx_desc(AwSun8iEmacState *s,
 }
 
 static void allwinner_sun8i_emac_flush_desc(AwSun8iEmacState *s,
-                                            FrameDescriptor *desc,
+                                            const FrameDescriptor *desc,
                                             uint32_t phys_addr)
 {
-    dma_memory_write(&s->dma_as, phys_addr, desc, sizeof(*desc),
+    uint32_t desc_words[4];
+    desc_words[0] = cpu_to_le32(desc->status);
+    desc_words[1] = cpu_to_le32(desc->status2);
+    desc_words[2] = cpu_to_le32(desc->addr);
+    desc_words[3] = cpu_to_le32(desc->next);
+    dma_memory_write(&s->dma_as, phys_addr, &desc_words, sizeof(desc_words),
                      MEMTXATTRS_UNSPECIFIED);
 }
 
@@ -638,8 +648,7 @@ static uint64_t allwinner_sun8i_emac_read(void *opaque, hwaddr offset,
         break;
     case REG_TX_CUR_BUF:        /* Transmit Current Buffer */
         if (s->tx_desc_curr != 0) {
-            dma_memory_read(&s->dma_as, s->tx_desc_curr, &desc, sizeof(desc),
-                            MEMTXATTRS_UNSPECIFIED);
+            allwinner_sun8i_emac_get_desc(s, &desc, s->tx_desc_curr);
             value = desc.addr;
         } else {
             value = 0;
@@ -652,8 +661,7 @@ static uint64_t allwinner_sun8i_emac_read(void *opaque, hwaddr offset,
         break;
     case REG_RX_CUR_BUF:        /* Receive Current Buffer */
         if (s->rx_desc_curr != 0) {
-            dma_memory_read(&s->dma_as, s->rx_desc_curr, &desc, sizeof(desc),
-                            MEMTXATTRS_UNSPECIFIED);
+            allwinner_sun8i_emac_get_desc(s, &desc, s->rx_desc_curr);
             value = desc.addr;
         } else {
             value = 0;
-- 
2.34.1


