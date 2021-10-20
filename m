Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A705443518E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:43:31 +0200 (CEST)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFcf-0006EW-1P
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUb-0005FL-HG
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:09 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUZ-0002eu-P7
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:09 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 g79-20020a1c2052000000b00323023159e1so3419162wmg.2
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MQaHeRwjBXtlwH+HWJdlO988bBQFl1PSkeW02oBI2yE=;
 b=cnvSmzp5Q5I2fhVe8VKQflUG8EBRmB7TnGd+GGy+RlewS6eQFKzYmUXNbh4AxF91Hp
 5UT4MA6u6aC7nkqjsvkvVZemBaagF26NqnCjPBjsnNGF8r/7pW1nsfFgaf39t0yOINr/
 /k7kMl85EU0lV2wE5s1SeQPesy5JbtnJ2GNmNAZqRCtji+ISFur4/0jdltyQyIU+JKfO
 H9aUWbvrQXYetFarD+02xCWEPRHy+z/CqFkjrylyC34oDIfc8G8Lt0ZfKa2l2kdeqCRd
 MLpM3TOnP/8GlM1677chK4nA0pvLSZlJlnyg3TP2LZQlRebKK4vN4cPdzj4NOD1BtT5O
 pVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MQaHeRwjBXtlwH+HWJdlO988bBQFl1PSkeW02oBI2yE=;
 b=PPflgwACaTAjV0Rr+BlPr+bSQJuq9sXj9HgQc4ukBmguQ8lMmoUxyXaCylcK05r1Em
 RcqOS4JCmfO80CGGPpLZ1oryHbN4ZmtYpvuUDE5g9JFf0ARAAupK0E8suaUSgdrvbIZT
 DxeLe+RtgfqBiyC9a1C8ikT1nvTH7ptqovEYk0mq1GLv7Pbd7ZmqfxXXLqqLV9z3nado
 Jc+Xa3sFsPFbAlXnFjsHXSbKpSvqHPTJFzzk0tXlEVZxDFUcwXV6SmRswgJC8zodoEW1
 sBEAQzeuaV1vMbxRpbW2Vl5wzr5tAHUhcpQO/Xq3zOw0Dr95Mz//6M1e0epytYOOpax/
 WZNg==
X-Gm-Message-State: AOAM530y3iO+WEc2SnneIj8KmrEC9SrWMELjMBwij40KJ0AhFmrvHsFf
 J1/31i+/yq5Q1e26goZbsZyXWA==
X-Google-Smtp-Source: ABdhPJxm3Uhw+C2nSYxFqgaSbTORrUw6CaZ7dvF70PKDj59IA5O9/8vviPl7gRx+3eEl7snZZVbMNA==
X-Received: by 2002:a05:600c:1d19:: with SMTP id
 l25mr671862wms.119.1634751306327; 
 Wed, 20 Oct 2021 10:35:06 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:35:05 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 08/12] hw/arm/virt: Use object_property_set instead of
 qdev_prop_set
Date: Wed, 20 Oct 2021 18:27:42 +0100
Message-Id: <20211020172745.620101-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020172745.620101-1-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
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
index 25db8d4262..7a061ab401 100644
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


