Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE931324E92
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:54:51 +0100 (CET)
Received: from localhost ([::1]:53300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEIE-00066J-UB
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFEEI-0003BO-TI
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:50:50 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFEEG-0003qK-Da
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:50:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id u187so2340255wmg.4
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 02:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U2HUHqnMPtE09XQlUHQ8mDrWUzirVZiJHq3XffRFXHU=;
 b=YhJ2FKfzvLbCcpxbmvFpy9D6V/IrzVaVJNWP2vs5AP2OZGf5Gjyptyl3V/CHVbnpq+
 clTJQ/VSF/KLz/lcS5GqfoVCraJAQSeaR19hB0bflMwCDFDbhphHHWa2jxUq8716AIJ+
 fcD5hQzgifiJSCP0RtD1zcqNIoh512JaNzw/2p5YNU3JdF+GqWtQpnt6WyfYHYfY+OcN
 uK/d1EC7oJBfLdUoVWcpKEl7G0L6sBZDthCTWo3iSbkR74x9TOCr0sxhHS753rN1/qKQ
 CsN3fwTG3QOiWzKfATw8VecgEVzpZ3UsLzb5JmLrTDxDQbWy6VegeM2iCIY9hXLOJ73q
 Ob7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U2HUHqnMPtE09XQlUHQ8mDrWUzirVZiJHq3XffRFXHU=;
 b=j+/L5WgNLQiATGgPI3W1AUETNuslviMY4bgJhVNEfa5TA4MuOV+GlB2pZSIhpXsV4R
 Y69CkYrht4sJUvglywUWkk7+VvHuj+sef3oIhHR//b49R7JnZ9Q25XsIEPJni9QODsAk
 cdj4+JDcRmXhc/MK+iZ5CrkkcznXMa2MkO76dHFeBlUlxmE4DI5p6SO9Uwm0+TncC80Y
 Fmjz7YcQ0Ey5q5/mgQaS72yx+FN1ibHJtKR9a4pywz8V0QPogtqjHxA06l7I6labbW1i
 b7z33dhJyGTMTG/07/U13/1vHOitQrYfEF7wTZc1HNP0Sj7V6JCct2QH3IF77nRzp9LW
 UqAg==
X-Gm-Message-State: AOAM532IpAQBRvBzXOT8KtS0RikiYXDlbAOTAuO0Zl/ur0i9nVvxnWKi
 Zw1yyNlZZppW2QAZz0B0syU=
X-Google-Smtp-Source: ABdhPJxpQxAowdvVI8MZy5b1djl9LcHz69+V16k5tYyFYxzyOLIoOZSZr0x3gD7MlV0VlpRCBAVfPA==
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr2664680wmc.168.1614250241534; 
 Thu, 25 Feb 2021 02:50:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g1sm6726435wmh.9.2021.02.25.02.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 02:50:40 -0800 (PST)
Subject: Re: [PATCH v2 00/42] esp: consolidate PDMA transfer buffers and other
 fixes
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <e1eaa8e1-c3e8-478b-615d-3cf87542d357@amsat.org>
 <f0ba939b-b69f-5fce-e24a-5778aa29b59f@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e5f47ad6-7eb9-8875-7a7b-8144190a18cd@amsat.org>
Date: Thu, 25 Feb 2021 11:50:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f0ba939b-b69f-5fce-e24a-5778aa29b59f@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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

On 2/25/21 10:54 AM, Mark Cave-Ayland wrote:
> On 23/02/2021 21:32, Philippe Mathieu-Daudé wrote:
> 
>> Hi Mark,
>>
>> On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
>>> This patch series comes from an experimental branch that I've been
>>> working on
>>> to try and boot a MacOS toolbox ROM under the QEMU q800 machine. The
>>> effort is
>>> far from complete, but it seems worth submitting these patches
>>> separately since
>>> they are limited to the ESP device and form a substantial part of the
>>> work to
>>> date.
>>>
>>> As part of Laurent's recent q800 work so-called PDMA (pseudo-DMA)
>>> support was
>>> added to the ESP device. This is whereby the DREQ (DMA request) line
>>> is used
>>> to signal to the host CPU that it can transfer data to/from the
>>> device over
>>> the SCSI bus.
>>>
>>> The existing PDMA tracks 4 separate transfer data sources as
>>> indicated by the
>>> ESP pdma_origin variable: PDMA, TI, CMD and ASYNC with an independent
>>> variable
>>> pdma_len to store the transfer length. This works well with Linux
>>> which uses a
>>> single PDMA request to transfer a number of sectors in a single request.
>>>
>>> Unfortunately the MacOS toolbox ROM has other ideas here: it sends
>>> data to the
>>> ESP as a mixture of FIFO and PDMA transfers and then uses a mixture
>>> of the FIFO
>>> and DMA counters to confirm that the correct number of bytes have been
>>> transferred. For this to work correctly the PDMA buffers and separate
>>> pdma_len
>>> transfer counter must be consolidated into the FIFO to allow mixing
>>> of both
>>> types of transfer within a single request.
>>>
>>> The patchset is split into several sections:
>>>
>>> - Patches 1-7 are minor patches which make esp.c checkpatch friendly,
>>> QOMify ESPState,
>>>    and also fix up some trace events ready for later patches in the
>>> series
>>>
>>> - Patches 8-13 unify the DMA transfer count. In particular there are
>>> 2 synthetic
>>>    variables dma_counter and dma_left within ESPState which do not
>>> need to exist.
>>>    DMA transfer lengths are programmed into the TC (transfer count)
>>> register which is
>>>    decremented for each byte transferred, generating an interrupt
>>> when it reaches zero.
>>>    These patches add helper functions to read the TC and STC
>>> registers directly and
>>>    remove these synthetic variables so that the DMA transfer length
>>> is now tracked in
>>>    a single place.
>>>
>>> - Now that the TC register represents the authoritative DMA transfer
>>> length, patches
>>>    14-25 work to eliminate the separate PDMA variables pdma_start,
>>> pdma_cur, pdma_len
>>>    and separate PDMA buffers PDMA and CMD. The PDMA position
>>> variables can be replaced
>>>    by the existing ESP cmdlen and ti_wptr/ti_rptr, whilst the FIFO
>>> (TI) buffer is used
>>>    for incoming data with commands being accumulated in cmdbuf as per
>>> standard DMA
>>>    requests.
>>
>> I tried to help reviewing up to this point.
>>
>> The next parts are too specific to me.
> 
> Thanks Phil - I understand that a set of 42 patches for a 25 year old
> disk controller is never going to be the top of most people's review
> list, and some parts are almost impossible to review unless you have a
> good understanding of the datasheet.

Well I also have a series for a 30+ years old MIPS board and am
not confident to post it because probably little interest for
the community, although it is very interesting to compare with
actual SoC and see how the IP blocks are indeed reused and improved
over the time -- or not... i.e. when someone report a hw bug in a 2020
product and the same bug is present in the IP core from the 80th it
inherited ;)

> I'll see if Laurent has any comments over the next few days, but other
> than that I'd be inclined to send a v3 followed soon by a PR to avoid me
> having to update these regularly (I already see a slight conflict with
> Paolo's SCSI error handling changes, for example).

I'll have a look at your v3 and Cc you when I post this MIPS board :D

Regards,

Phil.

