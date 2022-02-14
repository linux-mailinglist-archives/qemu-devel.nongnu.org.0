Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0884B5230
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:54:21 +0100 (CET)
Received: from localhost ([::1]:48440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbo4-0005eX-GQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:54:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nJarb-0001rf-BO
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:53:55 -0500
Received: from [2a00:1450:4864:20::531] (port=33355
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nJarZ-0006sa-9W
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:53:54 -0500
Received: by mail-ed1-x531.google.com with SMTP id b13so26994692edn.0
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4brhjN3/9PYkC5fIn6cy6NSoFzEeYleDxTc63BTv37E=;
 b=fFVA8EfwE1BSTPs8uLwrX0VpTgzex3BeVZEEankjky8KTSjrUgjLfvnqfQEfNfGbRb
 2vGbP5PDVu4hCkA9XEBQj4YCctLdGo2JqLuccBa6r09tNwevIrEErEjg+5sVBczIawWM
 lBoiRmc8tam/JJkK0SijO/ts361+yDAeBLQm99BIbtV+2twjvaxYY18og5DW/mCxplEh
 7cPRbp05nE5PkpZeFbfB8QTCVBx9WKiPNAb6CjNz3wkTbySzIzBcET50lofFoooEh4Zn
 h9x9KyWSk927yfagYAXoNgjuuve6r8NsKZdstd+yw8TIfMsqj4XfcaCcan00NCgjTCpU
 AwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4brhjN3/9PYkC5fIn6cy6NSoFzEeYleDxTc63BTv37E=;
 b=PjImeBa5R/ni/v/BSNZzERYZGmZF1Xpha8ub8fvPg7aA+j8Xqe0WL2hzGqwn7l5XhG
 24AIqL2f0575Ojk3ZVvykSgX4C2ZbBb51nLxz9U3ydrKsItSDjvQYTaxSc+UkgpCiX2J
 t9At/jyccqeQe+tcvxRlIQCIh2Q1qajfwwFNxqCafQ174p5GRzwkrR3XbHFoyCJMVUqU
 trvyt5vhkewO1aKozBcp4WaQt0JriTHvS9G1AI1WDX9pmWo0KtlQw6QvzTjWmisxUVKJ
 ypesdz/cy3QS/n5Z2Efjk7pRGq3Sc7M4ZiogI188ecjnib+LpctVL4kzPX/7imLYPjPp
 s04A==
X-Gm-Message-State: AOAM5315FyUO6OCTALt/WDunVH4pk7zYVtWOmySwbr4NR7ps6E2NUPt+
 rUvtX2AHgyEe4dpyq7DaWP9o9bcbcFoH5g==
X-Google-Smtp-Source: ABdhPJwFaH8cnKSjo2SKIh44VAl0ns0MbYPeXuwvPlekqxOrB9toG4j4TSMOTV2ZCVBZgNmhUmKYhA==
X-Received: by 2002:a17:906:729d:: with SMTP id
 b29mr8371392ejl.471.1644842858748; 
 Mon, 14 Feb 2022 04:47:38 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id kq17sm1475422ejb.205.2022.02.14.04.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 04:47:38 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 4/4] tests/qtest/virtio-iommu-test: Check bypass config
Date: Mon, 14 Feb 2022 12:43:56 +0000
Message-Id: <20220214124356.872985-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214124356.872985-1-jean-philippe@linaro.org>
References: <20220214124356.872985-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 dgilbert@redhat.com, pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bypass config field should be initialized to 1 by default.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
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
2.35.1


