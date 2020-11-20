Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92AC2BA7D5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 11:56:23 +0100 (CET)
Received: from localhost ([::1]:38548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg45W-00042v-BP
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 05:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg44S-0003Yw-NZ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:55:16 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg44R-0003qG-0K
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:55:16 -0500
Received: by mail-wr1-x442.google.com with SMTP id p8so9582205wrx.5
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 02:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xegj5JQ49GKHqGAXzz8gAZ1DY5LujJVgAIPZFdhOM48=;
 b=khE5rZYdcIAYRHncJd3g84jMHMi6sYINNMQRM3ddveU4a6WIeEjWZVMyUV/aOSzRxa
 SCP0oXtj348TM/lamxSWHwNGV0ZSLEVvLFShpuCqRuHeOJ0hew2hlsxrdGYV3spSs+oo
 +jVHOg9w/OpxpoDsWjHFFLQq1uB9vl+KQxvMnhDu9YTYsd4CnI6D7wwPn69MN6r86So8
 cSyghPxHZLw0bnZSUD0M7OEegnpt1U4uztN7y0O2P9cgMnlSs3URfXBxxAoyiHEMaLQL
 fdrT586UMDUrRIRw/3cG72rXETj0a3Qh3iuX+azx6FVx0h6jujyxpHjSCNHc4IZKvrj+
 5+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xegj5JQ49GKHqGAXzz8gAZ1DY5LujJVgAIPZFdhOM48=;
 b=ppbYVzkEhiqstI4jo9V0yNKo6xOsUAcEYSwtem8oP2iHua/hcXfcFj4bvKZuz2CRJr
 vrCIsQfU+wtIEZb1nMyozOx3p6th6MFNec8Xw6SomLqC2W1jC2FWGbCj7FrxgCDaSVal
 pvLu5eUo8z5Kvae7htqLc4GQdzS6rdFcN8tvDqLlCY3JThzIY6Huk8agRyYNXh9SWYbY
 syHmH5SaZ0geZ+zT4C73NplUw+XN8x+OJbmVnPfx7HQ0/QCK1z17kEFQtd0MUcO+VkQr
 CQHolryAx01r5COgvM19BuKJAo+uMPyhySA9L0CGef8bvMxfCJdKLG6KdIrZZvosmzci
 7qIQ==
X-Gm-Message-State: AOAM531TWClbJMuBulPkTEG/vWtGCAJtL6tfJ7tf9OO4y0D/Hm+QU5qP
 cU6zqiYG9MDnWg5/LyA/SXk=
X-Google-Smtp-Source: ABdhPJx0EipjX4t399BIPjYxrECHma65KFQdU7n3dKcbzivp+b4NE1RibcdvoVhUMI42c+8VZVqQSQ==
X-Received: by 2002:a5d:438f:: with SMTP id i15mr15328794wrq.121.1605869713252; 
 Fri, 20 Nov 2020 02:55:13 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id e4sm2301525wrr.32.2020.11.20.02.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 02:55:12 -0800 (PST)
Subject: Re: [PATCH V13 2/9] meson.build: Re-enable KVM support for MIPS
To: Huacai Chen <chenhuacai@gmail.com>, Huacai Chen <chenhc@lemote.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1602059975-10115-1-git-send-email-chenhc@lemote.com>
 <1602059975-10115-3-git-send-email-chenhc@lemote.com>
 <0dfbe14a-9ddb-0069-9d86-62861c059d12@amsat.org>
 <CAAhV-H63zhXyUizwOxUtXdQQOR=r82493tgH8NfLmgXF0g8row@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9fc6161e-cf27-b636-97c0-9aca77d0f9cd@amsat.org>
Date: Fri, 20 Nov 2020 11:55:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H63zhXyUizwOxUtXdQQOR=r82493tgH8NfLmgXF0g8row@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 5:28 AM, Huacai Chen wrote:
> On Wed, Nov 18, 2020 at 1:17 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 10/7/20 10:39 AM, Huacai Chen wrote:
>>> After converting from configure to meson, KVM support is lost for MIPS,
>>> so re-enable it in meson.build.
>>>
>>> Fixes: fdb75aeff7c212e1afaaa3a43 ("configure: remove target configuration")
>>> Fixes: 8a19980e3fc42239aae054bc9 ("configure: move accelerator logic to meson")
>>> Cc: aolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
>>> ---
>>>  meson.build | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 17c89c8..b407ff4 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -59,6 +59,8 @@ elif cpu == 's390x'
>>>    kvm_targets = ['s390x-softmmu']
>>>  elif cpu in ['ppc', 'ppc64']
>>>    kvm_targets = ['ppc-softmmu', 'ppc64-softmmu']
>>> +elif cpu in ['mips', 'mips64']
>>> +  kvm_targets = ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu', 'mips64el-softmmu']
>>
>> Are you sure both 32-bit hosts and targets are supported?
>>
>> I don't have hardware to test. If you are not working with
>> 32-bit hardware I'd remove them.
> When I add MIPS64 KVM support (Loongson-3 is MIPS64), MIPS32 KVM is
> already there. On the kernel side, MIPS32 KVM is supported, but I
> don't know whether it can work well.

Well, from the history, you inherited from it:

commit 1fa639e5618029e944ac68d27e32a99dcb85a349
Author: James Hogan <jhogan@kernel.org>
Date:   Sat Dec 21 15:53:06 2019 +0000

    MAINTAINERS: Orphan MIPS KVM CPUs

    I haven't been active for 18 months, and don't have the hardware
    set up to test KVM for MIPS, so mark it as orphaned and remove
    myself as maintainer. Hopefully somebody from MIPS can pick this up.


commit 134f7f7da12aad99daafbeb2a7ba9dbc6bd40abc
Author: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date:   Mon Feb 24 12:50:58 2020 +0100

    MAINTAINERS: Reactivate MIPS KVM CPUs

    Reactivate MIPS KVM maintainership with a modest goal of keeping
    the support alive, checking common KVM code changes against MIPS
    functionality, etc. (hence the status "Odd Fixes"), with hope that
    this component will be fully maintained at some further, but not
    distant point in future.


commit 15d983dee95edff1dc4c0bed71ce02fff877e766
Author: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Wed Jul 1 20:25:58 2020 +0200

    MAINTAINERS: Adjust MIPS maintainership (Huacai Chen & Jiaxun Yang)

    Huacai Chen and Jiaxun Yang step in as new energy [1].


commit ca263c0fb9f33cc746e6e3d968b7db80072ecf86
Author: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date:   Wed Oct 7 22:37:21 2020 +0200

    MAINTAINERS: Remove myself

    I have been working on project other than QEMU for some time,
    and would like to devote myself to that project. It is impossible
    for me to find enough time to perform maintainer's duties with
    needed meticulousness and patience.


QEMU deprecation process is quite slow, if we release mips-softmmu
and mipsel-softmmu binaries with KVM support in 5.2, and you can not
test them, you will still have to maintain them during 2021...

If you don't have neither the hardware nor the time, I suggest you
to only release it on 64-bit hosts. Personally I'd even only
announce KVM supported on the little-endian binary only, because
AFAIK you don't test big-endian KVM neither.

Your call as a maintainer, but remember last RC tag is next
Tuesday (Nov 24) in *4* days, then we release 5.2:
https://wiki.qemu.org/Planning/5.2#Release_Schedule

Regards,

Phil.

