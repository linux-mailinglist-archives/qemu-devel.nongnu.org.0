Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4844D44D3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 11:39:05 +0100 (CET)
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGCC-00034Y-0x
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 05:39:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nSGA9-0002Bu-5C
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:36:53 -0500
Received: from [2a00:1450:4864:20::434] (port=33588
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nSGA7-0007ys-I2
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:36:52 -0500
Received: by mail-wr1-x434.google.com with SMTP id j17so7311736wrc.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 02:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=iByAFYfalUP8cBGZR//n54AYUd+z6mXZgsSFSG1YPdA=;
 b=PSi4bQtuValsLW9BiXts9SGLH9dpLpkfeDrNjfgn/7xL2kIeONhcPVH5zjqfC0TBaz
 0DXU+4fJS4OzzYJFaMrNnHtr1yyW7AAkMW5jtE5UdhnGkOkruVN45NUzB8NV6/iXoboZ
 8spQ1XcY+O2Y5348kfjeYZHp2551f1NT0xJOm+aEcnnWpuexj+2eD7/A2qVc1RaTwEdl
 ENR+HC25SIrRY9E2CtJb8ynDwUWpFyX9XKT9Yi11lRneX2RXXjqLVlqKS4uB0pWKlEYF
 mQ0HRGVEkUFFX7GnvA1IVL6k+c/V7BYZ+nyzYhfpaumo9ABZI1wDpKMt7oBfUPbQZFdg
 Fclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=iByAFYfalUP8cBGZR//n54AYUd+z6mXZgsSFSG1YPdA=;
 b=eovUrk6UUEqudSPLbfkSOydT+ea9I8NVA51X3w38brZkwMFf6Egimquai4M1F/5cZq
 LzxJ8Ec97iQevkEWBxwIh1WdhGuWWmCRuV/k9mFbYSZNCOBkRmTL70924XafptoGsLHf
 sB6Cw2dLCIJQleKSoqS9JpTS3ju2uAXrv788Hk4s1DL8lRXS4Le3/SoP+KK8DAKOUR5Z
 nXm2IMef8YyEpEue+bzvX5roOY+oV6q+uAuE3FgvONW5mSkNY65/IpcC0kqo6sizdwfB
 P9tFt68VKHVJtelxgVHbn5XIMnpUXXG/lWylwOQVISGIHwoPRIq6/l2RGin2bmngikyc
 doEQ==
X-Gm-Message-State: AOAM531Q0abXqfTSP8/F2LLgfGGZbnnlMELpvezt/rDtJMFzF1Q2Pd0M
 dYey0aANBHHS8A2qa4HlAxE5iw==
X-Google-Smtp-Source: ABdhPJw4NzVEgVAz0nOzlAL09Px/50yWK2UrSvDdd6xwIo1/+eAdTERFokvEHJBs5hN7ZEp8lu+nTA==
X-Received: by 2002:a5d:6e0c:0:b0:1ef:7cbb:a5aa with SMTP id
 h12-20020a5d6e0c000000b001ef7cbba5aamr3072553wrz.5.1646908609087; 
 Thu, 10 Mar 2022 02:36:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p18-20020adfba92000000b001e4ae791663sm4022337wrg.62.2022.03.10.02.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 02:36:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 233C31FFB7;
 Thu, 10 Mar 2022 10:36:47 +0000 (GMT)
References: <20220309112248.4083619-1-alex.bennee@linaro.org>
 <5ac2ce87-90a3-05f9-d65e-a8ef9854863c@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] tests/tcg: drop -cpu max from s390x sha512-mvx
 invocation
Date: Thu, 10 Mar 2022 10:34:34 +0000
In-reply-to: <5ac2ce87-90a3-05f9-d65e-a8ef9854863c@redhat.com>
Message-ID: <87a6dy5c1s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 09/03/2022 12.22, Alex Benn=C3=A9e wrote:
>> With -cpu max we get a warning:
>>    qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
>> But dropping the -cpu max and it still runs fine.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/tcg/s390x/Makefile.target | 2 --
>>   1 file changed, 2 deletions(-)
>> diff --git a/tests/tcg/s390x/Makefile.target
>> b/tests/tcg/s390x/Makefile.target
>> index 257c568c58..7aa502a557 100644
>> --- a/tests/tcg/s390x/Makefile.target
>> +++ b/tests/tcg/s390x/Makefile.target
>> @@ -34,6 +34,4 @@ sha512-mvx: CFLAGS=3D-march=3Dz13 -mvx -O3
>>   sha512-mvx: sha512.c
>>   	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>>   -run-sha512-mvx: QEMU_OPTS+=3D-cpu max
>> -
>>   TESTS+=3Dsha512-mvx
>
> Ok, this helps to get rid of the warnings, thus feel free to add:
>
> Tested-by: Thomas Huth <thuth@redhat.com>
>
> However, the error still persists. I now had a closer look by running
> the test with "qemu-s390x" on my z15 machine directly, and all tests
> are failing! The problem happens with both, gcc v11.2.1 and clang
> v13.0.1. The problem goes away (i.e. test works fine) if I compile the
> code with -O1 instead of -O3, or if I use GCC v8.5 instead. I'll try
> to find out more, but as a temporary workaround, we could also switch
> to -O1 instead of -O3.

The -O3 is included to force the compiler to vectorise the code -
otherwise you will get the same code as the plain sha512 test. However
is it because gcc v11.2.1 is using even more advanced mvx instructions
or just getting it's code generation wrong?

Do the tests also fail when run natively?

>
>  Thomas


--=20
Alex Benn=C3=A9e

