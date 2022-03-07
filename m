Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0134CFB35
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:33:09 +0100 (CET)
Received: from localhost ([::1]:47176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAfs-0005cQ-Kt
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:33:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACZ-00026J-Pt
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACY-0002oK-C0
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5b8reuTHyuhMIH4vmrxET5yF+Z8FE8Jp8knp1f17Abw=;
 b=cxeJaIJ/4v6PoMSym/JYVQUtZu70XPszVuHlUQAcquUo5clzyCnXxOBmmBN5ZYGZy4MLRo
 nfu1xIDpJ8JKVXY4nleeZmiNlDrabWYMBOo9PVOr62eQ4GTvLYQSdeHM+ryXzlndi5FOMF
 FptZ+AwS43ynMFwEwF91+cOhUGxIUeg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-skvz22tENwmJhuGQx8jbkA-1; Mon, 07 Mar 2022 05:02:48 -0500
X-MC-Unique: skvz22tENwmJhuGQx8jbkA-1
Received: by mail-ej1-f71.google.com with SMTP id
 hq34-20020a1709073f2200b006d677c94909so6777664ejc.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5b8reuTHyuhMIH4vmrxET5yF+Z8FE8Jp8knp1f17Abw=;
 b=sjhTqv3cIFWzSJH1IN3it9hVinb4+bMdTKdQN8KrZRMDUkJZRVXRZ45kXSypNjMclt
 s1AWZzycEa1SVgAY/6YCNlHkOu6mKKm1dqdIvp3Ximyw2WBIBB2k/xgcVAJeCtPOyXVO
 h5/TrodE955tb5CUEd0uM2T0ch9nnSsruyB1HG53DOMhwg67o44IsnY8W0t06TgHq1lV
 UX4A9SO9jrbhKMInN+cCwiuoLUper8UTuhXywtSUCyzuLKJ9hMXGkeSsvmR3rA2xRwtS
 gCaaF+6SgoDClF5m713g8B99utxIAakKwnt2cUMBL1PsAwPdSJvfxdhKcTMHSYaQy0AO
 Xrkw==
X-Gm-Message-State: AOAM530ZM1gcdjgO7xPFGw6IHGGHnGzDbM8lQE0nYDtYV7NRuN8eQGNz
 U1K8tLoODsYufT8Q0XBFUDSwUs3YWM7X6hwSxHXLdRMvwibvq/nKJc3y7cGA8m29ZQlT9RSlsfd
 3y+jxXhwkgOQNKEGCGd2lg8oQqjWnQU2cet8p0LNKgmROYER20k24APPwoIoh
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id
 m3-20020a1709061ec300b006cfd11859e2mr8430350ejj.767.1646647367355; 
 Mon, 07 Mar 2022 02:02:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyQTVh94iv2oxK47Oun1dhpg4LVENgF0MkePsmgamdSsSThTkLdsYo3q0akMzcrVMHM/ULJQ==
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id
 m3-20020a1709061ec300b006cfd11859e2mr8430323ejj.767.1646647367080; 
 Mon, 07 Mar 2022 02:02:47 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 y18-20020a170906471200b006da8a883b5fsm4529019ejq.54.2022.03.07.02.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:46 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 28/47] pci-bridge/xio3130_upstream: Fix error handling
Message-ID: <20220307100058.449628-29-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Goto label is incorrect so msi cleanup would not occur if there is
an error in the ssvid initialization.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220218102303.7061-1-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/xio3130_upstream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/xio3130_upstream.c
index 5cd3af4fbc..5ff46ef050 100644
--- a/hw/pci-bridge/xio3130_upstream.c
+++ b/hw/pci-bridge/xio3130_upstream.c
@@ -75,7 +75,7 @@ static void xio3130_upstream_realize(PCIDevice *d, Error **errp)
                                XIO3130_SSVID_SVID, XIO3130_SSVID_SSID,
                                errp);
     if (rc < 0) {
-        goto err_bridge;
+        goto err_msi;
     }
 
     rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_UPSTREAM,
-- 
MST


