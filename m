Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B76D3C818C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:26:46 +0200 (CEST)
Received: from localhost ([::1]:59968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bAD-0008I7-H5
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3b8W-0007WI-Cc
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:25:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m3b8T-0004a3-Jd
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626254696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bkMbogtUrUMsd2bgAEKOQK5r6nZ07NyP82vUnHElno=;
 b=Ytt7OZe/iUxsQ84IgFyqnjKKflRu+vdXpXYGEmic2BQr9wocKSQ9s1o1YMoQNu6xFSVfe7
 2fQHcDvacC3NkOGoMHPiKBH0jRGyLVcfjQMRAFo6wySXs4RtkLG+LRA9TaTY5Y4vmTjgu/
 aETokaqX8bfrH16k5XGQU9DIEwp3yK0=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-L9O3S4auO0OAv0t83BZ02A-1; Wed, 14 Jul 2021 05:24:55 -0400
X-MC-Unique: L9O3S4auO0OAv0t83BZ02A-1
Received: by mail-pf1-f197.google.com with SMTP id
 s15-20020a056a0008cfb0290306b50a28ecso1201039pfu.10
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1bkMbogtUrUMsd2bgAEKOQK5r6nZ07NyP82vUnHElno=;
 b=ljeAQcnmXMJPDG2TNi9yHjnswOIHbm5UkZueU1ffqnYOT6xiE4BRxUayu8d9qkMC+h
 9dD5C9DVoh2N0iHlDXUU0S0GtbZgBR/Af5drzcE+hahYG7ys3wgdJ4h20GffcW00gtVj
 x7SjGkeWoLMFnEj1PZxKvR+zglDf/erqjsB1vwoCYbQ3Bez8guJLrIZ6EvcdoIH6/UwN
 IP/t964dK5X6QMQK4fBwRShnleUiYjZBYBItAe4jjGEt1TsUoPDoiYlj8xvlD5YqJWdi
 WdkeEkm1f7oIq+n1DWw9+zTZjLZmjWan+4bk60nuFtzkwdYLN0QQVon2WB4DkIKOrcGo
 VB9A==
X-Gm-Message-State: AOAM530m9nfBcn3hveOkLM53q9BJII6WHuQoQAmAdWXUhzp0zCOeYx9b
 TJSLMJUSR8qgFoxcbHUGF1x8VNUHYVAg1Z98D+Bk9zUu4Ue3r4fGQ74mnRrov14HXWu5FyvCc31
 O495cjXH6v6vJRu0=
X-Received: by 2002:a62:b414:0:b029:32e:3ef0:7735 with SMTP id
 h20-20020a62b4140000b029032e3ef07735mr6579888pfn.61.1626254694511; 
 Wed, 14 Jul 2021 02:24:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGHDjt6e/+MSV2P4ZJ8V/LmSxTfmQN3xfdoAlep5MJiCrekEo0y6Rsn5pE2SMTGyUu1JWqsw==
X-Received: by 2002:a62:b414:0:b029:32e:3ef0:7735 with SMTP id
 h20-20020a62b4140000b029032e3ef07735mr6579861pfn.61.1626254694278; 
 Wed, 14 Jul 2021 02:24:54 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id t10sm2109528pgv.52.2021.07.14.02.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 02:24:53 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
 <434daef6-4afb-c796-9b63-f72cca403314@redhat.com>
 <CAEUhbmWqU=sM6s1ogQB6vQmBSf6KrobW9xUcWCbt2aaO3OtuOg@mail.gmail.com>
 <CAEUhbmWZ3D50J08T5bCFAu_hStQ7n=T8O48OVaTAbrdLh48FbQ@mail.gmail.com>
 <63ff5849-d830-87cc-486c-7fc292220424@redhat.com>
 <CAEUhbmV5CaXr9-7W4v5hyTqvJoi1xtg0pxBiY9O6QkOjPWRJcQ@mail.gmail.com>
 <891042a0-10d5-c1df-ae85-7950ae387a41@redhat.com>
 <CAEUhbmW__q9mqDK2_XpTqB2Nmdu0_Mj4UrypOi3TugOuGud11A@mail.gmail.com>
 <62d56b3b-ef11-2384-d3cd-0d34046400ee@redhat.com>
 <CAEUhbmVtydsZBwnt+QVnZp9uwvKNru2CZ_trq07eJ5mT=UcqUA@mail.gmail.com>
 <CAFEAcA_5LugG0JbBX=gN=dYE301nVNuDUpe9--_8o3rw9_y4Jg@mail.gmail.com>
 <CAEUhbmWZnkUKG76SWi0bOXDta9eR__Z5zn38UjSMROuucc1jQg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f000681c-b8ce-16fb-626e-530da2156812@redhat.com>
Date: Wed, 14 Jul 2021 17:24:49 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWZnkUKG76SWi0bOXDta9eR__Z5zn38UjSMROuucc1jQg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Christina Wang <christina.wang@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Markus Carlstedt <markus.carlstedt@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/14 下午5:14, Bin Meng 写道:
> On Wed, Jul 14, 2021 at 5:01 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Wed, 14 Jul 2021 at 04:42, Bin Meng <bmeng.cn@gmail.com> wrote:
>>> On Wed, Jul 14, 2021 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>
>>>> 在 2021/7/13 下午5:11, Bin Meng 写道:
>>>>> Can we get some agreement among maintainers?
>>>>
>>>> It's not about the agreement but about to have a stable ABI. I don't
>>>> know the case for sd but e1000 is used in various  and we work hard to
>>>> unbreak the migration compatibility among downstream versions. Git log
>>>> on e1000.c will tell you more.
>>> Agreement or stable ABI, whatever we call, but we should be in some consistency.
>>>
>>> IMHO maintainers should reach an agreement to some extent on how
>>> compatibility should be achieved. I just found silly to add a property
>>> to fix a real bug in the model, and we preserve the bug all over
>>> releases.
>>>
>>> I can find plenty of examples in the current QEMU tree that were
>>> accepted that changed the bugous register behavior, but it was not
>>> asked to add new properties to keep the bugos behavior.
>>>
>>> e.g.: commit ce8e43760e8e ("hw/net: fsl_etsec: Reverse the RCTRL.RSF logic")
>> There is basically a judgement call going on here about whether the
>> device is "significant enough" that it's worth the effort of
>> preserving back-compatibility of bugs.
>>
>> There is at least one clear rule: if the device isn't used by any
>> machine with a versioned machine type, then there is no need to
>> provide back-compatibility of old buggy behaviour. (There would
>> be no way for the user to select the old behaviour by choosing a
>> -4.2 machine type.) This is why the fsl_etsec device doesn't need
>> to handle that.
>>
>> For PCI devices it's a bit fuzzier because in theory you can plug
>> any PCI card into a versioned x86 PC machine.
>>
>> We don't want to preserve bug-compatibility for absolutely
>> everything, because the codebase would quickly clog up with weird
>> behaviour that we never test and which is not of any use to users
>> either. So you have to look at:
>>   * how easy is providing the back-compat?
>>   * how commonly used in production is the device?
>>   * how likely is it that guests might care?
>>   * would the behaviour change cause odd behaviour across
>>     a cross-version migration from the old QEMU?
>>
>> Migration compat is similar, but not quite the same because the
>> compatibility handling tends to be less invasive, so we take the
>> "provide compat" choice more often. For non-versioned machine types,
>> again, we're OK with breaking back-compat as long as we bump a
>> migration version number so the user gets an error message rather
>> than weird behaviour.
> Thanks Peter. I think the above information can be put in a doc in
> docs/devel, and with some real examples to help developers on how to
> achieve backward compatibility.
>
> Regarding this series, as I mentioned in an earlier thread, I believe
> the possibility of breaking a guest is very low. Adding a back-compat
> check is not that hard either. Just not sure which factor weighs more.


Just few lines of code for the compatibility. Let's do that.

Thanks


>
> Regards,
> Bin
>


