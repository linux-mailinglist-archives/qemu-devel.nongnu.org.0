Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B1335AF01
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 18:15:33 +0200 (CEST)
Received: from localhost ([::1]:37476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVGGh-0007ml-O5
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 12:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVGFS-0007AP-1J; Sat, 10 Apr 2021 12:14:14 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVGFQ-0003mm-Gu; Sat, 10 Apr 2021 12:14:13 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a6so8556741wrw.8;
 Sat, 10 Apr 2021 09:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mLZ+hTXB95ZrUHTVkfmWUiGP11kgEfWqsdlKjx6Dc7g=;
 b=ZFts39qGs2kGF1tJojEz0B05xjTolVkqOFD53Envw69BdhvXlLhX3Cen/loPlgZiIg
 31hXx3PNVoltcefR1JP0Nu/YvSjMsysAOuoHTz73K19cznwObY0+bcr2D7tfXlj3FsCA
 1fuKAZkZcMqVd6kYgFlSFig6+UV+KauXdVw4942cefuS9qJUkZu/QHEntq3SVWgEMIKB
 dN8XxNSW5eig5cubQ6Ygq0mqqmo+iMRMDX/shcByaj6Jzc3O6YXrnnM64eb18q9HkpQR
 ajl+R6SJDhzzp2TU76Db8Z6Wfr7ahfJ6JCjp7F07CEIT++x4qP3rGFZOMq1paOL6acDR
 Kqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mLZ+hTXB95ZrUHTVkfmWUiGP11kgEfWqsdlKjx6Dc7g=;
 b=c6fdwaX9jTedQ1+Qbkx/0Iju2e2+dh7nDKkJ7Um0hiSxYDlC2PbHpDAtnoFm3XC5Er
 K9zooQS69u24NIgmYrIF28bsaIb5T31IvXgtenCtiWWHK7C/qKRzeDIIfJKsPv5e849+
 TcPbMlk923fsasT0MxYxaeQ3DI5cphsQgxmryOh6geQpGfIiXMbDLmyilCgqHm5eAxfM
 QMCflvqs96UMskiivVKrgY0QqzPPgR89plcjWGOisNuAxewBN8jXPDbfkzZ74f8Gl1Bo
 cVLooChmxj6bT7YDyTJoHZLgbyp90Q6lhwXMfBEAfjgk/0vLxReRdg7ZsBHurdKUDVDv
 KeQQ==
X-Gm-Message-State: AOAM5335gnq3AGDQ18tj2amdKkysId5ngbClUGmWjhAR8mkiOxGRx6cJ
 T7oHNYWhVQFnWjJNWckZ/9o=
X-Google-Smtp-Source: ABdhPJyHwqwqnHJADO9hz9In8ITr70G7D2GnblxLfQHV0fsuCQsxP3+4tjClXe0HvZToM3el4RHtuQ==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr23937123wrw.235.1618071250325; 
 Sat, 10 Apr 2021 09:14:10 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m2sm7772011wmq.6.2021.04.10.09.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Apr 2021 09:14:09 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
To: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
 <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
 <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4d295b0b-21df-be78-512c-95131aef7f7c@amsat.org>
Date: Sat, 10 Apr 2021 18:14:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9rqx97D_ZN7MzqqJtz9ajFNK=AAeQu9z65+g35SHD_NA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Mark & Igor

On 4/10/21 5:15 PM, Peter Maydell wrote:
> On Sat, 10 Apr 2021 at 14:53, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 4/10/21 3:19 PM, Luc Michel wrote:
>>> Note that clock propagation during reset has always been a complicated
>>> problem. Calling clock_propagate is forbidden during the reset's enter
>>> phase because of the side effects it can introduce.
>>
>> Ah... Maybe this is related to the generic reset problem in QEMU :(
> 
> I do wonder if we got the clock-propagation-during-reset part of this
> wrong -- it seemed right to me at the time but trying to use the
> clock API recently I did run into some unhelpful-seeming results
> (I forget the details now, though).
> 
>>> I find your API modification a bit restrictive. I think creating a
>>> standalone clock can be useful, e.g. in complicated devices that may
>>> want to use internal "intermediate" clocks. I would not remove this
>>> possibility to the API users.
>>
>> Well, this is the point. I can't see a justification to have a clock
>> on a non-qdev object. We should be able to model complicated devices
>> with qdev.
> 
> The obvious reason is that machine objects are not qdev devices (ie
> TYPE_MACHINE inherits directly from TYPE_OBJECT, not from TYPE_DEVICE),
> but it's a reasonable thing to say "this machine has a fixed frequency
> clock which it connects to the SoC".

In this series I restrict Clocks to 1/ qdev and 2/ MachineState (which
is the case you described). I tried to think about all the hardware I
worked with and all could be somehow modeled as qdev.

> I do wonder if the right fix to that would be to make TYPE_MACHINE
> be a subtype of TYPE_DEVICE, though -- machines not being subtypes
> of device has other annoying effects, like their not having reset
> methods or being able to register vmstate structs. There might be
> some unanticipated side effects of making that change, though.

Yes, that would simplify few things. I might try it.

Expanding the topic, this reminds me a discussion between Igor and Mark
about MemoryRegion...

One was about we can not change the NULL owner to MachineState
because the region could be migrated and there is a mismatch.

Another was about preparing the design for multi-arch machines, Mark was
confuse by having owner for memory regions such DRAM because on a board
they aren't owned, can be used by various masters (CPUs, DMA). So the
machine should be the owner somehow. Maybe the problem was with
migration indeed, I can't remember :S

Regards,

Phil.

