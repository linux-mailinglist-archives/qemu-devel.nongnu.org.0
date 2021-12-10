Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B24706D5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 18:16:14 +0100 (CET)
Received: from localhost ([::1]:33088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvjVF-0003Xk-K2
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 12:16:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLT-0005qq-GZ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:06:07 -0500
Received: from [2a00:1450:4864:20::52f] (port=38404
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLO-0006Tb-BQ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:06:06 -0500
Received: by mail-ed1-x52f.google.com with SMTP id x10so14586181edd.5
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 09:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9IY62PSTotbT3b2mMDMBqrDCdhq+HRJSuGZ7/M2iISA=;
 b=MlAyKg8SpwxLFbiGzhFsztNym1SLq9kk7t2etxKr34Lx7YrifeLKMg6VzgD0QiHogx
 Gc72utugRJ8cxf9eI6jFMQ5dPdxDHl1ASkEZ+zNWJ+wBXNVrDG6SdhG89OwyVVROfxGj
 GOVndXUBR0WVb0bI0mhfa/yYEXa0IMtwCliHAtxVgrKVFm0URKKgMQoF7Tmc8hPlS7wg
 YshvxE47j4m+XTWvDZj1mEsejKm/IwcQQ4FJX5dMolRl+6awNmlGFs/mmJ+6pttzxbOH
 YX3xGcedxBdXtp787m1QqsV/5SvQojBLjx4NHJHSLuw/1azHORWUM1abrVlJYniiL/4C
 UmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9IY62PSTotbT3b2mMDMBqrDCdhq+HRJSuGZ7/M2iISA=;
 b=D55g6aeLcrPr52LBPdd4AvwsDHUwCrDmUIw8+aR8BNOUQzlpO5WXdHepQ0Mvjoorbf
 dYzy3Xh0Rz56Fp6pG/98cEP76SAv0aU5h0Kmq9lzUXgMLvXHcNzAueVGPW8tB8z4UyzP
 qcuOVVGWT+Waz8WiPWidus92SQWuwHZEgN4mD4OFbDB0NMv8OP5jJq4HrWoMDyrJoZz0
 REFHIHaxIKsUPvDMwSGMzzudppgi+fA3f+I6Z8o7pcAQI8TCtOOBZHDzq24BoUlBQ8iS
 t8N4OQ7KO9R4o1R6m2ZCddwiuZjJvAb4UPD6X2GE72a5o8qb/yzzfiSZ5GcjDtZzC+mP
 48Zw==
X-Gm-Message-State: AOAM533CBbwZt7F3dSJWP2RXd2AA0vwb6J+0J7RdQ0PceY33Zbk29fVa
 NrErmxzcbtiKOS+Q+0Xl1UwFSg==
X-Google-Smtp-Source: ABdhPJzJ/iQo2/6z6TSEaaRnYUwKRUpkP52qKl+EVF7gBie5BE7ctRqHiGaZis7HIsk+KjQBLzJSgA==
X-Received: by 2002:a17:907:160a:: with SMTP id
 hb10mr25801855ejc.83.1639155959337; 
 Fri, 10 Dec 2021 09:05:59 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:05:58 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 4/8] hw/arm/virt: Use object_property_set instead of
 qdev_prop_set
Date: Fri, 10 Dec 2021 17:04:12 +0000
Message-Id: <20211210170415.583179-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: ani@anisinha.ca, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To propagate errors to the caller of the pre_plug callback, use the
object_poperty_set*() functions directly instead of the qdev_prop_set*()
helpers.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 608a0a78f0..6b51e8ad10 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2518,8 +2518,9 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
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
2.34.1


