Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2346E4F8E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 19:46:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poSuJ-0001jG-0S; Mon, 17 Apr 2023 13:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poSuD-0001ix-Q2
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 13:44:45 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poStu-0003et-5f
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 13:44:38 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so11765905e9.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 10:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681753461; x=1684345461;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gvPkuKRaxIoQ5N+27DsxZophIEyVIhwZjPjhSE7pAg0=;
 b=oa5UdPjuDUR2ro/GewBUfXNc2FVwl4i0loygBP6pVJH4BWCQUrodLEI5BVT+BBXM81
 OmKiDP6uEaWQ0zK3DsMeVagfxbS0RH5i8ameKOxYwhDtMDj0pf9ZhuxMO8M38khna/z5
 N2ZFgi5s+X113xHJABRI9oOCIwmdDkFqVunA1W6OfJa2rUN6Ssv3cATEyLlr6XO1/UWv
 WaV86ku5vNqubILt5moTExFYut1eKoKyAjJSAelrXvj3FK7Jo3jdOu8JgYHSy4VYt8Uf
 E1hStLICFEdFJ+qAZPEgQGPZTYpJFogzdK1sPFmbP0TgeYl7ptHqHfrzoFCHDyiPNECu
 /Ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681753461; x=1684345461;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gvPkuKRaxIoQ5N+27DsxZophIEyVIhwZjPjhSE7pAg0=;
 b=aFrZmUEJDYHJJnX4SkdQ5FyLayqVTlSyRxORgohVMeu8I8rBK21VrDMXB3t7JroKug
 AeTsrc07Rx0AAsLvuzEqZZ4lhJJMTBVde+1/71lHM2gBT2ksiaunjxoINACH+UgEwBp9
 y4Jr26eVJvf9aVZ1GPxhGHTd4wBNdEYJ12W96y+pBflgm9FXfdbgHtkOCgyEXPJJtu1A
 LIf/IkR/PvdXUGxxy9bS7AXIWrWpvL+r1wJt70tufS1BZA09ToWetV4vBZIYGD1oWqS+
 52+NvVIk15Bd/jLpBj01TmOi38jhtb5U10KZMlWSS46MiyK3qg27elKyI7OZuKWOarHq
 wnow==
X-Gm-Message-State: AAQBX9eOaQMv6UnsN/ctmhI2bfXH71/GqI4w6Kk/RxWIbg0JrCiOvUT6
 MjNRXtpIzH/zNjedRqvxjMCWiQ==
X-Google-Smtp-Source: AKy350YsUgRH32kyAV7hfsUycUGp/Z9pEHU5gkxLRMayp0auD5w8F9/8OddjRHYdJvkQuZ9wTJ7DPw==
X-Received: by 2002:adf:fc91:0:b0:2f7:8acb:b823 with SMTP id
 g17-20020adffc91000000b002f78acbb823mr6133251wrr.56.1681753460871; 
 Mon, 17 Apr 2023 10:44:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a056000115100b002fa6929eb83sm3236459wrx.21.2023.04.17.10.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 10:44:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E30861FFB7;
 Mon, 17 Apr 2023 18:44:18 +0100 (BST)
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, Jan Richter <jarichte@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Markus Armbruster <armbru@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, Kautuk
 Consul <kconsul@linux.vnet.ibm.com>, Hariharan T S
 <hariharan.ts@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up
 avocado-framework version to 101.0
Date: Mon, 17 Apr 2023 18:44:04 +0100
In-reply-to: <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
Message-ID: <87pm82e74d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


John Snow <jsnow@redhat.com> writes:

> On Mon, Apr 17, 2023 at 9:43=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@lin=
aro.org> wrote:
>>
>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>
>> Avocado version 101.0 has a fix to re-compute the checksum
>> of an asset file if the algorithm used in the *-CHECKSUM
>> file isn't the same as the one being passed to it by the
>> avocado user (i.e. the avocado_qemu python module).
>> In the earlier avocado versions this fix wasn't there due
>> to which if the checksum wouldn't match the earlier
>> checksum (calculated by a different algorithm), the avocado
>> code would start downloading a fresh image from the internet
>> URL thus making the test-cases take longer to execute.
>>
>> Bump up the avocado-framework version to 101.0.
>>
>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
>> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - limit --max-parallel-tasks $(JOBS_OPTION:-j%=3D%)
>> ---
>>  tests/Makefile.include | 18 +++++++++++-------
>>  tests/requirements.txt |  2 +-
>>  2 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index 9422ddaece..a4de0ad5a2 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>>  # download all vm images, according to defined targets
>>  get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDO=
RA_31_DOWNLOAD))
>>
>> +JOBS_OPTION=3D$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS)=
)))
>> +
>>  check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>> -       $(call quiet-command, \
>> -            $(TESTS_PYTHON) -m avocado \
>> -            --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_RE=
SULTS_DIR) \
>> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>> -                       --filter-by-tags-include-empty-key) \
>> -            $(AVOCADO_CMDLINE_TAGS) \
>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>> +       $(call quiet-command,                                           =
        \
>> +            $(TESTS_PYTHON) -m avocado                                 =
                \
>> +            --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_RE=
SULTS_DIR)  \
>> +            $(if $(AVOCADO_TAGS),,                                     =
        \
>> +                       --filter-by-tags-include-empty                  =
        \
>> +                       --filter-by-tags-include-empty-key)             =
        \
>> +               --max-parallel-tasks $(JOBS_OPTION:-j%=3D%)             =
          \
>> +            $(AVOCADO_CMDLINE_TAGS)                                    =
        \
>> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS),           =
        \
>>              "AVOCADO", "tests/avocado")
>>
>>  check-acceptance-deprecated-warning:
>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>> index 0ba561b6bd..a6f73da681 100644
>> --- a/tests/requirements.txt
>> +++ b/tests/requirements.txt
>> @@ -2,5 +2,5 @@
>>  # in the tests/venv Python virtual environment. For more info,
>>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>>  # Note that qemu.git/python/ is always implicitly installed.
>> -avocado-framework=3D=3D88.1
>> +avocado-framework=3D=3D101.0
>>  pycdlib=3D=3D1.11.0
>> --
>> 2.39.2
>>
>
> I thought there were test failures that prohibited us from bumping the
> Avocado-Framework version. Did those get rectified recently?

I'm not seeing any with your patch applied.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

