Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2198C6C19A7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:36:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peHYU-0001XX-C7; Mon, 20 Mar 2023 11:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peHYS-0001UV-M4
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:36:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peHYR-0000LK-1R
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679326570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z9Yr/wgIyNIQa/0tjpIKNIoIddq7yoLZuq1TzWAaAio=;
 b=Y0E+NDIbKlOYCzkmPF6xTNgVpBXfmDBMGixzJv2ML1b9rehZa/Rwv6ms0zIPe/ph1frwl4
 nCugTUlWtr6yx3hwZoFA12VH2YxnDS3B0f4qQOdtVAdUCImFLOvtYHJm7wRYeRLHXWnHXV
 FgzAYMTbrFoGPbCa3Z7iXpH+y9Oq1Jo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-aOg0Cg5qN3iAKNkHvDudZg-1; Mon, 20 Mar 2023 11:36:05 -0400
X-MC-Unique: aOg0Cg5qN3iAKNkHvDudZg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l18-20020a05600c4f1200b003ed35ab903aso8215122wmq.6
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 08:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679326564;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9Yr/wgIyNIQa/0tjpIKNIoIddq7yoLZuq1TzWAaAio=;
 b=k5G0RH/hwES0SHCA1kue/1V4Ab91B77kn8TO6JNCpRai8nZHTIgKWVbBr4AKtoISoU
 L21k7kilUeg1NeEB7yCjcQIs5inCJwdCMkxNGBLQ0sX3TIoq8BTQtwjpwsIEL6aMBtwW
 AFMpFjDjo2rr4z4qUdl+iDNJgcUSIY+Xif6QWIVNKT4diCEyxPUPXuXGD9LW/NLu2Qhr
 x3q3nUYsGuzyaTVNazC0uSkqGm5cXxgMaONgFO6tZg39eTApguyNJ+QEnihGz+4Zs+wD
 25J/Oi1Ps2WKdlPXxiAjQQywXW0eUbTFHp+YzW4wyF7/Ubhb0b4UpLH48MS8c6z6nR8R
 dV8g==
X-Gm-Message-State: AO0yUKW9c0pTpXKqMbKkLRCxSm9/Q9rILYxi9uS1U4nmKLCS7l7sK98e
 aHg/sF2oghEnCT7HYxi+wyu1quQqXm1F6nt/si+YH0gFBIVXC3v5q1HNWHQv/q+MbNSFL6XU7r2
 SNRr4ssbC+oKmnqg=
X-Received: by 2002:a5d:618c:0:b0:2d7:3d7c:19cb with SMTP id
 j12-20020a5d618c000000b002d73d7c19cbmr7981wru.4.1679326564799; 
 Mon, 20 Mar 2023 08:36:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set9STLKckAcsGlqFa2If3AbICeCnBzSqpOZcHxdA2IS2bhivt7wTCZUVY4G+Q18krFDgVoqeog==
X-Received: by 2002:a5d:618c:0:b0:2d7:3d7c:19cb with SMTP id
 j12-20020a5d618c000000b002d73d7c19cbmr7964wru.4.1679326564534; 
 Mon, 20 Mar 2023 08:36:04 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-234.web.vodafone.de.
 [109.43.179.234]) by smtp.gmail.com with ESMTPSA id
 g18-20020adffc92000000b002cdbb26bb48sm9198329wrr.33.2023.03.20.08.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:36:04 -0700 (PDT)
Message-ID: <b578116e-0e44-f692-28fa-8eae9b01e0b8@redhat.com>
Date: Mon, 20 Mar 2023 16:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 00/24] s390x and misc patches for 8.0-rc1
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
References: <20230320130330.406378-1-thuth@redhat.com>
 <539ae95e-7e81-586c-b1d3-e8e41145cc42@redhat.com>
 <CAFEAcA9_1Yyg=X6mNOyMn0NeGnJs4xj0m6VrkjOb=J-LZmVL1A@mail.gmail.com>
 <5dfd8515-3e51-b861-3dc5-02c29c699b05@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <5dfd8515-3e51-b861-3dc5-02c29c699b05@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/03/2023 16.27, Philippe Mathieu-Daudé wrote:
> On 20/3/23 16:10, Peter Maydell wrote:
>> On Mon, 20 Mar 2023 at 14:02, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 20/03/2023 14.03, Thomas Huth wrote:
>>>>    Hi Peter!
>>>>
>>>> The following changes since commit 
>>>> 74c581b6452394e591f13beba9fea2ec0688e2f5:
>>>>
>>>>     Merge tag 'trivial-branch-for-8.0-pull-request' of 
>>>> https://gitlab.com/laurent_vivier/qemu into staging (2023-03-17 14:22:01 
>>>> +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-20
>>>>
>>>> for you to fetch changes up to 48805df9c22a0700fba4b3b548fafaa21726ca68:
>>>>
>>>>     replace TABs with spaces (2023-03-20 12:43:50 +0100)
>>>
>>>    Hi Peter,
>>>
>>> FYI, since you likely did not put this into your CI branch yet, I did a
>>> small fix on top: I replaced the patch that fixes osdep.h with the one by
>>> Philippe, since it was slightly better (removing the "extern" keyword
>>> instead of swapping it).
>>>
>>> New commit ID for the tag is now: c29e73f7e65299ed9261abce3950710d89c64724
>>>
>>> I hope that's ok, if not, please let me know.
>>
>> Ah, I've already merged the old tag into staging for the CI
>> run. I could drop it and re-do, but we'd burn another lot of
>> CI minutes on it. Is that worth doing?
> 
> Nah, what is worth is getting CI green and saving minutes :)

Agreed, it was a rather cosmetic change - and I'm pretty sure Philippe will 
fix it in the 8.1 cycle instead :-)

  Thomas


