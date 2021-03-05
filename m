Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2AF32F196
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:44:53 +0100 (CET)
Received: from localhost ([::1]:36518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEVQ-0007xn-9L
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIDnf-0002oi-29
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:59:40 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIDnc-0000Pu-6t
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:59:38 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h98so2804433wrh.11
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ryGPpbeSIAXtlUDM8l0Fkky+/i/+4Hxegpp4l46fyNg=;
 b=m0FM9tFU+VtUdtxv1VF70dwyHJJE5an03PJ/7oVhESM8+rchvqq9Bx/YwRfrZzO32j
 GhR7dm1O5yca7mHhzwt7uL18X463cSIlynMHVpIbtCszKPvwzLcidNTKZBiXoj+whmXo
 j3Peosw7hJN9mSkysfkUU6WOpcYWeqZUKBf+x8otpge6dkTDMxztayhED/EJLTSQyO89
 vkj6hFr+5IQXa11jJMCqRFCZR1Ms6VKlRnk1rKBv4+KduQBXoQkY87M3z1quHLbtmU8+
 UGzjh89m6lVEgKaGQ0VuacgtZIiCjMJuAV1QDlbUxzMAcH7FebJfxrV5rDTG2Peggywb
 HpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ryGPpbeSIAXtlUDM8l0Fkky+/i/+4Hxegpp4l46fyNg=;
 b=a1989eGDRFWWFZtCAPCOboxxEQFRwPwhTwfNXPHMj0uprcHV2NWhF5lF69mbGpMck8
 EAWmitQ4qZv3L+XrKn0uSiuNZgq17npdnEsa6zIkCXIJgeRCZKM8kJYwUDY9V0pr8Zi8
 g8B+QwoRmfSi9uzrOAJevrs1nncOobC4Nr158EgmOnOqhV3jSzJ8ImDW0MjtZC3FR5kI
 fZh6zW6OBLj9cGhz92fLEqpXCrdVL1xjjlEXMfsJPZgPBqOj41YCwg0G+0vqxnXsLOto
 b01AgCcQRBUC1XgPUmUM/3mvfZv2mah7ejn+bDCZfezs2lULHjlLqocCS6F5coJrcUf+
 aAoA==
X-Gm-Message-State: AOAM533iYKVbVEZ4JFhAPfCdCPaNIGRQBn2m50ZhG2F9wPUv1L1Rr9ke
 WAJpU5HLaRzbqdlx1PbkauhHbQ==
X-Google-Smtp-Source: ABdhPJy6A+FGgWvPMFYstsnXs9z3TOK4QtPWDyeXbSwYAZaDIH1q/4nH8F+2jyLMao3of+MUAI17eQ==
X-Received: by 2002:adf:b313:: with SMTP id j19mr10133288wrd.188.1614963573441; 
 Fri, 05 Mar 2021 08:59:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l15sm5209139wmh.21.2021.03.05.08.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:59:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 04A6B1FF7E;
 Fri,  5 Mar 2021 16:59:19 +0000 (GMT)
References: <20210208023752.270606-1-richard.henderson@linaro.org>
 <87zgzheeto.fsf@linaro.org> <87wnulee0a.fsf@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 00/70] TCI fixes and cleanups
Date: Fri, 05 Mar 2021 16:59:03 +0000
In-reply-to: <87wnulee0a.fsf@linaro.org>
Message-ID: <87tuppeduh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> Changes since v2:
>>>   * 20-something patches are now upstream.
>>>   * Increase testing timeout for tci.
>>>   * Gitlab testing for tci w/ 32-bit host.
>>
>> Hmm that fails with this applied on the current master:
>>
>> cc -Ilibqemu-i386-linux-user.fa.p -I. -I.. -Itarget/i386 -I../target/i38=
6 -I../linux-user/host/i386 -Ilinux-user -I../linux-user -Ilinux-user/i386 =
-I../linux-user/i386 -I../capstone/include/capstone -Itrace -Iqapi -Iui -Iu=
i/shader -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -fdiagnostics-=
color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu99 -O2 -g -isystem=
 /builds/stsquad/qemu/linux-headers -isystem linux-headers -iquote . -iquot=
e /builds/stsquad/qemu -iquote /builds/stsquad/qemu/include -iquote /builds=
/stsquad/qemu/disas/libvixl -iquote /builds/stsquad/qemu/tcg/tci -iquote /b=
uilds/stsquad/qemu/accel/tcg -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=
=3D2 -m32 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstri=
ct-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototype=
s -fno-strict-aliasing -fno-common -fwrapv -m32 -Wold-style-declaration -Wo=
ld-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-sel=
f -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpan=
sion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-s=
hift-negative-value -Wno-psabi -fstack-protector-strong -fPIC -isystem../li=
nux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"i386-lin=
ux-user-config-target.h"' '-DCONFIG_DEVICES=3D"i386-linux-user-config-devic=
es.h"' -MD -MQ libqemu-i386-linux-user.fa.p/tcg_tci.c.o -MF libqemu-i386-li=
nux-user.fa.p/tcg_tci.c.o.d -o libqemu-i386-linux-user.fa.p/tcg_tci.c.o -c =
../tcg/tci.c
>> ../tcg/tci.c: In function 'tcg_qemu_tb_exec':
>> ../tcg/tci.c:317:37: error: passing argument 1 of 'g2h' makes pointer fr=
om integer without a cast [-Werror=3Dint-conversion]
>>   317 | # define qemu_ld_ub      ldub_p(g2h(taddr))
>>       |                                     ^~~~~
>>       |                                     |
>>       |                                     target_ulong {aka unsigned i=
nt}
>> ../tcg/tci.c:923:25: note: in expansion of macro 'qemu_ld_ub'
>>   923 |                 tmp32 =3D qemu_ld_ub;
>>       |                         ^~~~~~~~~~
>>
>> and more:
>>
>> https://gitlab.com/stsquad/qemu/-/jobs/1076231320
>
> Looks like it was broken by:
>
> 3e8f1628e864201692aa28996f8f64f9761555af is the first bad commit
> commit 3e8f1628e864201692aa28996f8f64f9761555af
> Author: Richard Henderson <richard.henderson@linaro.org>
> Date:   Fri Feb 12 10:48:43 2021 -0800
>
>     exec: Use cpu_untagged_addr in g2h; split out g2h_untagged
>
>     Use g2h_untagged in contexts that have no cpu, e.g. the binary
>     loaders that operate before the primary cpu is created.  As a
>     colollary, target_mmap and friends must use untagged addresses,
>     since they are used by the loaders.
>
>     Use g2h_untagged on values returned from target_mmap, as the
>     kernel never applies a tag itself.
>
>     Use g2h_untagged on all pc values.  The only current user of
>     tags, aarch64, removes tags from code addresses upon branch,
>     so "pc" is always untagged.
>
>     Use g2h with the cpu context on hand wherever possible.
>
>     Use g2h_untagged in lock_user, which will be updated soon.
>
>     Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>     Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>     Message-id: 20210212184902.1251044-13-richard.henderson@linaro.org
>     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
<snip>

I will now move to v4 which I missed and has a fix for this ;-)

--=20
Alex Benn=C3=A9e

