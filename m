Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001236EDD24
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:49:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDOc-0003BC-Df; Tue, 25 Apr 2023 03:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNt-0001t8-3r
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNr-0006vB-Hd
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t5kHDje6YgQKSvtsxfGVGWWdW2z/lTLpCHStMSMZnP4=;
 b=BbwXB0lGOsbJ6TFsOfcmFh5VwBBoMZHKbk4ijEVnlwk9HngFLhAiX9vv22XnLcWi2XNJFs
 hZyWAXzDBZIGhSnF3JUZ5IApOPzypOJEQflt6mQktykLxwl7MwosuMaI0gjEcQVGZOxIlh
 9DDSVbHnQ3UV0kaKnR83g7HxbPnZWG4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-Omf0556RNxab6dHMLT8h8g-1; Tue, 25 Apr 2023 03:46:40 -0400
X-MC-Unique: Omf0556RNxab6dHMLT8h8g-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f173bd0fc9so29624915e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408799; x=1685000799;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t5kHDje6YgQKSvtsxfGVGWWdW2z/lTLpCHStMSMZnP4=;
 b=j+AVK0lof03QSDn1GLx/tHKkLUIeaOWPFaUgoWttzG9PJmeNf4G0AWnBIuTwc9qhGw
 kvkurMo2ReCu5Nj8SEff5/UV127HcXWQskIxidUteKdctR9LubyAN7FwEBqFSQOGrKXH
 DyWPU5nugAPcN6yfw/jVypO7vYsjnOJii6kMiBhXT1mdmcwc7eTVwx+7mjKg7wPDShhx
 c0dZPmcufvvtq9/vx4kfS0HL1sKZVz9xhJVRJuG4BKVlMcSLnxhQ6pYX+S9pCf6SblL1
 /754MRcMWpXmHrpgQ3j6/LX6PH4mttP/nlQpTXSAtyif+nRxJogdJKEBYFE6lye2z2qY
 OdFw==
X-Gm-Message-State: AAQBX9d5RNBIaCKWcM4H3LkFzL2ugR0iyA3cCIMFhc0QmRiuwceuVUWR
 qMbxuRlV0Zf4QhpjZSboXgfJAwk5gDDKYAmTkjuvgRJDKS6FK81B/LA0iQ8Xj7PeoFt3uegiEuo
 6sv/Ka+5HUFcx7PFfKr704SzyN9tln0xQz4b8qDxl3txymVdJFwXl8T+e2bz/k6yY6NpG
X-Received: by 2002:a1c:7c04:0:b0:3f2:51e7:f1f4 with SMTP id
 x4-20020a1c7c04000000b003f251e7f1f4mr3051556wmc.10.1682408799183; 
 Tue, 25 Apr 2023 00:46:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZjOyy7WH+KkvyiDuKlNKtQFulBFZkNtznsh1G3DdvCWHBLI75YKQ8pTcEYIbtPMmB9N5vftA==
X-Received: by 2002:a1c:7c04:0:b0:3f2:51e7:f1f4 with SMTP id
 x4-20020a1c7c04000000b003f251e7f1f4mr3051534wmc.10.1682408798887; 
 Tue, 25 Apr 2023 00:46:38 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 q9-20020a1ce909000000b003f177c3672dsm17269229wmc.29.2023.04.25.00.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:46:38 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:46:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Huth <thuth@redhat.com>, qemu-stable@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 30/31] hw/pci-bridge: pci_expander_bridge fix type in
 pxb_cxl_dev_reset()
Message-ID: <9136f661c7277777a2f85a7e98438f4fe6472fdc.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reproduce issue with

configure --enable-qom-cast-debug ...

qemu-system-x86_64 -display none -machine q35,cxl=on -device pxb-cxl,bus=pcie.0

  hw/pci-bridge/pci_expander_bridge.c:54:PXB_DEV: Object 0x5570e0b1ada0 is not an instance of type pxb
  Aborted

The type conversion results in the right state structure, but PXB_DEV is
not a parent of PXB_CXL_DEV hence the error. Rather than directly
cleaning up the inheritance, this is the minimal fix which will be
followed by the cleanup.

Fixes: 154070eaf6 ("hw/pxb-cxl: Support passthrough HDM Decoders unless overridden")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230420142750.6950-2-Jonathan.Cameron@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/pci_expander_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index ead33f0c05..a78327b5f2 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -311,7 +311,7 @@ static void pxb_cxl_dev_reset(DeviceState *dev)
      * The CXL specification allows for host bridges with no HDM decoders
      * if they only have a single root port.
      */
-    if (!PXB_DEV(dev)->hdm_for_passthrough) {
+    if (!PXB_CXL_DEV(dev)->hdm_for_passthrough) {
         dsp_count = pcie_count_ds_ports(hb->bus);
     }
     /* Initial reset will have 0 dsp so wait until > 0 */
-- 
MST


