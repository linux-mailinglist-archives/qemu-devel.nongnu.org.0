Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84F75F7AB0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:41:02 +0200 (CEST)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpTB-0001c2-Jp
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ognmF-0004Ox-Rz
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:52:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ognmD-000800-Td
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665150749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i70+oSe4U/BczlqRYkQ+xyhMHFltOGtVMaZLuEpj/l0=;
 b=GRMlfenZOtm/xqZjqukn0Uqmur7/seEZxXViX5YX4LBVCBBvO0ebTxdQOq0tNTEGBkg16S
 pj+71Wqr58pZbKx2sOFmXqNWYK4b6cDS8rGgzpAZlIAFvo59A+akdKbsJFEpII0FaG7WqQ
 DVsiXZzhaUMfBxhYihVCxPAaMxqUJ48=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-MaCBJLXqNx2J3JnOzot5eQ-1; Fri, 07 Oct 2022 09:52:28 -0400
X-MC-Unique: MaCBJLXqNx2J3JnOzot5eQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r4-20020adfbb04000000b0022e5ec02713so1464094wrg.18
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 06:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i70+oSe4U/BczlqRYkQ+xyhMHFltOGtVMaZLuEpj/l0=;
 b=nGEzXsdmMRhkXw7O5l99rj2N147O6J6ke+bIxByG7BXoYdWeMkpDPXOh5sXcqAhUeg
 BZ2acRLnpZprAzkmX2SsMPnJ4hktyLJ6xgX31ZkaDuVAx4vii+vKirFye9giUZlNcJqJ
 0zqJDOnj75jwFn6FyvUQf6bxhhUhST9RcN3/Uera5DKc8dsa3XqczniqYzd86/XJZzBq
 svKL1VnRri067X3afVEG67SGj0U5P/KtpSmbKEi/QlRg4MSUhLO8K+o0Y5wOp7BA5Zge
 OI3xx5kU81V3yP+O04Ps/6v0Ay+ugCUFYL24+ttLPalUImaIUYc2cNRLupGRx5Lif10Q
 8Szg==
X-Gm-Message-State: ACrzQf1FpjCmQ6p0EClalXrArcFeAEDj0AaMkRkussgT/tEPCPAn6Cub
 2N1SzD/wvNd3crQLDHWU0wswvvxGD4fUJ+GkPgZlIMdTnZBT9nkKH1j1+uTBjn1KcrwU3U5VaVn
 GPZg3whArhtNU9hE=
X-Received: by 2002:a05:6000:1688:b0:22e:58cd:5a2b with SMTP id
 y8-20020a056000168800b0022e58cd5a2bmr3262557wrd.365.1665150746897; 
 Fri, 07 Oct 2022 06:52:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7yPgzkt0PZceLv+9jRyG3zbuxVLTbuPlT9bjAPkcZbDjK7ich+OUDNdvopen9LOFzVlyTXOg==
X-Received: by 2002:a05:6000:1688:b0:22e:58cd:5a2b with SMTP id
 y8-20020a056000168800b0022e58cd5a2bmr3262539wrd.365.1665150746611; 
 Fri, 07 Oct 2022 06:52:26 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 o5-20020adfe805000000b00228cd9f6349sm2106917wrm.106.2022.10.07.06.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 06:52:26 -0700 (PDT)
Date: Fri, 7 Oct 2022 09:52:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lev Kujawski <lkujaw@mailbox.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 1/2] qpci_device_enable: Allow for command bits
 hardwired to 0
Message-ID: <20221007095122-mutt-send-email-mst@kernel.org>
References: <20220922060325-mutt-send-email-mst@kernel.org>
 <20220925093759.1598617-1-lkujaw@mailbox.org>
 <20220925093759.1598617-2-lkujaw@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220925093759.1598617-2-lkujaw@mailbox.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 25, 2022 at 09:37:58AM +0000, Lev Kujawski wrote:
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


Can we get this from device's wmask?

>  };
>  
>  struct QPCIAddress {
> -- 
> 2.34.1


