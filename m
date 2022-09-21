Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009435BFDD9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:32:24 +0200 (CEST)
Received: from localhost ([::1]:56406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaytr-0001H9-1C
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaymm-0003Xk-Ic
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oaymj-00012S-Vl
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663763101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9bLu/kW1ODwVWHrpXy2/BjmYcy7R5RJp/ShYoj6bRI=;
 b=RSGo+0mFlubNmbmTzd6w9I+3PlbKC30sfUPYfoJbXzfMLwiQ/NlbCYZJErUEZ00RMPZh9B
 GLcsL+p8QkafQduS+n/sqK6x6VFKWcMcaQ8wcLIguyR/FsEWvf3SvGtYiMo60FYNKOgITO
 WmMR2solud+a89Lv18HxcB3fu6knnZI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-CiDsDaGnOUG0-Hdjs7I7mw-1; Wed, 21 Sep 2022 08:25:00 -0400
X-MC-Unique: CiDsDaGnOUG0-Hdjs7I7mw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v62-20020a1cac41000000b003b4fca0e80cso407748wme.0
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 05:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=l9bLu/kW1ODwVWHrpXy2/BjmYcy7R5RJp/ShYoj6bRI=;
 b=njiFxTG6svwAUnSnI0jctzRkIjXIpafA+DqwvllsPTlee87qdjDQRwrazat15UlzqS
 5XYsJq45HcJc7kAkDxaX/qf69r8vX7FcC59Ebe2n5Tb1nFLjMZmiq3RyWJqDqI0Mw4S+
 +QzvwLGCGZQZ0P8s0zEB5MWHv954recayVhRVqAwtFw8dY4wIAetB9+2mzE/+v05dOPP
 Qst9yW9vD1JXCMXKE4TtloUMhE6d1N4p7Am4RZhggeMbVziOvbUzikfUmLLI1Jm8F1hv
 Q1XcTrmpRyAUPWXf/PGGj9TUnMWFIqqq2rq2lIUbZVcr4+VelvOf6fOkK0eyhpTIW1Co
 C8Ig==
X-Gm-Message-State: ACrzQf0MeMCv60k+6CVT8I+o0IroqtAEz8TVCYinWn5JB9TV8e6Qh+Us
 kSWmaf7Ghnf/vNBWOXPVyVOT5Tqj5o6CT3v0j8rI6g3mxLIyUk9hr4H9RFazcekFUBUhPAdLBc8
 76cKcGrgzj+oBGNQ=
X-Received: by 2002:a7b:c450:0:b0:3b4:fb1a:325d with SMTP id
 l16-20020a7bc450000000b003b4fb1a325dmr1523159wmi.138.1663763096006; 
 Wed, 21 Sep 2022 05:24:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6NT7G0m3I5tiHBBdbFCaAv/mR+QDWEqG720AvW6es1Nt6Jr+PLo1ZS7RXKh0Av+6YOY+3vuA==
X-Received: by 2002:a7b:c450:0:b0:3b4:fb1a:325d with SMTP id
 l16-20020a7bc450000000b003b4fb1a325dmr1523142wmi.138.1663763095802; 
 Wed, 21 Sep 2022 05:24:55 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-131.web.vodafone.de.
 [109.43.179.131]) by smtp.gmail.com with ESMTPSA id
 x12-20020adfffcc000000b0022ac672654dsm2346984wrs.58.2022.09.21.05.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 05:24:55 -0700 (PDT)
Message-ID: <1013abdd-1e46-1121-21f5-522cb9bb5cd1@redhat.com>
Date: Wed, 21 Sep 2022 14:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/7] nsis: gitlab-ci: Improve QEMU Windows installer
 packaging
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <CAEUhbmVvxoZD7dJbMGud5LLp3fmZTyovgXUvEEdyuneg=K_LUg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEUhbmVvxoZD7dJbMGud5LLp3fmZTyovgXUvEEdyuneg=K_LUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.702, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/09/2022 14.18, Bin Meng wrote:
> Hi,
> 
> On Thu, Sep 8, 2022 at 9:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> At present packaging the required DLLs of QEMU executables is a
>> manual process, and error prone.
>>
>> Improve scripts/nsis.py by adding a logic to automatically package
>> required DLLs of QEMU executables.
>>
>> 'make installer' is tested in the cross-build on Linux in CI, but
>> not in the Windows native build. Update CI to test the installer
>> generation on Windows too.
>>
>> During testing a 32-bit build issue was exposed in block/nfs.c and
>> the fix is included in this series.
>>
>>
>> Bin Meng (7):
>>    scripts/nsis.py: Drop the unnecessary path separator
>>    scripts/nsis.py: Fix destination directory name when invoked on
>>      Windows
>>    scripts/nsis.py: Automatically package required DLLs of QEMU
>>      executables
>>    .gitlab-ci.d/windows.yml: Drop the sed processing in the 64-bit build
>>    block/nfs: Fix 32-bit Windows build
>>    .gitlab-ci.d/windows.yml: Unify the prerequisite packages
>>    .gitlab-ci.d/windows.yml: Test 'make installer' in the CI
>>
>>   meson.build              |  1 +
>>   block/nfs.c              |  8 ++++++
>>   .gitlab-ci.d/windows.yml | 40 ++++++++++++++++++++-------
>>   scripts/nsis.py          | 60 +++++++++++++++++++++++++++++++++-------
>>   4 files changed, 89 insertions(+), 20 deletions(-)
>>
> 
> I see Thomas only queued patch #4 (".gitlab-ci.d/windows.yml: Drop the
> sed processing in the 64-bit build")
> 
> What about other patches?

I hope that Stefan Weil (our W32 maintainer) could have a look at these first...

  Thomas



