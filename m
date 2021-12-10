Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E667A4706C2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 18:13:44 +0100 (CET)
Received: from localhost ([::1]:56872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvjSp-0000X6-Vb
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 12:13:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLT-0005qP-BF
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:06:07 -0500
Received: from [2a00:1450:4864:20::529] (port=38910
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLN-0006Sx-UZ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:06:03 -0500
Received: by mail-ed1-x529.google.com with SMTP id x10so14586064edd.5
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 09:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eT4rNPLFVR6cVRrKRWEc6vQ7I4D2oIIXC1EjnaeFLfw=;
 b=m6VTRGLIYPWf6T4kpr0Z9k52Xt/DXBOo27KioYt4qyJ+8XLPC1xYpJi32ElZv2Zvky
 v5eJPMl+NbMVg55KCd851NYpmsWNLXyJvXZ4SQ4uuoGEGYcO1idzPZxi1zPzi/JXadiZ
 pMbek/sDtyaLMX+nTl9qwHDo4f4n1uPPsmWN2OJM2j6BnNJYO3TG6brfeIgZvIcbfa9u
 1+omUoyqxk4n8LLOkaGxxxGdUr2l/v6BuwTnvhy+Bqfyy/VQsJeFjoBsmNLhyj9Qd6mX
 L95xU0N1YzOVoNsVo0gl6QrhDBLeaxQfsSeuapbnFnfmuDJF1dVbSNoZeeO1Mb4C9yQc
 TJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eT4rNPLFVR6cVRrKRWEc6vQ7I4D2oIIXC1EjnaeFLfw=;
 b=rjKPJp4hwEg0/ZLkhmat7PkxC6aYPdpuONvDcV6xERWY40xYYgJ3fChBdX6yHd0qY4
 uhv79Ji9EZqBv7RWw2YAPk3UpZ5vyZIe4l9qDpD7pHeQwOfqQ3zNAbsAKsToMiFN+KaH
 jY54s0u+QjGRRq+JR4ad3bXx1acQ4W2DSEPfe8ChzRGWWhBFcvApNjdmMYbB018RiXCL
 yEw4hRbQrNw6vf6bYm7IPfjOm0eitSws1juJCDXfQWvNPL7xqFWXpf0bL4gK93fzZM43
 88Bh5okESSFqBfNgjjS6jFtztRCVLfmW4jYVfwDCgW8z7tkcYcJ4IDIDJUgY+dPaNgPw
 Gu+Q==
X-Gm-Message-State: AOAM531rzb+Z86LsqYXiD12t+nTcZ4XcOf1X7CFuvUDd8TlVmjFSGFni
 7caXrxJQp76a8FPrJ3oaHOT6VA==
X-Google-Smtp-Source: ABdhPJyd3H/AuVzujS6OYa7xjfLQ6deVJEjaFpHsjqbtQnapBtKPJZbz9FpFniK/kcBIT1uZC2nlJA==
X-Received: by 2002:a17:906:9253:: with SMTP id
 c19mr26201996ejx.63.1639155958151; 
 Fri, 10 Dec 2021 09:05:58 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:05:57 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 3/8] hw/arm/virt: Reject instantiation of multiple IOMMUs
Date: Fri, 10 Dec 2021 17:04:11 +0000
Message-Id: <20211210170415.583179-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x529.google.com
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

We do not support instantiating multiple IOMMUs. Before adding a
virtio-iommu, check that no other IOMMU is present. This will detect
both "iommu=smmuv3" machine parameter and another virtio-iommu instance.

Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 53941e4aac..608a0a78f0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2494,6 +2494,11 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         hwaddr db_start = 0, db_end = 0;
         char *resv_prop_str;
 
+        if (vms->iommu != VIRT_IOMMU_NONE) {
+            error_setg(errp, "virt machine does not support multiple IOMMUs");
+            return;
+        }
+
         switch (vms->msi_controller) {
         case VIRT_MSI_CTRL_NONE:
             return;
-- 
2.34.1


