Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE8963B0A9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 19:03:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oziS6-0004tx-4F; Mon, 28 Nov 2022 13:01:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1oziS0-0004sk-8a
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:01:53 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1oziRw-0003Ix-TL
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 13:01:50 -0500
Received: by mail-qt1-x82e.google.com with SMTP id l2so7225816qtq.11
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 10:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UwG5p8IQE1UGVQWrYep9M1WjUfwCOY/agkbTrcq5miU=;
 b=RCyHi9hwDSE3J/AHA8jw4Z7EA6VS7KMiUpq3n8a/WKUZ+1PMtN1fIeZcYe5vbYxyE6
 Tc2GNHRRRoZ2KcD0oTOSebGeBI3WqUvLVlk6pPKSwgA8yjip1qGO9CDZN0PhQS7M4PzP
 APP1EZjQ1rGxPlI1NvrbmPQqr5OxtwhdYdYImwk+t25jqXpAlyIXUtlb6Vw6rhMVKOJ1
 ed0LtB/T/p5iNpTSXsZytoGz8kPMXGznEwLHWfZqDN+p3vpI+sqkQUUBvgSSHZ5Qriy0
 xartjVPPOo7T6gjYa74uqBlXbIuFLxRa3CmVjzZSBdwL2G37gVo2vdjiK2ErU1b3KX+y
 7tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UwG5p8IQE1UGVQWrYep9M1WjUfwCOY/agkbTrcq5miU=;
 b=yHLVjHkJyIujEUj9SVHdy1uNPxS5LtF0JmU4eCYvwNUyy/3kwuLK7BfU3jkX259xtC
 wuj/H2IKrkhOQ7uZK8bLp2Deo0IyCk3bemHBLuF5iiJFQr0gMZop6Xp37pxEedHRUjvI
 +2PQFfr8NMS1b1Yoc8QZ0PKE0P/JFzQP/dj/6hxWXPu5hj0FtAMlbgDvGOSvZCnjrjQR
 OJCpmfXrTW2rFMu/lEfFI83ndh2gVpDWwRp8S0oBXlUqfMKMAo1d2/rJMPF67nfR90m1
 SHC227H11aHvfmN/yjALAN4fPVnmaTYoJoxnvGadYP701exsH3Olt0JeHRtkN0jbBu4U
 2Tqw==
X-Gm-Message-State: ANoB5pmfIPDR0nsh3wn3FPyhwQVz1EyONRvvj7vVkp8Cw2kbks7YHJTH
 bSXdQf67eGAsriPqnsj1fsJXIw==
X-Google-Smtp-Source: AA0mqf6XoOey/AP2fzMVBKOHGLrKr/wvWMVuMThokL6wgvIHZ1YXKjAMcEltHKgLC3qNwC1u/LQ0HQ==
X-Received: by 2002:ac8:67d0:0:b0:399:acab:ed6d with SMTP id
 r16-20020ac867d0000000b00399acabed6dmr49642544qtp.101.1669658505287; 
 Mon, 28 Nov 2022 10:01:45 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05620a284400b006bb29d932e1sm8798602qkp.105.2022.11.28.10.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 10:01:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oziRr-00GboS-3d;
 Mon, 28 Nov 2022 14:01:43 -0400
Date: Mon, 28 Nov 2022 14:01:43 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Marc Zyngier <maz@kernel.org>
Cc: chenxiang <chenxiang66@hisilicon.com>, alex.williamson@redhat.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, linuxarm@huawei.com
Subject: Re: [PATCH v2] vfio/pci: Verify each MSI vector to avoid invalid MSI
 vectors
Message-ID: <Y4T3h+rzGBPo7FLj@ziepe.ca>
References: <1669167756-196788-1-git-send-email-chenxiang66@hisilicon.com>
 <Y3+xTLC0io6wvPpf@ziepe.ca> <871qpquful.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qpquful.wl-maz@kernel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e; envelope-from=jgg@ziepe.ca;
 helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Nov 26, 2022 at 11:15:14AM +0000, Marc Zyngier wrote:

> > Physical hardware doesn't do this, virtual emulation shouldn't either.
> 
> If you want to fix VFIO, be my guest. My rambling about the sorry
> state of this has been in the kernel for 5 years (ed8703a506a8).

We are talking about things. Stuff we want to do doesn't work, or is
completely insane right now.

> > People are taking too many liberties with trapping the PCI MSI
> > registers through VFIO. :(
> 
> Do you really want to leave access to the MSI BAR to userspace? The
> number of ways this can go wrong is mind-boggling. 

Yeah, actually I do. This is basically mandatory to do something like
IMS, SIOV, etc.

> Starting with having to rebuild the interrupt translation tables on
> the host side to follow what the guest does, instead of keeping the
> two independent.

At least on x86 most of the discussion has been about teaching the
interrupt controller to go to the hypervisor to get help when
establishing interrupts. The hypervisor can tell the guest what the
real MSI data is.

This is following the example of hyperv which plugs in a hyper call to
HVCALL_MAP_DEVICE_INTERRUPT in its remapping irq_chip. This allows the
hypervisor to tell the guest a real addr/data pair and the hypervisor
does not have to involve itself in the device programming.

We haven't reached a point of thinking in detail about ARM, but I would
guess the general theme would still apply.

Jason

