Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198255A8564
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 20:21:45 +0200 (CEST)
Received: from localhost ([::1]:49318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTSLP-00043J-Ix
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 14:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTSJE-0002WR-7c
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 14:19:28 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTSJC-00037W-Fi
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 14:19:27 -0400
Received: by mail-ej1-x633.google.com with SMTP id se27so22332275ejb.8
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=IeMA9kSHqp/Jsi9NZ9nqjcTmuH4BlSCPehCQgISiBvg=;
 b=q7PMAhaKQ1Max40kkPCG+vT3RFj2nWf4S0m9cNPbVfxK8+QRPRJUBecjcQrEHnownR
 wxP+y77vRE5fP1Gs7oxkIXxd0iotioEvu6qF3Nr1qiOxrjvRVGFSH6ZqKT/kG7X+3nPo
 Jmif+m4k/99QBeazb/O3q0zsqHS+hUzfkvghG5dtukJlZmF1cXHZ7Yx0JIXTF6h9hPbo
 4HdDLgF1qhUB++7JryYMm/BJe+Gg3Ll9fWdm5rydc7fdxTWeQWI46za63kg4iltrm5uE
 11SVPF2WALaaFQzc7RF1BfCW+jLKIuSfbWO/rEI7AnX0tgUAH9PTY41bI7YKO+3GEzs4
 ke2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=IeMA9kSHqp/Jsi9NZ9nqjcTmuH4BlSCPehCQgISiBvg=;
 b=UC85Zoqyy6luroOUDgVGsiQ5o3xxzq+YxVthFxbtpLchZ158TpdZf/4yKi5ARUc+FR
 OZWqXIJacrEJsBgLLoSSx28qmjgC1jhhVcp9NX1CiE4NcwS/akHTzfTMJNt7vnyGIbm5
 9kiyoWd6T+pDhbtHwxdL5digbuG0Ztts1eUrUp4rxyCSsAW2jsAipsAEBgEGkSbzMQdU
 LXw9tvLFrxz+v9WVkaLX5T3nonOgcZNpDK5gfP4SSphx3bFjAQQ15RY7XrkLTBaN83QP
 wVJsnDUK1HxUJqo/gkKck4j2nxBj/4kluUWvzX8+oWP+HzsB1rSPwJWqAGIfxRbur/zD
 MfvQ==
X-Gm-Message-State: ACgBeo2W/0hvl5ukKLXSPY/AntmwVNQqn2xlYgab8xrTxIv0prTcDbj7
 rtAeNpBfmcdNpM404+/KcQbodw==
X-Google-Smtp-Source: AA6agR5+gSbDEXF5onq1kXVeANWGmVCbv9JqT93zTtgcKKlvVS+mauf29NxvWT+DyhikmNmrJ4FEvA==
X-Received: by 2002:a17:906:3bd2:b0:731:3f03:1697 with SMTP id
 v18-20020a1709063bd200b007313f031697mr21776857ejf.289.1661969964815; 
 Wed, 31 Aug 2022 11:19:24 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 kx17-20020a170907775100b00734a9503bcasm7483216ejc.135.2022.08.31.11.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:19:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B53F1FFB7;
 Wed, 31 Aug 2022 19:19:23 +0100 (BST)
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-3-alex.bennee@linaro.org>
 <47466a1a-9163-0192-eb27-d37bde434828@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH v1 02/25] tests/avocado: reduce the default timeout to 120s
Date: Wed, 31 Aug 2022 19:18:56 +0100
In-reply-to: <47466a1a-9163-0192-eb27-d37bde434828@redhat.com>
Message-ID: <87k06onums.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> On 26/08/2022 19.21, Alex Benn=C3=A9e wrote:
>> We should be aiming to keep our tests under 2 minutes so lets reduce
>> the default timeout to that. Tests that we know take longer should
>> explicitly set a longer timeout.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/avocado/avocado_qemu/__init__.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/tests/avocado/avocado_qemu/__init__.py
>> b/tests/avocado/avocado_qemu/__init__.py
>> index 9d17a287cf..0efd2bd212 100644
>> --- a/tests/avocado/avocado_qemu/__init__.py
>> +++ b/tests/avocado/avocado_qemu/__init__.py
>> @@ -229,7 +229,7 @@ def exec_command_and_wait_for_pattern(test, command,
>>   class QemuBaseTest(avocado.Test):
>>         # default timeout for all tests, can be overridden
>> -    timeout =3D 900
>> +    timeout =3D 120
>
> Did you try this on gitlab already? I guess it will fail in
> some cases, e.g.:
>
>  https://gitlab.com/qemu-project/qemu/-/jobs/2928561388
>
> there are some tests that run definitely longer, e.g.:
>
>  (005/192) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gic=
v2:  PASS (342.26 s)
>  (006/192) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gic=
v3:  PASS (330.37 s)
>
> and I can't spot a "timeout =3D ..." in that file.

I've added some patches for that, ppc64le and s390 into v2

>
>  Thomas


--=20
Alex Benn=C3=A9e

