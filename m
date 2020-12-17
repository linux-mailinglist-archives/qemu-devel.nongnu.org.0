Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76102DD9A2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 21:06:59 +0100 (CET)
Received: from localhost ([::1]:52704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpzYA-0000ck-HE
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 15:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kpzWF-0008D7-L6
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:04:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kpzWD-00036J-Gr
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608235495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YW3xTI/bBvLzohhi/BzQh/rq8+tb2jt7pfDMKJqZOkg=;
 b=g/5rPcnIso8jS1QBwGJMK3xLdsF3flEIF7Bx7RGR5iQMiIe5nDX4l7qF8alfEID5/yz2TV
 ytwkU9KHBxMMrf/7Oc3ntpVxn4/k9M3dtCoFpTAJ431GPeZfwSNJP2AqRB4X29FDESLwGL
 +18W/xb2GX5itP5NyTtafr7syuv+TI4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-MBv5HkKTPXOlNhHNr4-N-Q-1; Thu, 17 Dec 2020 15:04:52 -0500
X-MC-Unique: MBv5HkKTPXOlNhHNr4-N-Q-1
Received: by mail-wr1-f71.google.com with SMTP id w9so55261wrt.2
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 12:04:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YW3xTI/bBvLzohhi/BzQh/rq8+tb2jt7pfDMKJqZOkg=;
 b=V+U4nFXuXpIbYdfx9TiXN43Pz2Mb0rCZMa32J8dlbp08OmE9fWfcXFsQiS5ZRpJUBY
 WCilT3Q7D6jD1B/pqyv5xYVweGzJKSFmH46QRP6HOlYhct5/K7FhUq71tpfVM79cntMu
 p2PMZrwHhMAoS+VIYaiY6RSelVxuwyzl1dgyKS5bAPFPh+roK7sMr2DMSJiu1MSjp9pd
 30PrjeNOzEtEDINlMY+ljexeJUaPPq+9lYmkGjNxbWf0kANk7T+l+KTUMb/onA+6sbwf
 4mG6gCu2fFeYZht4XWf8Fl+/GY80UJaCAsXRHMtQ9qMZV4RXKJE2UCBCgaK6TAE32vL8
 60Hw==
X-Gm-Message-State: AOAM5309DvYMlwN9Sz4ReO5RCJLbqtckUKWiTJrIDTeMDFwsNRGdbMDQ
 rxk3bhFEJ63WhKvvKrGghBa2uAo62YWWgCZMUM02K1ccZ1JLxwDazwi7Ie2GSrGDDNSBoV6EcUS
 4mkdoBFHZAr3ovvM=
X-Received: by 2002:adf:fccb:: with SMTP id f11mr503361wrs.3.1608235490816;
 Thu, 17 Dec 2020 12:04:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymncVKPwR5OvnuPFPU1rPoNW7GRLioBDS/VICKbiMFK65HVJVyg344lNZN2cGbtBNbXJ6tiA==
X-Received: by 2002:adf:fccb:: with SMTP id f11mr503335wrs.3.1608235490592;
 Thu, 17 Dec 2020 12:04:50 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id u85sm9484873wmu.43.2020.12.17.12.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 12:04:49 -0800 (PST)
Date: Thu, 17 Dec 2020 15:04:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH] acpi/gpex: Inform os to keep firmware resource map
Message-ID: <20201217144933-mutt-send-email-mst@kernel.org>
References: <20201217132926.4812-1-cenjiahui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201217132926.4812-1-cenjiahui@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xieyingtai@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 09:29:26PM +0800, Jiahui Cen wrote:
> There may be some differences in pci resource assignment between guest os
> and firmware.
> 
> Eg. A Bridge with Bus [d2]
>     -+-[0000:d2]---01.0-[d3]----01.0
> 
>     where [d2:01.00] is a pcie-pci-bridge with BAR0 (mem, 64-bit, non-pref) [size=256]
>           [d3:01.00] is a PCI Device with BAR0 (mem, 64-bit, pref) [size=128K]
>                                           BAR4 (mem, 64-bit, pref) [size=64M]
> 
>     In EDK2, the Resource Map would be:
>         PciBus: Resource Map for Bridge [D2|01|00]
>         Type = PMem64; Base = 0x8004000000;     Length = 0x4100000;     Alignment = 0x3FFFFFF
>            Base = 0x8004000000; Length = 0x4000000;     Alignment = 0x3FFFFFF;  Owner = PCI [D3|01|00:20]
>            Base = 0x8008000000; Length = 0x20000;       Alignment = 0x1FFFF;    Owner = PCI [D3|01|00:10]
>         Type =  Mem64; Base = 0x8008100000;     Length = 0x100; Alignment = 0xFFF
> 
>     While in Linux, kernel will use 0x2FFFFFF as the alignment to calculate
>     the PMem64 size, which would be 0x6000000.
> 
> The diffences could result in resource assignment failure.
> 
> Using _DSM #5 method to inform guest os not to ignore the PCI configuration
> that firmware has done at boot time could handle the differences.
> 
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> ---
>  hw/pci-host/gpex-acpi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 071aa11b5c..2b490f3379 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -112,10 +112,19 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>      UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
>      ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>      ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
> -    uint8_t byte_list[1] = {1};
> +    uint8_t byte_list[1] = {0x21};
>      buf = aml_buffer(1, byte_list);


Hmm what is this change for?

I also noticed something weird.
Spec seems to say for _DSM for PCI Express Slot Information:


Arguments:
Arg0: UUID: E5C937D0-3553-4d7a-9117-EA4D19C3434D
Arg1: Revision ID: 2
Arg2: Function Index: 1
Arg3: Empty Package


how come we are comparing function index to 0 here?



Also, as long as we are changing this probably shouldn't hard-code
1 as array size ...


>      aml_append(ifctx1, aml_return(buf));
>      aml_append(ifctx, ifctx1);
> +
> +    /* PCI Firmware Specification 3.2
> +     * 4.6.5. _DSM for Ignoring PCI Boot Configurations

Note you must always quote the most recent spec that
your change refers to. This is so people can figure out
legacy guest compatibility.

In this case I think this first appeard in 3.1 not 3.2

> +     * The UUID in _DSM in this context is
> +     * {E5C937D0-3553-4D7A-9117-EA4D19C3434D}

This is just five lines earier, I don't think we need it here.

> +     */
> +    ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(5)));

add comment:
	/* Arg2: Function Index: 5 */

> +    aml_append(ifctx1, aml_return(aml_int(0)));


add comment: /* 0 - do not ignore ... (quote spec I don't have it to hand) */




> +    aml_append(ifctx, ifctx1);
>      aml_append(method, ifctx);
>  
>      byte_list[0] = 0;
> -- 
> 2.28.0


