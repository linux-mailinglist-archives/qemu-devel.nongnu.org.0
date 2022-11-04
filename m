Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C18619D6E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:37:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzgT-00048y-0e; Fri, 04 Nov 2022 12:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqzgR-00048P-71
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqzgP-0003ja-BM
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667579800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pcbnIkm7yFDxFFThtYnvVEKO5/m6mxZ88n/gMxURpzw=;
 b=R1cP8sIj6wAPTuhCtgIHhBrIquEN/NJ1gLpCxQ6yFOK93UdpsLukahBxNgggmdklRd0A9q
 00BXcjfSiHyLlzZiO00/ZRq6IUll/cKyxrOQK+ZQTTn2W+grRMeEsLNNMscMmDOkrujUju
 LacNcxcj5RS45SJRRENBLYeQMQlgClw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-ZkqwJm5xMP6mL0wAYT2bSQ-1; Fri, 04 Nov 2022 12:36:37 -0400
X-MC-Unique: ZkqwJm5xMP6mL0wAYT2bSQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so1945457wmg.0
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pcbnIkm7yFDxFFThtYnvVEKO5/m6mxZ88n/gMxURpzw=;
 b=U6EUkJkv3Oy9jdPyNcBcEM2EynUhSUdmR38lOyZRfltZjjsbqAE45ijMOXSYhiH1mc
 yk8ObbDpaDnTVM++3FfYkRPXu03x+oP30Y5mM8fLlMa4c2vEu81ohEkgbaCpyJWDdvzr
 Uhxen32zOhM8bstNPi9b6t4c3agW6CR2A9rgJIFy+y554N61QKY1Do+1aGa1njJzTH9g
 j9RrLV815reChCyp+1UqWV2rar3MIfBM8MEukc8PGu4Q76RxmgSomL3GHS/5k+7IeceW
 WeF1aZDmX8DDTRu1Pr0anlMWt/zeJHrNCfCVrPteaJrOk/T+V2VdcC8udYtz9k9y827f
 k1Yg==
X-Gm-Message-State: ACrzQf1svOSkCQ2hEQ028h4EXgockh/57Az5jcKI4umW9qL3q53wiIzn
 dNDme7U5ReCntdRyxJ0iA22UbWOUr6TZp9oeo0k3sR2n257MWDscBLOPgQgWYb5i55D3G7YV1O7
 sq250oVNO18z+gWMboPMvC2l53B24AQFZsATciFhAOSr736vVTGOli3C9nuBF
X-Received: by 2002:a5d:42c6:0:b0:235:1b3a:8d2e with SMTP id
 t6-20020a5d42c6000000b002351b3a8d2emr22657167wrr.689.1667579796265; 
 Fri, 04 Nov 2022 09:36:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4VwN/RvN4LJR6nQ7QTDfUUvfOvwhIRGAz1oo1L5WbujpR3zATOkKdFLNQLx4bkSiVi1DRQiw==
X-Received: by 2002:a5d:42c6:0:b0:235:1b3a:8d2e with SMTP id
 t6-20020a5d42c6000000b002351b3a8d2emr22657137wrr.689.1667579795843; 
 Fri, 04 Nov 2022 09:36:35 -0700 (PDT)
Received: from redhat.com ([2.55.180.182]) by smtp.gmail.com with ESMTPSA id
 bs21-20020a056000071500b00228cd9f6349sm3764867wrb.106.2022.11.04.09.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:36:35 -0700 (PDT)
Date: Fri, 4 Nov 2022 12:36:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lev Kujawski <lkujaw@mailbox.org>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PULL 68/86] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Message-ID: <20221104123545-mutt-send-email-mst@kernel.org>
References: <20221031124928.128475-1-mst@redhat.com>
 <20221031124928.128475-69-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-69-mst@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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

On Mon, Oct 31, 2022 at 08:53:57AM -0400, Michael S. Tsirkin wrote:
> From: Lev Kujawski <lkujaw@mailbox.org>
> 
> One method to enable PCI bus mastering for IDE controllers, often used
> by x86 firmware, is to write 0x7 to the PCI command register.  Neither
> the PIIX 3/4 specifications nor actual PIIX 3 hardware (a Tyan S1686D
> system) permit setting the Memory Space Enable (MSE) bit, thus the
> command register would be left in an unspecified state without this
> patch.
> 
> * hw/core/machine.c
>   Facilitate migration by not masking writes to the PIIX 3/4 PCICMD
>   register for machine states of QEMU versions prior to 7.2.
> * hw/ide/piix.c
>   a) Add a reference to the PIIX 4 data sheet.
>   b) Mask the MSE bit using the QEMU PCI device wmask field.
>   c) Define a new boolean property, x-filter-pcicmd, to control
>      whether the write mask is enabled and enable it by default
>      for both the PIIX 3 and PIIX 4 IDE controllers.
> * include/hw/ide/pci.h
>   Add the boolean filter_pcicmd field to the PCIIDEState structure,
>   because the PIIX IDE controllers do not define their own state.
> * tests/qtest/ide-test.c
>   Use the command_disabled field of the QPCIDevice testing model to
>   indicate that PCI_COMMAND_MEMORY is hardwired within PIIX 3/4 IDE
>   controllers.
> 
> Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>
> Message-Id: <20221024094621.512806-3-lkujaw@mailbox.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


Caused test asserts reported by Stefan. Dropped for now,
pls figure the issue out and resubmit. Thanks!
> ---
>  include/hw/ide/pci.h   |  1 +
>  hw/core/machine.c      |  2 ++
>  hw/ide/piix.c          | 24 ++++++++++++++++++++++++
>  tests/qtest/ide-test.c |  1 +
>  4 files changed, 28 insertions(+)
> 
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index d8384e1c42..5424b00a9e 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -53,6 +53,7 @@ struct PCIIDEState {
>      MemoryRegion bmdma_bar;
>      MemoryRegion cmd_bar[2];
>      MemoryRegion data_bar[2];
> +    bool filter_pcicmd; /* used only for piix3/4 */
>  };
>  
>  static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 907fa78ff0..65fdfe2fed 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -42,6 +42,8 @@
>  
>  GlobalProperty hw_compat_7_1[] = {
>      { "virtio-device", "queue_reset", "false" },
> +    { "piix3-ide", "x-filter-pcicmd", "false" },
> +    { "piix4-ide", "x-filter-pcicmd", "false" },
>  };
>  const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>  
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index de1f4f0efb..a3af32e126 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -25,6 +25,8 @@
>   * References:
>   *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
>   *      290550-002, Intel Corporation, April 1997.
> + *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
> + *      Intel Corporation, April 1997.
>   */
>  
>  #include "qemu/osdep.h"
> @@ -160,6 +162,21 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>      uint8_t *pci_conf = dev->config;
>      int rc;
>  
> +    /*
> +     * Mask all IDE PCI command register bits except for Bus Master
> +     * Function Enable (bit 2) and I/O Space Enable (bit 0), as the
> +     * remainder are hardwired to 0 [1, p.48] [2, p.89-90].
> +     *
> +     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
> +     * Enable (MSE, bit 1) is hardwired to 1, but this is contradicted
> +     * by actual PIIX3 hardware, the datasheet itself (viz., Default
> +     * Value: 0000h), and the PIIX4 datasheet [2].
> +     */
> +    if (d->filter_pcicmd) {
> +        pci_set_word(dev->wmask + PCI_COMMAND,
> +                     PCI_COMMAND_MASTER | PCI_COMMAND_IO);
> +    }
> +
>      pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
>  
>      bmdma_setup_bar(d);
> @@ -185,6 +202,11 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
>      }
>  }
>  
> +static Property pci_piix_ide_properties[] = {
> +    DEFINE_PROP_BOOL("x-filter-pcicmd", PCIIDEState, filter_pcicmd, TRUE),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
>  static void piix3_ide_class_init(ObjectClass *klass, void *data)
>  {
> @@ -198,6 +220,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
>      k->device_id = PCI_DEVICE_ID_INTEL_82371SB_1;
>      k->class_id = PCI_CLASS_STORAGE_IDE;
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +    device_class_set_props(dc, pci_piix_ide_properties);
>      dc->hotpluggable = false;
>  }
>  
> @@ -220,6 +243,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
>      k->device_id = PCI_DEVICE_ID_INTEL_82371AB;
>      k->class_id = PCI_CLASS_STORAGE_IDE;
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +    device_class_set_props(dc, pci_piix_ide_properties);
>      dc->hotpluggable = false;
>  }
>  
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index dbe1563b23..d5cec7c14c 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -174,6 +174,7 @@ static QPCIDevice *get_pci_device(QTestState *qts, QPCIBar *bmdma_bar,
>  
>      *ide_bar = qpci_legacy_iomap(dev, IDE_BASE);
>  
> +    dev->command_disabled = PCI_COMMAND_MEMORY;
>      qpci_device_enable(dev);
>  
>      return dev;
> -- 
> MST
> 


