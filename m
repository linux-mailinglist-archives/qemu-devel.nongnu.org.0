Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189AF3CB9CE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:27:11 +0200 (CEST)
Received: from localhost ([::1]:56508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Pk5-00010P-Te
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PZ7-0001Qq-QV
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PZ6-0004QU-0e
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=flEK484QxMT1aHuKxIzbr2uWeLGle3LeEcxZhYEt/9E=;
 b=EsftECBdCHGfl4TXkQfyP1GukIBa3uJk0lgj72atwblKNHlsRWHiBcmFCcRJYpFp6EGtEJ
 wx4sFbz99R0BjbinAQtjLp3egSKKKmHVuTqnZqCqwwxLjL7XYCD++CpbWYOAfkFxNKnkCx
 XDTYCTLey5twP9uVjf6UB0HVc9/ycIE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-fItV-tuiNLSAKCsl_dyCHg-1; Fri, 16 Jul 2021 11:15:46 -0400
X-MC-Unique: fItV-tuiNLSAKCsl_dyCHg-1
Received: by mail-wr1-f72.google.com with SMTP id
 m9-20020a5d4a090000b029013e2b4a9d1eso4967770wrq.4
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=flEK484QxMT1aHuKxIzbr2uWeLGle3LeEcxZhYEt/9E=;
 b=YHyRdK8jKF9ciAUFgmqWlBONADENGKo2ntFMWk0wHPEQxVhsZy5XzWZbssnLHi9SW1
 xTbT2/IS6cCc04ERSreSGOc4Alygc9LyE8zp9PdxwZw21sfIsvSMZc7k6O+P+YqyBHDw
 1XOx2UvvU2W82wEeWB7+F2wamgIPOSf0GNwtVIXOy057XNRBCxq+1pbf3REEWzh6nCbw
 xJZCNQqpAFRvAKwtbWtHX1PUuOJNlPq6o7LSRcf00xUdyw670F+GP6hP48pmK3NY4z5r
 an/U8ezTeJaepjOoPbg9WbRLPHdgXXCDlp4PhNHHvb4z/mxrTbFGctbIkWAdFquqbFZV
 8qbw==
X-Gm-Message-State: AOAM531kFvkVKtVdsPm1vJ9lvStjxWV3M/AMhshmx0NbEeYEMg5csilr
 +HwwPbRGe5jT7XaawYiVnu7oDCFTyKu2pRjq/TjWOpYA6CSIx6VyxQrcarCbvpy4hpyoHvbL0tW
 srzbc7U3jrvoeeGmXPv8fVjv5u1zWfT/edy4CeuQZfoMWxcHaxKMG/SAbLJyk
X-Received: by 2002:adf:fcc9:: with SMTP id f9mr12809202wrs.133.1626448544814; 
 Fri, 16 Jul 2021 08:15:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbCeorGZcO3ryRcD4F2KQWVPNi97oaXfgtWP9zuE+sAvONWYfb2Rj650dhm7cNdvE1H1v6Jg==
X-Received: by 2002:adf:fcc9:: with SMTP id f9mr12809171wrs.133.1626448544652; 
 Fri, 16 Jul 2021 08:15:44 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id g3sm10366553wru.95.2021.07.16.08.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:44 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 17/19] hw/i386/acpi-build: Add IVRS support to bypass iommu
Message-ID: <20210716151416.155127-18-mst@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Xingang Wang <wangxingang5@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Check bypass_iommu to exclude the devices which will bypass iommu.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Message-Id: <1625748919-52456-9-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 7efc6285ac..17836149fe 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2263,7 +2263,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
     if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
-        if (bus) {
+        if (bus && !pci_bus_bypass_iommu(bus)) {
             pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd_blob);
         }
     }
-- 
MST


