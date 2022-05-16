Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E385652832C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:26:09 +0200 (CEST)
Received: from localhost ([::1]:55704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYrY-0001PJ-NY
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6e-0007GI-T8
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6d-0005P1-4q
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+TWCmXemeOOogm+lPN22wWpWb1iaL7PiLt3LTYMSX8=;
 b=WA+xaWta+Qs5WdQq2MrQmGUaNdGy3+WL/sZw0uaxAw/kQ/YNWBrUuAZh8pcT27PteRCZXV
 qk33Q+TEvNQ7CXUZXg06YZNLHtk9T0tHMvNc1ohNPclvoXSJDgd0rFsOabcObjFAu4HEjp
 qij14rnhPRDJSiZF1aItE0lRyIUGuGc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-vJD36-e5NQunyFL-8B-gTQ-1; Mon, 16 May 2022 06:37:37 -0400
X-MC-Unique: vJD36-e5NQunyFL-8B-gTQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 205-20020a1c02d6000000b003928cd3853aso10134150wmc.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=U+TWCmXemeOOogm+lPN22wWpWb1iaL7PiLt3LTYMSX8=;
 b=zWzxVQ0V0Fl6vCGVvAC1s1qF04PPCseNzEzcz+8oLKbxCRQcjI5kIK6lCtoA8giq+g
 s4kcbQ3CIkQRfrKSImX4v1h6VSEv8I0mk8ny3Is819uimzonwxijZjJB0QRCRxx++FT3
 vfBoipoNUtTQk8Fi+ELGs9UrC39sPukr6/drts+e/s8YJVysYkxVWU9DbZ1F5PWRK35Z
 OCTPJLcyewZuXJkVUI9b1Ij9VcBrvTG4pY1rV/l674Jj44JF7pyCE9IsZqTjTqaM/W4f
 N+sT85thuawMdzJwcAZ929cUxx1bbSLcxHyfGG6wRk9wbU/Qomg/N7Jfr8rW240q8TZP
 ukJg==
X-Gm-Message-State: AOAM530bvrQRKWPS3hj/i2ok78nSG05CWzhulPfVchgVJf4feFbgN5W7
 yR1ovckyJUCrmqgf7bp0RyhwqpZZWF/QB/KApZGjWUbK3r9y4rA9d+zcSAV8H3MilmnNxCdniKK
 S4fdp1tDkT9gmRH670/3U93yK7guByOnz9AEzPOUmPG+4ejcJIzQAbjQDgpcj
X-Received: by 2002:adf:ffcf:0:b0:20d:437:97a7 with SMTP id
 x15-20020adfffcf000000b0020d043797a7mr5844058wrs.286.1652697456029; 
 Mon, 16 May 2022 03:37:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh28mR7hXMJLj1YQP2zzH/tYj+IE/EAnCP2iT6yqkwMRVIJb2BiUvHsseGVifnESX9kk9ejQ==
X-Received: by 2002:adf:ffcf:0:b0:20d:437:97a7 with SMTP id
 x15-20020adfffcf000000b0020d043797a7mr5844034wrs.286.1652697455756; 
 Mon, 16 May 2022 03:37:35 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003942a244edbsm7398435wmb.32.2022.05.16.03.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:37:35 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 33/91] CXL/cxl_component: Add cxl_get_hb_cstate()
Message-ID: <20220516095448.507876-34-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

Accessor to get hold of the cxl state for a CXL host bridge
without exposing the internals of the implementation.

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-32-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_component.h      | 2 ++
 hw/pci-bridge/pci_expander_bridge.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 4f69688c47..70b5018156 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -218,4 +218,6 @@ static inline hwaddr cxl_decode_ig(int ig)
     return 1 << (ig + 8);
 }
 
+CXLComponentState *cxl_get_hb_cstate(PCIHostState *hb);
+
 #endif
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 22feda1ff0..69244decdb 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -72,6 +72,13 @@ static GList *pxb_dev_list;
 
 #define TYPE_PXB_HOST "pxb-host"
 
+CXLComponentState *cxl_get_hb_cstate(PCIHostState *hb)
+{
+    CXLHost *host = PXB_CXL_HOST(hb);
+
+    return &host->cxl_cstate;
+}
+
 static int pxb_bus_num(PCIBus *bus)
 {
     PXBDev *pxb = convert_to_pxb(bus->parent_dev);
-- 
MST


