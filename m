Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39826400397
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:41:16 +0200 (CEST)
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCFf-0007Bj-Ar
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMCEd-0006Qj-8v
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:40:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMCEZ-0003zF-8G
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630687205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pO7DSPpASwbyNf4G45pF/nMHpJ3FwzuOhKgTjWCjas=;
 b=XN0XcHLHLrsBnYGmtW2cvpQjPt8cfwvGM1QVWR+BBjS7PBNg5KwavyV6anfKHMJ7zH8EBj
 u0xQYWV7qhx9G6K3lbPlf+l5oh+YJXvCHwkd4up8oBqCBA6o6K2tDR1ZIyuq3WAWQBwbf0
 foXNjCKT3aSv4TKBud2U8GMRw/2M69o=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-X1XEu6_QNlOTdsUy-iSfQg-1; Fri, 03 Sep 2021 12:40:02 -0400
X-MC-Unique: X1XEu6_QNlOTdsUy-iSfQg-1
Received: by mail-qv1-f71.google.com with SMTP id
 et12-20020a056214176c00b0037279a2ce4cso6198196qvb.13
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 09:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6pO7DSPpASwbyNf4G45pF/nMHpJ3FwzuOhKgTjWCjas=;
 b=KKK54IsJ7cDjbBH8EXCo1FSbHK4T1fRljiu6X2GsC41tOqHA9/CEPhudNQWysA/TKd
 2vR3cjukfARtq1h0SC8kKm+K4U5Th8B2DXQDP7aqP/QHBDWy/YmanSxKcNlwdIn5cp0e
 n/7vUIcQwZt2x2nfk5e4myHBnA8DO494xztCG4i4y/GRwFsieWZBvmW8dMGcJjl93y4k
 er4dQCgxiZgIhTqH3lrIjvJAXMfiVf7TAUlCrua52MZ4RnctBkn7wBxEWfvLgjmAGyNn
 RJnt7aIeY3XDxFEoKvgI0QRN5xF7nbRdlTHLm/Th7i2sq6HLnFRs8BxmJOsKEACKFtNn
 NUMg==
X-Gm-Message-State: AOAM530SdQTKAoR3d7bVcfgBU6DhzbBlmdQqiziMGy0/bjdptvwcXoFn
 e+2vYLfEG58c8dBpsaIFPras2HXhw77XGYOxyEvxmxKo2yEawcySAjZGjv9iJIsB8ZypR++6g/C
 +0/YEOCylANWs0cw=
X-Received: by 2002:a05:6214:23cc:: with SMTP id
 hr12mr4701478qvb.56.1630687202021; 
 Fri, 03 Sep 2021 09:40:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXhRCgSmnW9duzaZTH9IoK5pBUlftIhw58U6R5AYCd9t0Iii7IHokdaov+HjiBVGABVTnkFw==
X-Received: by 2002:a05:6214:23cc:: with SMTP id
 hr12mr4701463qvb.56.1630687201770; 
 Fri, 03 Sep 2021 09:40:01 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id u13sm4167224qki.38.2021.09.03.09.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:40:01 -0700 (PDT)
Date: Fri, 3 Sep 2021 12:39:59 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v6 2/2] memory: Have 'info mtree' remove duplicated
 Address Space information
Message-ID: <YTJP34IFfGAJ4oDp@t490s>
References: <20210903160619.699632-1-philmd@redhat.com>
 <20210903160619.699632-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903160619.699632-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 06:06:19PM +0200, Philippe Mathieu-Daudé wrote:
> Per Peter Maydell [*]:
> 
>   'info mtree' monitor command was designed on the assumption that
>   there's really only one or two interesting address spaces, and
>   with more recent developments that's just not the case any more.
> 
> Similarly about how the FlatView are sorted using a GHashTable,
> sort the AddressSpace objects to remove the duplications (AS
> using the same root MemoryRegion).
> 
> This drastically reduces the output of 'info mtree' on some boards.
> 
> Before:
> 
>   $ (echo info mtree; echo q) \
>     | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
>     | wc -l
>   423
> 
> After:
> 
>   $ (echo info mtree; echo q) \
>     | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
>     | wc -l
>   106
> 
>   (qemu) info mtree
>   address-space: I/O
>     0000000000000000-000000000000ffff (prio 0, i/o): io
> 
>   address-space: cpu-memory-0
>   address-space: cpu-memory-1
>   address-space: cpu-memory-2
>   address-space: cpu-memory-3
>   address-space: cpu-secure-memory-0
>   address-space: cpu-secure-memory-1
>   address-space: cpu-secure-memory-2
>   address-space: cpu-secure-memory-3
>   address-space: memory
>     0000000000000000-ffffffffffffffff (prio 0, i/o): system
>       0000000000000000-000000003fffffff (prio 0, ram): ram
>       000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
>         000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
>         000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
>         000000003f006000-000000003f006fff (prio 0, i/o): mphi
>         000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
>         000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
>         000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
>         000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
>         000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
>         000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
>         000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
>         000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
>         000000003f201000-000000003f201fff (prio 0, i/o): pl011
>         000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
>         000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
>         000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
>         000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
>         000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
>         000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
>         000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
>         000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
>         000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
>         000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
>         000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
>         000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
>         000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
>         000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
>         000000003f980000-000000003f990fff (prio 0, i/o): dwc2
>           000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
>           000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
>         000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
>         000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
>         000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15
>       0000000040000000-00000000400000ff (prio 0, i/o): bcm2836-control
> 
>   address-space: bcm2835-dma-memory
>   address-space: bcm2835-fb-memory
>   address-space: bcm2835-property-memory
>   address-space: dwc2
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
> 
>   address-space: bcm2835-mbox-memory
>     0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
>       0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
>       0000000000000080-000000000000008f (prio 0, i/o): bcm2835-property
> 
>   memory-region: ram
>     0000000000000000-000000003fffffff (prio 0, ram): ram
> 
>   memory-region: bcm2835-peripherals
>     000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
>       000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
>       000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
>       000000003f006000-000000003f006fff (prio 0, i/o): mphi
>       000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
>       000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
>       000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
>       000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
>       000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
>       000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
>       000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
>       000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
>       000000003f201000-000000003f201fff (prio 0, i/o): pl011
>       000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
>       000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
>       000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
>       000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
>       000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
>       000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
>       000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
>       000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
>       000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
>       000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
>       000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
>       000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
>       000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
>       000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
>       000000003f980000-000000003f990fff (prio 0, i/o): dwc2
>         000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
>         000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
>       000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
>       000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
>       000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15
> 
>   (qemu) q
> 
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg829821.html
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks Phil.

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


