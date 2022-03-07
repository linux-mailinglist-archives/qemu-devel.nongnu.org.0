Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93E84D0BAC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:07:11 +0100 (CET)
Received: from localhost ([::1]:55974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMRa-0007z4-Os
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:07:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7R-0008Ck-Pd
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7Q-0005i4-5f
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q5Qs0Ta30Dp0mubfWgDTgHCOBS4dk+VOqy8LKgXc+bc=;
 b=HBbala76+1baRh+CMiYNk54V2udcrmZTYSqAgnMYnEKBOCd56MRTnUkDBLOiwNBhTlYbZL
 5wSOXkyPNQ/HFwuy530LS/6xTq++L00SQF1/yotUZtpPaFXvdAAMn9loesVx11DMo0n7uc
 Dnf5nI8PEUgnwxZwtd6KXy4ByoX3egw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-BH0qGvvnOE2HRGDP5EG67Q-1; Mon, 07 Mar 2022 17:46:17 -0500
X-MC-Unique: BH0qGvvnOE2HRGDP5EG67Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 k41-20020a05600c1ca900b00389a2b983efso1523804wms.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q5Qs0Ta30Dp0mubfWgDTgHCOBS4dk+VOqy8LKgXc+bc=;
 b=MRZI6lZEmGu3WNYXIjEQ60q9nixpyS0KNo2O3ySZbjr3oppCHM9HVcVQGLRuekxtuZ
 i3qdGB5q/9PwF2/zojVQbT7lfsWUdurTnMusCPTcCt00+BA7bzZVIejWLHoJqdqtSGJv
 Rq611BDIqsdDuzsCtUvJ1i8a0p8JEdJk4cPWqlS0jA4nzX035zwshbI6KcXa6lHF/n4J
 uzPw5YLJ+Vz3gISOR0Ji+XO1OaQQRGl/2R6ZYFAeBOiC//mkXTPVncubnFwkVw9nPBFk
 GFYQi7fZAo4v7/ihbcUnwlW3geOolGjA9JM28gLBvPikhDJPNVkhenb7iw0f2JzObx+m
 9LGQ==
X-Gm-Message-State: AOAM530kq1ntD7u2XNL7yOYUYj1OqJ11vhTcFSLOAjmR/mzSst7fL2hS
 kUPiQ3UMJBCcbSI8PmFDNTyHrvgXoWIXCF2i76uRizPTmFINnIRF1xOxsycXir5GkgMhl8XudDt
 SCzQ3LdZ89rjDxCAnNVxpS+KZrq/Bqf99L0LhONiGwv+HICpjY2dceAYsv3xq
X-Received: by 2002:a05:600c:1988:b0:37c:505:d45c with SMTP id
 t8-20020a05600c198800b0037c0505d45cmr948606wmq.107.1646693176010; 
 Mon, 07 Mar 2022 14:46:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyW7OlABTqmsR8bgrc+7gqW9R9W+0LIE4MvkTZ94cvg/d8sI6AoOb1rYpiS+B2I+t8JG6PtwQ==
X-Received: by 2002:a05:600c:1988:b0:37c:505:d45c with SMTP id
 t8-20020a05600c198800b0037c0505d45cmr948586wmq.107.1646693175675; 
 Mon, 07 Mar 2022 14:46:15 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 i9-20020adffdc9000000b001f046861795sm12253397wrs.19.2022.03.07.14.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:15 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 32/47] pci: show id info when pci BDF conflict
Message-ID: <20220307224357.682101-33-mst@redhat.com>
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


