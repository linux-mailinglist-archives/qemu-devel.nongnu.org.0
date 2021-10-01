Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D141EC80
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 13:47:18 +0200 (CEST)
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWH0W-0004Wu-LC
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 07:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWGui-0001oG-QW
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 07:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWGuf-0004gq-B8
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 07:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633088471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xfrex0QI7hpVzPgFFWdo8jVGIG7esty/IttIpU+pckc=;
 b=JpZHP7WvLgk+5CYYUXn9jys2s8MaJrOVq6rIVXNieTj2wZczGS0tSEEVCafvsuGJgkjoVI
 u+MaVEdcJYtHQyB9HM3ZzQVEi5e9SH62KYx16UCSOXuNhoJewox8tjhZksWmYWQ8wduT2M
 VrE4mzjMM2MfPG3EaPQmRJroJHdpdwc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-iCU4q3phO8aOvpZddDvIyA-1; Fri, 01 Oct 2021 07:41:08 -0400
X-MC-Unique: iCU4q3phO8aOvpZddDvIyA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n17-20020a7bc5d1000000b0030d4041f73eso1231539wmk.4
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 04:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xfrex0QI7hpVzPgFFWdo8jVGIG7esty/IttIpU+pckc=;
 b=RLQQ3qnGNTdD5CmOm7WuA00ghdnkQm1M/2wopRRJ56gUiLo1FRdD6kO/hx5MHLjUOd
 H3fmgu9m2GMENdm75R8TcwhBdbQQaKGrtSh1eTkm6ORn+1j0tEkYny1uEWq+1r50i5+J
 kqx3B5kPeVrafDwOmyp2Mi1xDaUDBdpGmguBSE5uI2clC5EPMHFz0ClXNLnpOdLlEp9+
 f3hgrutYiTB90pNoxjXGZ5NYRjbZzu0WB1GYxjY4pp19K69GhjNJJEC9soqrc/GMO3Uz
 q9WY4d5Bi8lV7yU7z1BazjlxFGeKkTZDzMKcBdrqMa2lTMr2AsQD+eRWerVjiGSFxVPl
 sMlg==
X-Gm-Message-State: AOAM533VR6C/ohW9xgPhrvuwlKQOYYV7Vvj3/6Z6f7J5Xbm97HCfOshy
 cYWJQskR5fzJX9oeKwlxWe6CZ159QRY6YvaFUnTeA7R4+5rSYNZ7V3u1qOoH9MCg6VcCLaXgsew
 ZAgr+JIs/KjRxWJM=
X-Received: by 2002:adf:dd42:: with SMTP id u2mr11729463wrm.39.1633088467168; 
 Fri, 01 Oct 2021 04:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW15DGrz6c7gTXdKXbRFGbrV8kTzBjtPYPcKJEDXOs5Ud/ISBkSQJNuSRC7O4Pr1JADfTg2A==
X-Received: by 2002:adf:dd42:: with SMTP id u2mr11729446wrm.39.1633088466953; 
 Fri, 01 Oct 2021 04:41:06 -0700 (PDT)
Received: from thuth.remote.csb (tmo-097-75.customers.d1-online.com.
 [80.187.97.75])
 by smtp.gmail.com with ESMTPSA id v10sm5795718wrm.71.2021.10.01.04.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 04:41:06 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
 <YVbQERWD9fY0kxxW@redhat.com>
 <CAFEAcA8PdNEHU2YMGT56bCwezf9i+BGxijwevLJakrR_N1Yjhw@mail.gmail.com>
 <YVbYavVeV/OmYON6@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
Message-ID: <9e3620ce-4a79-da2c-aaf1-20832622c576@redhat.com>
Date: Fri, 1 Oct 2021 13:41:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVbYavVeV/OmYON6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/10/2021 11.44, Daniel P. Berrangé wrote:
> On Fri, Oct 01, 2021 at 10:37:51AM +0100, Peter Maydell wrote:
>> On Fri, 1 Oct 2021 at 10:10, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>
>>> On Thu, Sep 30, 2021 at 09:10:12AM +0200, Thomas Huth wrote:
>>>> On 27/08/2021 14.09, Thomas Huth wrote:
>>>>> The dtc submodule is currently pointing to non-release commit. It's nicer
>>>>> if submodules point to release versions instead and since dtc 1.6.1 is
>>>>> available now, let's update to that version.
>>
>>> Most of our supported platforms don't have version 1.6.1 available.
>>>
>>> As a general goal IMHO we should be seeking to eliminate bundling of
>>> 3rd party modules that are commonly available in distros. We've
>>> carried dtc for a hell of a long time, and if we keep updating our
>>> submodule we'll keep relyin on new features, and never be able to
>>> drop it because it will always be newer than what's in the distros.
>>>
>>> So personally I think we should never again update dtc and capstone
>>> modules. If we want to take adbantage of new features, then do that
>>> through conditional compilation, as we do for any of the other 3rd
>>> party libraries consumed.

I basically agree, especially for capstone. But for dtc, that also means 
that we cannot compile certain target boards if its not available ... that's 
somewhat more ugly than if there is just a missing backend feature ... but I 
guess it's still ok. Users could always install a recent libfdt first.

>> I agree in general, but (per the commit message here) our dtc
>> submodule is currently pointing at some random not-a-release
>> commit in upstream dtc. We should at least move forward to
>> whatever the next released dtc after that is, before we say
>> "no more dtc updates".
> 
> Yep, if we want to fix it onto an official version tag, that's
> OK, just not jumping right to very latest version.

That was the intention here. Accidentally, the first release tag after the 
commit that we are currently using, is version 1.6.1, which also happens to 
be the latest version, too.

> We might want
> to move it backwards to better align with what we're targetting
> in the support

We shouldn't use an older versions as submodule since there was a problem in 
libfdt on Sparc hosts on older versions. All other hosts should be fine with 
version 1.5.1 though (which is what we're indirectly checking in meson.build)

> Best I can tell the distros currently have these versions:
> 
>       - Alpine 3.14 - 1.6.1
>       - CentOS 8 - 1.6.0
>       - Debian 10 - 1.4.7
>       - Fedora 33 - 1.6.0
>       - OpenSUSE Leap 15.3 - 1.5.1
>       - Ubuntu 18.04 - 1.4.5
>       - FreeBSD Ports - 1.6.0
>       - OpenBSD Ports - 1.6.0
>       - macOS HomeBrew - 1.6.1
>       - Windows MSys2 - 1.6.0

Thanks! I was just about to collect the same information, too.

So I'd suggest: Update the submodule to v1.6.1 now, so that it points to a 
proper release tag.

Then wait until Debian 10 and Ubuntu 18.04 are EOL (sometime in 2022), then 
we can finally get rid of the dtc submodule an rely on the system fdt 
instead (assuming that versions that are older than 1.6.1 will be fixed by 
the distros on Sparc hosts).

  Thomas


