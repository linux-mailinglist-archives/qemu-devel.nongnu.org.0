Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561765292EA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:34:27 +0200 (CEST)
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiME-0002hW-Du
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhi-0006Jq-3s
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhg-0006W7-F9
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+TWCmXemeOOogm+lPN22wWpWb1iaL7PiLt3LTYMSX8=;
 b=YYw4drxmBh41JbwCuIh94xd7oIPmQKTBocpMkcVMTc08BWgCAyP67fG/a5scXPpWbAxQdB
 xH7nNrphrP8+dIlIJk1gZ1XWOnHCyq0X/DKUVVp8cywnS9zLAcSE//44e8FUEM0FeCglrb
 ID5HaNQR5OtDUHykpD1hIm7ub3XMNmg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-ldGKMWwvMTSg3Yqify9Sgg-1; Mon, 16 May 2022 16:52:30 -0400
X-MC-Unique: ldGKMWwvMTSg3Yqify9Sgg-1
Received: by mail-ed1-f71.google.com with SMTP id
 q12-20020a056402040c00b0042a84f9939dso4548007edv.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=U+TWCmXemeOOogm+lPN22wWpWb1iaL7PiLt3LTYMSX8=;
 b=FW8vDFKCjOQxiJVdaZ6CWNeHitzYF/9Jz266wI/s6n0OLl3r19zC20eBO/zRoAUcml
 EmnDkxTO2dO+5tHEdX1646oWg/zlg49ioOMr4cxXk4WMR/4IaS42mmyvaV/74L69keVX
 eps1xHB8gf2hQdm7kdnc4LlwG7zKDaKviKBHVM+E+A0R4VDfXKME+uavz+HTfd2w5sCP
 ygh+lGqeRpECjx7Hw1cBYs047gZOtX5km8hHcFClviv8nMQ4OJzWpuPB9u+TxsJZb488
 csQ6Q5lPOGAG59b+BggzGuSv+lOG82dalr5YUKq4Ps1WFDRaZXHvSeIBH2sV46RaYP6W
 782Q==
X-Gm-Message-State: AOAM531Pgwr16XTNysbIFvalKLKZixs5h0k67CogfoaeX/3qoPIcgOzd
 /zrJeoFyUJ3LCkt9+NgxPleljSY1wNeYYsiYy0yaxMiSkccR0dF9IUs/SxtV6JgY48pR0l3as2U
 fWmmT9lEQ9VpiAIysdsej7ZUs0asUHZBXNq9egEzXVEkuKtRViQ5rTOff4ugV
X-Received: by 2002:aa7:d619:0:b0:42a:af7b:eda7 with SMTP id
 c25-20020aa7d619000000b0042aaf7beda7mr8159003edr.235.1652734349254; 
 Mon, 16 May 2022 13:52:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVxLe/Hiq4te5kpzn1FRDbSH7+MMAF5kcnI1hrTuj5rUg62qL3hQB2eiJ4c2DQ7ehhD2Tn0g==
X-Received: by 2002:aa7:d619:0:b0:42a:af7b:eda7 with SMTP id
 c25-20020aa7d619000000b0042aaf7beda7mr8158981edr.235.1652734348988; 
 Mon, 16 May 2022 13:52:28 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 a17-20020a50ff11000000b0042a2d9af0f8sm5686781edu.79.2022.05.16.13.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:52:28 -0700 (PDT)
Date: Mon, 16 May 2022 16:52:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL v2 33/86] CXL/cxl_component: Add cxl_get_hb_cstate()
Message-ID: <20220516204913.542894-34-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

Accessor to get hold of the cxl state for a CXL host bridge
without exposing the internals of the implementation.

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-32-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_component.h      | 2 ++
 hw/pci-bridge/pci_expander_bridge.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 4f69688c47..70b5018156 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -218,4 +218,6 @@ static inline hwaddr cxl_decode_ig(int ig)
     return 1 << (ig + 8);
 }
 
+CXLComponentState *cxl_get_hb_cstate(PCIHostState *hb);
+
 #endif
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 22feda1ff0..69244decdb 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -72,6 +72,13 @@ static GList *pxb_dev_list;
 
 #define TYPE_PXB_HOST "pxb-host"
 
+CXLComponentState *cxl_get_hb_cstate(PCIHostState *hb)
+{
+    CXLHost *host = PXB_CXL_HOST(hb);
+
+    return &host->cxl_cstate;
+}
+
 static int pxb_bus_num(PCIBus *bus)
 {
     PXBDev *pxb = convert_to_pxb(bus->parent_dev);
-- 
MST


