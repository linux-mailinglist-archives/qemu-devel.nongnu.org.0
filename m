Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB486A7666
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:50:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUKw-00025Z-Fa; Wed, 01 Mar 2023 16:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUKt-00024b-9I
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:50:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUKn-0004vC-7J
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677707384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eC/wyKrwhseKpubERWfSRffsnEgwub8sb0v3XX6IXOc=;
 b=SRLimWsNik3nWtAXZhH/vfEwFNAXzumbvVx5ziZKtbkQXT3/ztpWGQMmllXdoYB+r5/e9D
 41GOFewtqh/YAqsfbwnilsL4zRHTf696SL4ftL5CfO1SSU3yxct5HJX/IoGzarjohqKRWS
 2riAdfu2lg95JFs6B+QO+jdPKbEZt0g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-542-cdwcJHb1N-egkJfTiaRb4Q-1; Wed, 01 Mar 2023 16:49:43 -0500
X-MC-Unique: cdwcJHb1N-egkJfTiaRb4Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so273145wml.2
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677707382;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eC/wyKrwhseKpubERWfSRffsnEgwub8sb0v3XX6IXOc=;
 b=xwkO635OP8uAzyNoyXdjCP3PNJUYn9ixsnVDkgcwTppeuLKZh1oX/WY2pYcveXNcVH
 FllbcpoMabbw93zlYG5e5SrwBoIYibYO9o+WuWMHkcVbhhyQ5JduiV+Vx+mhz9SD7Xhy
 W6BF6IBmjXXO32hKDS+i0B4K+IY3j8LZgU5hshSP+8lHjPFK6vhf4QoBL61vVC2otMgc
 skrh4IX7yj9XYiCHif9JTfcN2K89BDfZRgVa2dFxar7oDiaNSw8/ff51jSAYXBHZ3IcM
 qFCKdRSZs7rlXaNGusN3GgAX90quVqc9+BNzVABg9xbmr5gNLkIE4tHrNrbNWS5R7eUI
 Epow==
X-Gm-Message-State: AO0yUKVITeCTMWBr1byDhBoRcvdFr8rsp8rFTXXuH70TVhRWOE6r37Tu
 jYuhsg64ynAgTuJmdlAgjotcGCCwOrZydljyJuQj9NhgQb4NCjn7cgPryVq7WIhctPtd9SL+jzj
 KTDo84uFQlyKKQUA=
X-Received: by 2002:adf:e48e:0:b0:2c7:885:709c with SMTP id
 i14-20020adfe48e000000b002c70885709cmr6444480wrm.21.1677707382244; 
 Wed, 01 Mar 2023 13:49:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+l3vK0yUh9udfpaaUHL4qKQrUKsVKYWcMqMr4Q+uvFsrOUfplmmSI2PWQhxI3jvHvzPgZPqA==
X-Received: by 2002:adf:e48e:0:b0:2c7:885:709c with SMTP id
 i14-20020adfe48e000000b002c70885709cmr6444474wrm.21.1677707381914; 
 Wed, 01 Mar 2023 13:49:41 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 a5-20020a5d4565000000b002c3f81c51b6sm13359779wrc.90.2023.03.01.13.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:49:41 -0800 (PST)
Date: Wed, 1 Mar 2023 16:49:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 00/12] Q35 PCI host fixes and QOM cleanup
Message-ID: <20230301164900-mutt-send-email-mst@kernel.org>
References: <20230214131441.101760-1-shentey@gmail.com>
 <A090A42F-D368-4671-9C91-716DD2D7CA64@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A090A42F-D368-4671-9C91-716DD2D7CA64@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 21, 2023 at 03:39:28PM +0000, Bernhard Beschow wrote:
> 
> 
> Am 14. Februar 2023 13:14:29 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >This series mostly cleans up QOM-related initialization code. It also performs
> >
> >some modernization and fixing.
> >
> >
> >
> >The first patch originates from "PC and ICH9 clanups" series [1] which has been
> >
> >dropped in v3 in favor of another series [2]. Review comments in [2] suggest it
> >
> >needs more work, so bring the patch back here.
> >
> >
> >
> >Patch 2 fixes a clangd warning and patch 3 modernizes usage of the memory API.
> >
> >
> >
> >Patches 4-9 clean up initialization code.
> >
> >
> >
> >The last four patches also clean up initialization code with the last patch
> >
> >doing the actual cleanup.
> >
> 
> Ping


sent some comments. Philippe was reviewing related patches maybe
he wants to poke at these too.

> >
> >
> >Based-on: <20230213162004.2797-1-shentey@gmail.com>
> >
> >         "[PATCH v4 0/9] PC cleanups"
> >
> >
> >
> >Testing done:
> >
> >* `make check`
> >
> >* `make check-avocado`
> >
> >* `qemu-system-x86_64 -M q35 -m 2G -cdrom \
> >
> >     manjaro-kde-21.3.2-220704-linux515.iso`
> >
> >
> >
> >[1] https://lore.kernel.org/qemu-devel/20230131115326.12454-1-shentey@gmail.com/
> >
> >[2] https://lore.kernel.org/qemu-devel/20230203180914.49112-1-philmd@linaro.org/
> >
> >
> >
> >Bernhard Beschow (12):
> >
> >  hw/i386/pc_q35: Resolve redundant q35_host variable
> >
> >  hw/pci-host/q35: Fix contradicting .endianness assignment
> >
> >  hw/pci-host/q35: Use memory_region_set_address() also for
> >
> >    tseg_blackhole
> >
> >  hw/pci-host/q35: Initialize PCMachineState::bus in board code
> >
> >  hw/pci-host/q35: Initialize "bypass-iommu" property from board code
> >
> >  hw/pci-host/q35: Initialize properties just once
> >
> >  hw/pci-host/q35: Initialize PCI hole boundaries just once
> >
> >  hw/pci-host/q35: Turn PCI hole properties into class properties
> >
> >  hw/pci-host/q35: Rename local variable to more idiomatic "phb"
> >
> >  hw/pci-host/q35: Propagate to errp rather than doing error_fatal
> >
> >  hw/pci-host/q35: Merge mch_realize() into q35_host_realize()
> >
> >  hw/pci-host/q35: Move MemoryRegion pointers to host device
> >
> >
> >
> > include/hw/pci-host/q35.h |  17 +-
> >
> > hw/i386/pc_q35.c          |  33 ++--
> >
> > hw/pci-host/q35.c         | 325 ++++++++++++++++++--------------------
> >
> > 3 files changed, 178 insertions(+), 197 deletions(-)
> >
> >
> >
> >-- >
> >2.39.1
> >
> >
> >


