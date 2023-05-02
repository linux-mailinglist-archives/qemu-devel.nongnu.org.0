Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DEC6F3FA9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 10:56:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptlmV-00005b-Nq; Tue, 02 May 2023 04:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ptlmT-00005S-Ft
 for qemu-devel@nongnu.org; Tue, 02 May 2023 04:54:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ptlmR-0001LI-UI
 for qemu-devel@nongnu.org; Tue, 02 May 2023 04:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683017678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b7MRvn+36vnRrucFztl/iXQPBBeFdrWe3EVNFU0OdjY=;
 b=jGEPqQ3+ltvzmlM1Ao1BZypW8sAo93mAdEuXFA02fo/w0YJ4SGlfbDjD04OKdp6qQwIxSN
 8nSxOXpT9lkyKaLHnG3CaaWkeyPXHUz4OcCyh7d61cSINwZ2GgMqU1RefwTB2W/UqG2d9T
 5/o7srWtsxDoHWumW5R9UWw5f69tGw0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-I2wVzpgBOYi1Z5fHH_9RxA-1; Tue, 02 May 2023 04:54:37 -0400
X-MC-Unique: I2wVzpgBOYi1Z5fHH_9RxA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f25376e3b1so10485555e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 01:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683017676; x=1685609676;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b7MRvn+36vnRrucFztl/iXQPBBeFdrWe3EVNFU0OdjY=;
 b=DMzCcfHzAHBMVr+Foe5uSPHv/beltcnOXMBn39QB1u9bub5y+DAm/GSeoGuGnSHzZW
 FnH4Luy6Lc9NpjP86pghUE9z0rpWkpHjQuEyE7lQORR6J/hBj4QE2WnUOIeRpFjRxctO
 klnU1clLAkhXrJkbTL2hfctScHq/K30nFgPRd/NkgrfWwiBlNwJK8ZpAxrDmXYaBZoWe
 XE+DPc7vjxSC1mUMDawFt8VZzNHaSOCsvjvDGw8FDsjRv4VJ1A3MmPR+/OJDjHhya90t
 Qb2armiHpKBMVSEffz+t63CPOZCQvOag9eSnUsEPuO9a2ADTx3Ta3f9X5AOU6LIxa9jm
 87qw==
X-Gm-Message-State: AC+VfDxCWYtURHudzSKr7kCG6GfLTc+vMtE9n9SS1CpKUOCOhyWEdUsB
 5PsEZ3+Ix5Xf4lTHuWYYPUezW+91vbgOQ8oXCyHZ9z0HHDHLXbcx/eG8OAwykFZwUd3HpmRnqG/
 eKKmYbiI/rsEyh1s=
X-Received: by 2002:adf:e9cf:0:b0:306:2aa7:2ed2 with SMTP id
 l15-20020adfe9cf000000b003062aa72ed2mr4531160wrn.61.1683017675940; 
 Tue, 02 May 2023 01:54:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5lJwsdp+y3J4lTX0yNOTHKpPJy9RVsUO/rkcORPFrEcUGKB6ShBjz/zh6Q80mKUuVFIPH+dQ==
X-Received: by 2002:adf:e9cf:0:b0:306:2aa7:2ed2 with SMTP id
 l15-20020adfe9cf000000b003062aa72ed2mr4531143wrn.61.1683017675588; 
 Tue, 02 May 2023 01:54:35 -0700 (PDT)
Received: from redhat.com ([2.52.8.43]) by smtp.gmail.com with ESMTPSA id
 n10-20020a1c720a000000b003edef091b17sm34389793wmc.37.2023.05.02.01.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 01:54:34 -0700 (PDT)
Date: Tue, 2 May 2023 04:54:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Ira Weiny <ira.weiny@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Michael Roth <michael.roth@amd.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Dave Jiang <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mike Maslenkin <mike.maslenkin@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [RESEND PATCH v6 1/8] hw/pci/aer: Implement PCI_ERR_UNCOR_MASK
 register
Message-ID: <20230502045358-mutt-send-email-mst@kernel.org>
References: <20230302133709.30373-1-Jonathan.Cameron@huawei.com>
 <20230302133709.30373-2-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302133709.30373-2-Jonathan.Cameron@huawei.com>
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

On Thu, Mar 02, 2023 at 01:37:02PM +0000, Jonathan Cameron wrote:
> This register in AER should be both writeable and should
> have a default value with a couple of the errors masked
> including the Uncorrectable Internal Error used by CXL for
> it's error reporting.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>

OK it does not look like a fix to migration breakage
is forth coming so I'll revert this patchset for now.



> ---
>  hw/pci/pcie_aer.c          | 4 ++++
>  include/hw/pci/pcie_regs.h | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index 9a19be44ae..909e027d99 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -112,6 +112,10 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver, uint16_t offset,
>  
>      pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
>                   PCI_ERR_UNC_SUPPORTED);
> +    pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
> +                 PCI_ERR_UNC_MASK_DEFAULT);
> +    pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
> +                 PCI_ERR_UNC_SUPPORTED);
>  
>      pci_set_long(dev->config + offset + PCI_ERR_UNCOR_SEVER,
>                   PCI_ERR_UNC_SEVERITY_DEFAULT);
> diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
> index 963dc2e170..6ec4785448 100644
> --- a/include/hw/pci/pcie_regs.h
> +++ b/include/hw/pci/pcie_regs.h
> @@ -155,6 +155,9 @@ typedef enum PCIExpLinkWidth {
>                                           PCI_ERR_UNC_ATOP_EBLOCKED |    \
>                                           PCI_ERR_UNC_TLP_PRF_BLOCKED)
>  
> +#define PCI_ERR_UNC_MASK_DEFAULT        (PCI_ERR_UNC_INTN | \
> +                                         PCI_ERR_UNC_TLP_PRF_BLOCKED)
> +
>  #define PCI_ERR_UNC_SEVERITY_DEFAULT    (PCI_ERR_UNC_DLP |              \
>                                           PCI_ERR_UNC_SDN |              \
>                                           PCI_ERR_UNC_FCP |              \
> -- 
> 2.37.2


