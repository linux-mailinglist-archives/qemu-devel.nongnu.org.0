Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D249E4E1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:44:07 +0100 (CET)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD60M-0007fD-MR
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:44:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nD5se-0005Iq-TB
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:36:08 -0500
Received: from [2a00:1450:4864:20::332] (port=55817
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nD5sZ-0005bk-F6
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:36:08 -0500
Received: by mail-wm1-x332.google.com with SMTP id r7so2077523wmq.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 06:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2zSKrSp6a5EAi6fIn7FE1Se7TLsdnk4XPoD/ijRomuk=;
 b=Zbh8abxC9MXMq9rlUIQu1YoRSG0l+W93JnGNGfW+FyQDbU+Jy+s9uiqjmDE4JY1ajj
 dSMTgwAjkdSvpKcY2o+LqMf3okZM8IwU270YWBZn+ajASrO5FLtaWKx8Itb9r0tHHXLm
 i6wtNRrQCSMAiFZEHV7Mr/Hcn/4UWaL4SfwELMbmQFIQtSuKNACndiH28MBDUk5PvO2g
 Pof87unTvShk3OOzxys4EDFN/CacKalaPUmK89l853lzzHK1MEfuKzQ2sg7BPXHTsu3U
 u4mMT63MEvvNSZ6aORjFysbOujXaIBj02bZR2CWutHi4csA6d7v/HBaFBbpChrIvOccJ
 ZpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2zSKrSp6a5EAi6fIn7FE1Se7TLsdnk4XPoD/ijRomuk=;
 b=VCrisc4iqd5HVh1OQ6VY5HzFKPB/+RKl7Q2T0/bcjdEaWvRuJpNukMTlgsGQQcrcgP
 MRLefoLBFEcVB3HSHJU3L7De+f5FUpsS6N6VPj/VjYuGR8OKxMktIeD8fEL3e15QDIWh
 eDcQ7HKiFDUeIlvKjNmkXlaOet7hakTxsHAXPDtkxBZAprzRD7N7vMQedPxNVJlpS6wD
 3UPynU12M+XKs6N4ldeOlW/mnh6Wwbt3415tmrw8zhlA2MG4oXvDd51lD5Oe+aV2/xAQ
 K/UfKhwrklkn9Vc1nN2S+TDC3pHYtD/50aXmXeB12blpZ9w03myn67wEFjHaOhJcA6eP
 VKFg==
X-Gm-Message-State: AOAM5313/04xLFZ9bJsaMSYh+s1ep0DuETbMnNIL8v+V1RD1h+nPLV/j
 jPeSf5UnpzX8jfd4tSb/aT433A==
X-Google-Smtp-Source: ABdhPJwNtof78MrIiMOhDyzpatOuY6ObKAqIfhUHzXdN9tYBAman3hSADHLM3nRuI2BaLWT5D4At0w==
X-Received: by 2002:a05:600c:3848:: with SMTP id
 s8mr3515240wmr.151.1643294159895; 
 Thu, 27 Jan 2022 06:35:59 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id i3sm2285894wru.33.2022.01.27.06.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 06:35:59 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 4/4] tests/qtest/virtio-iommu-test: Check bypass config
Date: Thu, 27 Jan 2022 14:29:41 +0000
Message-Id: <20220127142940.671333-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127142940.671333-1-jean-philippe@linaro.org>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 thuth@redhat.com, mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bypass config field should be initialized to 1 by default.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/virtio-iommu-test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-test.c
index 47e68388a0..068e7a9e6c 100644
--- a/tests/qtest/virtio-iommu-test.c
+++ b/tests/qtest/virtio-iommu-test.c
@@ -31,11 +31,13 @@ static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
     uint64_t input_range_end = qvirtio_config_readq(dev, 16);
     uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
     uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
+    uint8_t bypass = qvirtio_config_readb(dev, 36);
 
     g_assert_cmpint(input_range_start, ==, 0);
     g_assert_cmphex(input_range_end, ==, UINT64_MAX);
     g_assert_cmpint(domain_range_start, ==, 0);
     g_assert_cmpint(domain_range_end, ==, UINT32_MAX);
+    g_assert_cmpint(bypass, ==, 1);
 }
 
 static int read_tail_status(struct virtio_iommu_req_tail *buffer)
-- 
2.34.1


