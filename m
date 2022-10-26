Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CAC60E9EF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:08:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmg5-0007cZ-1I; Wed, 26 Oct 2022 16:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmfV-0007AH-22
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:06:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmfT-0001Rq-3Y
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:06:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666814785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kJbtSYiPhNxQ2HMlsmhAY3yYtRvixnk1SRvZ0hFQjaI=;
 b=G32FHutI8CLBun32mOrSVolQAsW//gBk7PAAGCEgneM3ic8KWFuZG7hvdAl3Bm99nZHB6s
 5FAoDLQvfLrP+CLP5P0d1PUAOPa2W78rdg+zIbCq619ZoWvyLz9yLbxGOCikF5vKKm5y6e
 HbXlS9FMtqekQdTcFbiv8XGp0stWs5c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-U4hn9S0LNzauj2QGClcjaQ-1; Wed, 26 Oct 2022 16:06:24 -0400
X-MC-Unique: U4hn9S0LNzauj2QGClcjaQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 iw9-20020a05600c54c900b003cf4eea332cso580281wmb.1
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJbtSYiPhNxQ2HMlsmhAY3yYtRvixnk1SRvZ0hFQjaI=;
 b=MU3YJEjZ8tykGUTwSqzK3e4xksN0qdIk2FCe8lhireeB1ZpyIVz7egsWNqkqfj2plH
 83GRVuAHdWcoaDP0jP/5Gl5oIal9beiCILTnIi4o4qBxCv8Avrfn52tyWgwaiyO8tWZ8
 DyDPXBmfBHxWp8R/5yWB4hy88KJgsfYw/okPf4k2QY04IemtSqJ7sATbkoDDhmtz0j72
 f6pGqebP0adRT5fMAOR+UDEsb/KwoYi4cscR2DQ38mnyT+ZuKArayviOU4dpfwfcK+xw
 PRs59ksKtvqCor9a2voG7Uygmy20eorVAf/32HihsJlJyhpyaGIqCYYauYnNBkKKiBFx
 NRBQ==
X-Gm-Message-State: ACrzQf0x6wkFNPCE25wADyiDSuTUGQ4s47ddv62uQniugeaQtl1JiHuq
 7aEelAymrxqme/FZpTAYZ0TrcsOYGRvFzjCgVd77OcyybCVR+9P1McKpt8o77tA86tmVSB0VHV0
 Wca6CJUa6Qtuje6o=
X-Received: by 2002:a05:600c:19d1:b0:3c7:b52:3aa4 with SMTP id
 u17-20020a05600c19d100b003c70b523aa4mr3699405wmq.56.1666814783415; 
 Wed, 26 Oct 2022 13:06:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7CDoZL0RCSiT7Kxb1lDkPQKvatbpa5r0k7WVPhTpSMtuycc4dq+Zgv5Oxk5oEe8hdvfCN8+Q==
X-Received: by 2002:a05:600c:19d1:b0:3c7:b52:3aa4 with SMTP id
 u17-20020a05600c19d100b003c70b523aa4mr3699385wmq.56.1666814783199; 
 Wed, 26 Oct 2022 13:06:23 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 d5-20020a05600c34c500b003cf4d99fd2asm1855476wmq.6.2022.10.26.13.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:06:21 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:06:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 linux-cxl@vger.kernel.org, alison.schofield@intel.com,
 dave@stgolabs.net, a.manzanares@samsung.com, bwidawsk@kernel.org,
 Gregory Price <gregory.price@memverge.com>
Subject: Re: [PATCH 1/2] hw/cxl: set cxl-type3 device type to
 PCI_CLASS_MEMORY_CXL
Message-ID: <20221026160545-mutt-send-email-mst@kernel.org>
References: <20221006233702.18532-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006233702.18532-1-gregory.price@memverge.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 06, 2022 at 07:37:01PM -0400, Gregory Price wrote:
> Current code sets to STORAGE_EXPRESS and then overrides it.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>

If you expect me to merge it you need to CC me.
Also, do we need this separately from the series?

> ---
>  hw/mem/cxl_type3.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index ada2108fac..1837c1c83a 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -146,7 +146,6 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
>      }
>  
>      pci_config_set_prog_interface(pci_conf, 0x10);
> -    pci_config_set_class(pci_conf, PCI_CLASS_MEMORY_CXL);
>  
>      pcie_endpoint_cap_init(pci_dev, 0x80);
>      cxl_cstate->dvsec_offset = 0x100;
> @@ -335,7 +334,7 @@ static void ct3_class_init(ObjectClass *oc, void *data)
>  
>      pc->realize = ct3_realize;
>      pc->exit = ct3_exit;
> -    pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
> +    pc->class_id = PCI_CLASS_MEMORY_CXL;
>      pc->vendor_id = PCI_VENDOR_ID_INTEL;
>      pc->device_id = 0xd93; /* LVF for now */
>      pc->revision = 1;
> -- 
> 2.37.3
> 
> 


