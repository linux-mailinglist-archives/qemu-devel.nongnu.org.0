Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3D54DABE2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 08:37:02 +0100 (CET)
Received: from localhost ([::1]:54326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUODN-0006Xv-65
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 03:37:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUOC1-0005dm-Ba
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 03:35:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUOBy-0003bs-1G
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 03:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647416132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ngwlVdd+Zs1zurbVFycxeSpU/6N3MhF/6t24yStKa6U=;
 b=htJ83bjgV1iuVE04kcWoY63Rtef6RoOed9qlUdI0rMTzZDN3CxRgei94VSnjrkE61CMTs6
 AZpFdTKxfwbVtuCzWdui4eGMwZkuqSheP8c9rgvIljmdatoN9fyd/dS/7zqGu8n6VzWCKk
 xV0mC7RcH8X2mK1vzdKLwv61mMR6EZE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-oUf1jfnyOa2WjcWJPgg9mQ-1; Wed, 16 Mar 2022 03:35:29 -0400
X-MC-Unique: oUf1jfnyOa2WjcWJPgg9mQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l1-20020a1c2501000000b00389c7b9254cso1760448wml.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 00:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ngwlVdd+Zs1zurbVFycxeSpU/6N3MhF/6t24yStKa6U=;
 b=SF3pH6Y253/e5hbkrDkCI2y6+cyT2rrePSXhaz4sAUJaQQGsByxVyXXC8Z3rugymzl
 VcETzW/HMKJuW0vMdO7iGlwNAwxeRJWdOiNOoBgBK6O+C5/UIxFarZZRveN1aOt4U4Jv
 Hzm2Zxodcv0iyPkPw+ZUmJaIz9+vnciyD56KfYFS1SkB2zeYz7G/paaA1IfxrZgGYC9f
 6WVaxpCOnrccjXI2OS8baFSRn4RCzbzxBr+f2bFjw4CVhX+uzddpeASKGUdQNh8mMAPk
 5MDir6VJxGDQmVNjFzoPkjikFkYQu66fr7kqkdCbyQ9w/9PUBSa+S+9XvaPE7FlMpZyD
 igPw==
X-Gm-Message-State: AOAM532E08SK+8qOpF+YsQhIvYM/mUzrvHwEDCp35N7jpPKapf7EXqSK
 Uapv7KR9qOIjyRPxRWeb9zHa6LCMSAJjL35WamW/TYHN7aotYyCLn//El7CuMFAtA9OWgJo7qSj
 nF4u8w92qtSPs/Tc=
X-Received: by 2002:a1c:2bc3:0:b0:381:3dd5:5707 with SMTP id
 r186-20020a1c2bc3000000b003813dd55707mr6280161wmr.31.1647416128531; 
 Wed, 16 Mar 2022 00:35:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1zDp03u6aT+tNpWsR1Q5xLKZtzvgeAlYwoAhcWnzStS2dB6pn7yw+5ZVEM7Ab4CpCvpgjOA==
X-Received: by 2002:a1c:2bc3:0:b0:381:3dd5:5707 with SMTP id
 r186-20020a1c2bc3000000b003813dd55707mr6280147wmr.31.1647416128285; 
 Wed, 16 Mar 2022 00:35:28 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c22cb00b00382a960b17csm4201938wmg.7.2022.03.16.00.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 00:35:27 -0700 (PDT)
Message-ID: <54ff73e7-d3c1-775f-a2e8-b2671333f1ac@redhat.com>
Date: Wed, 16 Mar 2022 08:35:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PULL 0/8] s390x and misc fixes
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220315112052.515467-1-thuth@redhat.com>
 <CAFEAcA8u8G3=V=OVM6v_BaOwfeDu1RJmnwrW+4PXqbnPrAAr_w@mail.gmail.com>
 <CAFEAcA-C9Y1RKMfDWr132xCvXkoGovU8aK6Z6fjQ9LEZyeUtyg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA-C9Y1RKMfDWr132xCvXkoGovU8aK6Z6fjQ9LEZyeUtyg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2022 20.30, Peter Maydell wrote:
> On Tue, 15 Mar 2022 at 18:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 15 Mar 2022 at 11:20, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>>   Hi Peter!
>>>
>>> The following changes since commit 352998df1c53b366413690d95b35f76d0721ebed:
>>>
>>>    Merge tag 'i2c-20220314' of https://github.com/philmd/qemu into staging (2022-03-14 14:39:33 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-03-15
>>>
>>> for you to fetch changes up to 36149534792dcf07a3c59867f967eaee23ab906c:
>>>
>>>    meson: Update to version 0.61.3 (2022-03-15 10:32:36 +0100)
>>>
>>> ----------------------------------------------------------------
>>> * Fixes for s390x branch instruction emulation
>>> * Fixes for the tests/avocado/boot_linux.py:BootLinuxS390X test
>>> * Fix for "-cpu help" output
>>> * Bump meson to 0.61.3 to fix stderr log of the iotests
>>>
>>> ----------------------------------------------------------------
>>
>> This results in every "Linking" step on my macos box producing the
>> warning:
>>
>> ld: warning: directory not found for option
>> '-Lns/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.0'
>>
>> Obvious suspect here is the new meson version.
> 
> Also, after rolling this merge attempt back, older meson barfs
> on whatever the new one left behind:
> 
> 
> [0/1] Regenerating build files.
> Traceback (most recent call last):
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/mesonmain.py",
> line 228, in run
>      return options.run_func(options)
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/msetup.py",
> line 281, in run
>      app.generate()
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/msetup.py",
> line 177, in generate
>      env = environment.Environment(self.source_dir, self.build_dir, self.options)
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/environment.py",
> line 462, in __init__
>      self.coredata = coredata.load(self.get_build_dir())  # type:
> coredata.CoreData
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/coredata.py",
> line 1003, in load
>      obj = pickle.load(f)
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/mesonlib/universal.py",
> line 2076, in __setstate__
>      self.__init__(**state)  # type: ignore
> TypeError: __init__() got an unexpected keyword argument 'module'
> FAILED: build.ninja
> /usr/local/opt/python@3.9/bin/python3.9
> /Users/pm215/src/qemu-for-merges/meson/meson.py --internal regenerate
> /Users/pm215/src/qemu-for-merges
> /Users/pm215/src/qemu-for-merges/build/all --backend ninja
> ninja: error: rebuilding 'build.ninja': subcommand failed
> /usr/local/bin/ninja  build.ninja && touch build.ninja.stamp
>    GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> [0/1] Regenerating build files.
> Traceback (most recent call last):
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/mesonmain.py",
> line 228, in run
>      return options.run_func(options)
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/msetup.py",
> line 281, in run
>      app.generate()
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/msetup.py",
> line 177, in generate
>      env = environment.Environment(self.source_dir, self.build_dir, self.options)
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/environment.py",
> line 462, in __init__
>      self.coredata = coredata.load(self.get_build_dir())  # type:
> coredata.CoreData
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/coredata.py",
> line 1003, in load
>      obj = pickle.load(f)
>    File "/Users/pm215/src/qemu-for-merges/meson/mesonbuild/mesonlib/universal.py",
> line 2076, in __setstate__
>      self.__init__(**state)  # type: ignore
> TypeError: __init__() got an unexpected keyword argument 'module'
> FAILED: build.ninja
> 
> 
> meson ought to be smart enough to spot that it's got data from an
> incompatible version and just discard its cache rather than
> choking on it.

Ok, I'll respin without the meson update.

Question is: Do we now want to revert the TAPification of the iotests for 
7.0? I guess so, otherwise most people won't see the output of failed tests 
when doing "make check-block" ...

  Thomas


