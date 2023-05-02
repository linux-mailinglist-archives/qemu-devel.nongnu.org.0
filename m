Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D56F4387
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:16:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptov7-0003uO-Se; Tue, 02 May 2023 08:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoun-0003qP-BL
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003FK-Ae
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:26 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f178da219bso35873585e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029716; x=1685621716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+hHFosEz8hVgcMXzEdjy3NeSzoqselMzKD6ykELAmag=;
 b=ArRazfTibcVYnvJftaVeTir7jwgNYKn7BnBpINrOb9g9iHKr+dlJhP1PmBrbDtcwPF
 QDio4Imowdswd5ZecMY1fQWEPw7Ou6NYTcvlMtJ2jE+3Ee3zg6wOKc2ZwiAO8SogUCYS
 cxAlwarOkLboAM70qm5ZdIQsk0fju1cjqUJlEAMjXKhbBUqCXsp5isrISi9u14LDdYtI
 6yVtknVkaczt2EKxURdMzGIvt++qf/BGX7PmLzlDdZE3AQUVgVHpyegCTvApZBUxU0Ie
 H4hCGrWLEFbyBYzyWKSjQmtsrCUyQoRGW2umXoG3peiueI6dovPdJtMze2CX7iNxBLtp
 oAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029716; x=1685621716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+hHFosEz8hVgcMXzEdjy3NeSzoqselMzKD6ykELAmag=;
 b=FeLVRI5YYbK8CIyWd+cq7nlSTP91pzhxw6aztF0o74Nbmrx9fwOuKi+4IXXADSblbL
 uSvHKXX4mM7Mq+RvnYpn6T0DQHmgJ4a2s/5nQ9cjrdLVoxUAVUTL2QuyezPYSXaZ5fRc
 szg/oHi9RyK1DdZpymbC8rNb7MYT+LMxxCDA0iZFV1Py77nDsI3a2EOEvlka5kOU87Wo
 hrfqgzzYDQQUDHWIP8RA/QZbfaEmoD4fwE5rElZRh653xsnF+cZ6KlFn9y1rMtQQJDSP
 ykA7M/OydHMPf1zPwL+wMyDSaWEECYebbkOQw8SdYZvwvNobIzs29b4Zlxp7exOji+FB
 zVUA==
X-Gm-Message-State: AC+VfDxf0e8xqCCTOe8Mk6xv/HSEdCwF0+vu0Jh/P0unoL2GovEKEJSn
 gT32C+YL1KTyLjQHFXbW24fB4gTGc1nREHQYtZw=
X-Google-Smtp-Source: ACHHUZ7wi4Ev/UTfu83JBTb9kL/ZT/oIi20b5izqRndEEzWUJYK2R852LbLhDgFORtcVEbTDtvIIiA==
X-Received: by 2002:a7b:c5da:0:b0:3f1:72d4:b271 with SMTP id
 n26-20020a7bc5da000000b003f172d4b271mr13682573wmk.3.1683029716268; 
 Tue, 02 May 2023 05:15:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/35] hw/sd/allwinner-sdhost: Correctly byteswap descriptor
 fields
Date: Tue,  2 May 2023 13:14:58 +0100
Message-Id: <20230502121459.2422303-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

In allwinner_sdhost_process_desc() we just read directly from
guest memory into a host TransferDescriptor struct and back.
This only works on little-endian hosts. Abstract the reading
and writing of descriptors into functions that handle the
byte-swapping so that TransferDescriptor structs as seen by
the rest of the code are always in host-order.

This fixes a failure of one of the avocado tests on s390.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230424165053.1428857-2-peter.maydell@linaro.org
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


