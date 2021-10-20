Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F164355BC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:09:26 +0200 (CEST)
Received: from localhost ([::1]:42478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdJm1-0004Uu-C1
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdJks-0003q0-BU
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:08:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdJkp-0007H5-7R
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634767688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IW/pztafDXUIxtRBcSVAHwWwer+9lM6a7YIRXcoeFxc=;
 b=aqlLc1Mnk55O2iMO7dtH7k+dRfxethSuNjwBVzfPabEitQgg7FM4KEzqLW6A0PpKbBm3cs
 R/k2byXuOfiupi6HuUgiwUd/40gFEqqX+0Dykr1FjoibEC4033a4aws6fbMs23T8CT/Jyc
 NLcWMZLOW8aQTdFFpWGJUhHhL09DBsM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-2uPWMSFIPrC7tYs93TZlZQ-1; Wed, 20 Oct 2021 18:08:07 -0400
X-MC-Unique: 2uPWMSFIPrC7tYs93TZlZQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k126-20020a1ca184000000b003231d0e329bso392462wme.4
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 15:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IW/pztafDXUIxtRBcSVAHwWwer+9lM6a7YIRXcoeFxc=;
 b=nXGi8ndGZ4DYLgo4Vwd0xfd28n4pxuw6xUCL4XrXBPbnsXDtBBlvuLEolcR8uTeiYn
 xa9ujt3AjlGwQugEeqOctyY+GV1mC1tvkozttd58CWLclvHN+cC6pT5fBu1HcJLg+hoZ
 JQlRqNRovn1PTk9ftoPLpMshi+4Bs/pd894pC2h31oMMv8cBoRfITQaV17LAV7zD0y5c
 5LyLeTsTPVKrIzk9RvY1xv94kAKl6h5k3u41/kfl8Akviedajnb9HZidHsJHhfC+ckyd
 nl7W4966mNSfZ4PsHuDCB7PUsiNetvQdbXu9RiI3vKf/a3uDvxCexTF0mDB3z4aHtK6I
 Mo2w==
X-Gm-Message-State: AOAM531wGuTrDmT30+XIYCLSJXsNmtNexxj2bZa5eK2DyR0Y2NM05rZj
 Q2M2ubGJSCrVo6iu83hsc0/34SnKFS7e1MtoheeOt+Dkpldjt4fNMGRUTOadAji7nSbG+yy9UT8
 cuV1a0lvhV5IwXeI=
X-Received: by 2002:adf:c604:: with SMTP id n4mr2289230wrg.202.1634767686398; 
 Wed, 20 Oct 2021 15:08:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3w3T/0GyLZg710RezwWQyn1Z8ULrnC3QCRwL77iZxocI1Pceh5TqxqSIQ9FsB9lIi8saXKg==
X-Received: by 2002:adf:c604:: with SMTP id n4mr2289214wrg.202.1634767686177; 
 Wed, 20 Oct 2021 15:08:06 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h1sm2991493wmb.7.2021.10.20.15.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 15:08:05 -0700 (PDT)
Message-ID: <b05eef3b-7710-9a40-783f-cf5ef37126e1@redhat.com>
Date: Thu, 21 Oct 2021 00:08:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/3] optionrom: add a DMA-enabled multiboot ROM
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211020140244.485249-1-pbonzini@redhat.com>
 <20211020140244.485249-3-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211020140244.485249-3-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: adam@l4re.org, marcus.haehnel@kernkonzept.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 16:02, Paolo Bonzini wrote:
> From: Marcus Hähnel <marcus.haehnel@kernkonzept.com>
> 
> Add a new option rom for the multiboot loader, using DMA transfers to copy
> data instead of "rep insb".
> 
> This significantly lowers QEMU's startup latency by a factor of about 40,
> for example, going from 30sec to 0.8sec when loading modules of 120MB
> in size.
> 
> Signed-off-by: Marcus Hähnel <marcus.haehnel@kernkonzept.com>
> Signed-off-by: Adam Lackorzynski <adam@l4re.org>
> [Modified to keep the non-DMA code depending on #ifdef USE_FW_CFG_DMA;
>  do not write below stack. - Paolo]
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  pc-bios/meson.build               |   1 +
>  pc-bios/multiboot_dma.bin         | Bin 0 -> 1024 bytes
>  pc-bios/optionrom/Makefile        |   4 +-
>  pc-bios/optionrom/multiboot.S     |   4 +-
>  pc-bios/optionrom/multiboot_dma.S |   2 +
>  pc-bios/optionrom/optionrom.h     |  66 ++++++++++++++++++++++++++++++
>  6 files changed, 72 insertions(+), 5 deletions(-)
>  create mode 100644 pc-bios/multiboot_dma.bin
>  create mode 100644 pc-bios/optionrom/multiboot_dma.S

> diff --git a/pc-bios/multiboot_dma.bin b/pc-bios/multiboot_dma.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..c0e2c3102a3358207c61d3ae113524fb6007abc3
> GIT binary patch
> literal 1024
> zcmd^-v1=1i9LIlmUTlcNU1}{N5`u&{DAHSmq6iKdix;GHRxaNnR0A<Lc978Fk#IvN
> zaS+5wQE+fL&*iQWa#czc94ZyL>R{3q;@~8~^LMo;4s!p158nI!-tWur_ul*P<{!&%
> z=%3>xm5f`4Bq!!)`Rkwf;(oFd*qcAb=mhXX1)X>Bw-tylkUpR_ETXkH1AnO4L$nJ|
> zWJui_M1kmKmTID)P`mI^=HM`~{VB1t1l_Ye=Lor4X5{8Gd)zzw_o4<6zLQJ!dr<pW
> z;7%~ysSHL?*HHx*O%k}?fCyRL<7_RWt(4;Aqn}X}S>MolrKNZG2Z|kTOyaJIhYFc^
> zFhhuQ9`r5fQLCrm#T4^_QylQ>8kgs;ZX9bIEiXb`8AIxu;?h~d%9izBkKht%WM1G*
> z^E{W9(OT9dt5in2qF}|dPH>dL>{=sV#-U1<quUb@YkIW%niI?8-7fCz#695e<V=WZ
> zrVCY?W~`3Hw@^=cHALr#9F2GOTYJ;??9d*-Vbsi+;lz|<$jMX#;lr6ov3qKNLH7(W
> z+>yFoWnOtw14D$&k*SUtsT%wS`ki@#&rUrnmtuDv`PtJm(Kg?H$Pdc0CL@YCy4R<D
> pT|LnIbg(BnP0#tqRx5M!bkkaD-nd?`H;YU4Yi6yHwD{k({tHC8FAx9#

Ideally this should be generated on CI as artifact, archived
and we commit the CI generated file.

> diff --git a/pc-bios/optionrom/optionrom.h b/pc-bios/optionrom/optionrom.h
> index a2b612f1a7..8d74c0ddf3 100644
> --- a/pc-bios/optionrom/optionrom.h
> +++ b/pc-bios/optionrom/optionrom.h
> @@ -37,6 +37,17 @@
>  #define BIOS_CFG_IOPORT_CFG	0x510
>  #define BIOS_CFG_IOPORT_DATA	0x511
>  
> +#define FW_CFG_DMA_CTL_ERROR   0x01
> +#define FW_CFG_DMA_CTL_READ    0x02
> +#define FW_CFG_DMA_CTL_SKIP    0x04
> +#define FW_CFG_DMA_CTL_SELECT  0x08
> +#define FW_CFG_DMA_CTL_WRITE   0x10
> +
> +#define FW_CFG_DMA_SIGNATURE 0x51454d5520434647ULL /* "QEMU CFG" */
> +
> +#define BIOS_CFG_DMA_ADDR_HIGH  0x514
> +#define BIOS_CFG_DMA_ADDR_LOW   0x518
> +
>  /* Break the translation block flow so -d cpu shows us values */
>  #define DEBUG_HERE \
>  	jmp		1f;				\
> @@ -62,6 +73,61 @@
>  	bswap		%eax
>  .endm
>  
> +
> +/*
> + * Read data from the fw_cfg device using DMA.
> + * Clobbers:	%edx, %eax, ADDR, SIZE, memory[%esp-16] to memory[%esp]
> + */
> +.macro read_fw_dma VAR, SIZE, ADDR
> +        /* Address */
> +	bswapl		\ADDR
> +	pushl		\ADDR
> +
> +	/* We only support 32 bit target addresses */
> +	xorl		%eax, %eax
> +	pushl		%eax
> +	mov		$BIOS_CFG_DMA_ADDR_HIGH, %dx
> +	outl		%eax, (%dx)
> +
> +	/* Size */
> +	bswapl		\SIZE
> +	pushl		\SIZE
> +
> +        /* Control */

Indent off.

> +	movl		$(\VAR << 16) | (FW_CFG_DMA_CTL_READ | FW_CFG_DMA_CTL_SELECT), %eax
> +	bswapl		%eax
> +	pushl		%eax
> +
> +	movl		%esp, %eax /* Address of the struct we generated */
> +	bswapl		%eax
> +	mov		$BIOS_CFG_DMA_ADDR_LOW, %dx
> +	outl		%eax, (%dx) /* Initiate DMA */
> +
> +1:  mov		(%esp), %eax /* Wait for completion */
> +	bswapl		%eax
> +	testl		$~FW_CFG_DMA_CTL_ERROR, %eax
> +	jnz		1b
> +       addl            $16, %esp

Indent off.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


