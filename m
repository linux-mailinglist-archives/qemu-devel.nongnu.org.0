Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825574B550F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:42:48 +0100 (CET)
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdUz-0007ns-Bn
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:42:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nJd4s-0006mu-GQ
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:15:46 -0500
Received: from [2a00:1450:4864:20::529] (port=47068
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nJd4p-0001yR-Vx
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:15:46 -0500
Received: by mail-ed1-x529.google.com with SMTP id m17so2658076edc.13
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 07:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5oFk/bC/ul3D28yABHmiP7lXJXWiET9XRr4UG5gCSqs=;
 b=r8EKAkWgYjT9m9bZbMMWbj50RDafklvpwKgDy0MISj0TmBBf0bGq+1Fvm0apF9QTQ1
 fW/cNhRCwGkKfgdXaFAQ54FALZz0s1p6FLLnOM4umHQZKPjF1tJ7L2GCnXOyZtqRUADP
 tGFzi5B9ZGxa00J4nNTxPKy2XVAHIgZWe/Vg6890nzzLpU7b8MMEkohk4DCSVJ4yFH+g
 IhWPt3k9gvUtZ1w4Kcmcsy1kMVuvsncP6s6nByo/q3Jov5ZxR+Z2tagVj0AhBREA/YiC
 x/f5SVw92WxOPtWSv2BMrFsmWM8iZa+b2CdXH+lytjC3z3P7XSLxAp7scG6GmGbVvrVL
 k3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5oFk/bC/ul3D28yABHmiP7lXJXWiET9XRr4UG5gCSqs=;
 b=muYjaXJHXwkhHiWEsiy/WOSQh4UCrzgl12T80DRCw1HDI0qUbMIQTSPptTk6MozDtv
 86LRGlz+PdXlt8q29ZlCFXP+OXXoxC6ki5ce8nLq2vGEhDmi/w/IahTrio1oTCBP1S3g
 f3+ExZGQhXEAk+DuT53a/Rit1DkzntGCNfA3X1ZeBej9nxzheg+bnMFqBC7Yxg8ZYb5K
 OSKkZMNZjvKQA/bCGV83ldlIfXozL4BCUuhnxudy5Q9X1Slh1YugeSbsj4rsp0HSGsNo
 C/xd9fyYXW97CM7DtjmZdUY/qFe7RZ7zLD73ClRHeqvISXLlYqkjmvgUN4336mIOjaHZ
 CyHA==
X-Gm-Message-State: AOAM531A89z1i5csUO/scTvtlzpvvc+fmQx9PUZhvHhwkPRp5XVdh+ig
 hJiRoDCor/2qQaNu0iPg8NNCoQ==
X-Google-Smtp-Source: ABdhPJwkB2R9t/fFeDKytLxTbaX3wSx5DoCVJMEY4XCzHhKv0ypcjBOh3OwvmmnUIaULlEhJwidqaQ==
X-Received: by 2002:a05:6402:614:: with SMTP id n20mr8667edv.287.1644851742358; 
 Mon, 14 Feb 2022 07:15:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t3sm777256ejd.83.2022.02.14.07.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 07:15:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9DE5320329;
 Mon, 14 Feb 2022 15:15:40 +0000 (GMT)
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-12-alex.bennee@linaro.org>
 <f8164a77-80d1-86fa-7fc9-6089d6b4f34b@eldorado.org.br>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Subject: Re: [PATCH v1 11/11] tests/tcg: add vectorised sha512 versions
Date: Mon, 14 Feb 2022 15:14:30 +0000
In-reply-to: <f8164a77-80d1-86fa-7fc9-6089d6b4f34b@eldorado.org.br>
Message-ID: <87v8xhcwdf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org, Eduardo Habkost <eduardo@habkost.net>, "open list:S390
 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Matheus K. Ferst" <matheus.ferst@eldorado.org.br> writes:

> On 11/02/2022 13:03, Alex Benn=C3=A9e wrote:
>> This builds vectorised versions of sha512 to exercise the vector code:
>>    - aarch64 (AdvSimd)
>>    - i386 (SSE)
>>    - s390x (MVX)
>>    - ppc64 (vector)
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20220202191242.652607-5-alex.bennee@linaro.org>
>> ---
>> v2
>>    - use -msse4.1 -O3 instead of -pentium4 for i386 build
>> ---
>>   tests/tcg/multiarch/sha512.c      | 2 +-
>>   tests/tcg/aarch64/Makefile.target | 7 +++++++
>>   tests/tcg/arm/Makefile.target     | 8 ++++++++
>>   tests/tcg/i386/Makefile.target    | 6 ++++++
>>   tests/tcg/ppc64le/Makefile.target | 5 ++++-
>>   tests/tcg/s390x/Makefile.target   | 9 +++++++++
>>   tests/tcg/x86_64/Makefile.target  | 7 +++++++
>>   7 files changed, 42 insertions(+), 2 deletions(-)
>>=20
>
> <snip>
>
>> diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makef=
ile.target
>> index 480ff0898d..4f1d03dfcf 100644
>> --- a/tests/tcg/ppc64le/Makefile.target
>> +++ b/tests/tcg/ppc64le/Makefile.target
>> @@ -5,10 +5,13 @@
>>   VPATH +=3D $(SRC_PATH)/tests/tcg/ppc64le
>>   ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
>> -PPC64LE_TESTS=3Dbcdsub non_signalling_xscv
>> +PPC64LE_TESTS=3Dbcdsub non_signalling_xscv sha512-vector
>>   endif
>>   $(PPC64LE_TESTS): CFLAGS +=3D -mpower8-vector
>>=20
>
> Since this test does not target a specific instruction, maybe it
> should use -mvsx/-maltivec to allow the compiler to use newer
> instructions.

I wasn't sure which vector instructions are supported by the TCG front
ends so if the above flags won't trip up the TCG I can add them to the
cflags.

>
>> +sha512-vector: sha512.c
>> +       $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>> +
>
> Can we have this test for big-endian too?

We have tests/tcg/ppc64 so sure...

>
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


--=20
Alex Benn=C3=A9e

