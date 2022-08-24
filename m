Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A83959F680
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:40:52 +0200 (CEST)
Received: from localhost ([::1]:58168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmsV-0000na-Kq
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQmZa-0003H5-1v
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:21:18 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQmZY-00078c-4O
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:21:17 -0400
Received: by mail-ed1-x530.google.com with SMTP id z2so21258511edc.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=neCVeXNqlHMFDwv04nrerh44tdra+eMhaY+K+AHraC4=;
 b=AudradoKnLekyUT4katbkrvqCQLfqaRWuNp572L7zTT62eUL5eMvnqeJbee6Kc/YvC
 wfdEK1gskMg7o+8+5E6i0clfIDozGn+2J5Jj1JMakG3hlr7c23dMr6CLuhg8u//e7mSq
 dnVGBx/prY93rPO2eT6MPf0lfZdWOLvKRSrJX/yrgJy6WjP3RNxPONPYgZRJKQlfEk9j
 KZwNsqrWl6Eh5X9S+SFkmJwg339QRBhC+kd0C/dIIDFauS8FnUGXP/XPSvc2GfNGDn3h
 Rw9/nobMKnccCcwH3uuw1wXaLR3tP9MW8EbhkaNpMP6QZFbQeidfJ0qGSYuCTA+5WWDa
 DAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=neCVeXNqlHMFDwv04nrerh44tdra+eMhaY+K+AHraC4=;
 b=Bbeh8RbUVAPDdlfzboRd3GOphVA3DOzkowQJS9qK9aT9DlHvViM2TMnrj6ip8UvvMj
 jHDHGLg2n6eeUSZYLRwsFy3om23tvCp9bi61/3/Uhy0ypqG1g/E6yxaVTtnpwXAg76Os
 H1PVXGBUQ3SE9OwOJt/gOKkOzVgxooiI4CqCUQgKGgLaaUymoLhJ/lTqW6jxajm6BCar
 LL+7aI+DOlqkvWyzvTwQ6TlKjPIp3X6pPe3aQqskHD65WMk6O+oag9llUrXAw6PeLutR
 cfO71diClnu3zvl8Nfk+FxUEvPs8SFEPY24vR5AjE4r08Dko1BO7Et+rsBklFbTryVyR
 O7xA==
X-Gm-Message-State: ACgBeo0fRITEUFSCIECbYaJNHNpxysRj6axI4jNtC0rM/cT21uGRiRMK
 otMDR85NurHc15SLhK+ekyoOaQ==
X-Google-Smtp-Source: AA6agR6WUIvDvWqHzv7zHLAI/ztSJCADNyHEN7HeOTq9tIrnk/iaDi3Rv0EaZqfD5JOtCtPd6nRJHg==
X-Received: by 2002:a05:6402:e96:b0:443:a086:e3e8 with SMTP id
 h22-20020a0564020e9600b00443a086e3e8mr7088505eda.330.1661332874560; 
 Wed, 24 Aug 2022 02:21:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a170906385b00b0073d732e440asm904366ejc.84.2022.08.24.02.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:21:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C47131FFB7;
 Wed, 24 Aug 2022 10:21:12 +0100 (BST)
References: <20220823152558.301624-1-alex.bennee@linaro.org>
 <20220823152558.301624-2-alex.bennee@linaro.org>
 <13926833-3ce7-dc1a-33a4-ac6691eda763@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, Cleber Rosa
 <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PULL 1/6] tests/avocado: push default timeout to QemuBaseTest
Date: Wed, 24 Aug 2022 10:19:25 +0100
In-reply-to: <13926833-3ce7-dc1a-33a4-ac6691eda763@linaro.org>
Message-ID: <87o7wahu9j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 8/23/22 08:25, Alex Benn=C3=A9e wrote:
>> All of the QEMU tests eventually end up derrived from this class. Move
>> the default timeout from LinuxTest to ensure we catch them all. As 15
>> minutes is fairly excessive we drop the default down to 2 minutes
>> which is a more reasonable target for tests to aim for.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20220822165608.2980552-2-alex.bennee@linaro.org>
>> diff --git a/tests/avocado/avocado_qemu/__init__.py
>> b/tests/avocado/avocado_qemu/__init__.py
>> index ed4853c805..0efd2bd212 100644
>> --- a/tests/avocado/avocado_qemu/__init__.py
>> +++ b/tests/avocado/avocado_qemu/__init__.py
>> @@ -227,6 +227,10 @@ def exec_command_and_wait_for_pattern(test, command,
>>       _console_interaction(test, success_message, failure_message, comma=
nd + '\r')
>>     class QemuBaseTest(avocado.Test):
>> +
>> +    # default timeout for all tests, can be overridden
>> +    timeout =3D 120
>> +
>>       def _get_unique_tag_val(self, tag_name):
>>           """
>>           Gets a tag value, if unique for a key
>> @@ -512,7 +516,6 @@ class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
>>       to start with than the more vanilla `QemuSystemTest` class.
>>       """
>>   -    timeout =3D 900
>>       distro =3D None
>>       username =3D 'root'
>>       password =3D 'password'
>
> Bah.
>
> https://gitlab.com/qemu-project/qemu/-/jobs/2923804714


Hmm weird - the avocado CFI job doesn't even appear on my CI list (even
with push-ci-now). Anyway I've reverted the timeout to 900s and sent a
v2 of the PR. I'll drop it back down to 120s next cycle and explicitly
increase the timeouts for the known slow tests.

>
>  (001/192)
>  tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg:
>  INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>  Timeout reached\nOriginal status: ERROR\n{'name':
>  '001-tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg',
>  'logdir':
>  '/builds/qemu-project/qemu/build/tests/results/job-2022-08-23T21.03-6d06=
db2/t...
>  (120.85 s)
>  (003/192) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg:
>  INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>  Timeout reached\nOriginal status: ERROR\n{'name':
>  '003-tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg',
>  'logdir':
>  '/builds/qemu-project/qemu/build/tests/results/job-2022-08-23T21.03-6d06=
db2/test...
> (120.81 s)
>
> The previous successful run had
>
>  (001/192) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg:=
  PASS (257.00 s)
>  (003/192) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg:  P=
ASS (238.67 s)
>
>
> r~


--=20
Alex Benn=C3=A9e

