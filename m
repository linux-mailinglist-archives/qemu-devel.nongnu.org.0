Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61B6C61F5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 09:38:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfGST-000761-8U; Thu, 23 Mar 2023 04:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfGSQ-0006y0-TS
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfGS9-0000LT-J6
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679560664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aIB7Yg4RqvR8Qhb4Ehfk7SSjQD34sAfhyZ8WzhjrNII=;
 b=DdKG5cB0HZga5pz684n+E5OA8hTz7bMOs4gImqaMEraMIArKlubekFhyXZ4pOPAaQdYUg5
 mEd/PKalhxXPvnTTmRVJwPpXzCyqhwHSq7x3OWnv+lfvYPVwIO6bo6EOlnxAgFvkfdPRfT
 /EyQAQ63mtTRFeUoQ5hYP7maRbUs4pQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-vckJCRn4MAKExDBkUTRuag-1; Thu, 23 Mar 2023 04:37:43 -0400
X-MC-Unique: vckJCRn4MAKExDBkUTRuag-1
Received: by mail-wm1-f72.google.com with SMTP id
 o7-20020a05600c4fc700b003edf85f6bb1so665396wmq.3
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 01:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679560662;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aIB7Yg4RqvR8Qhb4Ehfk7SSjQD34sAfhyZ8WzhjrNII=;
 b=hz+SVV1t8bvLnX1nuVs9+jONzFw+36ZIUpXb6et3nsokIvg+KPwJY1TnW+dsMCujgP
 ZRjri4vLAK7BPD10VI2VOXOCu+8tKRe7xmK+j8/dDL1qV4LP9Hv5mByZtL1g3IqoWFVf
 fPfsMQHR6SPcNPRhYRaJRMX6ZA0ImWVO6Mm4s1CFBBqZL9g8OtKB101gyyd39NMZDYey
 6SIBFDVqD+BDhnbQeS8jLc/Gyw7YNPB/bQ4nRE197rjYcc/LF0l2sZgSvtVpBlPjczQ0
 akDsrTjiCMykS7ni/HHmMFOYRxfXg/sWVzvMxYYPNJjaN2qrywDTYYufnMFO/IBOietv
 aKOQ==
X-Gm-Message-State: AO0yUKWunLwQ2McQeP/iq2YCUI2ftb7VRTm5BuIBlqi7ipSFuAIa4dWL
 P4deKHn+MT3YbX7fgHIgWtdxPe+CIS16PdcrcC5SCHg997HtraFGJOVIbWUYeYI1sENRJpikD2f
 A1qLAqhUhzkD7P2k=
X-Received: by 2002:a7b:cb49:0:b0:3ee:6cdf:c357 with SMTP id
 v9-20020a7bcb49000000b003ee6cdfc357mr1536380wmj.20.1679560662033; 
 Thu, 23 Mar 2023 01:37:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set/Plk92uM6bAcR0oAft6EOtBn2WsASDshofcxceYd++8AvLkDH2uCnzDpB/XThNLnFX5Z+S8g==
X-Received: by 2002:a7b:cb49:0:b0:3ee:6cdf:c357 with SMTP id
 v9-20020a7bcb49000000b003ee6cdfc357mr1536368wmj.20.1679560661753; 
 Thu, 23 Mar 2023 01:37:41 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-146.web.vodafone.de.
 [109.43.179.146]) by smtp.gmail.com with ESMTPSA id
 q6-20020a7bce86000000b003db0bb81b6asm1227299wmj.1.2023.03.23.01.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 01:37:41 -0700 (PDT)
Message-ID: <64c9356e-1197-8893-db1d-860e6a202a87@redhat.com>
Date: Thu, 23 Mar 2023 09:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jintao Yin <nicememory@gmail.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230322135721.61138-1-philmd@linaro.org>
 <20230322135721.61138-3-philmd@linaro.org> <ZBtLAvQ/5kFofyEJ@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 2/2] cirrus-ci: Remove MSYS2 jobs duplicated with
 gitlab-ci
In-Reply-To: <ZBtLAvQ/5kFofyEJ@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 22/03/2023 19.37, Daniel P. Berrangé wrote:
> On Wed, Mar 22, 2023 at 02:57:21PM +0100, Philippe Mathieu-Daudé wrote:
...
>> diff --git a/.cirrus.yml b/.cirrus.yml
>> deleted file mode 100644
>> index 5fb00da73d..0000000000
>> --- a/.cirrus.yml
>> +++ /dev/null
> 
>> -    MSYS2_PACKAGES: "
>> -      diffutils git grep make pkg-config sed
>> -      mingw-w64-x86_64-python
>> -      mingw-w64-x86_64-python-sphinx
> 
> This isn't listed in the .gitlab-ci.d/windows.yml file

I think that's fine. The gitlab CI Windows jobs are very slow and ran into 
timeout issues in the past already, so we certainly don't want to waste our 
time there with building the documentation.

>> -      mingw-w64-x86_64-toolchain
> 
> This also isn't listed

Seems to be a "group" package:

  https://packages.msys2.org/groups/mingw-w64-x86_64-toolchain

It includes other languages like Fortran and Ada ... I think we don't want 
that in the gitlab-CI job.

>> -      mingw-w64-x86_64-SDL2
>> -      mingw-w64-x86_64-SDL2_image
>> -      mingw-w64-x86_64-gtk3
>> -      mingw-w64-x86_64-glib2
>> -      mingw-w64-x86_64-ninja
>> -      mingw-w64-x86_64-jemalloc
> 
> This also isn't listed

I think jemalloc is very niche these days for building QEMU, especially on 
Windows, so I'd rather not use it there.

>> -      mingw-w64-x86_64-lzo2
>> -      mingw-w64-x86_64-zstd
>> -      mingw-w64-x86_64-libjpeg-turbo
>> -      mingw-w64-x86_64-pixman
>> -      mingw-w64-x86_64-libgcrypt
>> -      mingw-w64-x86_64-libpng
>> -      mingw-w64-x86_64-libssh
>> -      mingw-w64-x86_64-snappy
>> -      mingw-w64-x86_64-libusb
>> -      mingw-w64-x86_64-usbredir
>> -      mingw-w64-x86_64-libtasn1
>> -      mingw-w64-x86_64-nettle
>> -      mingw-w64-x86_64-cyrus-sasl
>> -      mingw-w64-x86_64-curl
>> -      mingw-w64-x86_64-gnutls
>> -      mingw-w64-x86_64-libnfs
> 
> The  .gitlab-ci.d/windows.yml file meanwhile adds 'dtc' 'gcc'
> and 'pkgconf' which are not present here.

dtc for avoiding to recompile the submodule, gcc and pkgconf as replacement 
for the toolchain group package.

> This inconsistency is another point in favour of removing this
> redundant cirrus config.

Well, different configs also help to test different things... but in this 
case, I think it's not enough to justify keeping the cirrus-ci.yml file.

>> -  script:
>> -    - mkdir build
>> -    - cd build
>> -    - C:\tools\msys64\usr\bin\bash.exe -lc "../configure --python=python3
>> -        --target-list-exclude=i386-softmmu,ppc64-softmmu,aarch64-softmmu,mips64-softmmu,mipsel-softmmu,sh4-softmmu"
> 
> This excludes a few targets, but the .gitlab-ci.d/windows.yml file
> merely allow-lists  x86_64-softmmu only, and also adds
> --without-default-devices

The gitlab job struggles with timeout issues when you add more stuff to it ...

> IOW the remaining config has less coverage than this one. Of course
> if no one ever looks at these results, the better coverage is not
> doing anything for us.

Yes, that's the main point! cirrus-ci.yml even does not provide e-mail 
notification when things go wrong, so most issues that could be discovered 
here just go completely unnoticed.

>> -    - C:\tools\msys64\usr\bin\bash.exe -lc "make -j8"
> 
> The .gitlab-ci.d/windows.yml file does not pass '-j8' so presumably
> runs slower.

Much, much slower!

> THe gitlab docs indicate the Windows VMs have 2 vCPUs so we ought to
> have been using -j2 in the .gitlab-ci.d/windows.yml file IIUC

The -j2 has been removed in commit 5f2992fe1ec5594e5c since we had some 
weird failures with it, likely due to memory constraints in those 
containers. After removing -j2, the jobs were reliable
again.

> Broadly I agree with this proposal, but it feels like we might want a
> few tweak to the windows.yml file to address some of the inconsistencies

You can have a try, but from my experience, it will be very hard to increase 
the test coverage of those jobs without hitting timeout issues again.

  Thomas


