Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61985337B59
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:49:04 +0100 (CET)
Received: from localhost ([::1]:34956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPQl-0007kY-Eb
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKPJY-0002HS-74
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:41:38 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKPJT-000843-Ea
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:41:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id g20so1908843wmk.3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RcXpCfak6JR8G+sCrCcTBvtMeyg1k5q/Cvd8tQdEYBU=;
 b=RvKlrj1T7HbQ+3ecsMLShVZjKkn6OMAnH2wLi3mUBQiC6j3+f5dZmw0uGArdG3ZDOv
 qZ/aRaKYsTfKdE29U75Hl9Z+TdgOQeQZhKAZpvLdj+6zOoqv6LvedZvXM38kj5q36xl+
 4m6RmMmEjzw0QJAExn+p3FAxmEi5z7hiBQ+ZlJD7O5+0icZqAkVdEeQnXyQFubLZ5lX/
 38iNE0z7fOxAbtywmKRg/yAkdm29R4XdF4BH0f896+DvsuNwxW4JXGK2voL9axfOXq+o
 BTmV3WIt6SpbbokpErTAcc7W7UhBSYSJT9cMWdHLwfs1+MGU/YstR+aicxRGZNMi10SH
 xuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RcXpCfak6JR8G+sCrCcTBvtMeyg1k5q/Cvd8tQdEYBU=;
 b=T/91G+JbRalDJXg1CGoOFtDCZYRR0naUb2ZOc5obIJq21c5Jr/hlxDysnG3npzcC2k
 zxvAjobKbraRYVBQmIeWnSI9SYbr0HNthYcotthwQ+qyDrqFSI2P4BDd7CsgzYYcdtMF
 AeZP3GXeb7s9vPKukTNQTO0noEZc6SlbQVuiOLkI/LHY+rMPVNGn1V36ZrxJkVq3KcSQ
 CO1aV/DnJdS8258jMMz2aFm27e78K/G/iNE/CLHEfpejZAiOBwoXfOI4TeMFxDReixeh
 2rH6todvaN+ZcFTZvdk/2dBk1hwVd9kTKissJpmyWImBDiPU2HyYkWbPsjqiupc5wYni
 wRsw==
X-Gm-Message-State: AOAM530D0lsH/QUIrkQnOHG5yZ/tBvQSnOdluTeHJZs+YvfXU3R35uz6
 GotyuQcHE2Mg/RfH1Hlrc/8=
X-Google-Smtp-Source: ABdhPJwJDLN95e4nGZU5Ivdhi2xiVOmCah2HAkgfUlreGJw3jMVQhZPSwGdSSGRiMwvnR9wLPnkWoA==
X-Received: by 2002:a05:600c:21ca:: with SMTP id
 x10mr9420094wmj.48.1615484488978; 
 Thu, 11 Mar 2021 09:41:28 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a124sm3547536wmh.39.2021.03.11.09.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 09:41:28 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/mips/jazz: Use generic I/O bus via get_system_io()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Xu <peterx@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
 <20210310191255.1229848-1-f4bug@amsat.org> <20210310194924.GF6530@xz-x1>
 <5e53b99f-548c-8da9-f6fd-9c764642350b@amsat.org>
 <20210310202919.GH6530@xz-x1>
 <a97eb0b5-d3fd-ca44-4490-c5e5bc796699@amsat.org>
 <a64ff8f0-5db1-c338-b99b-7a74a150a770@amsat.org>
Message-ID: <1f25782b-abcb-a3bc-fddc-0b585536ffcf@amsat.org>
Date: Thu, 11 Mar 2021 18:41:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a64ff8f0-5db1-c338-b99b-7a74a150a770@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 5:21 PM, Philippe Mathieu-Daudé wrote:
> +Aspeed team
> 
> On 3/11/21 1:18 PM, Philippe Mathieu-Daudé wrote:
>> On 3/10/21 9:29 PM, Peter Xu wrote:
> 
>>> Yeah no worry - it's just that I feel one memory_region_init_alias() call is
>>> probably missing in your huge series somewhere, so that you'll take that alias
>>> MR as subregion rather than the real MR (which is the root of one AS).
>>
>> OK, with your earlier comments start + Mark other comment I start
>> to understand better.
>>
>> So far:
>>
>> (1a) AddressSpace is a physical view, its base address must be zero
>>
>> (1b) AddressSpace aperture is fixed (depends on hardware design,
>> not changeable at runtime
>>
>> Therefore due to (1a):
>> (2) AddressSpace root MemoryRegion is a container and must not be
>> mmio-mapped anywhere (in particular not on SysBus).
>>
>> (3) If hardware has a MMIO view of an AddressSpace, it has to be
>> via a MemoryRegion alias. That way the alias handles paddr offset
>> adjustment to the zero-based AddressSpace root container MR.
>> Aliasing allows resizing the alias size without modifying the AS
>> aperture size (1b).
>>
>> I'll start adding assertions for (1a) and (2) in the code base and
>> see if (3) adjustments are required.
> 
> So using:
> 
> -- >8 --
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 874a8fccdee..8ce2d7f83b9 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -713,6 +713,12 @@ static MemoryRegion
> *memory_region_get_flatview_root(MemoryRegion *mr)
>                  continue;
>              }
>          }
> +        if (mr && mr->addr) {
> +            error_report("Detected flatview root memory region '%s' with"
> +                         " non-zero base address (0x%"HWADDR_PRIx"):
> aborting",
> +                         memory_region_name(mr), mr->addr);
> +            abort();
> +        }
> 
>          return mr;
>      }
> ---
> 
> I get:
> 
> $ ./qemu-system-arm -M ast2600-evb
> qemu-system-arm: Detected flatview root memory region
> 'aspeed.fmc-ast2600.flash' with non-zero base address (0x20000000): aborting
> Aborted (core dumped)

Another one (PPC):

$ ./qemu-system-ppc -S -monitor stdio -M 40p
QEMU 5.2.50 monitor - type 'help' for more information
(qemu) qemu-system-ppc: Detected flatview root memory region 'pci-io'
with non-zero base address (0x80000000): aborting
Aborted (core dumped)

$ ./qemu-system-ppc -S -monitor stdio -M 40p
QEMU 5.2.50 monitor - type 'help' for more information
(qemu) info mtree
address-space: raven-io
  0000000080000000-00000000bf7fffff (prio 0, i/o): pci-io
    0000000080000000-0000000080000007 (prio 0, i/o): dma-chan
    0000000080000008-000000008000000f (prio 0, i/o): dma-cont
    0000000080000020-0000000080000021 (prio 0, i/o): pic
    0000000080000040-0000000080000043 (prio 0, i/o): pit
    0000000080000060-0000000080000060 (prio 0, i/o): i8042-data
    0000000080000061-0000000080000061 (prio 0, i/o): pcspk
    0000000080000064-0000000080000064 (prio 0, i/o): i8042-cmd
    0000000080000070-0000000080000071 (prio 0, i/o): rtc
      0000000080000070-0000000080000070 (prio 0, i/o): rtc-index
    0000000080000074-0000000080000077 (prio 0, i/o): m48t59
    0000000080000081-0000000080000083 (prio 0, i/o): dma-page
    0000000080000087-0000000080000087 (prio 0, i/o): dma-page
    ...

address-space: lsi-pci-io
  0000000080000000-00000000bf7fffff (prio 0, i/o): pci-io
    0000000080000000-0000000080000007 (prio 0, i/o): dma-chan
    0000000080000008-000000008000000f (prio 0, i/o): dma-cont
    0000000080000020-0000000080000021 (prio 0, i/o): pic
    0000000080000040-0000000080000043 (prio 0, i/o): pit
    0000000080000060-0000000080000060 (prio 0, i/o): i8042-data
    0000000080000061-0000000080000061 (prio 0, i/o): pcspk
    0000000080000064-0000000080000064 (prio 0, i/o): i8042-cmd
    0000000080000070-0000000080000071 (prio 0, i/o): rtc
      0000000080000070-0000000080000070 (prio 0, i/o): rtc-index
      ...

memory-region: pci-memory
  00000000c0000000-00000000feffffff (prio 0, i/o): pci-memory
    00000000c00a0000-00000000c00bffff (prio 1, i/o): vga-lowmem

