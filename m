Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5A55462B8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:48:12 +0200 (CEST)
Received: from localhost ([::1]:57222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzbFT-00070N-7g
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYC-00029h-2V
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZYA-0006R4-Dr
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bpnbN543AcE2EomsO+62PxMhfcQHo0eUqiRvrbZfeFY=;
 b=Z9yXRJog7YVd7siINCBCvUnI5nmuP5InEtlE8ghKWW1v9F2K8u2iKOBa4Srfmwu4EZhxJ0
 EqGPrslpDA85lFyhK+v25MkC7YHRutmbSL3iePxcVB9cKyNQ3TL7fnfeiC6y6UTndjE5lC
 2T3cI3ym/o8WiZbiz8Z2+zStBbB2nsM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-qbaX72CFMFS5oJuntdLC8g-1; Fri, 10 Jun 2022 03:59:20 -0400
X-MC-Unique: qbaX72CFMFS5oJuntdLC8g-1
Received: by mail-wm1-f70.google.com with SMTP id
 be12-20020a05600c1e8c00b0039c506b52a4so1222965wmb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bpnbN543AcE2EomsO+62PxMhfcQHo0eUqiRvrbZfeFY=;
 b=UCuuwtCTHYsxkUMQKSAmzIYwv9qHXACLL3V27WtFzzvhtmzVNeYOrnOJTpde3c6UOv
 ZZ6CoPlNlkALElIj3l+bdekKsY2NENCVzx6PAwlQ8SpGHNKUhOUb3rMSyU/ILN6ac1LP
 CMAAHVVapELJzSCWZeZ/REZFDATPsznbEhp9U8apQpm+AJ+1SoJYw53tTs5IczyMFKUB
 sBujzuRdzfxk8hVVMG2rD8sLWXY1TSKDu048zeD1BgYX7n8uFno3/zn1XdY3MGynkBAA
 x1r8izMcJpmIkNe6HgLKTv1SBtB/MiQfSlsJfCfda07OneD4TrrW5yilo+xbCdFXEOHo
 Ee4w==
X-Gm-Message-State: AOAM532QzYDJ7Idth7wnQVJNUDAY8dl6A75nxmxTt7ecg+74XKIV/73n
 IKsIUP4S1lu6O+F+vGq3wf9FM114atvBh81/YGlOlsLq2drq8RS66K9RyyvgdqOSgrJIsyI6vro
 nuL2jVzUqmuXSHHT+KmW1Qq7d3dHidjreSF3xu3RAUAt08wrsjyMlKKtoOp8g
X-Received: by 2002:a05:600c:2d94:b0:39c:7cb9:5f1d with SMTP id
 i20-20020a05600c2d9400b0039c7cb95f1dmr2277993wmg.26.1654847959103; 
 Fri, 10 Jun 2022 00:59:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJN+mevoR0Jc8Mn6kOgssEu+bRbpHOmBQizMBX8Ved+qhp6KOQ8KAoFWMV8yaDkAIsoP+GRg==
X-Received: by 2002:a05:600c:2d94:b0:39c:7cb9:5f1d with SMTP id
 i20-20020a05600c2d9400b0039c7cb95f1dmr2277964wmg.26.1654847958770; 
 Fri, 10 Jun 2022 00:59:18 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 u2-20020a7bcb02000000b0039c5cecf206sm2033600wmj.4.2022.06.10.00.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:59:18 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:59:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben@bwidawsk.net>, Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 45/54] hw/cxl: Fix missing write mask for HDM decoder target
 list registers
Message-ID: <20220610075631.367501-46-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Without being able to write these registers, no interleaving is possible.
More refined checks of HDM register state on commit to follow.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
Message-Id: <20220608130804.25795-1-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-component-utils.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index 7985c9bfca..3edd303a33 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -154,7 +154,8 @@ static void ras_init_common(uint32_t *reg_state, uint32_t *write_msk)
     reg_state[R_CXL_RAS_ERR_CAP_CTRL] = 0x00;
 }
 
-static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk)
+static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk,
+                            enum reg_type type)
 {
     int decoder_count = 1;
     int i;
@@ -174,6 +175,14 @@ static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk)
         write_msk[R_CXL_HDM_DECODER0_SIZE_LO + i * 0x20] = 0xf0000000;
         write_msk[R_CXL_HDM_DECODER0_SIZE_HI + i * 0x20] = 0xffffffff;
         write_msk[R_CXL_HDM_DECODER0_CTRL + i * 0x20] = 0x13ff;
+        if (type == CXL2_DEVICE ||
+            type == CXL2_TYPE3_DEVICE ||
+            type == CXL2_LOGICAL_DEVICE) {
+            write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_LO + i * 0x20] = 0xf0000000;
+        } else {
+            write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_LO + i * 0x20] = 0xffffffff;
+        }
+        write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_HI + i * 0x20] = 0xffffffff;
     }
 }
 
@@ -239,7 +248,7 @@ void cxl_component_register_init_common(uint32_t *reg_state, uint32_t *write_msk
     }
 
     init_cap_reg(HDM, 5, 1);
-    hdm_init_common(reg_state, write_msk);
+    hdm_init_common(reg_state, write_msk, type);
 
     if (caps < 5) {
         return;
-- 
MST


