Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE2C65E816
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:44:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMRf-0000J5-QM; Thu, 05 Jan 2023 04:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMRc-0000FO-R7
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:21:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMRb-0002qG-3m
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:21:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nxGdrdwQae8hDG8cOVhv322TfPtg6lEqDQKrYnjbzdQ=;
 b=TywzSDEVM+ppgDm4gCa5L9gaGbklZ1vD33/qTpHWPr1WieZTbeA2hi+crfz50Zvi4hxUUk
 1XFdATICh8psk0692W6D08tDnQJghvM5CskuI+XoqAXAayMW4XXatnHWx2M4B9I56NnPFP
 okNL9zcJJ7m076sl88+Q11lhhsTxO+8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-xUmXMWrMOe2gXlYkZtmNeA-1; Thu, 05 Jan 2023 04:21:46 -0500
X-MC-Unique: xUmXMWrMOe2gXlYkZtmNeA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k20-20020a05600c1c9400b003d9717c8b11so17476327wms.7
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxGdrdwQae8hDG8cOVhv322TfPtg6lEqDQKrYnjbzdQ=;
 b=ODue2Qk5y4j1B3MUKIY/4ETbJAZjTiwj+riJ7KwlX3t0jd4U/ZCSIPj5IqBrqNsVLw
 uBZZtOwWJAk1/rmWJyeNpM7hsgCIfQJuVo/u1WOuXzGKN0xei2iOg21FvcjNsgpiINtW
 +iMKX66MF6VtjXVJra2VJPcS/KXht9pzrZSTal7cej8tul1Auzvlgc/BoWSNPnWTKlnd
 xETIaymIZC+73YobWf9+O8wZyb0u+ke+R1l5MhD24XuvUd0LiNj42OY1xt9hmD7Q+1F/
 kG1Fvrq2uu92ZTP4+yDP/8vNAAJdSoQv92OGK8KVy2a7WngtBMrKbg5GMYdrcelK6oDJ
 cCKQ==
X-Gm-Message-State: AFqh2kqtvCHutvvLtwa7Z2PCaB2EMSOPrQxg/9TiWjypQKMTSjTenHZN
 ENfeF6VoF2iK9XblrbzGj0AJKrY4m92BNJuMSzdjA6NyAdQ3OxWU7RKxfVe6EZKtCT0nfBovHVv
 nIr/Rg0IosphuYjwQQn9/iPneM2e5YF31/rHir17L3LnqbEyWdKxawptS+YF0
X-Received: by 2002:a05:600c:1e1e:b0:3d2:3b4d:d619 with SMTP id
 ay30-20020a05600c1e1e00b003d23b4dd619mr35660963wmb.15.1672910505119; 
 Thu, 05 Jan 2023 01:21:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXub5bYaExI715GwwLCTLhWLETan/SMh2z3TIXT2WQ5hJdKmdDtIwd/tXxl91MQ7y2hjtBEphA==
X-Received: by 2002:a05:600c:1e1e:b0:3d2:3b4d:d619 with SMTP id
 ay30-20020a05600c1e1e00b003d23b4dd619mr35660949wmb.15.1672910504863; 
 Thu, 05 Jan 2023 01:21:44 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003c6b7f5567csm6716579wmo.0.2023.01.05.01.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:21:44 -0800 (PST)
Date: Thu, 5 Jan 2023 04:21:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PULL 28/51] include/hw/cxl: Move typedef PXBDev to cxl.h, and put
 it to use
Message-ID: <20230105091310.263867-29-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
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

From: Markus Armbruster <armbru@redhat.com>

hw/cxl/cxl.h uses the PXBDev structure tag instead of the typedef
name.  The typedef name is defined in hw/pci/pci_bridge.h.  Its
inclusion was dropped in the previous commit to break an inclusion
loop.

Move the typedef to hw/cxl/cxl.h, and use it there.  Delete an extra
typedef in hw/pci-bridge/pci_expander_bridge.c.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221222100330.380143-3-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl.h                | 4 +++-
 include/hw/pci/pci_bridge.h         | 1 -
 hw/pci-bridge/pci_expander_bridge.c | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 5129557bee..b161be59b7 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -23,10 +23,12 @@
 
 #define CXL_WINDOW_MAX 10
 
+typedef struct PXBDev PXBDev;
+
 typedef struct CXLFixedWindow {
     uint64_t size;
     char **targets;
-    struct PXBDev *target_hbs[8];
+    PXBDev *target_hbs[8];
     uint8_t num_targets;
     uint8_t enc_int_ways;
     uint8_t enc_int_gran;
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index ca6caf487e..58a3fb0c2c 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -97,7 +97,6 @@ struct PXBDev {
     } cxl;
 };
 
-typedef struct PXBDev PXBDev;
 #define TYPE_PXB_CXL_DEVICE "pxb-cxl"
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
                          TYPE_PXB_CXL_DEVICE)
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index c9e817aa58..870d9bab11 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -50,7 +50,6 @@ struct PXBBus {
 };
 
 #define TYPE_PXB_DEVICE "pxb"
-typedef struct PXBDev PXBDev;
 DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
                          TYPE_PXB_DEVICE)
 
-- 
MST


