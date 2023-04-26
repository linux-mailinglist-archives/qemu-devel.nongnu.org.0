Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57736EEB92
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:43:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTF2-0007jG-Gb; Tue, 25 Apr 2023 20:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prTEv-0007iJ-RI
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:42:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prTEn-0006Kj-TR
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682469740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NXzSpAgHeUU/6xLQAwDBMqmvrEGmgD7eHtwtuM0EoGU=;
 b=NgC7ceKB7VbyEDkBxMGO0y76ZoTWmL3G+jSdZytxWhtr3fbfKm8l1uD7qtrn5f7YaSe/nO
 MqTWQT/NbSXRncIwba8Avr46JthzX6fp/Mf/HSF3+T/WVdRDi9moUph5df/MedmxjdZpfS
 LNbZsi2RRRMwjRXVeMtW5rEGP6Vub9o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-o33lKzyNPL-yEpaRneeOiw-1; Tue, 25 Apr 2023 20:42:19 -0400
X-MC-Unique: o33lKzyNPL-yEpaRneeOiw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-5ef67855124so5575706d6.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 17:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682469739; x=1685061739;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NXzSpAgHeUU/6xLQAwDBMqmvrEGmgD7eHtwtuM0EoGU=;
 b=Wgc/UuMvC/PCHELSXRO1SGLCkj4rSktomutTHkE35/z2qwoZvbYHnhTxu3tIClVVJh
 QzBhx0LPT7Q/o9G3Nzot8twzF7LKTZVAkCgp7eGTQCxcdo5GN8PTnsV0gFCHcsa05AwU
 WAmm9aiLqgK5D6r5sMpPLkAfECoJF3/UeLGcwAu9b/oVvSEvfhqK7Uj/5vJFF45m60Lq
 qtLNMXIhQROfaMNVK52Zg/mrARzBmCCZZoISMn9KmtMjcrSJ7mY5KYY8JHX5HyACpcdE
 hAALp6ZVzliZV/kBPfPLP2sQnV1Lscd6Yb3SE5sCedKZumokmC74sXPHQ3KrNBJktuyR
 5kSQ==
X-Gm-Message-State: AAQBX9fsnqO9fPpT5/+LUkIrkF/QxplcAL38NQfJK6iI6U4KVpzwnbHz
 Wt/1UHuFCQ/5LHAvuGHFvsC/8ThIVwtfWinezGEd9y4BlW0rvvhu9zqalG1WClz9Lg3FzX1Hv6M
 CeQKK2eDRlne4yl4=
X-Received: by 2002:a05:6214:400a:b0:5ef:55d8:7164 with SMTP id
 kd10-20020a056214400a00b005ef55d87164mr29994584qvb.5.1682469739156; 
 Tue, 25 Apr 2023 17:42:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350YKy+LRlgT6gpnKM/Iy0UanTo5mlROwsRwXg9yGYwuhycatan4xi9OoZtFVAW9SKyA6JNz17w==
X-Received: by 2002:a05:6214:400a:b0:5ef:55d8:7164 with SMTP id
 kd10-20020a056214400a00b005ef55d87164mr29994567qvb.5.1682469738890; 
 Tue, 25 Apr 2023 17:42:18 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 a21-20020a0ca995000000b005ef4de2cc3bsm4481374qvb.138.2023.04.25.17.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 17:42:18 -0700 (PDT)
Date: Tue, 25 Apr 2023 20:42:17 -0400
From: Peter Xu <peterx@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PULL 61/73] hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register
Message-ID: <ZEhzaWpNM+NvZCUw@x1n>
References: <cover.1678237635.git.mst@redhat.com>
 <010746ae1db7f52700cb2e2c46eb94f299cfa0d2.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <010746ae1db7f52700cb2e2c46eb94f299cfa0d2.1678237635.git.mst@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Hi, Michael, Jonathan,

On Tue, Mar 07, 2023 at 08:13:53PM -0500, Michael S. Tsirkin wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> This register in AER should be both writeable and should
> have a default value with a couple of the errors masked
> including the Uncorrectable Internal Error used by CXL for
> it's error reporting.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Message-Id: <20230302133709.30373-2-Jonathan.Cameron@huawei.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Fan Ni <fan.ni@samsung.com>
> ---
>  include/hw/pci/pcie_regs.h | 3 +++
>  hw/pci/pcie_aer.c          | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
> index 1fe0bdd25b..4972106c42 100644
> --- a/include/hw/pci/pcie_regs.h
> +++ b/include/hw/pci/pcie_regs.h
> @@ -141,6 +141,9 @@ typedef enum PCIExpLinkWidth {
>                                           PCI_ERR_UNC_ATOP_EBLOCKED |    \
>                                           PCI_ERR_UNC_TLP_PRF_BLOCKED)
>  
> +#define PCI_ERR_UNC_MASK_DEFAULT        (PCI_ERR_UNC_INTN | \
> +                                         PCI_ERR_UNC_TLP_PRF_BLOCKED)
> +
>  #define PCI_ERR_UNC_SEVERITY_DEFAULT    (PCI_ERR_UNC_DLP |              \
>                                           PCI_ERR_UNC_SDN |              \
>                                           PCI_ERR_UNC_FCP |              \
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

This breaks the simplest migration from QEMU 8.0->7.2 binaries on all
machine types I think as long as the cap is present, e.g. the default
e1000e provided by the default q35 machine can already hit it with all
default cmdline:

  ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]

7.2 binary will have empty wmask for PCI_ERR_UNCOR_MASK, meanwhile I think
it can also see a non-zero value, then the migration will fail at:

vmstate_load 0000:00:02.0/e1000e, e1000e                                                   
qemu-7.2: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
qemu-7.2: Failed to load PCIDevice:config   
qemu-7.2: Failed to load e1000e:parent_obj                                                
qemu-7.2: error while loading state for instance 0x0 of device '0000:00:02.0/e1000e'      
qemu-7.2: load of migration failed: Invalid argument

We probably at least want to have the default value to be still zero, and
we'd need to make sure it'll not be modified by the guest, iiuc.

Below oneliner works for me and makes the migration work again:

===8<===
diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index 103667c368..563a37b79c 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -113,7 +113,7 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver, uint16_t offset,
     pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
                  PCI_ERR_UNC_SUPPORTED);
     pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
-                 PCI_ERR_UNC_MASK_DEFAULT);
+                 0/*PCI_ERR_UNC_MASK_DEFAULT*/);
     pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
                  PCI_ERR_UNC_SUPPORTED);
===8<===

Anyone could have a look on a solid solution from PCI side?

Copy Juan and Leonardo.

Thanks,

-- 
Peter Xu


