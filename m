Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6F3528380
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:48:47 +0200 (CEST)
Received: from localhost ([::1]:34998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZDS-0002ni-9r
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7f-0008W6-27
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7d-0005W8-He
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KkHFCCAQZCxLhXASgQO3md5ERE8E9QGhI2Gkkwoba2E=;
 b=DMllq2KFMlNETOCS99atOQce7MXk7YLSMnUB0436Wmp+vvwIuwtpKjMoZeMc2CJil2k1BZ
 aw0YsrIP3noZsNEmInGulbu7BpeXuuXOOeQU780YK9phqW9SfoFaLGr3CKVWZhRedans0S
 qbnC/He6rrOk6NYqFq9/UZqXsjD9NFs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-1p8TDejKObyXtAhduJ7cWQ-1; Mon, 16 May 2022 06:38:40 -0400
X-MC-Unique: 1p8TDejKObyXtAhduJ7cWQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so6567773wmr.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KkHFCCAQZCxLhXASgQO3md5ERE8E9QGhI2Gkkwoba2E=;
 b=fB2qkeYfrdFkDd5HPtgdjMN4PfQAC8MDfxbLkJP7KrFDZRIiJ/JpU1ysNcn4TFkzui
 xpCAB0DLwtNKD9mlaRYW/QE9lEZdAZWSLeWYAsf7aTYIMi9Mc901hleiiDHkatpV1yxh
 KeOOx1ENBcxL9Ts2Rh+cB0AbgHG35V4RZNJuuWC9PwP6r6hGcGqotan027NBXMVPn7d5
 QURaf5NfiiUFAeeKLymTCmL+BnTzLoF9H3A5WanpdbnPzWDYi7qWyyhVyuxOWX5Z0Mmw
 0SEJy1/4hBB/Wh027cPlXlI+09VuS/Px/a8N0WdL41bQTc0fQfpTg0a/DvPgVI5mo0Ms
 AKZg==
X-Gm-Message-State: AOAM5320CMPy17doBh6YdKt3Vi2fCn32KtdOBE1UL11WLUnA2Y6iMwgo
 BTlIaXHNoc5SgseTi3F37AtbnfelmhubSreTB3e5Xyol/1EM7GKcmvHp7/iS0qXZh2+FWb+Ifm4
 P8vxg2bkZlZuRSihhmq+OviDLr1Zm6PxTi4Ej8VznrW2xbSWMeMVUBJHmeaxY
X-Received: by 2002:adf:e605:0:b0:20d:889:ec5a with SMTP id
 p5-20020adfe605000000b0020d0889ec5amr3731775wrm.429.1652697518577; 
 Mon, 16 May 2022 03:38:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziBhrMEujkytnoYYAe3OmPfj6c4YXBLL0wl5paCkbJraSUnTPenrRISU5R33rhLB2Eko/Bng==
X-Received: by 2002:adf:e605:0:b0:20d:889:ec5a with SMTP id
 p5-20020adfe605000000b0020d0889ec5amr3731751wrm.429.1652697518254; 
 Mon, 16 May 2022 03:38:38 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 x10-20020adfbb4a000000b0020d0435c97bsm4471915wrg.92.2022.05.16.03.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:37 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 51/91] intel_iommu: Only allow interrupt remapping to be
 enabled if it's supported
Message-ID: <20220516095448.507876-52-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
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

From: David Woodhouse <dwmw@amazon.co.uk>

We should probably check if we were meant to be exposing IR, before
letting the guest turn the IRE bit on.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220314142544.150555-3-dwmw2@infradead.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index b22376a45d..d3361c8313 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2209,6 +2209,7 @@ static void vtd_handle_gcmd_ire(IntelIOMMUState *s, bool en)
 /* Handle write to Global Command Register */
 static void vtd_handle_gcmd_write(IntelIOMMUState *s)
 {
+    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
     uint32_t status = vtd_get_long_raw(s, DMAR_GSTS_REG);
     uint32_t val = vtd_get_long_raw(s, DMAR_GCMD_REG);
     uint32_t changed = status ^ val;
@@ -2230,7 +2231,8 @@ static void vtd_handle_gcmd_write(IntelIOMMUState *s)
         /* Set/update the interrupt remapping root-table pointer */
         vtd_handle_gcmd_sirtp(s);
     }
-    if (changed & VTD_GCMD_IRE) {
+    if ((changed & VTD_GCMD_IRE) &&
+        x86_iommu_ir_supported(x86_iommu)) {
         /* Interrupt remap enable/disable */
         vtd_handle_gcmd_ire(s, val & VTD_GCMD_IRE);
     }
-- 
MST


