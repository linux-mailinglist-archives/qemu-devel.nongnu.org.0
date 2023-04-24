Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67996ED2D9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:52:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqzPB-00038F-Bl; Mon, 24 Apr 2023 12:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqzP4-00035J-CM
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:51:02 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqzP2-00029l-25
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:51:02 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2f3fe12de15so2833151f8f.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682355055; x=1684947055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0ZbXxb0hmj0vZqrNkooEeAN2y7lCrT/j7W1IOTwXQ4=;
 b=p665vZMaDiTOgl6tOWtCZi/7VVua0cSUHcT1Rlo/pV6W+KE9RkRUmKjmvF/QJEieGC
 C0QGaMuwYwejXa+LcrvNJF1bGAkv8Ro7cZAdfe99mdapNIW6PK0NrWmvY0myT/d7B53P
 AmV6d6Eb2zKtq8NZHTHXwjjrbARAcq+3xdBi6OeOd9P6y8trB9MgFfnwLZ9z2NVNydSc
 Lza0Aip6E09eJtIA5oAqMla/N/jjiFGBM7P8X7dIMuR3Xh5Qpxud6KyJgTqapTyQByV9
 jFcz2EoNScNe/RDD+YPzMlhA50H7hdaHRMTlxtMA1cbHl4x3Ck3vGwy6ovnzOwbcsWv0
 KP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682355055; x=1684947055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0ZbXxb0hmj0vZqrNkooEeAN2y7lCrT/j7W1IOTwXQ4=;
 b=MgEJ4GsgSLzYJtnBSHpAYfw5FRDpcKNSAmjmdCeSjOG7OJSLnZPyZbO3gSzUu8yQYR
 OGVKUklOT7nL9cSlCNxJXoakRvhQ5ygI+ayXShIo5Ad3mOIyz7JUtr8jXUmqq2pZ418n
 9jH1rTMdYlTkLGpiRt/8VkkP6TK/1Q7X6X3YFWnjhYAxi2lHRY7kH0z+A7PkjNyYnjsz
 yElKRl5knbynTRREZN60O29sJ+ME3dy+bMLOMXKFalVVzxV23dZ8fiWyMd2VKhOEx78H
 vTiq/Nit0OBtd2Bub31/sl9hdkHt/WVCLodGdD1C4LXpsfWDLW3PuZ5hjsiIXU5Bum/A
 PRnQ==
X-Gm-Message-State: AAQBX9ccUALPLA9cGCZi4IwTYRMH83h2JAiTDHStbF8RD0+X1YrmykUr
 jj0ZZeMEVCZ15iRZQx/8saeYug==
X-Google-Smtp-Source: AKy350aCAPk2+X+aTXAlVLuCljHEARlkrGrqRFn9wNROAjyqAXddl+O9H+KCSekpkqioyo1V67uAYA==
X-Received: by 2002:adf:e686:0:b0:2ce:9877:84ae with SMTP id
 r6-20020adfe686000000b002ce987784aemr8693521wrm.16.1682355055722; 
 Mon, 24 Apr 2023 09:50:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b002e5ff05765esm11211279wrf.73.2023.04.24.09.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 09:50:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org
Subject: [PATCH 1/2] hw/sd/allwinner-sdhost: Correctly byteswap descriptor
 fields
Date: Mon, 24 Apr 2023 17:50:52 +0100
Message-Id: <20230424165053.1428857-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424165053.1428857-1-peter.maydell@linaro.org>
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

In allwinner_sdhost_process_desc() we just read directly from
guest memory into a host TransferDescriptor struct and back.
This only works on little-endian hosts. Abstract the reading
and writing of descriptors into functions that handle the
byte-swapping so that TransferDescriptor structs as seen by
the rest of the code are always in host-order.

This fixes a failure of one of the avocado tests on s390.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/allwinner-sdhost.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index 51e5e908307..92a0f42708d 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -302,6 +302,30 @@ static void allwinner_sdhost_auto_stop(AwSdHostState *s)
     }
 }
 
+static void read_descriptor(AwSdHostState *s, hwaddr desc_addr,
+                            TransferDescriptor *desc)
+{
+    uint32_t desc_words[4];
+    dma_memory_read(&s->dma_as, desc_addr, &desc_words, sizeof(desc_words),
+                    MEMTXATTRS_UNSPECIFIED);
+    desc->status = le32_to_cpu(desc_words[0]);
+    desc->size = le32_to_cpu(desc_words[1]);
+    desc->addr = le32_to_cpu(desc_words[2]);
+    desc->next = le32_to_cpu(desc_words[3]);
+}
+
+static void write_descriptor(AwSdHostState *s, hwaddr desc_addr,
+                             const TransferDescriptor *desc)
+{
+    uint32_t desc_words[4];
+    desc_words[0] = cpu_to_le32(desc->status);
+    desc_words[1] = cpu_to_le32(desc->size);
+    desc_words[2] = cpu_to_le32(desc->addr);
+    desc_words[3] = cpu_to_le32(desc->next);
+    dma_memory_write(&s->dma_as, desc_addr, &desc_words, sizeof(desc_words),
+                     MEMTXATTRS_UNSPECIFIED);
+}
+
 static uint32_t allwinner_sdhost_process_desc(AwSdHostState *s,
                                               hwaddr desc_addr,
                                               TransferDescriptor *desc,
@@ -312,9 +336,7 @@ static uint32_t allwinner_sdhost_process_desc(AwSdHostState *s,
     uint32_t num_bytes = max_bytes;
     uint8_t buf[1024];
 
-    /* Read descriptor */
-    dma_memory_read(&s->dma_as, desc_addr, desc, sizeof(*desc),
-                    MEMTXATTRS_UNSPECIFIED);
+    read_descriptor(s, desc_addr, desc);
     if (desc->size == 0) {
         desc->size = klass->max_desc_size;
     } else if (desc->size > klass->max_desc_size) {
@@ -356,8 +378,7 @@ static uint32_t allwinner_sdhost_process_desc(AwSdHostState *s,
 
     /* Clear hold flag and flush descriptor */
     desc->status &= ~DESC_STATUS_HOLD;
-    dma_memory_write(&s->dma_as, desc_addr, desc, sizeof(*desc),
-                     MEMTXATTRS_UNSPECIFIED);
+    write_descriptor(s, desc_addr, desc);
 
     return num_done;
 }
-- 
2.34.1


