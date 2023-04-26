Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5366EEE24
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 08:14:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prYOi-00035B-KK; Wed, 26 Apr 2023 02:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prYOg-00034J-3X
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 02:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prYOe-0005m4-4l
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 02:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682489575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g7xWYc33N9XQ+GXLoYQ3lJSitemOfZG7GR1ZFjDqK30=;
 b=ewH7CpUVk+rohcIc2EjNpDEq2ZQ9gePRGi5KHye6U2zPQOTnfnRWbaw/pwLtBQMe9cLXPV
 8MOwaacenjpD0c3ThfvDqPmFpCfIkxxdwG7hmZwZJfS2ZSESxNRUHbdS5c5sYht/cu33Q1
 fo293OJUV/oOC3VAi1ksT7apMpxnRSQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-iitPcGDjP9CAXN-D_wb0Og-1; Wed, 26 Apr 2023 02:12:53 -0400
X-MC-Unique: iitPcGDjP9CAXN-D_wb0Og-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-301110f1756so2390875f8f.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 23:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682489572; x=1685081572;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g7xWYc33N9XQ+GXLoYQ3lJSitemOfZG7GR1ZFjDqK30=;
 b=WtzmEP/BvV0904tAA8urBZFRySXURZdgxkzrdmHNggAzr+84Rb468G5sCHh/v+aoti
 Ywyl5pvYu//vL5sMDeJ88EWIipFaJV3xag8LxPr7Fyg6gRKBJx1zm9pjJVLaRYzH+jHT
 +f4oMru6d2laKj2AyJQmFiI3Noi8D5C0g8gVYvJGNEuVN/jOMQezDVgYjdgbgUMj/N41
 jS5JxHlcp9PjMuM6jQpaDfEovTnqEAw1/cz/EP9pvIYwtQmDOfGg4CKSk/iylgGY6CdF
 yMYr+Z8Decc2ks1x6cfo4dRl0EK7E0uiKOmO+D4FQQfJfYSgL4ZkfcmTDIkuftlk7M0u
 lF/w==
X-Gm-Message-State: AAQBX9cMMt0aGpDiIwc78MV9jmk4XjRrXFCcMuOFAPMgbsjjYt1mnRWe
 GxBCe8hqjOVDDLRGRBhc1O5fsxG+cMH29GYM53UmUcQJmmB2NR3tSgO+sRr9RogYaA092ITd9Vt
 tZR3LfPECsizqhAk=
X-Received: by 2002:a5d:66c2:0:b0:2f7:780e:ee0a with SMTP id
 k2-20020a5d66c2000000b002f7780eee0amr13502961wrw.64.1682489572264; 
 Tue, 25 Apr 2023 23:12:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350bUh2GMohiDLEePABNHS+ivIyuPPmNqQOYWk2BjTt2dnQv1D33Bu3Nh0E7D1eQIukKjJp5pww==
X-Received: by 2002:a5d:66c2:0:b0:2f7:780e:ee0a with SMTP id
 k2-20020a5d66c2000000b002f7780eee0amr13502944wrw.64.1682489571971; 
 Tue, 25 Apr 2023 23:12:51 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 k17-20020a5d6291000000b002c561805a4csm14762323wru.45.2023.04.25.23.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 23:12:51 -0700 (PDT)
Date: Wed, 26 Apr 2023 02:12:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PULL 61/73] hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register
Message-ID: <20230426021019-mutt-send-email-mst@kernel.org>
References: <cover.1678237635.git.mst@redhat.com>
 <010746ae1db7f52700cb2e2c46eb94f299cfa0d2.1678237635.git.mst@redhat.com>
 <ZEhzaWpNM+NvZCUw@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZEhzaWpNM+NvZCUw@x1n>
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

On Tue, Apr 25, 2023 at 08:42:17PM -0400, Peter Xu wrote:
> Hi, Michael, Jonathan,
> 
> On Tue, Mar 07, 2023 at 08:13:53PM -0500, Michael S. Tsirkin wrote:
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > 
> > This register in AER should be both writeable and should
> > have a default value with a couple of the errors masked
> > including the Uncorrectable Internal Error used by CXL for
> > it's error reporting.
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> > Message-Id: <20230302133709.30373-2-Jonathan.Cameron@huawei.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Fan Ni <fan.ni@samsung.com>
> > ---
> >  include/hw/pci/pcie_regs.h | 3 +++
> >  hw/pci/pcie_aer.c          | 4 ++++
> >  2 files changed, 7 insertions(+)
> > 
> > diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
> > index 1fe0bdd25b..4972106c42 100644
> > --- a/include/hw/pci/pcie_regs.h
> > +++ b/include/hw/pci/pcie_regs.h
> > @@ -141,6 +141,9 @@ typedef enum PCIExpLinkWidth {
> >                                           PCI_ERR_UNC_ATOP_EBLOCKED |    \
> >                                           PCI_ERR_UNC_TLP_PRF_BLOCKED)
> >  
> > +#define PCI_ERR_UNC_MASK_DEFAULT        (PCI_ERR_UNC_INTN | \
> > +                                         PCI_ERR_UNC_TLP_PRF_BLOCKED)
> > +
> >  #define PCI_ERR_UNC_SEVERITY_DEFAULT    (PCI_ERR_UNC_DLP |              \
> >                                           PCI_ERR_UNC_SDN |              \
> >                                           PCI_ERR_UNC_FCP |              \
> > diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> > index 9a19be44ae..909e027d99 100644
> > --- a/hw/pci/pcie_aer.c
> > +++ b/hw/pci/pcie_aer.c
> > @@ -112,6 +112,10 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver, uint16_t offset,
> >  
> >      pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
> >                   PCI_ERR_UNC_SUPPORTED);
> > +    pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
> > +                 PCI_ERR_UNC_MASK_DEFAULT);
> > +    pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
> > +                 PCI_ERR_UNC_SUPPORTED);
> 
> This breaks the simplest migration from QEMU 8.0->7.2 binaries on all
> machine types I think as long as the cap is present, e.g. the default
> e1000e provided by the default q35 machine can already hit it with all
> default cmdline:
> 
>   ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
> 
> 7.2 binary will have empty wmask for PCI_ERR_UNCOR_MASK, meanwhile I think
> it can also see a non-zero value, then the migration will fail at:
> 
> vmstate_load 0000:00:02.0/e1000e, e1000e                                                   
> qemu-7.2: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
> qemu-7.2: Failed to load PCIDevice:config   
> qemu-7.2: Failed to load e1000e:parent_obj                                                
> qemu-7.2: error while loading state for instance 0x0 of device '0000:00:02.0/e1000e'      
> qemu-7.2: load of migration failed: Invalid argument
> 
> We probably at least want to have the default value to be still zero, and
> we'd need to make sure it'll not be modified by the guest, iiuc.
> 
> Below oneliner works for me and makes the migration work again:
> 
> ===8<===
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index 103667c368..563a37b79c 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -113,7 +113,7 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver, uint16_t offset,
>      pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
>                   PCI_ERR_UNC_SUPPORTED);
>      pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
> -                 PCI_ERR_UNC_MASK_DEFAULT);
> +                 0/*PCI_ERR_UNC_MASK_DEFAULT*/);
>      pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
>                   PCI_ERR_UNC_SUPPORTED);
> ===8<===
> 
> Anyone could have a look on a solid solution from PCI side?
> 
> Copy Juan and Leonardo.
> 
> Thanks,

My bad, I forgot about this 🤦.
So we need a property and tweak it with compat machinery depending on
machine type. Jonathan, can you work on this pls?
Or I can revert for now to relieve the time pressure,
redo the patch at your leasure.


> -- 
> Peter Xu


