Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D43A5C7D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 07:37:31 +0200 (CEST)
Received: from localhost ([::1]:36656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsfHu-0003WF-NS
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 01:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsfGv-0002lf-Iy
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 01:36:29 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsfGu-0003Vu-2O
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 01:36:29 -0400
Received: by mail-wm1-x32a.google.com with SMTP id m3so6106458wms.4
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 22:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=em5rI0ywzqbmdf7sczkmt5nyFQdyqEDBE2264yDdr5A=;
 b=MSEos6dnQxRR/pLnV0X9PYZF2VddMH25ZfGVYhysD2YR7kt6d1+OzFCzz5V8Ri9Oqf
 eUJW8lmV93AAPKyMM7w+/8QjXuVzOSOuwV17JkjqB7igZqTIyxnX2Ln9qyJE3EfmcZt7
 t5uCXoLgAZ2XFBIyv8F8TdE/cD4n3tYRRyeSZhnKjHtXUGGybuxbKaztlZgo+cN3rsv2
 lKRxaVgc7asQKFvgPBrmgrapw07FePTnfNgMnCmKNppripBJ0Pntt2ML3SYdlOwF9Zdr
 LQTi7bJrEIIChX6HgrX2KkLYLdKZ4tRUWk78ndFOSOsICam4l4SNVvd0gFO4KqthUPgN
 l+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=em5rI0ywzqbmdf7sczkmt5nyFQdyqEDBE2264yDdr5A=;
 b=A/Xv0TYqhUJLpFIUCO1278izzR3c0+zynPKyoHNi+zGHqdmiNHFJcpUYRJE0enbu1o
 3k4u/oM2Iq/PVH0SqNsDi2O2CzR6fHlIpIokfu+rHoz206Qhbth/9AlmPAzetcxQI1zr
 lgPLuplDenNGDufPXtKwERHY/NMxF9B7cYwMojVSeGwCh1nHMbIZgAk9J6DcOBoM6HRL
 OimmS8JD8/EzAnlt+3qN63eBiVX60IfXtLTfLb7Fhf47C7fA/LHSxLv+bmdD8MKj8lT0
 xlhL71pupIAfE3d65mX+cPq1lQD23SKXxWiDzRHAWEkagN6S7+wUiVojee5q0KiUgSip
 4f1w==
X-Gm-Message-State: AOAM531OTJ7gAriwgGlaLg2wD5GTe8ft8EHhIquNJ/cfT4cvc0OW6CsS
 h5K1YRBa6n7NNz/UiSYk4mo=
X-Google-Smtp-Source: ABdhPJy0+OWDn6CNxsgv8enW8IJlcrtXnpuov4KG2bAJVfTat+SSyC9yutG09b2YPdddhE8uPESjKQ==
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr30533458wmj.167.1623648986603; 
 Sun, 13 Jun 2021 22:36:26 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p10sm14721001wrr.33.2021.06.13.22.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jun 2021 22:36:25 -0700 (PDT)
Subject: Re: [PATCH 0/5] dp8393x: fixes for MacOS toolbox ROM
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com,
 Finn Thain <fthain@telegraphics.com.au>, Laurent Vivier <laurent@vivier.eu>
References: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <20a706c7-9b44-13cc-b294-1ee0f3cff6bb@amsat.org>
Date: Mon, 14 Jun 2021 07:36:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Finn & Laurent.

On 6/13/21 6:37 PM, Mark Cave-Ayland wrote:
> Here is the next set of patches from my attempts to boot MacOS under QEMU's
> Q800 machine related to the Sonic network adapter.
> 
> Patches 1 and 2 sort out checkpatch and convert from DPRINTF macros to
> trace-events.
> 
> Patch 3 fixes the PROM checksum and MAC address storage format as found by
> stepping through the MacOS toolbox.
> 
> Patch 4 ensures that the CPU loads/stores are correctly converted to 16-bit
> accesses for the network card and patch 5 fixes a bug when selecting the
> index specified for CAM entries.
> 
> NOTE TO MIPS MAINTAINERS:
> 
> - The Sonic network adapter is used as part of the MIPS jazz machine, however
>   I don't have a working kernel and system to test it with. Any pointers to
>   test images would be appreciated.
> 
> - The changes to the PROM checksum in patch 3 were determined by stepping
>   through the MacOS toolbox, and is different from the existing algorithm.
>   Has the current PROM checksum algorithm been validated on a MIPS guest or
>   was it just a guess? It might be that 2 different algorithms are needed for
>   the Q800 vs. Jazz machine.
> 
> - My current guess is the jazzsonic driver is broken since the last set of
>   dp8393x changes as the MIPS jazz machine does not set the "big_endian"
>   property on the dp8393x device. I'd expect that the following diff would
>   be needed, but I can't confirm this without a suitable test image.
> 
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index 1e1cf8154e..1df67035aa 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -280,6 +280,7 @@ static void mips_jazz_init(MachineState *machine,
>              dev = qdev_new("dp8393x");
>              qdev_set_nic_properties(dev, nd);
>              qdev_prop_set_uint8(dev, "it_shift", 2);
> +            qdev_prop_set_bit(dev, "big_endian", true);
>              object_property_set_link(OBJECT(dev), "dma_mr",
>                                       OBJECT(rc4030_dma_mr), &error_abort);
>              sysbus = SYS_BUS_DEVICE(dev);
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> [q800-macos-upstream patchset series: 3]
> 
> Mark Cave-Ayland (5):
>   dp8393x: checkpatch fixes
>   dp8393x: convert to trace-events
>   dp8393x: fix PROM checksum and MAC address storage
>   dp8393x: don't force 32-bit register access
>   dp8393x: fix CAM descriptor entry index
> 
>  hw/net/dp8393x.c    | 332 ++++++++++++++++++++++++--------------------
>  hw/net/trace-events |  17 +++
>  2 files changed, 198 insertions(+), 151 deletions(-)
> 

