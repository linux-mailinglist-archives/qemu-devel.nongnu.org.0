Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5354A6D0475
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:16:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrBT-0005i2-U6; Thu, 30 Mar 2023 08:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phrBR-0005hK-7z
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:15:13 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phrBN-0006tr-LE
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:15:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 bg13-20020a05600c3c8d00b003ef90adc168so3848126wmb.5
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680178506;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IWt+tbew+O+Dph9beM6nhFRwxe6p95wWS4FcSBSPAs=;
 b=EcMhs+yEFf0uMBS3r7wCtm5yILL78wpiiHR5YGGrh1HZ3xfV45pHCRTzl1yMBK/d7S
 Omx0HZaGZWeWlzyVP4eWVxG3RqGyLnoxz6FBg5LLhhbZKn2jMlqSSy8qSUkWxQajRGb2
 nPC7p15Eh/6TOVEPtSJjqvrq14Rp5r5Z7x78aDto5tFXEr2wKcHUm0O4F/XH2Io0BgyR
 MmnjsM4iwsU901lfchAUiy1MLrQjAHEoeasLSTgzoubsFDp3KtWsf9eVpNvtFAAqKm5s
 HIxxSL9zme3K/xTJeJVovy1EeuAaeDiosCZTi4xdke7Q57ZAJZJEKtMlferO3e9t/5Fs
 bN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680178506;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9IWt+tbew+O+Dph9beM6nhFRwxe6p95wWS4FcSBSPAs=;
 b=7tun6p3E/DMmkQm0F6Ur+zK1M5chi6CADeBTuRnwyBTcvvwSPyaDTCcvDCTo/r8tJh
 sSxH6gh8CrQS+cAvx6efEB3they47lGLBvA/4rcgm3i6rQi1KnYoMjNQ58P3cvLlaN7o
 I1V8f+YCqUAb2IDNr3xYrvnJK2Upcot8yjKmbl5Oe+uick9/eOV13IyJTI2QoswqBQfo
 h/RhTW/CD+otM7rSwBD504wZka+NA+sBpVvELwTmOWu9HZ/H/d1yJMiPeb8Xd1Rbzp+2
 i1GXQvPZXzrdssY390PFI0s+vkXp4gGBudDGctpbAu1WhmkqpRoufpWNmup/yCSOuCN0
 JLCA==
X-Gm-Message-State: AO0yUKWYzUfLRg/wxFkBeRj+9XOsupAPuBlOrb8csNpsNAg5OgxHEfS5
 T1sPC3N8IVHJyegllcE15AGFbg==
X-Google-Smtp-Source: AK7set+lHDEacfolnYT74TQEzPOuS9CgTIPECS9V1pMrzcf9JA8YtkESgYh3gF8dwYc5RUdo+NLJqw==
X-Received: by 2002:a7b:c3c7:0:b0:3ea:f75d:4626 with SMTP id
 t7-20020a7bc3c7000000b003eaf75d4626mr17177734wmj.38.1680178505993; 
 Thu, 30 Mar 2023 05:15:05 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p38-20020a05600c1da600b003edc4788fa0sm5939443wms.2.2023.03.30.05.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 05:15:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E00F1FFB7;
 Thu, 30 Mar 2023 13:15:05 +0100 (BST)
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-10-alex.bennee@linaro.org>
 <b23ab886-e9f5-bb94-c98d-ccdd45cdeff1@redhat.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, Warner Losh
 <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>, Kevin Wolf
 <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Kyle
 Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>, Kautuk
 Consul <kconsul@linux.vnet.ibm.com>, Hariharan T S
 <hariharan.ts@linux.vnet.ibm.com>
Subject: Re: [PATCH 09/11] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Date: Thu, 30 Mar 2023 13:12:09 +0100
In-reply-to: <b23ab886-e9f5-bb94-c98d-ccdd45cdeff1@redhat.com>
Message-ID: <87zg7uo2pi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> On 30/03/2023 12.11, Alex Benn=C3=A9e wrote:
>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>> Avocado version 101.0 has a fix to re-compute the checksum
>> of an asset file if the algorithm used in the *-CHECKSUM
>> file isn't the same as the one being passed to it by the
>> avocado user (i.e. the avocado_qemu python module).
>> In the earlier avocado versions this fix wasn't there due
>> to which if the checksum wouldn't match the earlier
>> checksum (calculated by a different algorithm), the avocado
>> code would start downloading a fresh image from the internet
>> URL thus making the test-cases take longer to execute.
>> Bump up the avocado-framework version to 101.0.
>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
>> ---
>>   tests/requirements.txt | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>> index 0ba561b6bd..a6f73da681 100644
>> --- a/tests/requirements.txt
>> +++ b/tests/requirements.txt
>> @@ -2,5 +2,5 @@
>>   # in the tests/venv Python virtual environment. For more info,
>>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>>   # Note that qemu.git/python/ is always implicitly installed.
>> -avocado-framework=3D=3D88.1
>> +avocado-framework=3D=3D101.0
>>   pycdlib=3D=3D1.11.0
>
> Did you check whether the same amount of avocado tests still works as
> before? ... last time I tried to bump the version, a lot of things
> were failing, and I think Cleber was recently working  on fixing
> things, but I haven't heart anything back from him yet that it would
> be OK to bump to a newer version now ...

I ran it on my default build and the only failure was:

 (008/222) tests/avocado/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_=
tcg: INTERRUPTED: timeout (240.01 s)

which passed on a retry. But now I realise with failfast it skipped a bunch:

RESULTS    : PASS 46 | ERROR 0 | FAIL 0 | SKIP 174 | WARN 0 | INTERRUPT 1 |=
 CANCEL 1
JOB TIME   : 290.26 s

> So upgrading to a new version of Avocado during the softfreeze sounds
> somewhat risky to me right now - I'd appreciate if we could do that
> after the release instead.

Sure. I was hoping we would speed up avocado a little by avoiding double do=
wnloads.

>
>  Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

