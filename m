Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1644D613F1B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:41:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opba3-0003su-Gn; Mon, 31 Oct 2022 16:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opbZy-0003oU-VD
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:40:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opbZw-0001er-Tt
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667248816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X0cSalSXCOa4oNNxWH/EnUJQatAd0WdN9QNxpxuwPdc=;
 b=Qmdr6QeR6X5yuq0l+WiAkBBV/EDBiP7Hve2sThJmRGFBxl+DmoGTBLU2XXTrMQadppj3n2
 IG5K4Jmjex9vz3ehr4T5bJRz75U3mgjkubEF1PWfzPcT64xNCaIL0/gPeFgaS1v2VRK9Pd
 qwctP7K1ALNquOBTmnExFR45cN6bdXc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-255-ThnE6S_2Mdy16GjG4Rkc8Q-1; Mon, 31 Oct 2022 16:40:14 -0400
X-MC-Unique: ThnE6S_2Mdy16GjG4Rkc8Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c4fd200b003c6ceb1339bso55631wmq.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 13:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0cSalSXCOa4oNNxWH/EnUJQatAd0WdN9QNxpxuwPdc=;
 b=T7NLFyTKjn0+pVMFjkvXMY4ukDPAkgzfQkj0LS229T+FTkKoiXdmEMTQ3VM4TLSIPw
 ImZ8CR6jcboe8pV4KDOLjQwBtSAH996I55aN1V2HExo9yJYqh0eHUP4LLRKoUH3+uBAZ
 mbsz8qoI1HorrGKe+Ca6ZCESRe0CpG6Fi6PZ7pjhZajtYlJjifaCDS4zFVtyBH2JN/Wp
 e4IwGSf+OKVL7lcWcmdZzv72/DVIHt8oJlwlci40b3NOeVxBIRrgReueQ0fJ9L3BV8nU
 H2FNL6geGU9rcB/3g6fvdOIFv8Qch9pKA1N2yMP7WHom0Gy7t8rs17W83Rt/w7WBJspO
 pwiQ==
X-Gm-Message-State: ACrzQf3V/C33j2VLPPMkO8TvksmSSs9eyahBJdt/Is0+EwB2QvQZrVPq
 9f55bp/0syutTPr8S2m7/CdNMzlUIQQsBOEBt44MVLpyoHiG86OTLC74hY2b/DOOVkP918OV0H9
 vMSlI4rCVD4M6zVU=
X-Received: by 2002:a5d:6550:0:b0:236:960f:15cf with SMTP id
 z16-20020a5d6550000000b00236960f15cfmr9421771wrv.177.1667248812673; 
 Mon, 31 Oct 2022 13:40:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM60ivF+mdnquTvWy2lMd3LjqSzuyNIEa/kEGi2NjxY6IwwMM3yaOz9TT4u8twl55dX4+k5bVA==
X-Received: by 2002:a5d:6550:0:b0:236:960f:15cf with SMTP id
 z16-20020a5d6550000000b00236960f15cfmr9421754wrv.177.1667248812390; 
 Mon, 31 Oct 2022 13:40:12 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 k3-20020adfd223000000b00228dbf15072sm8112761wrh.62.2022.10.31.13.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 13:40:11 -0700 (PDT)
Date: Mon, 31 Oct 2022 16:40:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lev Kujawski <lkujaw@mailbox.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 stefanha@redhat.com
Subject: Re: [PATCH 1/2] qpci_device_enable: Allow for command bits hardwired
 to 0
Message-ID: <20221031163908-mutt-send-email-mst@kernel.org>
References: <20221007095229-mutt-send-email-mst@kernel.org>
 <20221024094621.512806-1-lkujaw@mailbox.org>
 <20221024094621.512806-2-lkujaw@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024094621.512806-2-lkujaw@mailbox.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 24, 2022 at 09:46:20AM +0000, Lev Kujawski wrote:
> Devices like the PIIX3/4 IDE controller do not support certain modes
> of operation, such as memory space accesses, and indicate this lack of
> support by hardwiring the applicable bits to zero.  Extend the QEMU
> PCI device testing framework to accommodate such devices.
> 
> * tests/qtest/libqos/pci.h: Add the command_disabled word to indicate
>   bits hardwired to 0.
> * tests/qtest/libqos/pci.c: Verify that hardwired bits are actually
>   hardwired.
> 
> Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>


This patch makes the fuzzer unhappy with qpci_device_enable():
https://gitlab.com/qemu-project/qemu/-/jobs/3253817499

Will drop this patchset for now, pls address and resubmit.



> ---
>  tests/qtest/libqos/pci.c | 13 +++++++------
>  tests/qtest/libqos/pci.h |  1 +
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/libqos/pci.c b/tests/qtest/libqos/pci.c
> index b23d72346b..4f3d28d8d9 100644
> --- a/tests/qtest/libqos/pci.c
> +++ b/tests/qtest/libqos/pci.c
> @@ -220,18 +220,19 @@ int qpci_secondary_buses_init(QPCIBus *bus)
>  
>  void qpci_device_enable(QPCIDevice *dev)
>  {
> -    uint16_t cmd;
> +    const uint16_t enable_bits =
> +        PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
> +    uint16_t cmd, new_cmd;
>  
>      /* FIXME -- does this need to be a bus callout? */
>      cmd = qpci_config_readw(dev, PCI_COMMAND);
> -    cmd |= PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER;
> +    cmd |= enable_bits;
>      qpci_config_writew(dev, PCI_COMMAND, cmd);
>  
>      /* Verify the bits are now set. */
> -    cmd = qpci_config_readw(dev, PCI_COMMAND);
> -    g_assert_cmphex(cmd & PCI_COMMAND_IO, ==, PCI_COMMAND_IO);
> -    g_assert_cmphex(cmd & PCI_COMMAND_MEMORY, ==, PCI_COMMAND_MEMORY);
> -    g_assert_cmphex(cmd & PCI_COMMAND_MASTER, ==, PCI_COMMAND_MASTER);
> +    new_cmd = qpci_config_readw(dev, PCI_COMMAND);
> +    new_cmd &= enable_bits;
> +    g_assert_cmphex(new_cmd, ==, enable_bits & ~dev->command_disabled);
>  }
>  
>  /**
> diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
> index 8389614523..eaedb98588 100644
> --- a/tests/qtest/libqos/pci.h
> +++ b/tests/qtest/libqos/pci.h
> @@ -68,6 +68,7 @@ struct QPCIDevice
>      bool msix_enabled;
>      QPCIBar msix_table_bar, msix_pba_bar;
>      uint64_t msix_table_off, msix_pba_off;
> +    uint16_t command_disabled;
>  };
>  
>  struct QPCIAddress {
> -- 
> 2.34.1


