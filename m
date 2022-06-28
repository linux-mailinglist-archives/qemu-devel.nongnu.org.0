Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6D655BE75
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:32:08 +0200 (CEST)
Received: from localhost ([::1]:39858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63pX-0002SW-Kd
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633o-0007t9-GH
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633m-0006sA-UV
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NHP12tfV7UxG8H2z/KoGcDapZ2Sz7muWVetmqH96y00=;
 b=G866nxnFdqWuOponSwZnFU7RFB2tWYSLYcKtY48jaCHVm4gEKowhI2SYSYQuGh0+kZTn9N
 mIuQFS3tyK0/6TyvVr9a74fP2NEnzwlnZHpSuFnY1Aw/52WSi52DBfFsWjT6NWzqNqEemH
 gIrrxudRZwQqlGBXKbvnDFwI8SIU8TU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-BIxnsr47OQm2Q59WjAkLRQ-1; Tue, 28 Jun 2022 00:42:44 -0400
X-MC-Unique: BIxnsr47OQm2Q59WjAkLRQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n15-20020a05600c4f8f00b0039c3e76d646so6628494wmq.7
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NHP12tfV7UxG8H2z/KoGcDapZ2Sz7muWVetmqH96y00=;
 b=DPm173njT1Z3WnAtm6rL5+I5+6JBd9FW9qxsO+G9LJgeCxrKEe0df8O8aBQBdiRbsv
 qKrkixYM+JCYDkdvhdfRzXUwEeSBGHOaxsxURKDLP66uft0GoAKXZumaEeh5Z82CRZMK
 63WvmxG9JW2YGhlM8byxWjNI8j6DWVSzUo8cMJWHmP1TeK2a6m7aeUzrb/kRhguOI4GP
 /U+xjoJ5er32tSBNXhz85fkx+CwL36KflIpi/in21wryUtDfxUjudLWKRSzNdYKwn4zN
 4jVgJBrspbXCFZPdQUUQ6CE6YP3lyc/nHglh6erYPkIzOOhzQubJk8EBZf8hhWGh4Tvc
 9Dvw==
X-Gm-Message-State: AJIora+XvO6TE0ZPM5qOS6ZVEDTjD9mIv1KxU6IY9z4smHvjonbSk9ky
 leFmwLi07DjPB0nuaOrOaZt1+5iTiFJA98hmzvyTKFsHIMjTs+itIu9nqUiMKyRE4paj8qMgMj1
 aF/r1WGOVdKoP7wTfylXHYiTHHVq7qO8pFkI9xCjejnPOmyjATTSXa5BWY2Lw
X-Received: by 2002:adf:d1c6:0:b0:21b:ca9b:23d8 with SMTP id
 b6-20020adfd1c6000000b0021bca9b23d8mr9960039wrd.692.1656391362982; 
 Mon, 27 Jun 2022 21:42:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ti+RNDpi4zcodfTL7s1KpGnwthzjqu2WCejBT7k2C6fk5vUBplAXQgyFHARhJyMPFE6GHSpA==
X-Received: by 2002:adf:d1c6:0:b0:21b:ca9b:23d8 with SMTP id
 b6-20020adfd1c6000000b0021bca9b23d8mr9960028wrd.692.1656391362773; 
 Mon, 27 Jun 2022 21:42:42 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 v24-20020a5d5918000000b0021b9870049dsm12126567wrd.82.2022.06.27.21.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:42:42 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:42:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PULL 05/12] virtio-iommu: Fix migration regression
Message-ID: <20220628044201.217173-6-mst@redhat.com>
References: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

We also need to switch to the right address space on dest side
after loading the device status. DMA to wrong address space is
destructive.

Fixes: 3facd774962fd ("virtio-iommu: Add bypass mode support to assigned device")
Suggested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Message-Id: <20220624093740.3525267-1-zhenzhong.duan@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 08b227e828..281152d338 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1322,6 +1322,14 @@ static int iommu_post_load(void *opaque, int version_id)
     VirtIOIOMMU *s = opaque;
 
     g_tree_foreach(s->domains, reconstruct_endpoints, s);
+
+    /*
+     * Memory regions are dynamically turned on/off depending on
+     * 'config.bypass' and attached domain type if there is. After
+     * migration, we need to make sure the memory regions are
+     * still correct.
+     */
+    virtio_iommu_switch_address_space_all(s);
     return 0;
 }
 
-- 
MST


