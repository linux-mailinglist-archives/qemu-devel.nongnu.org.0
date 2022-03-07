Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49B14CFBC4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:47:34 +0100 (CET)
Received: from localhost ([::1]:53434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAtp-0003mW-Qf
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:47:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACo-0002ER-KE
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACk-0002pO-Gx
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q5Qs0Ta30Dp0mubfWgDTgHCOBS4dk+VOqy8LKgXc+bc=;
 b=QLQ86wGB0+Xnhg8yNqDvnR24Pe9goyCvU1DY8hhDRqIIQtST7TMYjubkvGBZd22eU5f0M9
 5CywlKMBNEt6ZXWYyFE5/J2/XSgXGcKBCuIGB1ViWTKt0zGzbu6+AhKuLxJPrVKuUpqlWb
 i8SmSXZrN7r4dxyrS/X/ni1TrG48hI0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-hkUWZ8t4O26CvRWYwcdDPQ-1; Mon, 07 Mar 2022 05:02:59 -0500
X-MC-Unique: hkUWZ8t4O26CvRWYwcdDPQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 ga31-20020a1709070c1f00b006cec400422fso6734920ejc.22
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q5Qs0Ta30Dp0mubfWgDTgHCOBS4dk+VOqy8LKgXc+bc=;
 b=leULnf1i19SPGq4GoFD7gA+PSgQQOqOgHWNJxb+HPbn0kaLKSeF6E+y13IvIeCypde
 oaRgMS1US8aouETDiDrOIjvukAez5EMwU1/wvvyeGEZMYHdqfHpvRKX4cm4//sgceT1S
 uvVeLpWX4za8fql9a46wOEVJfeCUeUWmPxEv7FRGSTg/PbkhqHFU2rQRMOulPvxM4azH
 GYDvkVm2L+l8goP2/ueYE/oqbn3Yawiou7LSgDF85hmNTYnetltGRlivlAx0mZcu6QRW
 NJa5tJgymydalWyRGUFPkOAR+ONGdPBX4AZx0JaxRFIDOTNQ/Zd7v1txQoJYTgV6OD69
 qaNw==
X-Gm-Message-State: AOAM533jDAIOC7LW5eDTOOYO+IAzmyLt9AOTxHCj/gtpIwRu+n8vBJUM
 3YBKHgKFZh3K02tCQANN5Sgme/dxjAQ4k+qj38lvKVPhTvc7ymXnsNcvCebwRCI4JleQzvPz2SE
 k3QvDGRwTBLaj/KTocER/TZaq6ZfsJ173ZVQKA5RuycYi8o8+H3R8t4O3E/9V
X-Received: by 2002:a17:906:4cd2:b0:6c8:7a90:9c7 with SMTP id
 q18-20020a1709064cd200b006c87a9009c7mr8482469ejt.439.1646647378315; 
 Mon, 07 Mar 2022 02:02:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxd28O8GJxOAdYTANmi1+yJ2Dwv/YDNKoNrCsrJMv65ZfFu2xdATT2j77j/oF1cxQzb1rsNCg==
X-Received: by 2002:a17:906:4cd2:b0:6c8:7a90:9c7 with SMTP id
 q18-20020a1709064cd200b006c87a9009c7mr8482449ejt.439.1646647378063; 
 Mon, 07 Mar 2022 02:02:58 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm4548642eje.183.2022.03.07.02.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:57 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 32/47] pci: show id info when pci BDF conflict
Message-ID: <20220307100058.449628-33-mst@redhat.com>
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
 Zhenzhong Duan <zhenzhong.duan@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

During qemu init stage, when there is pci BDF conflicts, qemu print
a warning but not showing which device the BDF is occupied by. E.x:

"PCI: slot 2 function 0 not available for virtio-scsi-pci, in use by virtio-scsi-pci"

To facilitate user knowing the offending device and fixing it, showing
the id info in the warning.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Message-Id: <20220223094435.64495-1-zhenzhong.duan@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index ba8fb92efc..5cb1232e27 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1099,9 +1099,9 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
         return NULL;
     } else if (!pci_bus_devfn_available(bus, devfn)) {
         error_setg(errp, "PCI: slot %d function %d not available for %s,"
-                   " in use by %s",
+                   " in use by %s,id=%s",
                    PCI_SLOT(devfn), PCI_FUNC(devfn), name,
-                   bus->devices[devfn]->name);
+                   bus->devices[devfn]->name, bus->devices[devfn]->qdev.id);
         return NULL;
     } else if (dev->hotplugged &&
                !pci_is_vf(pci_dev) &&
-- 
MST


