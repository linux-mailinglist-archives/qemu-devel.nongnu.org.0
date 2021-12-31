Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F72482120
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:01:49 +0100 (CET)
Received: from localhost ([::1]:33618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Im-0001Ph-28
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:01:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Dh-0001MN-Fj
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Df-0003YG-Vh
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JE68J83OkbzA8nCRRfKVPFa1WbIbEeNp8R6h+tw15yA=;
 b=Tmp6CsaP2+rdjP56S/SEc86zfk/Ty75c5HC7VTnMXSWhg9M/UrSb0HLTwObx6IXEJP+tbD
 t74UAwR/fIkzZxTBRHMYFrczE3rMw8uqSqkShXod+F+2vK2woLysSBThzi4974pMb2tZuG
 z8GdtWy3tOhi/YL5ztlXkUuzAfRw1p8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-WpcKM11oOEejbHv80bQcvg-1; Thu, 30 Dec 2021 19:56:28 -0500
X-MC-Unique: WpcKM11oOEejbHv80bQcvg-1
Received: by mail-ed1-f69.google.com with SMTP id
 i5-20020a05640242c500b003f84839a8c3so18032690edc.6
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JE68J83OkbzA8nCRRfKVPFa1WbIbEeNp8R6h+tw15yA=;
 b=lPg+RhA3Rabqq1iYHfSu+fGa5ZMu798r5KgocFJ5wysIbQwdCzWdW8GI09AiNwy5jn
 JnGfMwCoOfSpNIiEB8buhz7xgv0VCo41OZx2UAAJpA+sJg87G3XVN9ci9T2n24EvV7wk
 B8LJ4GYoHJB+GwbcLzj8BjI+tfeSJTvLgZPNxYrU16nyXL8JcuXt5od6lVH8zxZzhBra
 reOpHoXO26irxDKFEx/SLBmfMeB8zd9Xby2kcCEc5b+L0HNzW39/Wlrpx5bbytd3XZxA
 3PIpAmbfoSCml6FFqHY9XpNjHht3ug4nNAKrs9pLTDnSyyi3cSRxruK9KRj5wQyXxVn3
 gNBg==
X-Gm-Message-State: AOAM531RQ+oqrHcDVipeRSPXM87nBKMoSGGCRZy+G1oYOBw9lU6Eglwa
 gSd8ZVbFUb5O2AU3X5ZF/RzHk+ex2W93BKMJ+Yp6kevtqzRZywMaRjhKC5ZMp9ifbIlL1MgosxU
 7vX2R0Q+2TFqiUeLxAs1ne435BPRx2Jygrdd9GRrT52Tz77x9MiI+mmXmi2oyEDDp
X-Received: by 2002:a17:907:1c92:: with SMTP id
 nb18mr26650581ejc.249.1640912187274; 
 Thu, 30 Dec 2021 16:56:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydYwDARW50WnUU4/RVl/v4ApOhsA9Jb5AvPSAimAvCKtmnNIOYftP9+T4mG3pHewE9VGTk2w==
X-Received: by 2002:a17:907:1c92:: with SMTP id
 nb18mr26650573ejc.249.1640912187116; 
 Thu, 30 Dec 2021 16:56:27 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id sa6sm8122800ejc.6.2021.12.30.16.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:56:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/22] dma: Have dma_buf_rw() take a void pointer
Date: Fri, 31 Dec 2021 01:55:32 +0100
Message-Id: <20211231005546.723396-9-philmd@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DMA operations are run on any kind of buffer, not arrays of
uint8_t. Convert dma_buf_rw() to take a void pointer argument
to save us pointless casts to uint8_t *.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-8-philmd@redhat.com>
---
 softmmu/dma-helpers.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 3c06a2feddd..09e29997ee5 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -294,9 +294,10 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 }
 
 
-static uint64_t dma_buf_rw(uint8_t *ptr, int32_t len, QEMUSGList *sg,
+static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
                            DMADirection dir)
 {
+    uint8_t *ptr = buf;
     uint64_t resid;
     int sg_cur_index;
 
-- 
2.33.1


