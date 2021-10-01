Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B92341F448
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 20:02:56 +0200 (CEST)
Received: from localhost ([::1]:59936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMs3-0005M4-1m
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 14:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUG-0000XP-1G
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:22 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUD-0000jC-7P
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:19 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso7288599wme.0
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ezcbvk/+kLD6i+tf1SI+n2SWS5P4d5inXJz75DvTmhM=;
 b=ybZ9ULUbYc9FQ/tepxzqHXkP07aCwVxeouYzulmVK3/AMQ1oqtjSM4CziQ5LM+xCFo
 +2nVqlfhP9Ktj4iIv1I4iqBuB5AKLNt0WsMLcZKl9DwENLZCxER4X97euLpjomDwX+Xo
 XAR6iU6RQhAsBGeK3YHa1ku0KCDFPei5+X7mvlP3nV1aQG0GASk/2sY+YWVZsOgW9iTB
 RSMvJWQCtcDPqMmrNFnOnk+PmiYlznL7J1+xvEBepKnsV15TRW7z7gP7Movy9hfjNSOR
 4cGs88bLTehDlLwrJsX59A/WhzwAkTTMHKBC39dS2D0QteV8GfVYYLJonVvhEoksD4ZB
 UvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ezcbvk/+kLD6i+tf1SI+n2SWS5P4d5inXJz75DvTmhM=;
 b=gVRJ5mACik3mr0I60B+DixSoxb76qa7Y+JNK7r39MlMmFyW3L6edI65gSb4Jo2io20
 bjaRDwajR0nf5kD/VcAa7Va/B7Fk1eFA92LGhckQUS75YAx2BatohUx99XKakdTUmkoC
 CZTqLkS9PTNkmJnwArnfPxfEtfLYYyV0kHklY+lAJn8EkZouO+lbOnJxcLZNzxtM78q1
 et93fLPY5U8RV9RHFdYvfIVH5y4CyCeuLVAFl3UB3kSAs8IqyAN4H1mwrhcoUeF7dSyF
 1MQA19/Bc69DjHq3v1/q0csvNCzOrBls9uwSc/ySxmi15JJmifIccTS21GCztugXGXI3
 9tmw==
X-Gm-Message-State: AOAM532S/EvgtdZNan+F5Qup1GRImBoPPG2Fts5LhDsIkstryvdRjPGy
 lzMCqlJZviQA/HAUgAJVrRWQPw==
X-Google-Smtp-Source: ABdhPJy8He/O+mO6L3RXYlWzWb0oPE7IRFLlcF/1w3sD9hqt12yXuufVh0XDo46/OP6+MnjZhsNowA==
X-Received: by 2002:a1c:1d92:: with SMTP id d140mr6071526wmd.17.1633109895826; 
 Fri, 01 Oct 2021 10:38:15 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:15 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 05/11] hw/arm/virt: Use object_property_set instead of
 qdev_prop_set
Date: Fri,  1 Oct 2021 18:33:53 +0100
Message-Id: <20211001173358.863017-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To propagate errors to the caller of the pre_plug callback, use the
object_poperty_set*() functions directly instead of the qdev_prop_set*()
helpers.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 36f0261ef4..ac307b6030 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2465,8 +2465,9 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
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
2.33.0


