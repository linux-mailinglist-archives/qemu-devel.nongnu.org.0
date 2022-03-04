Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726E54CD654
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:27:47 +0100 (CET)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8uI-000195-GQ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:27:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8C6-0004YL-Vm
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8C5-0001FA-DJ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q5Qs0Ta30Dp0mubfWgDTgHCOBS4dk+VOqy8LKgXc+bc=;
 b=PkuExdsdOy6tabKlOehM+aCTSBSTot3BWvJX8IIOApfBFW1u8oyeM1yhlUJ3GSXSPq60Wj
 sksLTZR5RciVrpg1cwPsDd381EP3Ws86W0XEMIwIDwNnE38iqerxvln/bUjaFH7mdy2niU
 HWwh80DOyCqv4APsDGbJdYN7zsVEosc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-DKEj8tTDNbmp-J8mzJ589A-1; Fri, 04 Mar 2022 08:42:02 -0500
X-MC-Unique: DKEj8tTDNbmp-J8mzJ589A-1
Received: by mail-wm1-f70.google.com with SMTP id
 l2-20020a1ced02000000b0038482a47e7eso2826126wmh.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q5Qs0Ta30Dp0mubfWgDTgHCOBS4dk+VOqy8LKgXc+bc=;
 b=jcFm4WcTcjR67gh/21A3175nUETRv6070CxCdtUHCpZ4nz19g8FmY3rzsAAAMthCBv
 7CPOEU84Yu3yBNpJTtWit3LXAoaT2KGT0F6zsip3jP5ZPbbR6XIInUKKseedTcWLODFu
 yyJzBzv8wkiHyYw4f3gdCQpe0dlNQlkkPJvhLxrwWlJ0k24mChnPHh/JLU8qwg8kIs/o
 YsmGeSR3T/IiycDeXmmQOysX6WeMxdACFIY3fj/cC7BmURUKCYBYZeujvBFhEnTqJeqY
 8zvZHZ3ZHmP+TPJFTLw8lPRuL3mcQbNiSaKttWjTWO+Cwrb2tP1WYakhbG6W+3V1639D
 8Itg==
X-Gm-Message-State: AOAM532DXZCraYMC5lUqPuzadNYzRTChoPIGHQozQH52Z3GhMjFA8tc5
 2Hxs/wdWwW7t/9DOHcdx556LeTFcb21VfMCs15t2r/fcTi9nI2uRwhDrg0ogmeC+wncRYV54soj
 8qe4CBNUREF1K7ably3X/zIUrPSNHoEGfcueAIHHvPhyCCBDObGupR/W738om
X-Received: by 2002:adf:a399:0:b0:1f0:2478:242d with SMTP id
 l25-20020adfa399000000b001f02478242dmr10789287wrb.234.1646401321150; 
 Fri, 04 Mar 2022 05:42:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxilMuS3bxOncxz++u21kZOgNdbnY/wQEG7gP9fXrryvPTcgLz8QUiI8TUqpLwg/zGmaG2dgQ==
X-Received: by 2002:adf:a399:0:b0:1f0:2478:242d with SMTP id
 l25-20020adfa399000000b001f02478242dmr10789275wrb.234.1646401320909; 
 Fri, 04 Mar 2022 05:42:00 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 c4-20020adfed84000000b001e5b8d5b8dasm6333988wro.36.2022.03.04.05.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:41:51 -0800 (PST)
Date: Fri, 4 Mar 2022 08:41:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/45] pci: show id info when pci BDF conflict
Message-ID: <20220304133556.233983-37-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


