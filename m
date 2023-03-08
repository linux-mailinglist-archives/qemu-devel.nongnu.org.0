Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6076AFC0C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:17:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNo-0004NJ-IV; Tue, 07 Mar 2023 20:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNm-0004N2-JO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNl-00023K-4b
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tzdleBV3ydVretX/x8wf3hLhlAqIVmJyGtJ2OmsiBtw=;
 b=Ck/JwFGsIU4swltFKxJLEI+1lMR2BkoBnuT55rnn85WWwjVp35YnccE7pp39DGxncuMTPs
 obLmKzCfcmlsjwuN34iObkixUn/bjJB5sTWh8bz7Yu5fEvtic4o1IBywWFqIH/o3lykNpJ
 HGFK41xmJldP3hF9MOtM5bBDLgMotyU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-lxrfCHXJMamVryQ2kYbjTA-1; Tue, 07 Mar 2023 20:14:15 -0500
X-MC-Unique: lxrfCHXJMamVryQ2kYbjTA-1
Received: by mail-ed1-f71.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so21657713edb.21
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238053;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tzdleBV3ydVretX/x8wf3hLhlAqIVmJyGtJ2OmsiBtw=;
 b=B1LW3c0XxoZhMkKnB0HBSVHaEdZU89TaIrn9zklj7of4KIjvJvMF2LusIBeR/lhM99
 +QkiXREVwWhERNJgDIK1Mxwc+wEJ7CAbhJxqnvkNVm2WUVxJvwBh+RjIUJihDXd1ogmn
 PJ7QmHcsXXifL7mqHos0negSlTvT7G8Xhxlgrqxe2Gd8O3f1i+bmjLi0gGYjg7vVkis1
 R/lA5vBLqSRzz3zXSuvYu+ftlNAezY3SxUmFCIjyMXkb0jHi1ex7xwRxEAKmzc0di/DE
 QknV8EkHaPvpAKlQryHhgad2LOu33C9Zm4TtGexbm31+2j4RgtJSVHHznTztd9dwGUt8
 YgGw==
X-Gm-Message-State: AO0yUKXR7kSL0DK7Zkv4hnG+mBhZEV2bH63ADweiWg+S9rk5P9b1i9JU
 qsRqE+i8N9LrsWkoaTZKLEnHOM4ZO7BE80+ICvGGXtRo6Ns+9qFS47tQ3v3i1Ers4xBPuh3J8Br
 NTCDz+vdWtnPM7EUvvk08ZIGpczW8Tl3nechmd3KPsau4SEgGxrFJGcq6mQy6by0tskt5
X-Received: by 2002:a17:907:9a99:b0:918:668d:d6f9 with SMTP id
 km25-20020a1709079a9900b00918668dd6f9mr2356400ejc.16.1678238053764; 
 Tue, 07 Mar 2023 17:14:13 -0800 (PST)
X-Google-Smtp-Source: AK7set97JfDyG04FSmZCG3ZbrahM9m35IUMnN7//wOEPSBUCUzJyA6MQzOD8MjRcwPbehVKQCs+O1g==
X-Received: by 2002:a17:907:9a99:b0:918:668d:d6f9 with SMTP id
 km25-20020a1709079a9900b00918668dd6f9mr2356381ejc.16.1678238053512; 
 Tue, 07 Mar 2023 17:14:13 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 y7-20020a170906470700b008ef13127b5fsm6782613ejq.29.2023.03.07.17.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:14:13 -0800 (PST)
Date: Tue, 7 Mar 2023 20:14:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fan Ni <fan.ni@samsung.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 67/73] hw/pci/aer: Make PCIE AER error injection facility
 available for other emulation to use.
Message-ID: <4a295211f7d76d092bf0abcbee6891e8f053f6b8.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This infrastructure will be reused for CXL RAS error injection
in patches that follow.

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230302133709.30373-8-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
---
 hw/pci/pci-internal.h     | 1 -
 include/hw/pci/pcie_aer.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pci-internal.h b/hw/pci/pci-internal.h
index 2ea356bdf5..a7d6d8a732 100644
--- a/hw/pci/pci-internal.h
+++ b/hw/pci/pci-internal.h
@@ -20,6 +20,5 @@ void pcibus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 
 int pcie_aer_parse_error_string(const char *error_name,
                                 uint32_t *status, bool *correctable);
-int pcie_aer_inject_error(PCIDevice *dev, const PCIEAERErr *err);
 
 #endif
diff --git a/include/hw/pci/pcie_aer.h b/include/hw/pci/pcie_aer.h
index 65e71d98fe..1234fdc4e2 100644
--- a/include/hw/pci/pcie_aer.h
+++ b/include/hw/pci/pcie_aer.h
@@ -100,4 +100,5 @@ void pcie_aer_root_write_config(PCIDevice *dev,
                                 uint32_t addr, uint32_t val, int len,
                                 uint32_t root_cmd_prev);
 
+int pcie_aer_inject_error(PCIDevice *dev, const PCIEAERErr *err);
 #endif /* QEMU_PCIE_AER_H */
-- 
MST


