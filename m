Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9ED687C72
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:40:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXwP-0001cd-OK; Thu, 02 Feb 2023 06:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNXwN-0001ae-Nm
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:39:43 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNXwM-0004aA-1n
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:39:43 -0500
Received: by mail-pj1-x1036.google.com with SMTP id o13so1650754pjg.2
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FhBbCxu2VaAhZs+8+K2XA8B/OavZbUnMlTIEOpeDvgo=;
 b=OFfm2VFmMwkZarrOx3I3FAfFRu7Ta+pzLm1OxxWh5bSn+6iH4HEW83i17bH8ocYd3x
 gK/aC2YL0VITtM90yXu1Lja2KGi2z4uBpDr1fip3S6BGSXG95YvXgj5LDLi52i03oVIB
 vqiIU4AKt9An6YeuujCmijXrDiNo3eKJmnSB4M7QAFSEf6L4tyRW8flVtS+aajxTeY2o
 r4aR+v7RuagTcMgMQjomt5jiXZYTrcPq70bWSpvMLc034es+4Gf51DU0KXzDUhvT+sOJ
 KIutlu9OWh5nSde/QUUJpEjqysKHRzsc7jMtUdbH7lvfVmx/I8TlXDBRw9x2H7mO6eEQ
 pGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FhBbCxu2VaAhZs+8+K2XA8B/OavZbUnMlTIEOpeDvgo=;
 b=lSXlIhXHGfN7MYSGBPNGTYbvaQNRhvuovbXChYDuUjaowjneX3WyhEXaM5sBMNugwS
 CK2JxbDYYlPcCPFd+FqXDteCyXOfK/9YlYpfjSjW+sgctohzIB3XvUk29sj4mX4xZRn7
 d6nwx5H7SuQT4O6kHq095kEukSj1+WBbcYsH6j3qoj9zPMWYfo1IFO+UA4Cv2vk2DVv9
 qWCRaQpVzWDqjxJcAJUyw5iJ68zWGxrfYNt8ehGqnx16sh0idFkgGtI0d4I5QEWCTM3c
 eWmOhUw5SIrFnHf2/UHJ4a/SHvmXa9CMB5xnEmhI3SfsaWntyWe0ugUXPItIIf12PU9s
 Ai6w==
X-Gm-Message-State: AO0yUKXeDT1G8hgtCrmagkxvo6aLodk4RQbG2m54yEe1DN37duFfKvA1
 41DFIB3bbfZBVenp3TlrbxAtNGyEi8+sCA9C4qraBw==
X-Google-Smtp-Source: AK7set+OgjKnyrUaTg5eYCyLS05ev32usyVFvHSLp45V4ssVjYwlkq6Ib03JuI7aPEXV7U3XLcJIH0W4PeMUZnLlWwM=
X-Received: by 2002:a17:90a:43e5:b0:22c:baa:c2d5 with SMTP id
 r92-20020a17090a43e500b0022c0baac2d5mr525273pjg.53.1675337980433; Thu, 02 Feb
 2023 03:39:40 -0800 (PST)
MIME-Version: 1.0
References: <78bc53e3-bad3-a5c3-9e53-7a89054aa37a@wdc.com>
 <ff3f25ee-1c98-242b-905e-0b01d9f0948d@linaro.org>
 <20230202093911.000053cb@Huawei.com>
 <2e85fdea-9ffc-9a20-1c61-45ddd17a7fd6@linaro.org>
In-Reply-To: <2e85fdea-9ffc-9a20-1c61-45ddd17a7fd6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 11:39:28 +0000
Message-ID: <CAFEAcA9ohWGgaCK60Di4iUdgYqpmHeB_WnDGv4PzyfyfquMUzw@mail.gmail.com>
Subject: Re: An issue with x86 tcg and MMIO
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 =?UTF-8?Q?J=C3=B8rgen_Hansen?= <Jorgen.Hansen@wdc.com>, 
 Ajay Joshi <Ajay.Joshi@wdc.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Sid Manning <sidneym@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 2 Feb 2023 at 10:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/1/23 23:39, Jonathan Cameron wrote:
> > Not sure - if we can do the handling above then sure we could make that change.
> > I can see there is a path to register the callbacks but I'd kind of assumed
> > ROM meant read only...
>
> I think "romd" means "read mostly".
>
> In the case of flash, I believe that a write changes modes (block erase something
> something) and the region changes state into MMIO.  But normal state is read mode where
> read+execute go through unchallenged.

In QEMU a ROMD MemoryRegion (created by memory_region_init_rom_device())
is a memory region backed by RAM for reads and by callbacks for writes.
(I think ROMD stands for "ROM device".)

You can then use memory_region_device_set_romd() to put the ROMD into
either ROMD mode (the default, reads backed by RAM) or MMIO mode
(reads backed by MMIO callbacks). Writes are always callbacks regardless.
This is mainly meant for flash devices, which are usually reads-as-data
but have a programming mode where you write a command to it and then
read back command results. It's possible to use it for other tricks too.

When a ROMD is in ROMD mode then execution from it is as fast as execution
from any RAM; when it is in MMIO mode then execution from it is as slow
as execution from any other MMIO-backed MemoryRegion.

Note that AFAIK you can't execute from MMIO at all with KVM (either
ROMD-in-MMIO mode or a plain old MMIO device).

You might want to look at whether QEMU's iommu functionality is helpful
to you -- I'm assuming CXL doesn't do weird stuff on a less-than-page
granularity, and the iommu APIs will let you do "programmatically decide
where this address should actually go". The other option involves
mapping and unmapping MemoryRegions inside a container MR.

thanks
-- PMM

