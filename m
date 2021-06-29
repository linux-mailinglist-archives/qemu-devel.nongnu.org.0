Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D90A3B6EF3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 09:47:49 +0200 (CEST)
Received: from localhost ([::1]:49940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly8TE-0007qc-NP
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 03:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly8S9-0006tW-12
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:46:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly8S7-0005Pd-DK
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:46:40 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j1so24551941wrn.9
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 00:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BMpss9/lyG5l+UtjABRuyV6xKtRYMLKDX1RsSOVJ1V4=;
 b=bNkr1cjxOeS/ZA93b7lIpgowR4VcYIoNJtbjmpLN4W6nTF4Ne7uIu0DJvprx1kz6jg
 UCLSlJp3edDLFDSlBohVRkCA+z/fUb4eLMARYJ5qrZ0SDuFquSRQAc5Fa/0Jg5IVQCeh
 MUNWDG7GKwkkbAc45fEonhUet+0o/jJbGCyB/+BsApnET8UidKQ3r6XB77A18gGeSuz6
 esGIuMI+nYQqpo7Iv+PYZs7jybxh8VImlc5v+Knl7RnKo8unj6lgaaEwjls6p4AlOaEF
 3dwBfbkWIj3vxtnW49j8BGMGT/h3q8DQiAUkLwreltqh/yNN1b0OUK6IwQAOaTw4RKL6
 Z1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BMpss9/lyG5l+UtjABRuyV6xKtRYMLKDX1RsSOVJ1V4=;
 b=ZvCRYYWF2tivNvRSqJxGAz/Z/6XqEhZtq6Rsg9+mG+IztC+GnNTvJ5BOR3p9L66zgA
 a6lGhY+vale6rmXmZikg9M6wq8R9q/C4T6u9zbjb+ry72keZLzdQkhQWD/PKmJNyI7zK
 OKECEXrg/fsQSdZnhNlECV0x+Hbf4fAQAtRNU3OBTZHpjX/BHjglzXS6Q+HpZMbwaAeD
 vRUNx+FS8r0alQaCrGjIby0916eJ3VYQNoEVpxvlo4Eb4Q1QIiZ4wh6p78kFcfPXcdR4
 nDP9cxO9xEyxnZF3lfNd0MsfcVR0JD7WXmVfz34UIzw7F/IIaIub8sVadRY6krr5z7gK
 PkaA==
X-Gm-Message-State: AOAM532FlCrnNPLtG0so7q6d/hkWuDgZlyYcUwySl5sC5+Jfpv3Aegx4
 mjVJLV+K09QBATJLvmQwKfI=
X-Google-Smtp-Source: ABdhPJzB8ZQZqm7WLIhv3WTn9lpdwHZ6X0TElB37XmOWGRKJ79Mtpgtr48q2swOUdf59hoeb5o1REg==
X-Received: by 2002:a5d:43d1:: with SMTP id v17mr18579764wrr.118.1624952797805; 
 Tue, 29 Jun 2021 00:46:37 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 16sm3840206wmk.18.2021.06.29.00.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 00:46:37 -0700 (PDT)
Subject: Re: [PATCH v3] Add basic power management to raspi.
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210625210209.1870217-1-nolan@sigbus.net>
 <4fe1c908-6d2e-8481-81c6-2c68c367e5e3@amsat.org>
 <CAFEAcA_dZekwW0VXLUJWnDR9Etfc3kcEndckRKj-LyPa+0a2WA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <15380b6a-8886-9076-69c2-f782ebebdf49@amsat.org>
Date: Tue, 29 Jun 2021 09:46:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_dZekwW0VXLUJWnDR9Etfc3kcEndckRKj-LyPa+0a2WA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Nolan Leake <nolan@sigbus.net>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 7:38 PM, Peter Maydell wrote:
> On Sat, 26 Jun 2021 at 11:16, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Nolan, Peter,
>>
>> On 6/25/21 11:02 PM, Nolan Leake wrote:
>>> diff --git hw/arm/bcm2835_peripherals.c hw/arm/bcm2835_peripherals.c
>>
>> Odd, usually the diff line comes with a/ b/ prefix, I can not
>> apply your patch (git version 2.31.1, Fedora):
>>
>> Applying: Add basic power management to raspi.
>> error: arm/bcm2835_peripherals.c: does not exist in index
>> error: misc/meson.build: does not exist in index
>> error: hw/arm/bcm2835_peripherals.h: does not exist in index
>> Patch failed at 0001 Add basic power management to raspi.
>>
>> But patchew succeeded:
>> https://patchew.org/QEMU/20210625210209.1870217-1-nolan@sigbus.net/
>>
>> Applying: Add basic power management to raspi.
>> Using index info to reconstruct a base tree...
>> A       arm/bcm2835_peripherals.c
>> A       hw/arm/bcm2835_peripherals.h
>> A       misc/meson.build
>> Falling back to patching base and 3-way merge...
>>
>> So I tested patchew's commit 7856ac0e804:
>> https://github.com/patchew-project/qemu/commit/7856ac0e8045d006f1008a03e1d4d8710b9d0612
> 
> It succeeded, but if you look at that tree you'll notice it
> was confused enough to create a new top level directory misc/
> to put the .c file in! I'm not sure how the result manages to build :-)

I had to do move bcm2835_peripherals.c to build (otherwise meson
complains and refuses to finish the configure script). I assumed it was
a problem on my side (or with my git version) and didn't noticed
bcm2835_peripherals.h was not under include/.

> I have fixed this up locally. I have also moved the bcm2835_powermgt.h
> file to include/hw/misc, to go with the other bcm2835 headers there,
> and I have fixed the region size.

Thank you.

Nolan, can you tell us what OS/distribution you are using? You used
git v2.30.2 which might be badly packaged there, and could deserve
a proper bug report.

Regards,

Phil.

