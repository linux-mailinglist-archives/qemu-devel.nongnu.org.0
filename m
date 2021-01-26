Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0853045EA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 19:06:29 +0100 (CET)
Received: from localhost ([::1]:43578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4SjU-0003CS-Bt
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 13:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4SfN-0001Gs-6g
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 13:02:13 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4SfK-0007HX-Uk
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 13:02:12 -0500
Received: by mail-wr1-x436.google.com with SMTP id p15so10790152wrq.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 10:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=oct0WP2DMDSAG8DoAdmKcEmG7tjTnc1tBxsTZ2diuvQ=;
 b=pxTOJpuCIjZ9Q72k/lDc15T5IOte9yhmv3dz2GIpKqNFpTzK7spQa0WauxX2zOElE7
 B9DzRsQrW2ejEpZ/HAj20IDxtB00Sqx82sZ3WrEs6aWIHIjN8c8nb5Ix8XoIt9FGrexK
 34DszexV4CFlv3S2v1OPKuEmkCiB46PYtkFIUiE4VZEImaMRSDrjyNqYFaRSUQQDEvm6
 trk/qlzdl2UD1sYfEfgVtwZLShJwQTQJddEWds0pZqnH5Fqk0OgqgI0m6j2FQXEWC1Ek
 +D8uWZ4n52cEeppKXHCNSM9sZZyX13hnXzncOQtG7qDEe6YE9jNq8pNTrngrS57xB3ZP
 yNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=oct0WP2DMDSAG8DoAdmKcEmG7tjTnc1tBxsTZ2diuvQ=;
 b=MKwzIg3LNqxLXJpFtjoG36oG2VtVGmK8SjTtzwlf273Cv1CtPLuGUgHYJZZ0mSY89Q
 9qlk7hpnn6gIlseRsCt4EXV7zCcLC2zOwybQaDv73a1jLca5vb1BUs+hsHusxLWn9gD/
 LBDS3GL6xf7X5yQiPDRWJQlRr6l7T9R/Qm26z4G51Iz6JQSPRtdQqOO9un2GzFpFn7wJ
 FJ5Tjxo8e26AQN1wA0NOEbu8CIYacGcv9kJEjyXUo0+LQou+I4/P4SbJ1qSaE/tvbm+v
 1uoVj+nFck2LxdhB1QBtwaiprMJvE89CJNO1vOGWQUohb2cWy/aJT1z0fJSafZkFrl4Y
 S6Dg==
X-Gm-Message-State: AOAM532fZlF4gGm/2XF4CNvueDe3HSGMwrAaaLTyyMSgY9AIugIlretA
 YjHyY1G+cs/PqCVXnBVYbx4MKw==
X-Google-Smtp-Source: ABdhPJwCeIIkPbwm1uYbSPQPZ59bYU9QRts7t6v7vsiatYgRoadiJdF5j2+Q1zjomVCkOucgIIkXfw==
X-Received: by 2002:a5d:6511:: with SMTP id x17mr7486529wru.313.1611684129062; 
 Tue, 26 Jan 2021 10:02:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a62sm4542001wmf.7.2021.01.26.10.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 10:02:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 80C891FF7E;
 Tue, 26 Jan 2021 18:02:06 +0000 (GMT)
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
 <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
Date: Tue, 26 Jan 2021 17:24:10 +0000
In-reply-to: <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
Message-ID: <875z3jy3tt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?M?= =?utf-8?Q?athieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Weil <sw@weilnetz.de> writes:

> Am 25.01.21 um 23:35 schrieb Richard Henderson:
>> On 1/25/21 11:02 AM, Stefan Weil wrote:
>>> Am 25.01.21 um 20:02 schrieb Richard Henderson:
>>>> On 1/25/21 8:58 AM, Stefan Weil wrote:
>>>>> I have no evidence that TCI is less reliable than TCG, so I would not=
 write
>>>>> that.
>>>> It can't pass make check-tcg.
>>> Where does it fail? Maybe an expected timeout problem which can be solv=
ed by
>>> increasing the timeouts for TCI?
>>>
>>> I have just run a local test of `make check-tcg` with native TCG and wi=
th TCI
>>> and did not see a difference. But I noticed that in both cases many tes=
ts show
>>> "skipped".
>> You need to enable docker or podman for your development, so that you ge=
t all
>> of the cross-compilers.
>>
>> Then:
>>
>>    TEST    fcvt on arm
>> TODO ../qemu/tcg/tci.c:614: tcg_qemu_tb_exec()
>> ../qemu/tcg/tci.c:614: tcg fatal error
>> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>>
>>    TEST    float_convs on m68k
>> TODO ../qemu/tcg/tci.c:614: tcg_qemu_tb_exec()
>> ../qemu/tcg/tci.c:614: tcg fatal error
>> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>>
>> which is of course one of the TODO assertions.
>> It's positively criminal those still exist in the code.
>
>
> I installed podman and repeated `make check-tcg`. The log file still=20
> shows 87 lines with "SKIPPED". There is also a gdb core dump, several=20
> warnings, but nothing related to TCI. Both tests cited above seem to=20
> work without a problem.

I'm going to go out on a limb and guess you have commit:

  23a77b2d18 (build-system: clean up TCG/TCI configury)

which temporarily has the effect of disabling TCI. See

  Subject: Re: [PATCH v4 1/4] configure: Fix --enable-tcg-interpreter
  From: Paolo Bonzini <pbonzini@redhat.com>
  Message-ID: <2b8b6291-b54c-b285-ae38-21f067a8497d@redhat.com>
  Date: Mon, 25 Jan 2021 17:36:42 +0100

with that fix fixed I see the same failures as Richard:

  ./qemu-arm ./tests/tcg/arm-linux-user/fcvt > /dev/null
  TODO ../../tcg/tci.c:614: tcg_qemu_tb_exec()
  ../../tcg/tci.c:614: tcg fatal error
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  fish: =E2=80=9C./qemu-arm ./tests/tcg/arm-linu=E2=80=A6=E2=80=9D terminat=
ed by signal SIGSEGV (Address boundary error)

which does raise the question before today when was the last time anyone
attempted to run check-tcg on this?

> The complete log file is available from=20
> https://qemu.weilnetz.de/test/check-tcg.txt.
>
> Daniel, regarding your comment: TCI has 100 % test coverage for the=20
> productive code lines.

By what tests? The fact you don't hit asserts in your day to day testing
doesn't mean there are features missing that are easily tripped up or
that TCI got it right.

> All code lines which were never tested raise an=20
> assertion, so can easily be identified (and fixed as soon as there is a=20
> test case which triggers such an assertion). The known deficits are=20
> speed, missing TCG opcodes, unimplemented TCG opcodes because of missing=
=20
> test cases and missing support for some host architectures.

Passing check-tcg would be a minimum for me.

--=20
Alex Benn=C3=A9e

