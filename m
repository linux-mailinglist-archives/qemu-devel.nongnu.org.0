Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898C9529359
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 00:07:49 +0200 (CEST)
Received: from localhost ([::1]:49166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqisW-00033M-Dq
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 18:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkk-0003bm-2J
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhki-000769-CZ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bx3yjI8J96Ow3fL/flNwsTWaDHNvQ6trt+wn+Q4QM50=;
 b=aKjsJOb/k98wX8Xc9IrgRKRSfO2HyTvbGfkCpDZryd7VYgVUa1v0KBiJXSGjgrVgxl8QBC
 UdsDqGO1YthK8YYOIK2AgNpGdXy/iOKJYfyprd0mxa2YHqtFfwkxhhbxiLhMPTpqZ6EId8
 1Ug/NLpmQpOTsEe4KyIcFprRkRcmgP4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-KyzaqODeNGuR200voPKE8Q-1; Mon, 16 May 2022 16:55:38 -0400
X-MC-Unique: KyzaqODeNGuR200voPKE8Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso6373836ejs.12
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bx3yjI8J96Ow3fL/flNwsTWaDHNvQ6trt+wn+Q4QM50=;
 b=f4u/bE3J6de/lhhxf+g/S7NTglwtosfe/hbV7mFJiIk2i4AWs4qE68of3LCxXq9lMW
 Xb3pZtEO7AfJC/rzkwAWygoAA2bpmdrq0a1GZAnxdFgsnkQioTbvsbduoVJrJAfPdTib
 Jsm46pIVfls3/PKxg7vgkvfKP+tgf4E6iCykqWQspSjItEKZzaOYUBQfE6XLa/0ix7bt
 KF8Pd4GAcNGE407an8vFgYZxBc/XI8oOUuizhreh7tT7xsrJzfvXgRO7RSndeSQF5t9v
 sExSlYxMUoOquI49qpVcEdSCtBeReExFKTwVTbexXfQDAgCQGCnxxmgw0/xfNaWrqz54
 IiOQ==
X-Gm-Message-State: AOAM532bWQCkKUhKBTxd/4uYVDXWf8f/+kDC5h18tCFw+B6X2YhrdjOA
 9jer2GcVCZq4NqREHbMiVv6Ehq4Zj8rMy9HxxqYnNh2jrQy9RNYa1NXVMpQy8an3ACvS3/CvsGu
 96moFIUA+IYNaIQZO0tDkTz+fwbubf2u7TMC+BG09/nLOmgAa6PaclI+uP003
X-Received: by 2002:a50:8a99:0:b0:42a:8c56:1904 with SMTP id
 j25-20020a508a99000000b0042a8c561904mr13391140edj.214.1652734537073; 
 Mon, 16 May 2022 13:55:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhtjB5FB8DMRtVpcF7KvBzDMzn1H2fG577MQnbQEyz0MCXZUDzfwjEzaW4Eiaf7LKJKUpUYg==
X-Received: by 2002:a50:8a99:0:b0:42a:8c56:1904 with SMTP id
 j25-20020a508a99000000b0042a8c561904mr13391111edj.214.1652734536812; 
 Mon, 16 May 2022 13:55:36 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 y17-20020a170906519100b006f3ef214e37sm165148ejk.157.2022.05.16.13.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:55:36 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Wei Huang <wei.huang2@amd.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 78/86] hw/i386/amd_iommu: Fix IOMMU event log encoding errors
Message-ID: <20220516204913.542894-79-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Huang <wei.huang2@amd.com>

Coverity issues several UNINIT warnings against amd_iommu.c [1]. This
patch fixes them by clearing evt before encoding. On top of it, this
patch changes the event log size to 16 bytes per IOMMU specification,
and fixes the event log entry format in amdvi_encode_event().

[1] CID 1487116/1487200/1487190/1487232/1487115/1487258

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Wei Huang <wei.huang2@amd.com>
Message-Id: <20220422055146.3312226-1-wei.huang2@amd.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/amd_iommu.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index ea8eaeb330..725f69095b 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -201,15 +201,18 @@ static void amdvi_setevent_bits(uint64_t *buffer, uint64_t value, int start,
 /*
  * AMDVi event structure
  *    0:15   -> DeviceID
- *    55:63  -> event type + miscellaneous info
- *    63:127 -> related address
+ *    48:63  -> event type + miscellaneous info
+ *    64:127 -> related address
  */
 static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
                                uint16_t info)
 {
+    evt[0] = 0;
+    evt[1] = 0;
+
     amdvi_setevent_bits(evt, devid, 0, 16);
-    amdvi_setevent_bits(evt, info, 55, 8);
-    amdvi_setevent_bits(evt, addr, 63, 64);
+    amdvi_setevent_bits(evt, info, 48, 16);
+    amdvi_setevent_bits(evt, addr, 64, 64);
 }
 /* log an error encountered during a page walk
  *
@@ -218,7 +221,7 @@ static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
 static void amdvi_page_fault(AMDVIState *s, uint16_t devid,
                              hwaddr addr, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_IOPF_I | AMDVI_EVENT_IOPF;
     amdvi_encode_event(evt, devid, addr, info);
@@ -234,7 +237,7 @@ static void amdvi_page_fault(AMDVIState *s, uint16_t devid,
 static void amdvi_log_devtab_error(AMDVIState *s, uint16_t devid,
                                    hwaddr devtab, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_DEV_TAB_HW_ERROR;
 
@@ -248,7 +251,8 @@ static void amdvi_log_devtab_error(AMDVIState *s, uint16_t devid,
  */
 static void amdvi_log_command_error(AMDVIState *s, hwaddr addr)
 {
-    uint64_t evt[4], info = AMDVI_EVENT_COMMAND_HW_ERROR;
+    uint64_t evt[2];
+    uint16_t info = AMDVI_EVENT_COMMAND_HW_ERROR;
 
     amdvi_encode_event(evt, 0, addr, info);
     amdvi_log_event(s, evt);
@@ -261,7 +265,7 @@ static void amdvi_log_command_error(AMDVIState *s, hwaddr addr)
 static void amdvi_log_illegalcom_error(AMDVIState *s, uint16_t info,
                                        hwaddr addr)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_ILLEGAL_COMMAND_ERROR;
     amdvi_encode_event(evt, 0, addr, info);
@@ -276,7 +280,7 @@ static void amdvi_log_illegalcom_error(AMDVIState *s, uint16_t info,
 static void amdvi_log_illegaldevtab_error(AMDVIState *s, uint16_t devid,
                                           hwaddr addr, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_ILLEGAL_DEVTAB_ENTRY;
     amdvi_encode_event(evt, devid, addr, info);
@@ -288,7 +292,7 @@ static void amdvi_log_illegaldevtab_error(AMDVIState *s, uint16_t devid,
 static void amdvi_log_pagetab_error(AMDVIState *s, uint16_t devid,
                                     hwaddr addr, uint16_t info)
 {
-    uint64_t evt[4];
+    uint64_t evt[2];
 
     info |= AMDVI_EVENT_PAGE_TAB_HW_ERROR;
     amdvi_encode_event(evt, devid, addr, info);
-- 
MST


