Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6484D0BCA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:12:53 +0100 (CET)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMX6-0003YI-HD
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:12:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7D-0007f5-3Z
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7B-0005gw-K0
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5b8reuTHyuhMIH4vmrxET5yF+Z8FE8Jp8knp1f17Abw=;
 b=Hf96WKHAZa/1HmTuRHGA9b1hMUlpCEgJgwwPMSA7Mtenm43LezGYu6+p72883Vs5ga1hwu
 cnOLJpHfFXzKptjZJoUCbQ+KPuPWihF436ummbvk+VbyL2kafnoYtXeaEkLoH6gJa6lQUW
 sB3i9w4+SfuTfokhpNCnlkSEtW/t1FY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615--fdAAlTvNROOWZMDV_3OjA-1; Mon, 07 Mar 2022 17:46:04 -0500
X-MC-Unique: -fdAAlTvNROOWZMDV_3OjA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m34-20020a05600c3b2200b0038115c73361so5689021wms.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5b8reuTHyuhMIH4vmrxET5yF+Z8FE8Jp8knp1f17Abw=;
 b=5/4+1XpI6M4SlftKttqySIjiM0JLKfTI6YJeJwRbRZF70r1dz3QpRkHtfxrXHLIjHz
 H6IiEOs57n9u+emknz+WtR3jYAnfprEA8VAYbgySQ0cNLZKQuQdPimV+0YP3epibRaxx
 JXPJ16HYFSRf2eAj+MtvfkRdU8DWDmZkqxasTtegC2q2taHhzF2sa4IlhFM+isMOWE8a
 zd/d8l6RcjPAIjn5szu8RDxgKhiRidLWZBwgdF52YTXtMnHwaiX46Aa5+zCI3Am9Dmyb
 r2QkT6XHaCv/LpwKOFn58aK1ieDz7/evOsaiv5QubmycgIe1M3j2lq16+utdkAG2xkMl
 e1TA==
X-Gm-Message-State: AOAM532h/AKcgTvQPvgM5nO2wsawpqX1ev8b+aydV466cDLELWp1XS+D
 CHIvbWyPu7mPItTQnRqqJWSYu6o8cpvd33DbUEZz3fVpZ12gu4OWLt/iyCUKlPS2zo9SicMidyT
 WDG31rn+bnyMFEJiifjATCIUmT7OBRF2p7bBn8jGIp0ulwO9494AIRbDNaCkK
X-Received: by 2002:a5d:584f:0:b0:1e8:5697:e979 with SMTP id
 i15-20020a5d584f000000b001e85697e979mr10073084wrf.167.1646693162777; 
 Mon, 07 Mar 2022 14:46:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKwUmdgSwyRKmGDSbV2B482AVaVWKM3SjtBufat0oWekX7pJeFMAOq2B+gJLrGLBZfnA0F2Q==
X-Received: by 2002:a5d:584f:0:b0:1e8:5697:e979 with SMTP id
 i15-20020a5d584f000000b001e85697e979mr10073071wrf.167.1646693162537; 
 Mon, 07 Mar 2022 14:46:02 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 l11-20020a5d674b000000b001f047c49e99sm12531584wrw.2.2022.03.07.14.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:02 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 28/47] pci-bridge/xio3130_upstream: Fix error handling
Message-ID: <20220307224357.682101-29-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


