Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729B86130BF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 07:53:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opOew-0006ed-FM; Mon, 31 Oct 2022 02:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1opOeu-0006e9-Su
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 02:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1opOet-0008Vt-C8
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 02:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667199150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhfnUEkaHp4hatogNphWgzJ8ZTTZcY/uBgeE2dcaqzE=;
 b=WZ+msG/HbZeZaCZgwg2zxxPnhzONarE4+X1GckscKXfJGzd6MaYCO1a6jYbLnpg2e6VFbW
 C2tnspvowBQGOpkl3h3jBcoV1quNSYMWHHR2V+uVExe5AMhE3pKVmQjaupMbuvAQje/3IV
 l4dr7+ODEWfsGYUYWy/+00IZxOCyoVE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-225-QAKn4iLxP_WPVpcCvlPexQ-1; Mon, 31 Oct 2022 02:52:28 -0400
X-MC-Unique: QAKn4iLxP_WPVpcCvlPexQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 w4-20020a05620a444400b006fa24b2f394so2490296qkp.15
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 23:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UhfnUEkaHp4hatogNphWgzJ8ZTTZcY/uBgeE2dcaqzE=;
 b=iYI636QCrPyJKko8uKAp263k87sd0gCxsj3OpK8jImdZjOkNTrkqgicIYLepHahSdD
 27fXClr0DdWfTy4c/Zwz5QtGGU7NTEvlAyNfzk6d8JbCsTX2eKoVULYz5ZmC6qaMUF7B
 09/G1pgVrPMaCJy4lOqrWB7ylomWpyrpg3S9ECH15lbe6A+ZbF9Sk0cIMHj1rDF2+Rnz
 Lh9J9fjpn6fHNbESxAw+qazDrfXM1NPNjd828lPlyHsjBB7nNVbWO9aFu05M0S0sgNj/
 TpEZ2ej5qa1/KzWye7wFdT6DChfKVYEbrL/sw5cUH1Cd3Zztb5oHl8PC7qJii96YZGcm
 GtAQ==
X-Gm-Message-State: ACrzQf0RwazcPfeIZ3pyvpuPQPm+coI2z3R3Ykr4hlM8A7vgFNBPVtRa
 tHNPWiFydKVvt2wHnF1x3HZ6SNmGu8VY66uZzB/NyXIA8KnYSZ4my47xOTsxZBWVnKWu374lws+
 T3jiVM79MsTalefw=
X-Received: by 2002:a05:620a:4808:b0:6fa:32a3:14b5 with SMTP id
 eb8-20020a05620a480800b006fa32a314b5mr865004qkb.570.1667199148267; 
 Sun, 30 Oct 2022 23:52:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM55Bb2z5NfsZwqyoLLrSuYbhe7LpSovcLKrq+Fn+NIIRlkzOciQntEYW9SHNnLJzLTHwmLsCw==
X-Received: by 2002:a05:620a:4808:b0:6fa:32a3:14b5 with SMTP id
 eb8-20020a05620a480800b006fa32a314b5mr864990qkb.570.1667199148029; 
 Sun, 30 Oct 2022 23:52:28 -0700 (PDT)
Received: from [192.168.8.104] (tmo-097-47.customers.d1-online.com.
 [80.187.97.47]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05620a40d300b006eea4b5abcesm4226689qko.89.2022.10.30.23.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 23:52:27 -0700 (PDT)
Message-ID: <573aea01-ecac-25ef-7dfc-6a4ce5a8f89b@redhat.com>
Date: Mon, 31 Oct 2022 07:52:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <CAEUhbmVvxoZD7dJbMGud5LLp3fmZTyovgXUvEEdyuneg=K_LUg@mail.gmail.com>
 <1013abdd-1e46-1121-21f5-522cb9bb5cd1@redhat.com>
 <CAEUhbmX=pVTK1VdCz6XcpYdUb8_4Og2T2BXGWEs2znpxp9c6mw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/7] nsis: gitlab-ci: Improve QEMU Windows installer
 packaging
In-Reply-To: <CAEUhbmX=pVTK1VdCz6XcpYdUb8_4Og2T2BXGWEs2znpxp9c6mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 29/10/2022 15.45, Bin Meng wrote:
> Hi Thomas,
> 
> On Wed, Sep 21, 2022 at 8:24 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 21/09/2022 14.18, Bin Meng wrote:
>>> Hi,
>>>
>>> On Thu, Sep 8, 2022 at 9:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>
>>>> At present packaging the required DLLs of QEMU executables is a
>>>> manual process, and error prone.
>>>>
>>>> Improve scripts/nsis.py by adding a logic to automatically package
>>>> required DLLs of QEMU executables.
>>>>
>>>> 'make installer' is tested in the cross-build on Linux in CI, but
>>>> not in the Windows native build. Update CI to test the installer
>>>> generation on Windows too.
>>>>
>>>> During testing a 32-bit build issue was exposed in block/nfs.c and
>>>> the fix is included in this series.
>>>>
>>>>
>>>> Bin Meng (7):
>>>>     scripts/nsis.py: Drop the unnecessary path separator
>>>>     scripts/nsis.py: Fix destination directory name when invoked on
>>>>       Windows
>>>>     scripts/nsis.py: Automatically package required DLLs of QEMU
>>>>       executables
>>>>     .gitlab-ci.d/windows.yml: Drop the sed processing in the 64-bit build
>>>>     block/nfs: Fix 32-bit Windows build
>>>>     .gitlab-ci.d/windows.yml: Unify the prerequisite packages
>>>>     .gitlab-ci.d/windows.yml: Test 'make installer' in the CI
>>>>
>>>>    meson.build              |  1 +
>>>>    block/nfs.c              |  8 ++++++
>>>>    .gitlab-ci.d/windows.yml | 40 ++++++++++++++++++++-------
>>>>    scripts/nsis.py          | 60 +++++++++++++++++++++++++++++++++-------
>>>>    4 files changed, 89 insertions(+), 20 deletions(-)
>>>>
>>>
>>> I see Thomas only queued patch #4 (".gitlab-ci.d/windows.yml: Drop the
>>> sed processing in the 64-bit build")
>>>
>>> What about other patches?
>>
>> I hope that Stefan Weil (our W32 maintainer) could have a look at these first...
>>
> 
> Stefan has reviewed / tested patch 1-3. Not sure who is going to queue
> these 3 patches?

If Stefan has time for a pull request, I think he would be the best fit. Stefan?

Otherwise, maybe Marc-André could take those patches, since he apparently 
wrote that nsis.py script?

(By the way, should we have an entry for that script in MAINTAINERS? ... 
likely in the W32/W64 section?)

  Thomas


