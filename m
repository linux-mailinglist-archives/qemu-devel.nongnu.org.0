Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F88B4E2DEE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:30:00 +0100 (CET)
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKut-0004FD-87
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:29:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWKt5-0001b5-Cw
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWKt3-0002Ew-Jk
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647880084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ymQhnr0LECeUo5OEWJXtE+1dt4mQUUyXuS+JmvqT7mo=;
 b=bwNZh3bjmH6eDb3pJ/12G7k+xjPcoKEUL6bOlKw3XASJykAtGLKT1sSPXebyzx9lNY29Ty
 +l6V+lhGoM/g/zGhdlOLgg7qSEAW8cusnCRoUBupvUhkX9l9PIDVAJP5TlprM5PIFCithw
 i2z2O0NHLSFCZEQm9hiJqgjbpeOUHGw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-OzILAJKSNqCHDdxazLFu7w-1; Mon, 21 Mar 2022 12:28:01 -0400
X-MC-Unique: OzILAJKSNqCHDdxazLFu7w-1
Received: by mail-wm1-f72.google.com with SMTP id
 n62-20020a1ca441000000b0038124c99ebcso5912762wme.9
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ymQhnr0LECeUo5OEWJXtE+1dt4mQUUyXuS+JmvqT7mo=;
 b=hFD4KXi0qHnxtR7kQ3lbcMGOPcvwISAGA7jhzGJ5wl11WaFkBG7VaGRzBntW74hYUb
 nOwgoDHo++PTIm9lSX/Ho92EVaVjscsxkf4DvFBAFjPdHPb8kzwK6wbtI1IwFLpwz9Ox
 tEmbB0AcKZ46JH/FxA5WBcqJElPec6hrtXwa/WKjstf00Ytc98k/a/lZGT7L40mqI3hX
 FUPo+5deJey21ODMggAEr+C4YORdDtNWAEb0a2bHWHAQIBo9WBML5DMJT1FUR9+7zPWf
 h5upMYg3WdMpUoVn7HCDUJVK4sD9fMNx2OTzXJi4S4dpKS1Us2ROHGo66SFKoXyP2Aso
 BJvQ==
X-Gm-Message-State: AOAM531fqbc2lhDK7vzRRNC52ds5Ih6kCNKyfjz1IjTXyolLrcnnEkKC
 w9K1o8sDZKHT7BaL/04mFo2tD8L59f0fl9MSuk3wFQkgvnMIZ/LGki6qoL3DzHR9Kf5BqFYpOWU
 YWQcIbNKB4NvI6io=
X-Received: by 2002:a5d:650d:0:b0:1f0:19c:a066 with SMTP id
 x13-20020a5d650d000000b001f0019ca066mr18536615wru.149.1647880080373; 
 Mon, 21 Mar 2022 09:28:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3wQzVK4XJwKu7f80InHHEw8fIp6hZNJE5uWG4GOhV1gNDbtSRTLRyz0PQ6JqOXPx4nsKepA==
X-Received: by 2002:a5d:650d:0:b0:1f0:19c:a066 with SMTP id
 x13-20020a5d650d000000b001f0019ca066mr18536603wru.149.1647880080072; 
 Mon, 21 Mar 2022 09:28:00 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 3-20020a5d47a3000000b0020412ba45f6sm3780696wrb.8.2022.03.21.09.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 09:27:59 -0700 (PDT)
Message-ID: <bb5cb2f8-7f02-0e0b-23ad-d1dab7fd6022@redhat.com>
Date: Mon, 21 Mar 2022 17:27:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4] tests: Do not treat the iotests as separate meson test
 target anymore
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220310075048.2303495-1-thuth@redhat.com>
 <2a2dadb8-24ba-50c4-617e-ab6d08166e83@redhat.com>
 <d59847b7-98cb-9e9c-0c42-74576f152737@redhat.com>
 <ed1c97e8-8a70-8808-cbeb-e6b4f6d1dccf@redhat.com>
 <f30fe79c-cebd-037c-043e-6eaaeed7070c@redhat.com>
 <052f71b0-2163-bc6a-e3f0-c6d806e591e0@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <052f71b0-2163-bc6a-e3f0-c6d806e591e0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/03/2022 14.11, Hanna Reitz wrote:
> On 21.03.22 10:17, Thomas Huth wrote:
>> On 21/03/2022 10.06, Hanna Reitz wrote:
>>> On 18.03.22 18:36, Thomas Huth wrote:
>>>> On 18/03/2022 18.04, Hanna Reitz wrote:
>>>>> On 10.03.22 08:50, Thomas Huth wrote:
>>>>>> If there is a failing iotest, the output is currently not logged to
>>>>>> the console anymore. To get this working again, we need to run the
>>>>>> meson test runner with "--print-errorlogs" (and without "--verbose"
>>>>>> due to a current meson bug that will be fixed here:
>>>>>> https://github.com/mesonbuild/meson/commit/c3f145ca2b9f5.patch ).
>>>>>> We could update the "meson test" call in tests/Makefile.include,
>>>>>> but actually it's nicer and easier if we simply do not treat the
>>>>>> iotests as separate test target anymore and integrate them along
>>>>>> with the other test suites. This has the disadvantage of not getting
>>>>>> the detailed progress indication there anymore, but since that was
>>>>>> only working right in single-threaded "make -j1" mode anyway, it's
>>>>>> not a huge loss right now.
>>>>>>
>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>> ---
>>>>>>   v4: updated commit description
>>>>>>
>>>>>>   meson.build            | 6 +++---
>>>>>>   scripts/mtest2make.py  | 4 ----
>>>>>>   tests/Makefile.include | 9 +--------
>>>>>>   3 files changed, 4 insertions(+), 15 deletions(-)
>>>>>
>>>>> I can’t really say I understand what’s going on in this patch and 
>>>>> around it, but I can confirm that it before this patch, fail diffs 
>>>>> aren’t printed; but afterwards, they are
>>>>
>>>> It's a bug in Meson. It will be fixed in 0.61.3 and later (so this patch 
>>>> won't be needed there anymore), but the update to meson 0.61.3 caused 
>>>> other problems so we also can't do that right now... so I'm not sure 
>>>> whether we now want to have this patch here included, wait for a better 
>>>> version of meson, or even rather want to revert the TAP support / meson 
>>>> integration again for 7.0 ... ?
>>>
>>> I don’t have anything against this patch, I just don’t fully understand 
>>> what it does, and how it works.
>>>
>>> So as far as I understand, check-block was its own target and used 
>>> --verbose so that the progress indication would work (with -j1). Now that 
>>> causes problems because of a bug in meson, and so this patch drops that 
>>> special-casing again.  The only disadvantage is that the progress 
>>> indication (which only worked with -j1) no longer ever works.
>>>
>>> (Is that right?)
>>
>> Right!
>>
>>> I personally don’t mind that disadvantage, because on CI systems it 
>>> doesn’t really matter anyway; and on developers’ systems, I would assume 
>>> `make check` to always be run with -jX anyway.
>>
>> Right again. So currently the only question is: Do we want to see a nice 
>> progress output with -j1 and do not care about the error logs, or do we 
>> rather want to see the error logs with -j1 and do not care about the nice 
>> progress output? For -jX with X > 1, the patch does not change much, and 
>> we'd need a newer version of meson to fix that.
> 
> OK, to me the answer sounds obvious.  We absolutely need error logs, nice 
> output is secondary to it.
> 
> Waiting for a new usable version of meson is not really an option, because 
> when it comes around, we can just revert this patch (or take any other 
> course of action that seems best then).
> 
> I guess we could revert TAP and/or the meson integration, I suppose that’d 
> mean we’d get some progress output again, but it’s just the plain one from 
> the iotests’ `check` script, right?

Right, reverting means to get the old progress output again.

>  I’m hard-pressed to find good arguments 
> against that, but I don’t really like that idea either.

Me neither, since it feels like a big step backwards, but if someone insists 
on having both, progress indication *and* error logs, it's currently the 
only feasible way, I think.

> Having this patch as a workaround until the functionality can be restored 
> (which seems in sight) seems absolutely fine to me.  I guess I’ll just take 
> it to my tree, then.  Won’t stop others from being able to protest, after 
> all. :)
> 
> (I.e.: Thanks, applied to my block branch: 
> https://gitlab.com/hreitz/qemu/-/commits/block)

Thank you!

  Thomas


