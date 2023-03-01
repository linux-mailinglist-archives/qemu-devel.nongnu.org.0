Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250236A766A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:51:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXULs-0002dg-54; Wed, 01 Mar 2023 16:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXULl-0002bc-2B
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:51:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXULj-0005P2-AR
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:51:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677707457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NF1wbKg8/hnMjsv5UggJIOWD+FSCJqEwnDBR+m8EGXk=;
 b=iARuWFDE61tvHBVR8rxsejoQu5G39rQAn+a7fRTTxf0K4eEJnmbe4+oiOoFlFfFPljxPfy
 3ZJGOY5BpFcQMgUoeRBNGWgMIePZsL1hOpX5aBuileQjbXqBW1xi8UfEJK77cK5uqaYij8
 MBOCII9e8vS8XYKO3nOk4EXoV1MgVtQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-T5P1wE9dPLuIBiCYzw9mGQ-1; Wed, 01 Mar 2023 16:50:56 -0500
X-MC-Unique: T5P1wE9dPLuIBiCYzw9mGQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so274679wml.2
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677707456;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NF1wbKg8/hnMjsv5UggJIOWD+FSCJqEwnDBR+m8EGXk=;
 b=GLVL8fOclR3hMtG+lK4r11F/ymgqHKTdThK579+ZOCikJkkYZIow1TOcdK1TmeqIkj
 1f6WXgPMis/ayaQy4O0tsjtJl6b87QyOU4Px3Vgb1H5RbloeGTkQTXw3Ki0jFqXfA1ML
 ls7Y67h6DD4AIUGkgAa6AFEvQMKuzlEaH1ajFW3tCB1VsoNZUQ9gF/pgm+lYDWOw7/W1
 WRR7DyQlX9qOM17QZn/Hi6hEwh2+bGmlPAa7A7a8x6/gCtBwPwtPQu+/yR4ZQszv177I
 tSKmEYO4bZ7dxtQCU/p9chrk9J++JZdyx0kujPRnu6nOO8RqcTFCLWRlsO4Pb7Rn1VFX
 Hvjg==
X-Gm-Message-State: AO0yUKXzsQhFFtBzEWuc0jOTeitX3LYGK+cn8IAB9h616NtCgGddAvLg
 U1TNqKEoG0qCwNFZMoeHwOdCTCUFHi4qS33HOKrRpt00psxgOvp1SaR/u7lO23lPACThHmlAKOs
 h3WOlafsHMkGT6nw=
X-Received: by 2002:adf:f549:0:b0:2c7:ffd:f483 with SMTP id
 j9-20020adff549000000b002c70ffdf483mr5903768wrp.41.1677707455809; 
 Wed, 01 Mar 2023 13:50:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9YTWGWvbHbNJbpgKYVRCkn53WDZnlS7faIoTBZzz1WtbyozMewc5jxf+3RH5EQvbbvA+zkfw==
X-Received: by 2002:adf:f549:0:b0:2c7:ffd:f483 with SMTP id
 j9-20020adff549000000b002c70ffdf483mr5903760wrp.41.1677707455501; 
 Wed, 01 Mar 2023 13:50:55 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 c10-20020a056000104a00b002c5544b3a69sm13292528wrx.89.2023.03.01.13.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:50:55 -0800 (PST)
Date: Wed, 1 Mar 2023 16:50:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 00/12] Q35 PCI host fixes and QOM cleanup
Message-ID: <20230301165036-mutt-send-email-mst@kernel.org>
References: <20230214131441.101760-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Feb 14, 2023 at 02:14:29PM +0100, Bernhard Beschow wrote:
> This series mostly cleans up QOM-related initialization code. It also performs
> some modernization and fixing.
> 
> The first patch originates from "PC and ICH9 clanups" series [1] which has been
> dropped in v3 in favor of another series [2]. Review comments in [2] suggest it
> needs more work, so bring the patch back here.
> 
> Patch 2 fixes a clangd warning and patch 3 modernizes usage of the memory API.

what's the warning? commit log says nothing about it.

> Patches 4-9 clean up initialization code.
> 
> The last four patches also clean up initialization code with the last patch
> doing the actual cleanup.
> 
> Based-on: <20230213162004.2797-1-shentey@gmail.com>
>          "[PATCH v4 0/9] PC cleanups"
> 
> Testing done:
> * `make check`
> * `make check-avocado`
> * `qemu-system-x86_64 -M q35 -m 2G -cdrom \
>      manjaro-kde-21.3.2-220704-linux515.iso`
> 
> [1] https://lore.kernel.org/qemu-devel/20230131115326.12454-1-shentey@gmail.com/
> [2] https://lore.kernel.org/qemu-devel/20230203180914.49112-1-philmd@linaro.org/
> 
> Bernhard Beschow (12):
>   hw/i386/pc_q35: Resolve redundant q35_host variable
>   hw/pci-host/q35: Fix contradicting .endianness assignment
>   hw/pci-host/q35: Use memory_region_set_address() also for
>     tseg_blackhole
>   hw/pci-host/q35: Initialize PCMachineState::bus in board code
>   hw/pci-host/q35: Initialize "bypass-iommu" property from board code
>   hw/pci-host/q35: Initialize properties just once
>   hw/pci-host/q35: Initialize PCI hole boundaries just once
>   hw/pci-host/q35: Turn PCI hole properties into class properties
>   hw/pci-host/q35: Rename local variable to more idiomatic "phb"
>   hw/pci-host/q35: Propagate to errp rather than doing error_fatal
>   hw/pci-host/q35: Merge mch_realize() into q35_host_realize()
>   hw/pci-host/q35: Move MemoryRegion pointers to host device
> 
>  include/hw/pci-host/q35.h |  17 +-
>  hw/i386/pc_q35.c          |  33 ++--
>  hw/pci-host/q35.c         | 325 ++++++++++++++++++--------------------
>  3 files changed, 178 insertions(+), 197 deletions(-)
> 
> -- 
> 2.39.1
> 


