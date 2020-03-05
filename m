Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8491C17B212
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 00:11:18 +0100 (CET)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9ze9-0004RZ-5K
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 18:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41959)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j9zdI-0003ZP-FZ
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 18:10:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j9zdG-0001OF-OS
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 18:10:23 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41807)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j9zdG-0001JM-En
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 18:10:22 -0500
Received: by mail-wr1-x443.google.com with SMTP id v4so163704wrs.8
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 15:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=aR7S8foBTaR7sMMxcqfDtjZoIfyL7NJ5YTTxmVrniYw=;
 b=Ov+4CBg92XTW/ws1zIlZ+aHtUIjawfnd1FecDVWquRsx8fPqw4LZZah7KZXiWqsA+X
 vfhOsaVEYQknOJb4QGc6zfSvEQVuHfb36yByFqXRLwMntLPs6Ngsfjz67LLiav6ETkvB
 MxATssnQRq8Evz5S/mkoHdnb5uZk/F3OwIaQswXh70AK+iScqteyrtsUGpGg8umFNFUJ
 BpkVkroySBvGhmD1ol6vkRH88AMiFqCKOMnQ3RJNM4OC0pzyqYQ4kYR10Fg/4itS6mOa
 OIiiDKAfc8AdN891E/6XM1z1PONOTVdd+rHNbaBByhDbCwfW3Vi5WQ/4x51qf9t80V71
 ADPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=aR7S8foBTaR7sMMxcqfDtjZoIfyL7NJ5YTTxmVrniYw=;
 b=iUJzohtHkTsSVnADPTfa9WVl6fyHOXY8EaEkGtlCWFglboUnZKve5hbPEoOZL2xvkM
 eef4EIJq3/Fcqn/HGuUBrM3YH6z8iViGgQM0ri5nGK+jMi/FP5WxNHvmcE8AbmHmZBav
 xlAGpG7cmmPx4lGPL9IQBwDBOfJVXbASMLM3KP7crVfxduKa2Z01aOMzOYtOd+NrYLqM
 ecRE+UvLxOMzjbAJOtw8j0E2kGJO6rwd9VOciCzpCQjyvCAWGTgAUwssceSHh2binXaw
 XDVAUhD8odJBlyH7mvkLpse5ZeyDDqYxkvQAwNfU2Utnx+q3K2LraqD033Hw0vbWbt5M
 jhrg==
X-Gm-Message-State: ANhLgQ1nKjMhbcUYSj2iybuWh/8QTk4zrN2Hc31Ghlenp7aizpG1f9sC
 yfIuZTTpbcTCVpraBeGFNXEkvQ==
X-Google-Smtp-Source: ADFU+vsKRBixmHmFHBxl6zLXNpPs3qxkexVWCLvV9wZmq0IW4a59oCKTPmj3uLnTYlys1M2Afoh6TA==
X-Received: by 2002:adf:cd03:: with SMTP id w3mr245599wrm.191.1583449820736;
 Thu, 05 Mar 2020 15:10:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p10sm42629181wrx.81.2020.03.05.15.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 15:10:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B84A21FF87;
 Thu,  5 Mar 2020 23:10:18 +0000 (GMT)
References: <20200305103427.157658-1-quintela@redhat.com>
 <87imji6eio.fsf@linaro.org> <87h7z2g6te.fsf@secure.laptop>
User-agent: mu4e 1.3.9; emacs 27.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: quintela@redhat.com
Subject: Re: [PATCH] configure: Improve zstd test
In-reply-to: <87h7z2g6te.fsf@secure.laptop>
Date: Thu, 05 Mar 2020 23:10:18 +0000
Message-ID: <87eeu65rfp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Juan Quintela <quintela@redhat.com> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>> Juan Quintela <quintela@redhat.com> writes:
>>
>>> There were one error on the test (missing an s for --exists).
>>> But we really need a recent zstd (0.8.1).
>>> That version was released in 2016, so it is newer that some of our trav=
is
>>> images.  Just check for the version that we need.
>>>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> Reported-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>  configure | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/configure b/configure
>>> index 7b373bc0bb..1bf48df1ef 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -2464,7 +2464,8 @@ fi
>>>  # zstd check
>>>=20=20
>>>  if test "$zstd" !=3D "no" ; then
>>> -    if $pkg_config --exist libzstd ; then
>>> +    libzstd_minver=3D"0.8.1"
>>> +    if $pkg_config --atleast-version=3D$libzstd_minver libzstd ; then
>>>          zstd_cflags=3D"$($pkg_config --cflags libzstd)"
>>>          zstd_libs=3D"$($pkg_config --libs libzstd)"
>>>          LIBS=3D"$zstd_libs $LIBS"
>>
>> Hmm still breaks with:
>>
>>    make docker-test-build@ubuntu J=3D9 V=3D1
>
> Thanks.
>
>> With:
>>
>>   FY_SOURCE=3D2 -g   -c -o monitor/qmp.o /tmp/qemu-test/src/monitor/qmp.c
>>   /tmp/qemu-test/src/migration/multifd-zstd.c: In function 'zstd_send_pr=
epare':
>>   /tmp/qemu-test/src/migration/multifd-zstd.c:125:9: error: unknown type=
 name 'ZSTD_EndDirective'; did you mean 'ZSTD_DDict'?
>>            ZSTD_EndDirective flush =3D ZSTD_e_continue;
>>            ^~~~~~~~~~~~~~~~~
>
> Greate, more things were introduced later.
> As it would be too easy, the zstd repository is not lineal, you need to
> checkout the tag you want to see when something has been introduced.
>
> Will try to get this fixed.
>
> Sorry for the inconveniences.
>
>
>>   Version: 1.3.8+dfsg-3
>>   Depends: libzstd1 (=3D 1.3.8+dfsg-3)
>>   Description: fast lossless compression algorithm -- development files
>
> I don't undertsand now.
>
> ZSTD_EndDirective was included in 1.3.0.
>
> I can just change that for 1.3.9, but I don't know why is that there.
> Could you do a grep ZSTD_EndDirective /usr/lib/zstd.h?

23:07:26 [alex@zen:~/l/q/b/all] review/misc-bits|=E2=80=A6 2 + docker run -=
-rm -it qemu:ubuntu grep -r "ZSTD_End" /usr/include/
/usr/include/zstd.h:} ZSTD_EndDirective;
/usr/include/zstd.h:                                         ZSTD_EndDirect=
ive endOp);
/usr/include/zstd.h:                            ZSTD_EndDirective endOp);

>
> Or if there is some documentation that shows how to use that docker
> images.

Setting up docker is described in docs/devel/testing.rst - once setup
the make invocations I listed work. The final images are all tagged
qemu:FOO so for ubuntu the general form:

  docker run --rm -it qemu:ubuntu COMMAND

Will do what you want.

>
> Later, Juan.


--=20
Alex Benn=C3=A9e

