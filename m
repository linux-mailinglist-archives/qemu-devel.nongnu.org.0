Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1F3337246
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:20:08 +0100 (CET)
Received: from localhost ([::1]:54224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKIR-00066T-TH
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKKH9-0005VP-BY
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:18:47 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKKH6-00058x-Gs
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:18:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id 7so1636473wrz.0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 04:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+lWeWNkiJzChZeqsXV/UKMVCDNZEdTwyGL56Ije5BOU=;
 b=bNiR1v/JyCR6zURovXNyWOcYZo7VIG1haj/+ygs4imeEIife9PrsomgMcg70PUbmDl
 fa4aeBsjcszfKvJuTOYhWtxnUJ3COTj5rqX4i4SXOvYOgVX3nLxtqRECykT0yROmAXT+
 XD+lt5qeJLdtWZ8DhfT0H2EArdy0lXTSrKzDUf6nwYfl+vucgjd3Hi5TBEhep+zfjgoq
 Bow/eD8HZAzp4W8UwksH9gqojeSZVqV454/qcpoysO5Nta9z22QQjmSM88cq3vOdGst9
 p/LP92ct2+nvWGb1GdA1a5I2rl3Yiht24W8bBYhl+nYN0CCV8NIc0WmyOf2vHhM9bMxJ
 vX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+lWeWNkiJzChZeqsXV/UKMVCDNZEdTwyGL56Ije5BOU=;
 b=pNk+wwl4f2lBiKZEpoxPaKTUoQUObqVkzsJLa4Bae/UKrCnWJiKaSkdA2DHR+xcjlP
 h4zey/pMjwenkUghfc0uaR6qmrcZbjPdh/PWz7Ma2VtQgjNYokaw6LxCgBEYKN9bzmak
 MHfHaZ1eE/sIyKEnlHdcz85qOSqsVIW2d2fRgiLeVkMFVqVcTj7aybC4RWhy7Bdbuehu
 I+w7q5tQNBzraT6hUx8nIFm9vQqtwgFB70J6M0EoULQk2aej44hh5SRt1yjL0KdKYYcP
 ruO+PCRa/+W2lXCI/LCVvAVuYHasRu6exi3ChrAx1UFc0SKQSR37ZwjzxdYphrzxQZ5R
 1YFA==
X-Gm-Message-State: AOAM531eOw4ufg2/OhDbbJ9by4I3mTaIY9nCIknfT+AIy0+5z7EItzU/
 vSVUjgKf0+ftyOYXxI6LlvA=
X-Google-Smtp-Source: ABdhPJxfRgn/h3J8R53QJgyDRFIQP0uTcdKDgW96eRS2uKxe+FnsInclvhmqzoI9mWkwz3F6WzNMLA==
X-Received: by 2002:adf:97d5:: with SMTP id t21mr8343267wrb.139.1615465122681; 
 Thu, 11 Mar 2021 04:18:42 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n6sm3712975wrt.1.2021.03.11.04.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 04:18:42 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/mips/jazz: Use generic I/O bus via get_system_io()
To: Peter Xu <peterx@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
 <20210310191255.1229848-1-f4bug@amsat.org> <20210310194924.GF6530@xz-x1>
 <5e53b99f-548c-8da9-f6fd-9c764642350b@amsat.org>
 <20210310202919.GH6530@xz-x1>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a97eb0b5-d3fd-ca44-4490-c5e5bc796699@amsat.org>
Date: Thu, 11 Mar 2021 13:18:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310202919.GH6530@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 9:29 PM, Peter Xu wrote:
> On Wed, Mar 10, 2021 at 09:11:40PM +0100, Philippe Mathieu-Daudé wrote:
>>>>      /* ISA bus: IO space at 0x90000000, mem space at 0x91000000 */
>>>> -    memory_region_init(isa_io, NULL, "isa-io", 0x00010000);
>>>>      memory_region_init(isa_mem, NULL, "isa-mem", 0x01000000);
>>>> -    memory_region_add_subregion(address_space, 0x90000000, isa_io);
>>>> +    memory_region_add_subregion(address_space, 0x90000000, get_system_io());
>>>
>>> The old code has an alias created just for adding subregion into address_space:
>>>
>>> -    /* ISA IO space at 0x90000000 */
>>> -    memory_region_init_alias(isa, NULL, "isa_mmio",
>>> -                             get_system_io(), 0, 0x01000000);
>>> -    memory_region_add_subregion(address_space, 0x90000000, isa);
>>> -    isa_mem_base = 0x11000000;
>>>
>>> While you didn't revert that part.  Maybe that's the issue?
>>
>> Hmm I'll have a look. This is not the series I'm working on, which
>> is much bigger and not ready for posting yet. I simply looked for
>> something similar (a bus mapped into sysbus) and remembered the
>> ISA bus from Jazz machines. I'll see if I can find a better PoC.
> 
> Yeah no worry - it's just that I feel one memory_region_init_alias() call is
> probably missing in your huge series somewhere, so that you'll take that alias
> MR as subregion rather than the real MR (which is the root of one AS).

OK, with your earlier comments start + Mark other comment I start
to understand better.

So far:

(1a) AddressSpace is a physical view, its base address must be zero

(1b) AddressSpace aperture is fixed (depends on hardware design,
not changeable at runtime

Therefore due to (1a):
(2) AddressSpace root MemoryRegion is a container and must not be
mmio-mapped anywhere (in particular not on SysBus).

(3) If hardware has a MMIO view of an AddressSpace, it has to be
via a MemoryRegion alias. That way the alias handles paddr offset
adjustment to the zero-based AddressSpace root container MR.
Aliasing allows resizing the alias size without modifying the AS
aperture size (1b).

I'll start adding assertions for (1a) and (2) in the code base and
see if (3) adjustments are required.

Thanks both!

Phil.

