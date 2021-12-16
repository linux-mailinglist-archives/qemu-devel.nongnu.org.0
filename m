Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18331477B25
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:58:01 +0100 (CET)
Received: from localhost ([::1]:36648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxv0y-0004G0-6q
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:58:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxuyY-00022a-61
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:55:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxuyW-0007KS-PZ
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 12:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639677328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBEhhvwmrK3INOwJ0KjtvMl1VgesDG36wHzC7bVJ4nc=;
 b=hhS9lCYahrbBYotFjyTtyOGfiIla6Jt4dcI/4GxjiWavqQ9CMLpzHqvddW8dNsjQUy6V0Q
 ASkHAhd9yws0p5G7cLuXaeIOg1d/jK88EZRHGmVqONUEm/oGTTrz1ZQDwm9FnO8gBqBJP7
 iURE4CS59ysJIWKe4NE17Fnp5C3o5vI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-VFN4vUvjMvKM2cXFgg6ByA-1; Thu, 16 Dec 2021 12:55:27 -0500
X-MC-Unique: VFN4vUvjMvKM2cXFgg6ByA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j20-20020a05600c1c1400b00343ad0c4c40so1639015wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 09:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EBEhhvwmrK3INOwJ0KjtvMl1VgesDG36wHzC7bVJ4nc=;
 b=OiIiUbVLaQn5NYh8xgP/VRzxxZiU1FFVaScb1POIAWda2P1bOvowKIzMb8Zw4lRuAJ
 qWEMOzUU6yzU3+seX7rrpLKPp9dGF13QWXaovVTg3od5NrbwF9hmVSgWxdzzRl4XhYTE
 v+V0JFWWaXHceeQmJEa3RrS8Y1V+7taXaTFEFPsBjBj8/uCWzbANR6uW4GR0w8eg/eox
 KLXgSI4Nbu903Lu+9xOD5DUmqjKynyEV/BWDNGRgXOOUiL0OyXl4tz3qojiNr12/Q7RI
 Y0GGOczpAjqjgdOVbDf5c7vs7Gv7z6GMf1TtiS69JPIlhJ1UEv09We6WorSCx7MIPzvi
 WAAQ==
X-Gm-Message-State: AOAM530awICZ9vld94iJPPw8gNIxoSCFPmZyCppHotL2bDD5JSwei+xX
 YRwWcaiHN+HNsAZUag+8mku73Y4tETySSrgvnS0yRdj5On0am//wVDbXSLLma0DSgmem7leXXcO
 ssIH17pX0iLDDLjGv0YM/Hsc3j0BKGPks8vQ8xWZdAMvLZSt+dBQ457sH6aJDXeOp
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr10123220wrs.273.1639677325166; 
 Thu, 16 Dec 2021 09:55:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKq/OOw3vRa7EiIkjaYarlgIoTYwbR/cYUfPpK/bcCcI/DiN36NRfauduaSSnaUZAePdgY8w==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr10123187wrs.273.1639677324855; 
 Thu, 16 Dec 2021 09:55:24 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w8sm5509969wre.106.2021.12.16.09.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 09:55:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/nvme/ctrl: Do not ignore DMA access errors
Date: Thu, 16 Dec 2021 18:55:09 +0100
Message-Id: <20211216175510.884749-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216175510.884749-1-philmd@redhat.com>
References: <20211216175510.884749-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Keith Busch <kbusch@kernel.org>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dma_buf_read/dma_buf_write() return a MemTxResult type.
Do not discard it, propagate the DMA error to the caller.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvme/ctrl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index fa410a179a6..604ed0aea0d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1147,15 +1147,16 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
 
     if (sg->flags & NVME_SG_DMA) {
         const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+        MemTxResult res;
         uint64_t residual;
 
         if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
-            dma_buf_write(ptr, len, &residual, &sg->qsg, attrs);
+            res = dma_buf_write(ptr, len, &residual, &sg->qsg, attrs);
         } else {
-            dma_buf_read(ptr, len, &residual, &sg->qsg, attrs);
+            res = dma_buf_read(ptr, len, &residual, &sg->qsg, attrs);
         }
 
-        if (unlikely(residual)) {
+        if (unlikely(residual) || res != MEMTX_OK) {
             trace_pci_nvme_err_invalid_dma();
             return NVME_INVALID_FIELD | NVME_DNR;
         }
-- 
2.33.1


