Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2713459108
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 16:11:18 +0100 (CET)
Received: from localhost ([::1]:60954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAyT-0000Ar-Ct
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 10:11:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAvv-0005u7-4L
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:08:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAvq-0001FU-Cn
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637593713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttVdCXYXdsA9KCg7M8PszRsf1MRKIXiF2zEP6COMgOk=;
 b=Mm2kl2uQ7rfp8J4f1+gDAUThb+4V9Ag7wiyc9W1quPCjtj4M2pmEGvq859hu/w5ShWb6Fn
 9jElR85fttcgQxuQA7cOFYr5ChuTwdWauPZF9ESWPogw18Li9uerTDU5+2fQYNjbzCiHmM
 nTn/tO2hqNr8IPI33WeS6S+Zvtc5ZsQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-LBdzHLZJO4SZQ64Y7qLPQw-1; Mon, 22 Nov 2021 10:08:32 -0500
X-MC-Unique: LBdzHLZJO4SZQ64Y7qLPQw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so35582wmr.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 07:08:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ttVdCXYXdsA9KCg7M8PszRsf1MRKIXiF2zEP6COMgOk=;
 b=6vHMeReizvbEh5nWR7c0BAKYLO9MnDixb3bUamASieOiFw81/61sfvjAfQ3dHsiLGx
 BJZbqlpbLK7L9b4DVu2dI1yWon7rlJHvtQJ/gUZXdTYUCRlvUMUzdrfb4c3ZCLR3XI/U
 rGE4JJqjWJsGoZk2WfvH8xPcli2Gi/NynaH6SDEG6PS1ZK9aI4oN5muKkCCq8QsiY8n7
 h8bSHg7wcrQ/40XAIExj091CQ96hNbZJtHjTRyJwWE5oRhodjqdajokcV1QcaKoD/cax
 xoET09m4UH+bZImfMabRnEPSrJEys9FG3ptTCtqmQzBbGP72KRV9UmDWMoKCDrsv2XQe
 QM5Q==
X-Gm-Message-State: AOAM533HtDxMcqj3X1Suuyo9GhhDLKhc5I31omdpZ4ogmpZn4Evij53m
 0FkRyPFlTE+N5IAGO21D0UaEhJcxaOciUl6WcNl4Pu2Wzx6iEN4RhlFdeIW45onzlQPmlvjtLEO
 61tvYTc+iVLRMAoY=
X-Received: by 2002:adf:f489:: with SMTP id l9mr39741284wro.268.1637593711144; 
 Mon, 22 Nov 2021 07:08:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwj40CTwSJHYc54CTvXBD43f8Efgbv65fX0cFj78dPUj+3gypOTpzwgDIs4A316589OeFLyiQ==
X-Received: by 2002:adf:f489:: with SMTP id l9mr39741256wro.268.1637593710985; 
 Mon, 22 Nov 2021 07:08:30 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id l4sm9100503wrv.94.2021.11.22.07.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 07:08:30 -0800 (PST)
Message-ID: <e4f267c5-3919-bcba-994e-23eb976950b1@redhat.com>
Date: Mon, 22 Nov 2021 16:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-7.0 2/5] hw/display/vga-mmio: Inline vga_mm_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211119171202.458919-1-f4bug@amsat.org>
 <20211119171202.458919-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211119171202.458919-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/2021 18.11, Philippe Mathieu-Daudé wrote:
> Inline vga_mm_init() in vga_mmio_init() to simplify the
> next patch review. Kind of.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/display/vga-mmio.c | 27 ++++++++++-----------------
>   1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
> index 8aaf44e7b1d..0aefbcf53a0 100644
> --- a/hw/display/vga-mmio.c
> +++ b/hw/display/vga-mmio.c
> @@ -65,12 +65,19 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
>       .endianness = DEVICE_NATIVE_ENDIAN,
>   };
>   
> -static void vga_mm_init(VGAMmioState *s, hwaddr vram_base,
> -                        hwaddr ctrl_base, int it_shift,
> -                        MemoryRegion *address_space)
> +int vga_mmio_init(hwaddr vram_base,
> +                    hwaddr ctrl_base, int it_shift,
> +                    MemoryRegion *address_space)
>   {
> +    VGAMmioState *s;
>       MemoryRegion *s_ioport_ctrl, *vga_io_memory;
>   
> +    s = g_malloc0(sizeof(*s));
> +
> +    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
> +    s->vga.global_vmstate = true;
> +    vga_common_init(&s->vga, NULL);
> +
>       s->it_shift = it_shift;
>       s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
>       memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
> @@ -89,20 +96,6 @@ static void vga_mm_init(VGAMmioState *s, hwaddr vram_base,
>       memory_region_add_subregion(address_space,
>                                   vram_base + 0x000a0000, vga_io_memory);
>       memory_region_set_coalescing(vga_io_memory);
> -}
> -
> -int vga_mmio_init(hwaddr vram_base,
> -                    hwaddr ctrl_base, int it_shift,
> -                    MemoryRegion *address_space)

Preferably with the indentation fixed (already in the first patch):

Reviewed-by: Thomas Huth <thuth@redhat.com>


