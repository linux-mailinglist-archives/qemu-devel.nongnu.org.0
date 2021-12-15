Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746BE475807
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:41:26 +0100 (CET)
Received: from localhost ([::1]:60338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSez-0001pI-K0
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:41:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRij-0007NL-RK
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:13 -0500
Received: from [2a00:1450:4864:20::42a] (port=46871
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRie-0000Hp-5E
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:12 -0500
Received: by mail-wr1-x42a.google.com with SMTP id i22so7569213wrb.13
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sNNQW6d9QcHylqNB7F7ihK/G2DuCR/LnfVagA5pSg9U=;
 b=gkIH1z9D9MU8jcSNsZQ+Xsm2DZBzXkmb3Ifx/q+sToljimUiVs5zZkEBJPsQsx7YOV
 4gVMHDaHjwZS13k+3zf2Tf3B+xa3eUbG45LVVpI0wHOai9A8cpfkyJ7+Fg92l1ICNajc
 6Kv0REoQ07bd1E8uyrp/4JaK6oVyMzgPgOMOOMSVZ0V7eyABnPOePekzy7mKcz9eJtOR
 c1CugnY8GogD+2JQevTLqbkP3C4mRVFC0ppHnYOaWyGKQhhK78URQjO/7Wbg6zr84ONt
 ABGMRkvZtADEMTHpY+/X9259vx7yePTb5HuaVPiOMQHIAIB+69tsIun0V432rhcFmAiM
 Ujew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sNNQW6d9QcHylqNB7F7ihK/G2DuCR/LnfVagA5pSg9U=;
 b=o/+ObHyTROM5Mq7zw83hCzxgun7SBbjXjXHmCsxJL0VcrEPt67k9BHWK/Q1KGy6akj
 DGzPhtRjQvULmsbgACvH1oSQWWz3VRRCXiUHkHtnf80ykPRVRgZb48RvpvOpxHC0WHGN
 WA5I1Wzzc4XkxCfzgcdHhX1rWn9tNSCMyod9oJyPUX/o3GAskSBFwt6Sqi8O3Kwi7nFo
 ZeegdZNuMPtNW3YtTD586To4ZHONoFctkjUQJkGWzOPpn1q+MyiPPQgfhFYX2+29MNKS
 5JBqe1irJJbg2tRrIleTUw7NlVFhqHAAMArEW9b6UwCav1Fb/+b5o0MifUSI1km5iJa+
 ETgw==
X-Gm-Message-State: AOAM531kuthcXjcbKz275qjkzU99ujnYc8UTwY7GjNcFmJ5rIgfTKxnH
 2hv2aejpsDErPyjUc0YcTmEWi+OOO/i2ZQ==
X-Google-Smtp-Source: ABdhPJx91QYJo59lufvcAB+Jvy2MjyQ9THoDbBUViHxPwcEiMWtKvYI665uNqGGXMVkafwwF0kQFYQ==
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr3678166wry.441.1639564866923; 
 Wed, 15 Dec 2021 02:41:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/33] hw/arm/virt: Use object_property_set instead of
 qdev_prop_set
Date: Wed, 15 Dec 2021 10:40:45 +0000
Message-Id: <20211215104049.2030475-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

To propagate errors to the caller of the pre_plug callback, use the
object_poperty_set*() functions directly instead of the qdev_prop_set*()
helpers.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-id: 20211210170415.583179-5-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 41c9808a3fd..6bce595aba2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2517,8 +2517,9 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                         db_start, db_end,
                                         VIRTIO_IOMMU_RESV_MEM_T_MSI);
 
-        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
-        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
+        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
+        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
+                                resv_prop_str, errp);
         g_free(resv_prop_str);
     }
 }
-- 
2.25.1


