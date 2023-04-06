Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264316D9701
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:28:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOj2-0007Am-RX; Thu, 06 Apr 2023 08:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkOj0-0007AD-25
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:28:22 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkOiy-0000le-B6
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:28:21 -0400
Received: by mail-ej1-x62a.google.com with SMTP id 18so952421ejo.13
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 05:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680784099; x=1683376099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4mSUvehWEMlLbDuQdmM0u3rS5orOycouYo4EzDuXNkE=;
 b=YntT2gpGyU5dKjaBwQvHGEupWUKScbITxPXDp0dkfNr8XBIrnhsvfkDRAmoKNTA73J
 rV4woobb1UxQP6OL1iR4eJoAM+o7WWB7CbxOZsj7y9bcbj0ThAxdBWO6BCLDEN0UeSeK
 QB2cYg/p/aan/cy2icttf1mF0cN/BE6OxRtAIwt5vAki0wJZA7k8zL2FtyKLGaAKwyKz
 bVSWdBLHIYdGmH7kKEPX4UKf+ATj42oFOLId6ENTaPia22k7JvUd2WkCgGStQqq8jnef
 IXCBFlcbbP0VVDvc/7q5D9DQLsU4lCRgxbWqxgxaaK3GIpY7nVV0+Vm2VyNa/nK4qPkK
 UxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680784099; x=1683376099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4mSUvehWEMlLbDuQdmM0u3rS5orOycouYo4EzDuXNkE=;
 b=2I63O/pNSiYr9hGbxPYBEU9FIrsqfc3gSwmKkY/oL/7Z8xLljel8aCbB0cpfwxrQvy
 i5KCkJTLWSLr7+nMszkNegASik6WIna/KOYBWvkQOwhebJLh3ledKsw5rQHaUWSr+T+s
 liwbInxUedEFurnscZoMhzFmIb1v03tiLSQcfLceaZW2Ax3Iitckpsyh2I7iOGDl6013
 HO0fYul5R5eAZBjeDvPLlXtQGXx32JAcOKPDS2xxOKVJu5rNQboo3yTqDnnuBN+7cHYy
 80J6FkDY8udHoHEbZne8iR7O8wlju1bwwqbJqS3KIP/ZwJYY6ErMnNg5UJezaJwQfFTb
 iZnQ==
X-Gm-Message-State: AAQBX9fdas2HaPfD0e51t5K144xKFRUxhzluZsszdsmuLdnOddW18/e2
 2c+LZg4PMoRjAiFT3P4eq0TJ3ccALQLe4jx3YPSLkg==
X-Google-Smtp-Source: AKy350bVk/GcmJkJspIhoKyPKNJQloGzXA7J9Rb/z6uys3nOx9hhJ+fjAvPjwOM+0DXvixs3MAFyhEZf/bNT6NBzjBM=
X-Received: by 2002:a17:907:3f15:b0:947:f389:58ca with SMTP id
 hq21-20020a1709073f1500b00947f38958camr3522030ejc.2.1680784098790; Thu, 06
 Apr 2023 05:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_7+5tK+rM6dBgozNJmMmL7fU3MHLuvzJtb7-zWK4rMTQ@mail.gmail.com>
 <4521ce29-1d11-f253-7a7d-342f6bd9e6b0@redhat.com>
 <CAFEAcA_HVpYajJ5yP7+eYKNhKggtNjgFyQ_V3WqSPf4dGL=zKQ@mail.gmail.com>
 <3b5cc225-50e8-e56d-3fa8-da052a515beb@linux.ibm.com>
 <CAFEAcA_Uh+20w1gnCBXe6Go9WqkUu+SUeRtsrrbwEO4j48OjGQ@mail.gmail.com>
 <149e9342-b48b-0871-ee4d-96c6f1d3f198@linux.ibm.com>
 <CAFEAcA_SgAZmv8YpaR0v7iU1oMdNTAMcrcYWaqGPzHDxjSP=wQ@mail.gmail.com>
 <c974308f-42a1-9163-5c4f-54bda7050ee8@linux.ibm.com>
In-Reply-To: <c974308f-42a1-9163-5c4f-54bda7050ee8@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 13:28:08 +0100
Message-ID: <CAFEAcA8dgFMOAAg_8AHUYg73vDRBcg4NFycZru64voy3A=pSkg@mail.gmail.com>
Subject: Re: s390 private runner CI job timing out
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Thu, 6 Apr 2023 at 13:13, Christian Borntraeger
<borntraeger@linux.ibm.com> wrote:
>
>
>
> Am 06.04.23 um 14:05 schrieb Peter Maydell:
> > On Thu, 6 Apr 2023 at 12:17, Christian Borntraeger
> > <borntraeger@linux.ibm.com> wrote:
> >>
> >> Am 06.04.23 um 12:44 schrieb Peter Maydell:
> >>> On Thu, 6 Apr 2023 at 11:40, Christian Borntraeger
> >>> <borntraeger@linux.ibm.com> wrote:
> >>>> Am 06.04.23 um 11:21 schrieb Peter Maydell:
> >>>>> Christian, does our S390X machine get a guaranteed amount of CPU,
> >>>>> or does it depend on what else is running on the hardware?
> >>>>
> >>>> I think its a shared system with shared CPUs. Can you check the steal
> >>>> time in top or proc? If this is far too high we could ask to give you
> >>>> more weight for that VM.
> >>>
> >>> It's idle at the moment and steal time seems to be low (0.0 .. 0.3);
> >>> I'll try to remember to check next time it's running a job.
> >>>
> >>
> >> Do you have /proc/stat ?
> >
> > Yes; hopefully it means more to you than it does to me :-)
> >
> > linux1@qemu01:~$ cat /proc/stat
> > cpu  60904459 604975 15052194 1435958176 17128179 351949 758578 22218760 0 0
> > cpu0 15022535 146734 3786909 358774818 4283172 98313 237156 5894809 0 0
> > cpu1 15306890 151164 3746024 358968957 4378864 85629 172492 5434255 0 0
> > cpu2 15307709 157180 3762691 359141276 4138714 85736 176367 5474594 0 0
> > cpu3 15267324 149895 3756569 359073124 4327428 82269 172562 5415101 0 0
>
> This is
> user,nice,system,idle,iowait,irq,softirq,steal,guest,guest_nice
> So overall there is some (20-30% since the last reboot) steal going on.
> Not sure if this is the real problem since it is only Ubuntu 20.04.
> Does a higher timeout make the problem go away?

I would expect that raising the timeout would improve this (it seems
to be on the borderline where some jobs make it in in time and some don't),
but on the other hand 75 mins is already a pretty high timeout.
I would rather we looked at whether we could cut down the amount
we are compiling/testing on this box instead.

thanks
-- PMM

