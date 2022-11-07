Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905E761FBAD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 18:42:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os67j-0001HF-4b; Mon, 07 Nov 2022 12:41:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os67d-0001GQ-G7
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:41:21 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1os67Z-0007WI-OX
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:41:19 -0500
Received: by mail-wm1-x331.google.com with SMTP id t4so7330057wmj.5
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 09:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0wswAa4b7uDXMMwnwXdjMJQvXoX0XaMPWT73n20gjlk=;
 b=Z+85Myji5DhnvtoBoUcvzQboONauuXset5ItExK9pOvsQkJLsGf1RhtEKe8h0TSCaw
 7zEdnxRi88snvEWUatq8UgAIfrWe6Gs1QGCP+DuF7uUbMd0BekPWketgE6QyaUsik1c7
 Jt94qmEJNxA9pdQzxfqr4c+WriYl/WhSH549ycPnVIvV1BVD9+BYQir/FAkAux5L+Zs4
 djEUeRPb6nHVcIKsZskanSdsmb4Jv1A7S3wPXQJUuqoueov7XVzuRhe5F9WBL+lwFQ88
 9Z42JV8RhAzpRl0H/uDPMiY2sVF1cXBDCm9f9nni4h7oEk1iFKnNJrKQve217au0co04
 D77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0wswAa4b7uDXMMwnwXdjMJQvXoX0XaMPWT73n20gjlk=;
 b=ujwgdOb5Q+WlSZJb3ZFqIvJFoQ7uV0jaHS0/oG88swKHcqa+kuwaJS/wJZZL08JBIu
 jP2D+VkIHJWOQ4ae1zn7lLc92HqXQnfxMpFphrSrmd2mbrmZ/h2n34g63bbKuFyabDLf
 3DCAt8hO/zdrUky5YgXiByH9JgQk8dRi0toBNFQTamjKtyKyU3z52aywj7Adv+EseApn
 8oTtcgPYrUeu0dfEfeAWM9spf0VE4WS8isdOINLDuQouMKttf7aTOEOKkf7f29N5Ww4U
 LPuOftRADGyV3zewo2JcgheAAe8P3uIrkN9XnPEPle6BoWsrAv7btvI9ObGwkAbtC2V2
 Gs4A==
X-Gm-Message-State: ACrzQf0v5214beoQYkf5ysYMPYuB9Yv50mEt2bjlSl5XhnbTfDtUvbHf
 VQbX681EY+T4afB3QxYWYKUY/w==
X-Google-Smtp-Source: AMsMyM4GzzhsVvUOXa3Er17OlUWXZChcQIBhl/pqcEJeLhPvzhpp3kf595JA00PpsIL578iFg0GwTA==
X-Received: by 2002:a1c:5454:0:b0:3cf:7521:3543 with SMTP id
 p20-20020a1c5454000000b003cf75213543mr27690794wmi.172.1667842875043; 
 Mon, 07 Nov 2022 09:41:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a05600c354200b003c71358a42dsm16243705wmq.18.2022.11.07.09.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 09:41:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 061E61FFB7;
 Mon,  7 Nov 2022 17:41:14 +0000 (GMT)
References: <20221107145227.1210499-1-alex.bennee@linaro.org>
 <ba915fd0-c542-cd7d-eb53-e4c2959429ad@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/docker: allow user to override check target
Date: Mon, 07 Nov 2022 17:40:26 +0000
In-reply-to: <ba915fd0-c542-cd7d-eb53-e4c2959429ad@linaro.org>
Message-ID: <87o7tifyrp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 7/11/22 15:52, Alex Benn=C3=A9e wrote:
>> This is useful when trying to bisect a particular failing test behind
>> a docker run. For example:
>>    make docker-test-clang@fedora \
>>      TARGET_LIST=3Darm-softmmu \
>>      CHECK_TARGET=3D"meson test qtest-arm/qos-test" \
>>      J=3D9 V=3D1
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/docker/Makefile.include | 2 ++
>>   tests/docker/common.rc        | 6 +++---
>>   2 files changed, 5 insertions(+), 3 deletions(-)
>> diff --git a/tests/docker/Makefile.include
>> b/tests/docker/Makefile.include
>> index c87f14477a..ece0aa77df 100644
>> --- a/tests/docker/Makefile.include
>> +++ b/tests/docker/Makefile.include
>> @@ -184,6 +184,7 @@ docker:
>>   	@echo '    TARGET_LIST=3Da,b,c    Override target list in builds.'
>>   	@echo '    EXTRA_CONFIGURE_OPTS=3D"..."'
>>   	@echo '                         Extra configure options.'
>> +	@echo '    CHECK_TARGET=3D"..."   Override the default `make check` ta=
rget '
>
> s/target /target./
>
>>   	@echo '    IMAGES=3D"a b c ..":   Restrict available images to subset=
.'
>>   	@echo '    TESTS=3D"x y z .."     Restrict available tests to subset.'
>>   	@echo '    J=3D[0..9]*            Overrides the -jN parameter for mak=
e commands'
>> @@ -230,6 +231,7 @@ docker-run: docker-qemu-src
>>   			$(if $(NETWORK),$(if $(subst $(NETWORK),,1),--net=3D$(NETWORK)),--n=
et=3Dnone) \
>>   			-e TARGET_LIST=3D$(subst $(SPACE),$(COMMA),$(TARGET_LIST))	\
>>   			-e EXTRA_CONFIGURE_OPTS=3D"$(EXTRA_CONFIGURE_OPTS)" \
>> +			-e CHECK_TARGET=3D"$(CHECK_TARGET)" 		\
>>   			-e V=3D$V -e J=3D$J -e DEBUG=3D$(DEBUG)		\
>>   			-e SHOW_ENV=3D$(SHOW_ENV) 			\
>>   			$(if $(NOUSER),,				\
>> diff --git a/tests/docker/common.rc b/tests/docker/common.rc
>> index e6f8cee0d6..f2769c1ff6 100755
>> --- a/tests/docker/common.rc
>> +++ b/tests/docker/common.rc
>> @@ -63,12 +63,12 @@ check_qemu()
>>   {
>>       # default to make check unless the caller specifies
>>       if [ $# =3D 0 ]; then
>> -        INVOCATION=3D"check"
>> +        INVOCATION=3D"${CHECK_TARGET:-make $MAKEFLAGS check}"
>
> Why pass MAKEFLAGS here?

That was just preserving previous behaviour. That said I think MAKEFLAGS
only ever has J in it and perhaps for check_qemu we never want to parallise?

>
>>       else
>> -        INVOCATION=3D"$@"
>> +        INVOCATION=3D"make $MAKEFLAGS $@"
>>       fi
>>   -    make $MAKEFLAGS $INVOCATION
>> +    $INVOCATION
>>   }
>>     test_fail()


--=20
Alex Benn=C3=A9e

