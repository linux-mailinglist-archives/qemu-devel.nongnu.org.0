Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E973401FB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:25:29 +0100 (CET)
Received: from localhost ([::1]:55680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMouG-000116-3P
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMooT-0003Jp-FK
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:19:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMooO-0005cX-1b
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5J58hYk8zHmKvTbQL9KikQdii1kbAOoKPygoMghCe8=;
 b=B2vvlhlWVFEzt+sAiRTNQZBUFgANEQmMTOq+JHW4R6oV3D5jUImKV2zxPU5RskpywnxpFq
 CzrGlHi09t25QXDaTNxLoWxGAnkxdxqM+Q4pQRnhCb7n7ONlLuHvNTy+5p6AlCzkphgYhV
 SfUuFo5Fu326gwf7Opf6x5Zlano3lw8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-Rg5UlbhQPsa6zLjbcdAHmg-1; Thu, 18 Mar 2021 05:19:21 -0400
X-MC-Unique: Rg5UlbhQPsa6zLjbcdAHmg-1
Received: by mail-wr1-f72.google.com with SMTP id r6so6534994wrt.20
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 02:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a5J58hYk8zHmKvTbQL9KikQdii1kbAOoKPygoMghCe8=;
 b=cun49xAIH4elaCKCgW3gymPj7CB781yqyjw2GQ0e2hl4ojRRhh+dG4a+SEdvRFoiy0
 WpxpxEq8eZq0mnApQ+0pxhtBQjt1zz8yJtYyvh2KS0h+3+e8sSH17ElDzntFiJ6yu6HR
 EhEaFaUymCSk7pM7wofPiXzY8+rnDu3TnYAJWjscVTyFms5YGBx7VsGk48l0/VAyof9u
 o6fKTDke2eTTWf2cPKmKQZeTuqo7PQLjO3Roh+1UauFiC4mZC4btEh55JqdptNfOpp4y
 lmhfIjnUWJyXXv62LDehC5j76LA5tsM8n7dmjDf1xdw9etxGFEKz9a3PJknd8O7ruIEJ
 E70A==
X-Gm-Message-State: AOAM533EsrRRT2TrnBO7RLi9bsVfqt26P1OPVSWS+efll9NKas1B+3aS
 PpU6gBWpXUgfBFiOidj9i/Od5xbpB58axsVqpRhlCkCRIhpG7jnQj4Qe2PftOf7N4GDusxeBaaz
 2EXf7FeIEU8Qe6Mk=
X-Received: by 2002:a5d:698e:: with SMTP id g14mr8431728wru.127.1616059159833; 
 Thu, 18 Mar 2021 02:19:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaAwpyHp0WHZ7AXhtZdq7UyFMiH9HGyS4CV/74eCivK16xgjHCQZCWcz8E5ukCfiuItcH6+g==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr8431706wru.127.1616059159639; 
 Thu, 18 Mar 2021 02:19:19 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j136sm1634911wmj.35.2021.03.18.02.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 02:19:19 -0700 (PDT)
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
Date: Thu, 18 Mar 2021 10:19:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315204226.3481044-6-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

+Paolo / Thomas

On 3/15/21 9:42 PM, Laurent Vivier wrote:
> The machine is based on Goldfish interfaces defined by Google
> for Android simulator. It uses Goldfish-rtc (timer and RTC),
> Goldfish-pic (PIC) and Goldfish-tty (for serial port and early tty).
> 
> The machine is created with 128 virtio-mmio bus, and they can
> be used to use serial console, GPU, disk, NIC, HID, ...
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210312214145.2936082-6-laurent@vivier.eu>
> ---
>  default-configs/devices/m68k-softmmu.mak      |   1 +
>  .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +
>  hw/m68k/virt.c                                | 313 ++++++++++++++++++
>  MAINTAINERS                                   |  13 +
>  hw/m68k/Kconfig                               |   9 +
>  hw/m68k/meson.build                           |   1 +
>  6 files changed, 355 insertions(+)
>  create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h
>  create mode 100644 hw/m68k/virt.c

> diff --git a/hw/m68k/Kconfig b/hw/m68k/Kconfig
> index 60d7bcfb8f2b..f839f8a03064 100644
> --- a/hw/m68k/Kconfig
> +++ b/hw/m68k/Kconfig
> @@ -23,3 +23,12 @@ config Q800
>      select ESP
>      select DP8393X
>      select OR_IRQ
> +
> +config M68K_VIRT
> +    bool
> +    select M68K_IRQC
> +    select VIRT_CTRL
> +    select GOLDFISH_PIC
> +    select GOLDFISH_TTY
> +    select GOLDFISH_RTC
> +    select VIRTIO_MMIO

I had this error on gitlab:

(qemu) QEMU_PROG: -drive driver=IMGFMT,file=TEST_DIR/t.IMGFMT,if=virtio:
'virtio-blk-pci' is not a valid device model name
job: check-system-fedora
https://gitlab.com/philmd/qemu/-/jobs/1106469724

I bisected locally to this commit.

check-system-fedora uses build-system-fedora:

build-system-fedora:
    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
             --enable-fdt=system --enable-slirp=system
             --enable-capstone=system

I'm confused because the machine provides a VIRTIO bus
via MMIO:

config VIRTIO_MMIO
    bool
    select VIRTIO

I remember I tested your machine with virtio-blk-device.

config VIRTIO_BLK
    bool
    default y
    depends on VIRTIO

Ah, this is virtio-blk-pci, which has:

virtio_pci_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true:
files('virtio-blk-pci.c'))
virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)

And VIRTIO_PCI isn't selected...

Are the tests incorrect then?

libqos isn't restricted to PCI:

tests/qtest/libqos/virtio-blk.c:24:#include "virtio-blk.h"
tests/qtest/libqos/virtio-blk.c:29:/* virtio-blk-device */
tests/qtest/libqos/virtio-blk.c:33:    if (!g_strcmp0(interface,
"virtio-blk")) {
tests/qtest/libqos/virtio-blk.c:40:    fprintf(stderr, "%s not present
in virtio-blk-device\n", interface);
tests/qtest/libqos/virtio-blk.c:109:    /* virtio-blk-device */
tests/qtest/libqos/virtio-blk.c:111:
qos_node_create_driver("virtio-blk-device", virtio_blk_device_create);
tests/qtest/libqos/virtio-blk.c:112:
qos_node_consumes("virtio-blk-device", "virtio-bus", &opts);
tests/qtest/libqos/virtio-blk.c:113:
qos_node_produces("virtio-blk-device", "virtio-blk");

But qemu-iotests / qtests do use virtio-blk-pci. Maybe they should
use a generic virtio-blk-device instead, hoping it get plugged correctly
to the virtio bus...


