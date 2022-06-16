Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411F954D6FD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 03:24:33 +0200 (CEST)
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1eFL-00075o-Tq
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 21:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o1eDv-0006ND-BR
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 21:23:03 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o1eDs-0001nr-Uh
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 21:23:02 -0400
Received: by mail-ej1-x62b.google.com with SMTP id h23so26422203ejj.12
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 18:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=al9wHa9DpJMVvpq8M22WdYq1iLjAF5JZgwZ/z3GRV3c=;
 b=ATpGe5r1V+4g4QEf2G44xzk8IHjaQ+icbZA177raDAOqFOExKA43QwZ3sDx2kYf21T
 zkDreJbsIsYmXZNfYLiZGeCZVIU5zsmAL/kaMWcShrmbvgTgaBCuQz311eSnLuT1aWKi
 yl5+GCEfPZ2M1Aeh0lueSU2D4ooRXSTmgPs5rHnd94w6HrHwOHA35C0/YdQI+2GL2dWG
 Ab08gcwwTWWeUVJnY7ENZ9bFGGTA+FsA090js6J08n3JEqOUi7AJVVmLUjNWRJ6SgVjX
 hEyYvkLKpZlhpwlm8XGXnl/KpQ75do8aEv8JDsdheKq0EnnVtzk6ec+KBmgDHIKNav9u
 xgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=al9wHa9DpJMVvpq8M22WdYq1iLjAF5JZgwZ/z3GRV3c=;
 b=yGdSvK/3ZbJH740egXj57ivBKWdHmiYHvdidqYsIjwzZO0dePVQm4gDOYAa7vstHgP
 H5btWpw4fx/YivjhPXikuKDSkvEWjlUEc2ScSfNNZdRU0TtlwUL9DUMmdpci5XFJxLrA
 U6EhZDyY24xh5G0MzZHUzMinnHSi5j8T9WzPpPz5BXGshhkFMvwyZ+3pmrTQ3r3l7NsW
 kl2Gp3yN5fEG4cVnYTBDJJ1TMVkt/ClHNL2wXTsHhUuLUIYybQP4Ix57JxR5UjQv+x2j
 q+cspJmdQjmE/qAgnAqgDhoReHKFiQTo3Be9on+Nxtj0Ad/icOW8U8bInALv0TTagt8P
 g/NQ==
X-Gm-Message-State: AJIora9cdlvfALT5KihOUKNEIIHJSkRWfqRux5TDfshHIxlcFu3gwuwG
 J70iT3gvzs9zKHTIREzfSbJbYg==
X-Google-Smtp-Source: AGRyM1uEd3wC3tcOPcTus9D4GWyBlRFJnGHCxvRe5VIIOdaIYIWarCZ472LfjwI3Lv/ogJ1f0aWzEA==
X-Received: by 2002:a17:906:7a1b:b0:712:237d:8562 with SMTP id
 d27-20020a1709067a1b00b00712237d8562mr2407644ejo.446.1655342578551; 
 Wed, 15 Jun 2022 18:22:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 cy2-20020a0564021c8200b0042ab2127051sm592024edb.64.2022.06.15.18.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 18:22:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D81031FFB7;
 Thu, 16 Jun 2022 02:22:56 +0100 (BST)
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
 <20220601180537.2329566-21-alex.bennee@linaro.org>
 <c655723a-95df-82e4-2105-678cdea9e702@eldorado.org.br>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [PULL 20/33] configure: handle host compiler in
 probe_target_compiler
Date: Thu, 16 Jun 2022 02:20:56 +0100
In-reply-to: <c655723a-95df-82e4-2105-678cdea9e702@eldorado.org.br>
Message-ID: <87sfo54d1r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br> writes:

> On 01/06/2022 15:05, Alex Benn=C3=A9e wrote:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>=20
>> In preparation for handling more binaries than just cc, handle
>> the case of "probe_target_compiler $cpu" directly in the function,
>> setting the target_* variables based on the ones that are used to
>> build QEMU.  The clang check also needs to be moved after this
>> fallback.
>>=20
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20220517092616.1272238-10-pbonzini@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20220527153603.887929-21-alex.bennee@linaro.org>
>
> Hi,
>
> After this patch, a clean build in ppc64le hosts will not build=20
> ppc64{,le}-linux-user tests with "make check-tcg"
>
>>=20
>> diff --git a/configure b/configure
>> index fbf6d39f96..217c8b3cac 100755
>> --- a/configure
>> +++ b/configure
>> @@ -954,10 +954,6 @@ case $git_submodules_action in
>>       ;;
>>   esac
>>=20
>> -if eval test -z "\${cross_cc_$cpu}"; then
>> -    eval "cross_cc_${cpu}=3D\$cc"
>> -fi
>> -
>>   default_target_list=3D""
>>   mak_wilds=3D""
>>=20
>> @@ -2008,13 +2004,6 @@ probe_target_compiler() {
>>     if eval test -n "\"\${cross_cc_$1}\""; then
>>       if eval has "\"\${cross_cc_$1}\""; then
>>         eval "target_cc=3D\"\${cross_cc_$1}\""
>> -      case $1 in
>> -        i386|x86_64)
>> -          if $target_cc --version | grep -qi "clang"; then
>> -            unset target_cc
>> -          fi
>> -          ;;
>> -      esac
>>       fi
>>     fi
>>     if eval test -n "\"\${cross_as_$1}\""; then
>> @@ -2027,6 +2016,20 @@ probe_target_compiler() {
>>         eval "target_ld=3D\"\${cross_ld_$1}\""
>>       fi
>>     fi
>> +  if test "$1" =3D $cpu; then > +    : ${target_cc:=3D$cc}
>> +    : ${target_as:=3D$as}
>> +    : ${target_ld:=3D$ld}
>> +  fi
>
> $cpu is normalized[1] to ppc64 on little-endian hosts, so=20
> ppc64le-linux-user will not have $target_{cc,as,ld} set, and=20
> ppc64-linux-user will have them set to a toolchain that may not support=20
> -mbig-endian. I suppose we have a similar problem with MIPS targets on=20
> MIPS hosts.

For now you can always explicitly tell configure about the host compiler
with:

 --cross-cc-ppc64le=3Dgcc

but we should fix the broken detection. It seems the var cpu has an
overloaded meaning so I wonder if we just need an explicit host_cpu
setting when we normalize cpu?

>
> [1]=20
> https://gitlab.com/qemu-project/qemu/-/blob/2ad60f6f8c12ca0acd8834fdd70e0=
88361b8791f/configure#L611


--=20
Alex Benn=C3=A9e

