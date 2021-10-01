Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7719141F398
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:49:00 +0200 (CEST)
Received: from localhost ([::1]:48158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMeZ-0003KV-G6
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUE-0000Wo-HU
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUC-0000hw-5a
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:18 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s21so16615739wra.7
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CgVISSWaN/wiEKluLdhbyhIaueQoVjOwu4O8mNNqFLk=;
 b=Y6Q+t6MKOupG582+reuc5UPxwBsVyf25MkKQUoLCFrkGWudOXnvCtR30OFL50DDPUu
 MpqrIq1GeDQBBd2phZcKNJ3oin/19hraall6lX+12dNZFD10YDNVw2yqwAu9NXdGEcdv
 B4xjkDyAz2HDqEh9zesYLl7VDq4QJIbSvWFx4VJrwfAWTgWXpSTqpNtGm+Qc/BZJKtiZ
 R4PLK1fFmjPzwZZ0abasNbBVJTtkk1IGgat9ikqoegAbtw9/BHD4Tn9s2Mk8t1Ct16bq
 BCwOyEQ5BRRaKDB8XeHU0RvfW0lw86TwuoP6VHbi8MCt6sWcQm+MXDXjqK2PytFMLRGb
 LbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CgVISSWaN/wiEKluLdhbyhIaueQoVjOwu4O8mNNqFLk=;
 b=oCgK/TcaHFeCBESwkLGDv6H2Ec/YZiEOqlObqXmABFSKVD/e/2GjcwTAj86y/VWOfD
 Erv35iYZEeX8sX5MsEW8cFjOl10B7f5uMcpU1I1y3NJLhZkuki4S3GBZ10UwaonaIRKV
 K2uYLaetsKhZHUqsrat8gdEn6iD6mcZpDslGJ5rpvnxb+0CNGTacnaWHj+bbEXMMKH0k
 jJX/NogOocL8aLDPmfr7ewWB9ZVWIL7m/ItsHaT3d9BG8nULbTLJikrMgB6gMKhZMcow
 7GbMHGSJe9+hJYj8yMOSwKIrOVoMW0Wqu6pcm9sBL9khFuNjXwg1OK4FBpw8oRiXt6UA
 YZ7A==
X-Gm-Message-State: AOAM531q/MelKxm4dQuRMBzxOShm+YyP/gI49yrZ25x+AR7y8IcFiJYY
 Z5TeWEOKfZWMU6OGYzgEjAc3Kg==
X-Google-Smtp-Source: ABdhPJyZ+ZEtSV/8vecOOl0hnmdlwg5u+rvfGw8RiMnOZe4TBa3j6FZfqqETrW/vFiLWvXUD/IQc/g==
X-Received: by 2002:adf:eb47:: with SMTP id u7mr14237850wrn.333.1633109894816; 
 Fri, 01 Oct 2021 10:38:14 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:14 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 04/11] hw/arm/virt: Reject instantiation of multiple IOMMUs
Date: Fri,  1 Oct 2021 18:33:52 +0100
Message-Id: <20211001173358.863017-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
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

We do not support instantiating multiple IOMMUs. Before adding a
virtio-iommu, check that no other IOMMU is present. This will detect
both "iommu=smmuv3" machine parameter and another virtio-iommu instance.

Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 56e8fc7059..36f0261ef4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2441,6 +2441,11 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
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
2.33.0


