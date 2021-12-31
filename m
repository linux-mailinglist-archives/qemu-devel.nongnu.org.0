Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F9C482130
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:09:57 +0100 (CET)
Received: from localhost ([::1]:50700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Qe-0004fZ-SP
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:09:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Dv-0001xr-9m
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Dt-0003ZG-Qc
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P6mIO4CGwa5WX+783uVHB0Nmeav2CUdqvdcqnFc0STk=;
 b=W8ncY2Igh9BcjM1B5YbmK0kBXsXKyd5gQNSC6GBc0gv2gCO6I5drW56QYyx/u5U/wRe8FV
 GAMpXL0ssUnfdF5lAFYqOSm78BdpJcQG+em1qPmNsHtBTHoUvNbQbepLgN3QZdTNqBBzlZ
 oVjEH6JkrMDqFvLY8XlzgeBKj/m/VfY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-Z5kzbgswPkOnKlVpg5DEHw-1; Thu, 30 Dec 2021 19:56:42 -0500
X-MC-Unique: Z5kzbgswPkOnKlVpg5DEHw-1
Received: by mail-ed1-f70.google.com with SMTP id
 d7-20020aa7ce07000000b003f84e9b9c2fso17913643edv.3
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P6mIO4CGwa5WX+783uVHB0Nmeav2CUdqvdcqnFc0STk=;
 b=FbqiJbfl+iSiuAfEZ17U6N9jttBiQkSmT/B0h9GGWMDwZwVcJtxHT3Ugu6mcLRECva
 ycegDTvocgN/LhzIrq07cuWbjPHMcr8TljJJrd0wTx6niR92occ7cUB3GVFEZGizo2nh
 Y9QDzmr+7kRlxu0/uVl8T/Usy8Js+XkSIaeVbpzs/rW1BmIOETm+gwRqlocYQHxhFqcJ
 WE2sUmo99JTp64mEj5YBBdbBeSwlGNv4+JZ03NwFq/i4GiMwtXkcUzOixwgw4hT1F9ZN
 WQY8i3HjYXi62CzyyKz12C723LCeZzcpGTPWV1DNPotFqEaKurLwNwsHm1GZ0UwNLbuW
 444w==
X-Gm-Message-State: AOAM5302VKBFWVJP7MIDJpLQgtKe80zKgdDr5x6gRC9QW9acUjXBUJBF
 vXRCrrc/Jh8s0d/+voxHEuppPk4tpnEYii3gwBwe9Gx78/cnbcUNfs0Q2xRz4O3T9GePuxrVHVn
 Vbl9DeDMcJOZ/qmdGQl8YDd0RTp1rsrFX2OH+KGktGsrq042cNlq7VrsYtp0rg6CL
X-Received: by 2002:a17:906:6a0f:: with SMTP id
 qw15mr27837138ejc.663.1640912201068; 
 Thu, 30 Dec 2021 16:56:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyquURKORaWOEDFdECldoNU1EVHi654jttm088yhvJ2slYLMn+OjAjLNZwGfLuVpYBiWM+/g==
X-Received: by 2002:a17:906:6a0f:: with SMTP id
 qw15mr27837124ejc.663.1640912200859; 
 Thu, 30 Dec 2021 16:56:40 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id sc7sm8063141ejc.87.2021.12.30.16.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:56:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/22] dma: Let dma_buf_rw() take MemTxAttrs argument
Date: Fri, 31 Dec 2021 01:55:35 +0100
Message-Id: <20211231005546.723396-12-philmd@redhat.com>
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

Let devices specify transaction attributes when calling dma_buf_rw().

Keep the default MEMTXATTRS_UNSPECIFIED in the 2 callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-11-philmd@redhat.com>
---
 softmmu/dma-helpers.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7f37548394e..fa81d2b386c 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -295,7 +295,7 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 
 
 static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
-                           DMADirection dir)
+                           DMADirection dir, MemTxAttrs attrs)
 {
     uint8_t *ptr = buf;
     uint64_t resid;
@@ -307,8 +307,7 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir,
-                      MEMTXATTRS_UNSPECIFIED);
+        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
         ptr += xfer;
         len -= xfer;
         resid -= xfer;
@@ -319,12 +318,14 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
 
 uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE,
+                      MEMTXATTRS_UNSPECIFIED);
 }
 
 uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE,
+                      MEMTXATTRS_UNSPECIFIED);
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1


