Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B816CD914
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 14:06:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phTty-0006pH-M7; Wed, 29 Mar 2023 07:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phTtw-0006ok-HT
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 07:23:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phTtu-00044z-RA
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 07:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680089013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C97uR/hhQ+ERIYheJ3+18QOMdGHfvIerzeofdHSNaZc=;
 b=ZN07swD0JJQMgP4foKsrZYMNrBj2Fhh6lGwn0Fuw5QERdeJfOpaN7jpPvbnCeYZzXyFkms
 f1nULeRlAME2sLdGq3xNi/y3RkVQ/4YNLho99wENB4/D/RYDqeId9ER9rhj1PuvwZkH0l2
 ufnEFGawjmW6aDYNU8Stj+mmu3hG33w=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-Maj6XGOpNhOwmYEqPAv8bw-1; Wed, 29 Mar 2023 07:23:30 -0400
X-MC-Unique: Maj6XGOpNhOwmYEqPAv8bw-1
Received: by mail-qk1-f199.google.com with SMTP id
 pc36-20020a05620a842400b00742c715894bso7082486qkn.21
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 04:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680089010;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C97uR/hhQ+ERIYheJ3+18QOMdGHfvIerzeofdHSNaZc=;
 b=sKxA2lBxSmSJSp8dL5jM892ed4fgV8r7sW7Waw+4OE+5TsZl1i0wOpu52MilYw52ze
 V0jeG0u4SNICpE+MDdbTkkRES4OouWzloheTdbfNvNEXm4rsC8YMl6uYPIM5wn4a1iUY
 P8gaRJL3+r0AGnh8tpvdxKxPd4lG1fdIakZ7SXss4+nSgH+DEFEffjwHXcLvr3NjxMVP
 2c5X6i0l+vu/xOzVkn7PDd8mofOh3cQt2s3Kq2mAfP99v7Y2nTVLlQdNQRPkWb8IZSAW
 bsofdN8hDzWxJEh90ihHcSxlHfwLu430dzqtB+cTI2Mw28FWUon8CKqbC+boOecVTNly
 jK6w==
X-Gm-Message-State: AO0yUKVKCB9dWXk4wVkzS9koSMTJoHdJqd+CNRlMZSDC/th1dzvzcg5k
 UjSZiIYiBi/Yf9FobEgY5WOZKrWt4JLjaKgb2aEnnonqgsdYkRBvz1QYn7NchyNHuh/fRSl65H1
 3ivpOYGJyxF67+/Q=
X-Received: by 2002:ac8:5d94:0:b0:3b6:9c63:5ca1 with SMTP id
 d20-20020ac85d94000000b003b69c635ca1mr34426717qtx.43.1680089010211; 
 Wed, 29 Mar 2023 04:23:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set8nUBQytNfAEK34SfJBGTdciXWweqrSgH8zsqD1CuaqtQJ4LochRS+RjgtIBPJ52FM9jlHctw==
X-Received: by 2002:ac8:5d94:0:b0:3b6:9c63:5ca1 with SMTP id
 d20-20020ac85d94000000b003b69c635ca1mr34426677qtx.43.1680089009796; 
 Wed, 29 Mar 2023 04:23:29 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-100.web.vodafone.de.
 [109.43.177.100]) by smtp.gmail.com with ESMTPSA id
 66-20020a370b45000000b0071eddd3bebbsm10217371qkl.81.2023.03.29.04.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 04:23:29 -0700 (PDT)
Message-ID: <257e4262-64dd-ffe1-a3f7-a8d7d4122d03@redhat.com>
Date: Wed, 29 Mar 2023 13:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 7/8] iotests: register each I/O test separately with
 meson
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230303160727.3977246-1-berrange@redhat.com>
 <20230303160727.3977246-8-berrange@redhat.com>
 <2dc0e2fe-bb41-f81a-893f-022d17c98a48@redhat.com>
 <ZCQekQ0/zaRsL2S/@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZCQekQ0/zaRsL2S/@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 29/03/2023 13.18, Daniel P. Berrangé wrote:
> On Wed, Mar 29, 2023 at 12:47:51PM +0200, Thomas Huth wrote:
>> On 03/03/2023 17.07, Daniel P. Berrangé wrote:
>>> Currently meson registers a single test that invokes an entire group of
>>> I/O tests, hiding the test granularity from meson. There are various
>>> downsides of doing this
>>>
>>>    * You cannot ask 'meson test' to invoke a single I/O test
>>>    * The meson test timeout can't be applied to the individual
>>>      tests
>>>    * Meson only gets a pass/fail for the overall I/O test group
>>>      not individual tests
>>>    * If a CI job gets killed by the GitLab timeout, we don't
>>>      get visibility into how far through the I/O tests
>>>      execution got.
>>>
>>> This switches meson to perform test discovery by invoking 'check' in
>>> dry-run mode. It then registers one meson test case for each I/O
>>> test. Parallel execution remains disabled since the I/O tests do not
>>> use self contained execution environments and thus conflict with
>>> each other.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>    tests/qemu-iotests/meson.build | 35 ++++++++++++++++++++++++++++------
>>>    1 file changed, 29 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
>>> index 323a4acb6a..a162f683ef 100644
>>> --- a/tests/qemu-iotests/meson.build
>>> +++ b/tests/qemu-iotests/meson.build
>>> @@ -32,16 +32,39 @@ foreach k, v : emulators
>>>      endif
>>>    endforeach
>>> +qemu_iotests_check_cmd = files('check')
>>> +
>>>    foreach format, speed: qemu_iotests_formats
>>>      if speed == 'quick'
>>>        suites = 'block'
>>>      else
>>>        suites = ['block-' + speed, speed]
>>>      endif
>>> -  test('qemu-iotests ' + format, sh, args: [files('../check-block.sh'), format],
>>> -       depends: qemu_iotests_binaries, env: qemu_iotests_env,
>>> -       protocol: 'tap',
>>> -       suite: suites,
>>> -       timeout: 0,
>>> -       is_parallel: false)
>>> +
>>> +  args = ['-tap', '-' + format]
>>> +  if speed == 'quick'
>>> +      args += ['-g', 'auto']
>>> +  endif
>>> +
>>> +  rc = run_command(
>>> +      [qemu_iotests_check_cmd] + args + ['-n'],
>>> +      check: true,
>>> +  )
>>> +
>>> +  foreach item: rc.stdout().strip().split()
>>> +      args = ['-tap', '-' + format, item,
>>> +              '--source-dir', meson.current_source_dir(),
>>> +              '--build-dir', meson.current_build_dir()]
>>> +      # Some individual tests take as long as 45 seconds
>>> +      # Bump the timeout to 3 minutes for some headroom
>>> +      # on slow machines to minimize spurious failures
>>> +      test('io-' + format + '-' + item,
>>> +           qemu_iotests_check_cmd,
>>> +           args: args,
>>> +           depends: qemu_iotests_binaries,
>>> +           env: qemu_iotests_env,
>>> +           protocol: 'tap',
>>> +           timeout: 180,
>>> +           suite: suites)
>>> +  endforeach
>>>    endforeach
>>
>> Seems like this somehow broke compilation on NetBSD:
>>
>> https://gitlab.com/thuth/qemu/-/jobs/4021584713#L2980
> 
> I ran it locally and got the meson-log.txt file which reports
> 
>    env: python3: No such file or directory
> 
> and indeed there is no python3 binary present in our netbsd
> VM.
> 
> our tests/vm/netbsd script works around this by passing an
> explicit --python=python3.7 arg to configure, but the way
> we invoke the 'check' script means it is just using the
> "#!/usr/bin/env python3"  logic instead.

Ah, that rings a bell - python scripts must not have the executable flags, 
otherwise meson tries to run them directly instead of using the interpreter 
that has been specified with the --python option.

  Thomas


