Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F95032334E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 22:33:37 +0100 (CET)
Received: from localhost ([::1]:35006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEfJI-0000pB-7b
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 16:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEfIA-0000MV-UJ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:32:27 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEfI9-0007Jv-Ar
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 16:32:26 -0500
Received: by mail-wm1-x32a.google.com with SMTP id v21so73388wml.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 13:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UZx+9uo4OIg+c4Yi1GejusKJqqe8FOqahlr52OVgFS4=;
 b=g1mnlKcRqsXyFVljhakWAHXyakmChPutWs7bcYgpBhovBbgoU3RF/sjc/nuwomOkZq
 AR0loAnpzALKUrwB7189YxI93fJElxySj5atZx2qvYFy4D+ArWAdvPUSWCVEaL8B3LD2
 0Fv6lm4GFQ3KGFDGBzCepSvE5jM1q/Ly6CijJQrTmwGwCYxj4Ugt/RMsxw5QuVMCrfce
 KXuUusCDZ7wiXM6F7DJbfibzURCKhAxaRadBF5XMnAJZxJIbHXNJDn4NN+td54hsA/ls
 6P4ueq8Jwa+An6teGuCDAPb7ll7c8FOdS1yqxddURAeMnt/J/d7/PJLKRdhbIFZ8RU1F
 nuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UZx+9uo4OIg+c4Yi1GejusKJqqe8FOqahlr52OVgFS4=;
 b=Cu4od2cRBfL0aYzIOH/LVAt9Gdfm4O96agV1kmmDRPj2ROstMyDH7udFXd0DV6sHIq
 VcNItzKlRHVFCZnJ5oMiR+/2/NVrJiehCGX+Jvs3wNNOgLHFAp04/oLdPj1Do70N0OXp
 ibrdgQLQ6EuSzIXI3oS9C0rYxI2/MZFYh836qngtivU0WjxbB6fMRpwCzCgTxbRlPnzo
 5BjHT9jL2GJaiGWsqZDxrY46ogNAVivSRON8p3tLkUZp0e8oey1Da4TyUxI5VIW5JWsw
 SDNFheeJp0rdsDh1Okh2W+6c5SDtLfjafRMUnfubjR9GQh9oT1+iejIN6FgjCKw9VOnr
 rDCg==
X-Gm-Message-State: AOAM531+6EDRG45qQsQMslMGMWjtMJ7qNR4llsjtKJ45HrzCItseXEoq
 6QaBMlLle8X4ouBapqjujiw=
X-Google-Smtp-Source: ABdhPJwMhBHCVim7hM+KcVbYX0nHw+kCgCw9ZcCkFZGmrVWfNJUQXqb3kNvjLyQLLGkORR3SJasfhg==
X-Received: by 2002:a7b:c391:: with SMTP id s17mr634715wmj.155.1614115943916; 
 Tue, 23 Feb 2021 13:32:23 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o10sm42511wrx.5.2021.02.23.13.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 13:32:23 -0800 (PST)
Subject: Re: [PATCH v2 00/42] esp: consolidate PDMA transfer buffers and other
 fixes
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e1eaa8e1-c3e8-478b-615d-3cf87542d357@amsat.org>
Date: Tue, 23 Feb 2021 22:32:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
> This patch series comes from an experimental branch that I've been working on
> to try and boot a MacOS toolbox ROM under the QEMU q800 machine. The effort is
> far from complete, but it seems worth submitting these patches separately since
> they are limited to the ESP device and form a substantial part of the work to
> date.
> 
> As part of Laurent's recent q800 work so-called PDMA (pseudo-DMA) support was
> added to the ESP device. This is whereby the DREQ (DMA request) line is used
> to signal to the host CPU that it can transfer data to/from the device over
> the SCSI bus.
> 
> The existing PDMA tracks 4 separate transfer data sources as indicated by the
> ESP pdma_origin variable: PDMA, TI, CMD and ASYNC with an independent variable
> pdma_len to store the transfer length. This works well with Linux which uses a
> single PDMA request to transfer a number of sectors in a single request.
> 
> Unfortunately the MacOS toolbox ROM has other ideas here: it sends data to the
> ESP as a mixture of FIFO and PDMA transfers and then uses a mixture of the FIFO
> and DMA counters to confirm that the correct number of bytes have been
> transferred. For this to work correctly the PDMA buffers and separate pdma_len
> transfer counter must be consolidated into the FIFO to allow mixing of both
> types of transfer within a single request.
> 
> The patchset is split into several sections:
> 
> - Patches 1-7 are minor patches which make esp.c checkpatch friendly, QOMify ESPState,
>   and also fix up some trace events ready for later patches in the series
> 
> - Patches 8-13 unify the DMA transfer count. In particular there are 2 synthetic
>   variables dma_counter and dma_left within ESPState which do not need to exist. 
>   DMA transfer lengths are programmed into the TC (transfer count) register which is 
>   decremented for each byte transferred, generating an interrupt when it reaches zero.
>   These patches add helper functions to read the TC and STC registers directly and
>   remove these synthetic variables so that the DMA transfer length is now tracked in
>   a single place.
> 
> - Now that the TC register represents the authoritative DMA transfer length, patches
>   14-25 work to eliminate the separate PDMA variables pdma_start, pdma_cur, pdma_len
>   and separate PDMA buffers PDMA and CMD. The PDMA position variables can be replaced
>   by the existing ESP cmdlen and ti_wptr/ti_rptr, whilst the FIFO (TI) buffer is used
>   for incoming data with commands being accumulated in cmdbuf as per standard DMA
>   requests.

I tried to help reviewing up to this point.

The next parts are too specific to me.

> - Patches 26 and 27 fix the detection of missing SCSI targets by the MacOS toolbox ROM
>   on startup at which point it will attempt to start reading information from a CDROM
>   attached to the q800 machine.
> 
> - Patch 28 is the main rework of the PDMA buffer transfers: instead of tracking the
>   SCSI transfers using a separate ASYNC pdma_origin, the contents of the ESPState
>   async_buf are copied to the FIFO buffer in 16-byte chunks with the transfer status
>   and IRQs being set accordingly.
> 
> - Patch 29 removes the last separate PDMA variable pdma_origin, including the separate
>   PDMA migration subsection which is no longer required (see note below about migration
>   compatibility).
>   
> - Patch 30 enables 4 byte PDMA reads/writes over the SCSI bus which are used by MacOS
>   when reading the next stage bootloader from CDROM (this is an increase from
>   2 bytes currently implemented and used by Linux).
> 
> - Patches 31-34 fix an issue whereby the MacOS toolbox ROM tries to read incoming data
>   from the target within a few instructions of receiving the command complete interrupt.
>   Since IO is asynchronous in QEMU, it is necessary to delay the command complete
>   interrupt for incoming data to avoid underflow.
> 
> - Patches 35-37 fix a problem with the SATN and stop command not changing the SCSI bus
>   to message out phase. This actually first manifested itself after the Fifo8 conversion
>   with guests that mix DMA/non-DMA commands but it is moved forward to aid bisection.
> 
> - Patches 38-39 convert ti_buf and cmdbuf from simple arrays to QEMU's Fifo8 type which
>   helped locate a handful of bugs around handling the buffer pointers which are
>   incorpated within earlier patches within the series.
>   
> - Finally patches 40-42 add support for the FIFO count registers, non-DMA transfers and
>   unaligned accesses which are required for the MacOS toolbox ROM to successful read
>   files from disk.

