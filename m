Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3483744D97F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:49:53 +0100 (CET)
Received: from localhost ([::1]:37414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCKm-0005x3-Bc
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:49:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlCHB-0000qa-8Z
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:46:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlCH8-0006Ki-Q7
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636645566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qg1GXXFWmSDcEemSye0eTm+kWbLuLN+y4psRhU/uNI4=;
 b=GtCJSQNTOT5x+6niF+ax4ya8BQW3Ejc98qxR60Mf53Ncs0wdDF5uFev/k92DfiG0cXZ8g7
 /WsYL4qrO9RhFVu59rSH/FrA1OiKCOJwnM/v7Ahr82R/FIj4d1o12NEZGsqX4RtK/99i7f
 uAeYsmxr6+REYDMSKupZtgD2DNpw/Os=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-45nZbo9SNqudGpfon1LI6A-1; Thu, 11 Nov 2021 10:46:05 -0500
X-MC-Unique: 45nZbo9SNqudGpfon1LI6A-1
Received: by mail-wr1-f70.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so1069354wro.21
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 07:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qg1GXXFWmSDcEemSye0eTm+kWbLuLN+y4psRhU/uNI4=;
 b=g+6Oec4Pj4iSHKvp1UHvBmalPb4sS1ytigd32WXaos7XFANOqQ4uHdTlysEKHoEnR/
 F4LpcSyKvXossSxXqE7PFO2GVe/UNt0++6wSd494q1jtFNs70Mrbul5NNiL+sKaoBk2k
 9c++V81zh904RMpqs0z9OiiXlsSP1zYhpcWMuWJcYvK5w7eHGovG3iO0LgR64dGNtOFi
 njRE5Ti8/NymovN2XA8d+UF4xGiIrel2RppMz1SyrN3KWC6grjCJFDj433fHdiB1h0o3
 svgxiSeqZw92QzqlGMIJCjKASPaH64euql7j40lp0VyVqPT+xm+AwTbYyzxhBannycuj
 BYCQ==
X-Gm-Message-State: AOAM5338BbNH7vf5szqzNdFWg0Kaqg3sXVzhPSdGXrt8QRl5YCBFSGci
 h0vJi8e5Y3al/afvBRz/o2orOaJBi+eGTFkc9E1KWAR4O380FN2CUFRNwd0zE7z1cyd7oKY30rn
 5CgsPrMRhZASKrd3PkO6ewOG3l7V45efWdvRlu2nrpUXGWHlcWaIIEdIV8MC+OPV8
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr10101753wri.6.1636645563790;
 Thu, 11 Nov 2021 07:46:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxh8Br+4KE98xdyxkc2md5NniXedu5Ini8Z3gjTF0VwvQ8qxqhrB7d2A1ank+jBGemjgXHApw==
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr10101717wri.6.1636645563607;
 Thu, 11 Nov 2021 07:46:03 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t8sm3219528wrv.30.2021.11.11.07.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 07:46:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 2/2] hw/nvme/ctrl: Pass buffers as 'void *' types
Date: Thu, 11 Nov 2021 16:45:52 +0100
Message-Id: <20211111154552.2263410-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111154552.2263410-1-philmd@redhat.com>
References: <20211111154552.2263410-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These buffers can be anything, not an array of chars,
so use the 'void *' type for them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvme/nvme.h |  4 ++--
 hw/nvme/ctrl.c | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 83ffabade4c..38f3ebf7f6c 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -495,9 +495,9 @@ static inline uint16_t nvme_cid(NvmeRequest *req)
 }
 
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
-uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
-uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+uint16_t nvme_bounce_mdata(NvmeCtrl *n, void *ptr, uint32_t len,
                            NvmeTxDirection dir, NvmeRequest *req);
 void nvme_rw_complete_cb(void *opaque, int ret);
 uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index c7cce63372a..8feefde9d19 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1140,7 +1140,7 @@ static uint16_t nvme_tx_interleaved(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr,
     return NVME_SUCCESS;
 }
 
-static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
+static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, void *ptr, uint32_t len,
                         NvmeTxDirection dir)
 {
     assert(sg->flags & NVME_SG_ALLOC);
@@ -1176,7 +1176,7 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
     return NVME_SUCCESS;
 }
 
-static inline uint16_t nvme_c2h(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+static inline uint16_t nvme_c2h(NvmeCtrl *n, void *ptr, uint32_t len,
                                 NvmeRequest *req)
 {
     uint16_t status;
@@ -1189,7 +1189,7 @@ static inline uint16_t nvme_c2h(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return nvme_tx(n, &req->sg, ptr, len, NVME_TX_DIRECTION_FROM_DEVICE);
 }
 
-static inline uint16_t nvme_h2c(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+static inline uint16_t nvme_h2c(NvmeCtrl *n, void *ptr, uint32_t len,
                                 NvmeRequest *req)
 {
     uint16_t status;
@@ -1202,7 +1202,7 @@ static inline uint16_t nvme_h2c(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return nvme_tx(n, &req->sg, ptr, len, NVME_TX_DIRECTION_TO_DEVICE);
 }
 
-uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
@@ -1218,7 +1218,7 @@ uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     return nvme_tx(n, &req->sg, ptr, len, dir);
 }
 
-uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
+uint16_t nvme_bounce_mdata(NvmeCtrl *n, void *ptr, uint32_t len,
                            NvmeTxDirection dir, NvmeRequest *req)
 {
     NvmeNamespace *ns = req->ns;
-- 
2.31.1


