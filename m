Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F274B9975
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 07:49:19 +0100 (CET)
Received: from localhost ([::1]:46474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKabF-0002HC-3w
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 01:49:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKaPU-0005qw-86
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:37:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKaPG-0002TE-St
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 01:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645079806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DT+1gkjLu6rYoRgQ72JKCrcr3jDcAgRKWOHsvqhyWhI=;
 b=PzFUUMVjr8x3/+JTJXCRkPmSK56DdlZC2fXp2r3Q7ZsrkuQKqLf2Bozn/uo7Fl934Ha/kB
 u8h5W6Ev/U1qu+GL00tlaVYUwUNnKpb2W0hgRwz7xkec69DniACA4AzsEIswvqjViNmvwa
 4wPR7iuuFfD92axdAW3CI0A46VR0gOg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-8KxV_iu8M3CuG2A0mEeu_Q-1; Thu, 17 Feb 2022 01:36:45 -0500
X-MC-Unique: 8KxV_iu8M3CuG2A0mEeu_Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 n3-20020a05600c294300b0037bc685b717so1244110wmd.8
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 22:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DT+1gkjLu6rYoRgQ72JKCrcr3jDcAgRKWOHsvqhyWhI=;
 b=azYbhnBO0CAG3QxzlJVrcnWXbrzowORDNZ4i+T9+JLGq/VhC5mJDlx05VXdAFE21bI
 QoycTB+OTxMRKUT06JNAgQo37L/uRSO0z6OWp51rr01yeE9FegRGPRo66YeEL3tNlJ1u
 XUF/qulrAU/D73VLCJ3jkweH3jRe8aXfMnpIHkQzUBaKAIlAIlpaEhuNQgoFYnW1IoYU
 GN8zlDgiR/x+iXxVbDHGbuq/YENo8T+noIB8U5ekRW4aSKRUCqtylsyuDYJzux0QBPLD
 eE3pDNV7QLV6G83kvgqnFBUY33U1Xs7HYylxj/LRtty0N1mCEG4IRE0R0efuxh6rJJug
 0fkQ==
X-Gm-Message-State: AOAM532MEL9B87dOomyZK4PBsRspjRbu38nCPMFwe8fymH0VKmVfSFXw
 D8nhCtpzLrXs8oO66PT0lqnwJTNtfvjDVq4mBuPIsmW6pb/je4iJIb2EhHkBSoJfD7rjlvED+4Q
 ewB26izgi5bstLfI=
X-Received: by 2002:a7b:c201:0:b0:350:de40:c295 with SMTP id
 x1-20020a7bc201000000b00350de40c295mr4743210wmi.103.1645079803366; 
 Wed, 16 Feb 2022 22:36:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiJxI92qpyHOhut8/vpCFyPO89odoCcQTMKHT0KsFsehilVZillqgt4j8ATOW38Xwzq4uCwQ==
X-Received: by 2002:a7b:c201:0:b0:350:de40:c295 with SMTP id
 x1-20020a7bc201000000b00350de40c295mr4743195wmi.103.1645079803101; 
 Wed, 16 Feb 2022 22:36:43 -0800 (PST)
Received: from redhat.com ([2.55.139.83])
 by smtp.gmail.com with ESMTPSA id u11sm37455454wrt.108.2022.02.16.22.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 22:36:42 -0800 (PST)
Date: Thu, 17 Feb 2022 01:36:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v3 0/7] malta: Fix PCI IRQ levels to be preserved during
 migration, cleanup
Message-ID: <20220217013601-mutt-send-email-mst@kernel.org>
References: <20220216224519.157233-1-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220216224519.157233-1-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 11:45:12PM +0100, Bernhard Beschow wrote:
> Tested with [1]:
> 
>   qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda \
>   debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"
> 
> It was possible to log in as root and `poweroff` the machine.
> 
> Moreover, I ran:
> 
>   :$ make check
>   Ok:                 569
>   Expected Fail:      0
>   Fail:               0
>   Unexpected Pass:    0
>   Skipped:            178
>   Timeout:            0
> 
> [1] https://people.debian.org/~aurel32/qemu/mips/
> 

Who's merging this? I assume mips guys?

> v3:
>   The migration bug now gets fixed in gt64xxx_pci before any cleanup. As
>     suggested by PMM the patch is based on commit e735b55a8c11.
>   The code movement patch now moves the already fixed code. I might be a bit
>     too conservative here by removing Philippe's Reviewed-By tag.
>   As suggested by BALATON Zoltan, the redundant i8259[] attribute is now
>     resolved immediately after the code movement. As a side effect, it also
>     removes moved code which doesn't adhere to the coding style (local loop
>     variable).
>   To address BALATON Zoltan's comment and to reduce the number of required
>     Reviewed-By's, only piix4_set_irq() is modified to expect own DeviceState
>     paremeter. Up to v2, all remaining set_irq() functions were changed this
>     way.
>   The patch resolving piix4's singleton variable got split into two patches:
>     One which resolves the singleton variable and one which replaces magic
>     constants. The split patches should be more comprehensible.
>   Suggested by BALATON Zoltan, I took a chance to resolve gt64120_register(),
>     a method akin to the legacy init functions we're trying to get rid of.
> 
> v2:
>   isa/piix4: Fix PCI IRQ levels to be preserved in VMState
>   isa/piix4: Resolve redundant i8259[] attribute
> 
> Bernhard Beschow (7):
>   hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be preserved during
>     migration
>   malta: Move PCI interrupt handling from gt64xxx_pci to piix4
>   hw/isa/piix4: Resolve redundant i8259[] attribute
>   hw/isa/piix4: Pass PIIX4State as opaque parameter for piix4_set_irq()
>   hw/isa/piix4: Resolve global instance variable
>   hw/isa/piix4: Replace some magic IRQ constants
>   hw/mips/gt64xxx_pci: Resolve gt64120_register()
> 
>  hw/isa/piix4.c                | 54 +++++++++++++++++++++--
>  hw/mips/gt64xxx_pci.c         | 80 +++--------------------------------
>  hw/mips/malta.c               | 17 ++++----
>  include/hw/mips/mips.h        |  3 --
>  include/hw/southbridge/piix.h |  2 -
>  5 files changed, 65 insertions(+), 91 deletions(-)
> 
> -- 
> 2.35.1
> 
> 
> 


