Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8474CFB69
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:36:52 +0100 (CET)
Received: from localhost ([::1]:55704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAjT-0002tG-Ou
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:36:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACc-0002AC-PK
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACb-0002og-B8
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0SLrr2pzwbz8DMCaGa52u4y7YRyNCIg4T/EysVR8B14=;
 b=ZRibq/mIYhnLUQeOqqptE6cuhhxu+XbplGd3W5OPVHg51SloIfuo+X0/YDLyihmJWITbA5
 H5Tx0uBHmfhQoVw39WJCkhBvdZy7QF6YEZnPlWSfsEfPG4Z4ofvZyY6PhVZMOZXJ3kmQem
 bTNdCbY1RswDmMb/UpauHr1Ef6IYleQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-R-0Dltu1Mcqx-VKK1LBkrA-1; Mon, 07 Mar 2022 05:02:52 -0500
X-MC-Unique: R-0Dltu1Mcqx-VKK1LBkrA-1
Received: by mail-ej1-f69.google.com with SMTP id
 ga31-20020a1709070c1f00b006cec400422fso6734718ejc.22
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0SLrr2pzwbz8DMCaGa52u4y7YRyNCIg4T/EysVR8B14=;
 b=lB9FdEJcDa+WmYVG5Ko3u2GRGT31BS2zfxQiYBSP+40AeOMA6Ykr8r6XDZC56JpTOA
 MW6ObXWeVa3998TmqC00SpFD+l2CF2LyQHx7TeXGZuCQPm5yyvELOf0khfsA5qdPqQTE
 CcZkogU9xBCMwuHjbQoG71RRDSmAx+izR5zcqhSXZnFpSuuGga//PWbUv804Y4OheQho
 pXAM+NJLxR6Kxn9icWrg+SciO1wTnVlWW/KnZ6Lt1ELRYXCmLbh/pHngy0rNGmjJQ2HO
 X3GTldX+CJYcHPDiiQiIut+DVoddca082KuCMIQNlmXmBy3SwsypG7FJckqGnDItNGuP
 FyeQ==
X-Gm-Message-State: AOAM5337pxuWq3nJaGdP5Dxg+bf+A+pwd7t+tYwiiI7GAU5ehqqaJy6O
 6pIpco9wAWuUJqLI4wiZ6ZQQD+yiQbBUpKxXLf9+wVOtsjmd71RYd7HCJ6MGWlgszUsjCAhyTMu
 ywNXfd1HXn1nwCbGb6VH10hKOyCThUTyXIPDsedD8ZhuFrmogMri42GlUz546
X-Received: by 2002:aa7:d384:0:b0:415:e2f0:1a21 with SMTP id
 x4-20020aa7d384000000b00415e2f01a21mr10055045edq.230.1646647370450; 
 Mon, 07 Mar 2022 02:02:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVJoFdF82Adi3X17h4w7ETJQ1acUzE/5WOLG2IJLWFaJ2guWeAgRTTGd8GKaVRu9ZaUQqCMQ==
X-Received: by 2002:aa7:d384:0:b0:415:e2f0:1a21 with SMTP id
 x4-20020aa7d384000000b00415e2f01a21mr10055022edq.230.1646647370235; 
 Mon, 07 Mar 2022 02:02:50 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 s8-20020a170906354800b006da9dec91f2sm4220011eja.163.2022.03.07.02.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:49 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 29/47] pci-bridge/xio3130_downstream: Fix error handling
Message-ID: <20220307100058.449628-30-mst@redhat.com>
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

Wrong goto label, so msi cleanup would not occur if there is
an error in the ssvid initialization.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220218102303.7061-2-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/xio3130_downstream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 04aae72cd6..080a6613fe 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -84,7 +84,7 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
                                XIO3130_SSVID_SVID, XIO3130_SSVID_SSID,
                                errp);
     if (rc < 0) {
-        goto err_bridge;
+        goto err_msi;
     }
 
     rc = pcie_cap_init(d, XIO3130_EXP_OFFSET, PCI_EXP_TYPE_DOWNSTREAM,
-- 
MST


