Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02D54F42D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 11:23:41 +0200 (CEST)
Received: from localhost ([::1]:40850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o28Ca-0001rZ-0B
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 05:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o287D-0000NL-KQ
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:18:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o2879-0006iG-0n
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655457481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RW9s8gRv8QqzvtEzG03rI8EO0vGsgZT2Pjj+vZHwNb8=;
 b=aPCcc4DzpPzq+YBBWTgAv3jAvXg2+7gT1QohDRnwQtw9+qWbvB9Jvz11bMgJIg4LaVrsPV
 ow4P993AQDydgYH7deoJBVYfZgNi1bjPZ/0zhliVujP+uNYir2vMULGWdKu/mT2ln/4UVt
 SMwtoCEF78GDJNpQijQNPZ0oLfGlY2s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-SlBQv0rDMC-PVE6tXcTvGA-1; Fri, 17 Jun 2022 05:18:00 -0400
X-MC-Unique: SlBQv0rDMC-PVE6tXcTvGA-1
Received: by mail-wm1-f70.google.com with SMTP id
 be12-20020a05600c1e8c00b0039c506b52a4so3513409wmb.1
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 02:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RW9s8gRv8QqzvtEzG03rI8EO0vGsgZT2Pjj+vZHwNb8=;
 b=SxnnLqSZrz1AsP3LNCUStEO8at8xyQjeRzmHW+rid9In9ABwQkUFhyuYFtd2KTG7QL
 Zqh+i9m51mBKjGBJcD+Ht+/G4CS51RtDCKaJlf1n9SYwY3vun9afW5Ujf43SgSIKxyud
 kCkVcBhRnhvlTIP8F1vde1IRNakUO00kJc+qx6L4PRo62D2b1jf+ky7NAZgBEZoKbRv3
 I9mJp71eEenvdJjMBFM0XjXfoUNgjT6LlX6uKdVTuGnqfGeuXmzZ48IVk2z+CFy7fZ36
 RjWJeKht7cOkHwLfjLg0R8hBszc3hNo5FnlNgyhcd+6gM9p00P7KxaxB9IMfENzH/nvw
 MgBQ==
X-Gm-Message-State: AOAM532YE+oZmF4MleCWEcREruS24t9Grq8Y0LC3e2vDPVffW67NH6BR
 ae0J7VFORuFZMFKedo+5hD4YB/zFzzGzS5ZaAYXW4b40yZGFaJ+NMqSiFSAMqkmZ1+uniHsrkIJ
 bTrkHUxPbJ/p9Xdw=
X-Received: by 2002:a05:600c:190b:b0:39c:7812:f1cb with SMTP id
 j11-20020a05600c190b00b0039c7812f1cbmr19819419wmq.196.1655457479123; 
 Fri, 17 Jun 2022 02:17:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+VqHS7x+n/MEWSpMD1pJ3zbr2RJ+x0c+BXaRsPwqE7608DS+53Ssz3ydp7pNBoGnF0Fc2RQ==
X-Received: by 2002:a05:600c:190b:b0:39c:7812:f1cb with SMTP id
 j11-20020a05600c190b00b0039c7812f1cbmr19819384wmq.196.1655457478842; 
 Fri, 17 Jun 2022 02:17:58 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c2ccf00b003974a00697esm8797709wmc.38.2022.06.17.02.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 02:17:58 -0700 (PDT)
Message-ID: <fec5a038-fe3f-dfd4-3c01-b2e956089006@redhat.com>
Date: Fri, 17 Jun 2022 11:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/10] qga: treat get-guest-fsinfo as "best effort"
Content-Language: en-US
To: John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220616142659.3184115-1-jsnow@redhat.com>
 <20220616142659.3184115-4-jsnow@redhat.com>
 <CAJ+F1C+iHv-RvnbvUikD431tNN8PJ+Z=EO0Hgi8Dht-sX1OKBQ@mail.gmail.com>
 <CAFn=p-ayV9vrF7JE=rwkfC_E8kmxAZE-_kwse0RsQdDS7PXtEw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFn=p-ayV9vrF7JE=rwkfC_E8kmxAZE-_kwse0RsQdDS7PXtEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 16/06/2022 16.43, John Snow wrote:
> On Thu, Jun 16, 2022 at 10:36 AM Marc-André Lureau
> <marcandre.lureau@gmail.com> wrote:
>>
>> Hi
>>
>> On Thu, Jun 16, 2022 at 6:27 PM John Snow <jsnow@redhat.com> wrote:
>>>
>>> In some container environments, there may be references to block devices
>>> witnessable from a container through /proc/self/mountinfo that reference
>>> devices we simply don't have access to in the container, and could not
>>> provide information about.
>>>
>>> Instead of failing the entire fsinfo command, return stub information
>>> for these failed lookups.
>>>
>>> This allows test-qga to pass under docker tests, which are in turn used
>>> by the CentOS VM tests.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   qga/commands-posix.c | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>>> index 0469dc409d4..5989d4dca9d 100644
>>> --- a/qga/commands-posix.c
>>> +++ b/qga/commands-posix.c
>>> @@ -1207,7 +1207,13 @@ static void build_guest_fsinfo_for_device(char const *devpath,
>>>
>>>       syspath = realpath(devpath, NULL);
>>>       if (!syspath) {
>>> -        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
>>> +        if (errno == ENOENT) {
>>> +            /* This devpath may not exist because of container config, etc. */
>>> +            fprintf(stderr, "realpath(%s) returned NULL/ENOENT\n", devpath);
>>
>>
>> qga uses g_critical() (except for some win32 code paths atm)
> 
> Whoops, this is a debugging thing that I left in by accident. I was
> just so excited that after testing overnight, everything worked. :)
> 
>>
>>>
>>> +            fs->name = g_strdup("??\?-ENOENT");
>>
>>
>> Hmm, maybe we should make the field optional instead.
> 
> Does that harm compatibility in a meaningful way? I'm happy to do
> whatever QGA maintainers want me to do. I just did something quick and
> dirty to get it working at all as a conversation starter. O:-)

Should the device get ignored instead of returning up a dummy device? ... at 
least that's what I'd expect at a quick glance at the problem...

  Thomas


