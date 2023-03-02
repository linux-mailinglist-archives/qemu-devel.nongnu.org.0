Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C696A7CE1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHM-0005kE-3e; Thu, 02 Mar 2023 03:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeH9-0005fz-P5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGo-0002Ye-8P
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8a+rP6o0RdY4iJOHPH7os1V5R8oHg454SVeKQqR7OvE=;
 b=CHJXkeRnSrPZh1Qzgb59skJRYmqIRB13F7AYcvNooYJxt6S8amZAPYHeyPxCVfKff8jQXd
 Gp4Lb7d6YBwxonaI1nm2inQT0SVxEJ9EFt2BqVcN7ib2Px2iHdR6IMW3hkez/UoLMzeURe
 4X2XZXYKQBJhHykTGxnFbH6ztyXrvx8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-G0577PPbOK2TxBL9oHVIjA-1; Thu, 02 Mar 2023 03:26:32 -0500
X-MC-Unique: G0577PPbOK2TxBL9oHVIjA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so750440wmr.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745590;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8a+rP6o0RdY4iJOHPH7os1V5R8oHg454SVeKQqR7OvE=;
 b=s0iXpN4CBTT8rxRQYaZXZl61K7PwVRPgk7Og6Iy1UxA+Wv+n8Nd+5rl+w7T75NmEAe
 1cekEiJWawBcRfzjEpb++rV1sz6p+80MrDLeAU8mbW1hngBDWHdTBepYdcq6lAHv+wyu
 48yuq0E90ZG7Ae+wezb70X8ISeDj1jdp9Ib8mdR7mD4dWvs51J6AASjxtbHvCRP0IKux
 qR62bPYgVF0lEy3VClgLNfqg77bIoWTqP9vfl1vGJHiykpTH4ffNkFzCwVYDH/XTQ/gw
 GudvXhq8gcqJT87nVZWWFM/QvHzMyAGjkxMBOHKQykKYgUZMvIpGeM8ZvHoukgEUbMSY
 zARQ==
X-Gm-Message-State: AO0yUKVB92INMvfyfIZU/257ppP0t4HgHtYwwuZjS7kOYlInOkiR8Suk
 25xzbF5ktDv5BFlBsQfpke2C1doA/0R162yl+01d+SN2UNKeJOU6ahdIN5ETkr6g/r8DCGo3lu/
 4LoE/FEg2TCyfJZmeqFkfweqxThpFODf7Xx447kfQd+wwgUnvm/1r9XffkPrFtpTBmQ==
X-Received: by 2002:adf:dc50:0:b0:2c5:8c04:efbf with SMTP id
 m16-20020adfdc50000000b002c58c04efbfmr6953666wrj.13.1677745590334; 
 Thu, 02 Mar 2023 00:26:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/Bu3WyPD8pBXiRZOHZJd8z6WczAJvd+o8PN+ICev8A08ETgL91zAH7cKzWrukJ9alEpWdAUA==
X-Received: by 2002:adf:dc50:0:b0:2c5:8c04:efbf with SMTP id
 m16-20020adfdc50000000b002c58c04efbfmr6953647wrj.13.1677745590111; 
 Thu, 02 Mar 2023 00:26:30 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 a5-20020a5d4565000000b002c3f81c51b6sm14344430wrc.90.2023.03.02.00.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:29 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Viktor Prutyanov <viktor@daynix.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 38/53] intel-iommu: fail DEVIOTLB_UNMAP without dt mode
Message-ID: <20230302082343.560446-39-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Jason Wang <jasowang@redhat.com>

Without dt mode, device IOTLB notifier won't work since guest won't
send device IOTLB invalidation descriptor in this case. Let's fail
early instead of misbehaving silently.

Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Tested-by: Laurent Vivier <lvivier@redhat.com>
Tested-by: Viktor Prutyanov <viktor@daynix.com>
Buglink: https://bugzilla.redhat.com/2156876
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230223065924.42503-3-jasowang@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index b520542c47..a6b35b07d2 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3179,6 +3179,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
 {
     VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
     IntelIOMMUState *s = vtd_as->iommu_state;
+    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
 
     /* TODO: add support for VFIO and vhost users */
     if (s->snoop_control) {
@@ -3193,6 +3194,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
                          PCI_FUNC(vtd_as->devfn));
         return -ENOTSUP;
     }
+    if (!x86_iommu->dt_supported && (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP)) {
+        error_setg_errno(errp, ENOTSUP,
+                         "device %02x.%02x.%x requires device IOTLB mode",
+                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
+                         PCI_FUNC(vtd_as->devfn));
+        return -ENOTSUP;
+    }
 
     /* Update per-address-space notifier flags */
     vtd_as->notifier_flags = new;
-- 
MST


