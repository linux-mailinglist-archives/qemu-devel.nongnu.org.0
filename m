Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF076A1F8A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 17:23:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVaqb-0003n9-CH; Fri, 24 Feb 2023 11:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pVaqX-0003kp-Ca
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 11:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pVaqV-000340-Ow
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 11:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677255775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qh9mU1AugbccuulwMD5HZVrwRNvOsYTsnWhactVasd4=;
 b=NYkiYUuGYnxhcaTxnNSmnbEui5wU1QXoAzCXFrNsBA0HMvdMeZf504jdgREJmxfI3U/TfJ
 JEgOluZwNU4VaXADcGsO9Lh7r6HxTO0nYCzjQ5o+ElPFBBkbeDGSXdPIhbCxCwTXqfKpDA
 yxRJR4AoNaGwNOzbTb/fpsZaE01cyYA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-mTWP2zqTM0GtFsIPBTG2_w-1; Fri, 24 Feb 2023 11:22:53 -0500
X-MC-Unique: mTWP2zqTM0GtFsIPBTG2_w-1
Received: by mail-wr1-f70.google.com with SMTP id
 o15-20020a05600002cf00b002c54a27803cso3223933wry.22
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 08:22:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qh9mU1AugbccuulwMD5HZVrwRNvOsYTsnWhactVasd4=;
 b=enP4RwMEuihtSl1wukPxvHJZv5R6PIzw1iJw7qqyyWb1AlZmLh8rcISbFt1S4nFF7i
 Bbgcsm9iEat2uBUhPqQyVPVSEpmGMKHxU0Nu95SNO0d6FMOOnxETp6xl6+L2QRiY7+AE
 by/5qZSh6sDN1MDYKbCM846Mji1hijffxIOom0ngm/atEZFO3W/7rWT4UTFKgJY1nG+e
 taPvsOv3qpJfiWltnD8NpWdOM4tM5RzC9A0WVuKcZVoUbsv1LReDLPbVVvsz1SuwQ6f8
 NYxnR9npWZVBy+kdb2lQ60YaWZCHMPB47ObTsmR4YXPh2eYtlaYg9cSbSwJYuFqnywsl
 oFtA==
X-Gm-Message-State: AO0yUKXD4fPe77sfVrk33stybyOOL3MvvV8dSofdgWqIn+tT3tKxXUCw
 0wcK5hWrbGOlAfYbrb+7q8lwSTBCxZn3AAejQBWnRw8pk0saglWVDWTrf47474N38fb5NVjENdO
 zF43ez1A3De9zD3Q=
X-Received: by 2002:a5d:53c7:0:b0:2c5:99df:f12 with SMTP id
 a7-20020a5d53c7000000b002c599df0f12mr15054442wrw.30.1677255772569; 
 Fri, 24 Feb 2023 08:22:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+gmPSmhdBV/McfUAnIVv4UQvqNpWuZwIcO1emj4tVoZljY4/rLW6fquDx9V3qExGIjq6jWrQ==
X-Received: by 2002:a5d:53c7:0:b0:2c5:99df:f12 with SMTP id
 a7-20020a5d53c7000000b002c599df0f12mr15054424wrw.30.1677255772213; 
 Fri, 24 Feb 2023 08:22:52 -0800 (PST)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 a18-20020adfe5d2000000b002be505ab59asm14219543wrn.97.2023.02.24.08.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:22:51 -0800 (PST)
Date: Fri, 24 Feb 2023 11:22:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 00/10] Resolve isabus global
Message-ID: <20230224112230-mutt-send-email-mst@kernel.org>
References: <20230126211740.66874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230126211740.66874-1-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 26, 2023 at 10:17:30PM +0100, Bernhard Beschow wrote:
> This series resolves the global "isabus" variable and is basically a v2 of [1].
> Note that the majority of the work consists of fixing ISA API calls in PIIX IDE
> which implicitly rely on the usage of the isabus global.
> 
> Rather than adding an ISABus pointer in PCIIDEState as in [1] this series uses
> a qemu_irq array which is roughly the approach outlined in [2]. Moreover, this
> series considers backwards compatibility for user-created PIIX IDE
> "Frankensten" devices by fishing out TYPE_ISA_BUS from the QOM tree inside
> the PIIX IDE device model. This hack can be removed again once a deprecation
> period of user-createable PIIX IDE devices is over. This deprecation wasn't
> announced yet but now might be a good time.
> 
> This series is structured as follows: The first three patches massage the ISA
> code for patch 8. Patches 4-8 change the PIIX IDE device models to not use the
> isabus global implicitly. Finally, the last two patches clan up and remove the
> isabus singleton.

I expect there will be a v3 of this, right?


> Based-on: <20230109172347.1830-1-shentey@gmail.com>
>           'Consolidate PIIX south bridges'
> 
> v2:
> - Big rework sticking closer to [1], giving it more credit and reusing one patch
> - Add io port cleanup
> - Rebase onto [4] so changes to PIIX could be done once and centrally
> 
> Testing done:
> * `make check`
> * `./qemu-system-x86_64 -M x-remote -device piix3-ide` still fails gracefully with
>   `qemu-system-x86_64: -device piix3-ide: No ISA bus found while piix3-ide requires one`
> * `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
> * `qemu-system-x86_64 -M q35 -m 2G -device piix4-ide -cdrom \
>    manjaro-kde-21.3.2-220704-linux515.iso`
> * `qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda \
>   debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=ttyS0"`
> 
> [1] https://patchew.org/QEMU/20210518215545.1793947-1-philmd@redhat.com/
> [2] https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg01707.html
> [3] https://people.debian.org/~aurel32/qemu/mips/
> [4] https://patchew.org/QEMU/20230109172347.1830-1-shentey@gmail.com/
> 
> Bernhard Beschow (9):
>   softmmu/ioport: Move portio_list_init() in front of portio_list_add()
>   softmmu/ioport: Merge portio_list_add() into portio_list_init()
>   softmmu/ioport: Remove unused functions
>   hw/ide/piix: Disuse isa_get_irq()
>   Revert "hw/ide: Fix crash when plugging a piix3-ide device into the
>     x-remote machine"
>   hw/ide/pci: Add PCIIDEState::isa_irqs[]
>   hw/ide/piix: Require an ISABus only for user-created instances
>   hw/ide: Let ide_init_ioport() take a MemoryRegion argument instead of
>     ISADevice
>   hw/isa/isa-bus: Resolve isabus global
> 
> Philippe Mathieu-Daudé (1):
>   hw/isa: Remove use of global isa bus
> 
>  include/exec/ioport.h     |  8 ++---
>  include/hw/ide/internal.h |  3 +-
>  include/hw/ide/pci.h      |  2 ++
>  include/hw/isa/isa.h      | 15 ++++----
>  hw/audio/adlib.c          |  4 +--
>  hw/display/qxl.c          |  5 ++-
>  hw/display/vga.c          |  8 ++---
>  hw/dma/i82374.c           |  6 ++--
>  hw/ide/ioport.c           | 19 +++++-----
>  hw/ide/isa.c              |  4 ++-
>  hw/ide/piix.c             | 75 +++++++++++++++++++++++++++++++--------
>  hw/isa/isa-bus.c          | 54 +++++++++++++++-------------
>  hw/isa/piix.c             |  5 +++
>  hw/watchdog/wdt_ib700.c   |  4 +--
>  softmmu/ioport.c          | 70 +++++++++++-------------------------
>  15 files changed, 149 insertions(+), 133 deletions(-)
> 
> -- 
> 2.39.1
> 


