Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B69B64A0D6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4inc-0002OX-PX; Mon, 12 Dec 2022 08:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4imy-0002Cr-Lv
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:24:24 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4imw-0005UI-Kc
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:24:12 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m19so5299067wms.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=P8BnJQe1AYgY7mJ9sKiUbVpWXK/QSJLMfu7WJ4qxq/U=;
 b=R1loVUvr75Fq0GBAV1wzRz+uJFvFLvMNBb9CrcH98TGS4pSoZvabUIPWWl4Rpf1U1o
 obHyBsewM9vCKser8gH3HzkUybZddDR5wnSkwGZp091RjF1TTH9E2e/ane1A3NGZa10k
 oLvulcnpPv78cQvaPEnbL3rKwRfaVkOYvay147s+FX5wil15bKp9Cme1EueCTjPS66ot
 P8vmexXi0BbNwU/NqSmpRsRlq8ajMKBt0dz9hx3U35pnd9+OW6O5VQ901L7yE/eJorbw
 WSNUeLFDw56SF0VOBpybDwMzDkjVrCT5c4nhB62ZAh5xwaRnLMd5CiRkst6mE2CceIHa
 W1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P8BnJQe1AYgY7mJ9sKiUbVpWXK/QSJLMfu7WJ4qxq/U=;
 b=NW5+wO9x2N1crN7Rz4FV2dsNBe1nx5j22iDvujOgGnT5b96nVVblP1gsoMKrax5MJm
 JoVhHnXcTLMYKLHQ1rSix4IW9wm12q0nbb6uiv5p9Wm9UoJBxOfsw5nX/P3JpVxYXd7S
 FqCLc3tltt6gmaImoTZAWbUeXy+L3zlvOoVyZCBBzjGnWYqdXq5cfhAGtLv65e5JlGqc
 mu/QeMX4D+w2rAqxyoy3A5cRkU9ErXcKkPuLr6AfKPddITeA44oN5yWng8499v7WdJ+S
 GOpV+NrM4thyb0A0W0OQ8WipY+PpfEfN5l97Kf71FxvWOXXfg+IA8VRlEx5rzM0QXsU0
 2zBw==
X-Gm-Message-State: ANoB5plrHKVNNByWCU7UNxDyrVBcf3I5K/RxHJGkRcnCagN+CgOF1cpl
 mFHNVzJTH+LXMsKkamquPQE=
X-Google-Smtp-Source: AA0mqf5I7VuTPNwhFZhzjjO43yx8gGaDKNFUFaJunuQKhwSfb6DJWxh4B044UImwV18ZpY5C529hdA==
X-Received: by 2002:a05:600c:4fc6:b0:3d2:14ec:f6b1 with SMTP id
 o6-20020a05600c4fc600b003d214ecf6b1mr7342991wmq.14.1670851448181; 
 Mon, 12 Dec 2022 05:24:08 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 iw3-20020a05600c54c300b003d220ef3232sm5964111wmb.34.2022.12.12.05.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 05:24:07 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b1690fb8-fec9-3694-3438-f00a7364ecfb@xen.org>
Date: Mon, 12 Dec 2022 13:24:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 05/22] xen-platform-pci: allow its creation with
 XEN_EMULATE mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-6-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09/12/2022 09:55, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> The only thing we need to handle on KVM side is to change the
> pfn from R/W to R/O.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/xen/xen_platform.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index a64265cca0..914619d140 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -271,7 +271,10 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
>       case 0: /* Platform flags */ {
>           hvmmem_type_t mem_type = (val & PFFLAG_ROM_LOCK) ?
>               HVMMEM_ram_ro : HVMMEM_ram_rw;
> -        if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
> +        if (xen_mode == XEN_EMULATE) {
> +            /* XXX */
> +            s->flags = val & PFFLAG_ROM_LOCK;
> +        } else if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
>               DPRINTF("unable to change ro/rw state of ROM memory area!\n");
>           } else {
>               s->flags = val & PFFLAG_ROM_LOCK;

Surely this would cleaner as:

if (xen_mode != XEN_EMULATE && xen_set_mem_type(xen_domid, mem_type, 
0xc0, 0x40))
     DPRINTF("unable to change ro/rw state of ROM memory area!\n");
else
     s->flags = val & PFFLAG_ROM_LOCK;

?

   Paul

> @@ -496,12 +499,6 @@ static void xen_platform_realize(PCIDevice *dev, Error **errp)
>       PCIXenPlatformState *d = XEN_PLATFORM(dev);
>       uint8_t *pci_conf;
>   
> -    /* Device will crash on reset if xen is not initialized */
> -    if (!xen_enabled()) {
> -        error_setg(errp, "xen-platform device requires the Xen accelerator");
> -        return;
> -    }
> -
>       pci_conf = dev->config;
>   
>       pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_MEMORY);


