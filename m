Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC3A6DD498
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 09:47:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm8hm-0003fH-SY; Tue, 11 Apr 2023 03:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pm8hV-0003f0-N0
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:46:01 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pm8hT-00074s-IS
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:46:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q29so6388239wrc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 00:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681199158; x=1683791158;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8GJkBu/6O7bpoxJpSxzQAmtDd9z9BrBcTp2/jbWSqLg=;
 b=ONrys1MQcuUa+gyjSddYDw/0ef8cr2MbRXSeoXGLMVtibaBja5whE6sSVgGWAVK/EM
 zJmY7FbvlT2+6CyulhXthb8c1nZ2Mbs6moQIVcQtfbUanq0yi/SLuWKSUIO8NiRxCj4O
 H/j/UYM/KtAogIIcG1nAT6+cmekS7jliJO0wKDgOYCfQZvzDyWlNEw02aDu7WsndtaBU
 Vuo6MVynWArAs8BXHY9gKF+j+0/fiWUvro80kG0bGyrZ3JIBPX7NuSRwfk7FBbKvg5yU
 9iaox21FvCX8P0MKd215a+nZhjhRXqCu5lXASGBW4Q/pMvWCcU9YiJccAliKgvNG2NgY
 LdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681199158; x=1683791158;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8GJkBu/6O7bpoxJpSxzQAmtDd9z9BrBcTp2/jbWSqLg=;
 b=OWd4cEjhu5bEkknadFkHz64BhlNPlHxRsgl8JnEqOZwLz4HjpHxWJbT3hzUrRs/qGI
 BzPf8y/APvShACZK24x9Dxkr1BUTJJgr20x8Xv4AxoQDDGqJdQSWcV9eSgI4jRR7zhOq
 cXVMMrkuma3LuhB1YDF+z7PJEaaQZQCYZ0hvpuyWd0VV9ebd5ZunJMmczrmCeGmL+iSZ
 SP59bbJW+4wnGRbjuS97/fNyvZ2/ICvHWhKjzgjQlcmq4g452xEmI8dJ7tHxQQEqsp9V
 /gVPzGU0MK/nJ2Fv3hvSjEQCjdCg3LZIvVwdE6J1XPlKdG8F4OydhPZwFNfCoCmMbCmB
 6eHA==
X-Gm-Message-State: AAQBX9dTaoZNoXt30qjjdjC8SOgzVGrsJRPSul82rXxqAoXGuNmpYmyo
 LwVj1xj9id+LSFdPi+nsK5R8Ug==
X-Google-Smtp-Source: AKy350bBvr6G4NN9rfEYbGer6u6n82uyRoaKQDPSezwGnZVwZF/ZEYw9oCSuzQJ5e7sKq7TMi088/w==
X-Received: by 2002:a05:6000:1081:b0:2f2:d852:c3e6 with SMTP id
 y1-20020a056000108100b002f2d852c3e6mr1336809wrw.3.1681199157880; 
 Tue, 11 Apr 2023 00:45:57 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a5d6a8a000000b002efdf3e5be0sm7736513wru.44.2023.04.11.00.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 00:45:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0218F1FFB7;
 Tue, 11 Apr 2023 08:45:57 +0100 (BST)
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230321152649.zae7edlfub76fyqq@orel>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, kvmarm@lists.linux.dev, qemu-arm@nongnu.org
Subject: Re: [kvm-unit-tests PATCH v10 0/7] MTTCG sanity tests for ARM
Date: Tue, 11 Apr 2023 08:43:49 +0100
In-reply-to: <20230321152649.zae7edlfub76fyqq@orel>
Message-ID: <87mt3erhe3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


Andrew Jones <andrew.jones@linux.dev> writes:

> On Tue, Mar 07, 2023 at 11:28:38AM +0000, Alex Benn=C3=A9e wrote:
>> I last had a go at getting these up-streamed at the end of 2021 so
>> its probably worth having another go. From the last iteration a
>> number of the groundwork patches did get merged:
>>=20
>>   Subject: [kvm-unit-tests PATCH v9 0/9] MTTCG sanity tests for ARM
>>   Date: Thu,  2 Dec 2021 11:53:43 +0000
>>   Message-Id: <20211202115352.951548-1-alex.bennee@linaro.org>
>>=20
>> So this leaves a minor gtags patch, adding the isaac RNG library which
>> would also be useful for other users, see:
>>=20
>>   Subject: [kvm-unit-tests PATCH v3 11/27] lib: Add random number genera=
tor
>>   Date: Tue, 22 Nov 2022 18:11:36 +0200
>>   Message-Id: <20221122161152.293072-12-mlevitsk@redhat.com>
>>=20
>> Otherwise there are a few minor checkpatch tweaks.
>>=20
>> I would still like to enable KVM unit tests inside QEMU as things like
>> the x86 APIC tests are probably a better fit for unit testing TCG
>> emulation than booting a whole OS with various APICs enabled.
>>=20
>> Alex Benn=C3=A9e (7):
>>   Makefile: add GNU global tags support
>>   add .gitpublish metadata
>>   lib: add isaac prng library from CCAN
>>   arm/tlbflush-code: TLB flush during code execution
>>   arm/locking-tests: add comprehensive locking test
>>   arm/barrier-litmus-tests: add simple mp and sal litmus tests
>>   arm/tcg-test: some basic TCG exercising tests
>>=20
>>  Makefile                  |   5 +-
>>  arm/Makefile.arm          |   2 +
>>  arm/Makefile.arm64        |   2 +
>>  arm/Makefile.common       |   6 +-
>>  lib/arm/asm/barrier.h     |  19 ++
>>  lib/arm64/asm/barrier.h   |  50 +++++
>>  lib/prng.h                |  83 +++++++
>>  lib/prng.c                | 163 ++++++++++++++
>>  arm/tcg-test-asm.S        | 171 +++++++++++++++
>>  arm/tcg-test-asm64.S      | 170 ++++++++++++++
>>  arm/barrier-litmus-test.c | 450 ++++++++++++++++++++++++++++++++++++++
>>  arm/locking-test.c        | 321 +++++++++++++++++++++++++++
>>  arm/spinlock-test.c       |  87 --------
>>  arm/tcg-test.c            | 340 ++++++++++++++++++++++++++++
>>  arm/tlbflush-code.c       | 209 ++++++++++++++++++
>>  arm/unittests.cfg         | 170 ++++++++++++++
>>  .gitignore                |   3 +
>>  .gitpublish               |  18 ++
>>  18 files changed, 2180 insertions(+), 89 deletions(-)
>>  create mode 100644 lib/prng.h
>>  create mode 100644 lib/prng.c
>>  create mode 100644 arm/tcg-test-asm.S
>>  create mode 100644 arm/tcg-test-asm64.S
>>  create mode 100644 arm/barrier-litmus-test.c
>>  create mode 100644 arm/locking-test.c
>>  delete mode 100644 arm/spinlock-test.c
>>  create mode 100644 arm/tcg-test.c
>>  create mode 100644 arm/tlbflush-code.c
>>  create mode 100644 .gitpublish
>>=20
>> --=20
>> 2.39.2
>>
>
> I don't see any problem with the series, but I didn't review it closely.
> I think it's unlikely we'll get reviewers, but, as the tests are
> nodefault, then that's probably OK. Can you make sure all tests have a
> "tcg" type prefix when they are TCG-only, like the last patch does for
> its tests? That will help filter them out when building all tests as
> standalone tests.

tcg-tests is the only test that explicitly targets TCG behaviour (in the
choice of loops and SMC). The other tests are architecture validation
tests which should just be easy passes on real silicon.

> Someday mkstandalone could maybe learn how to build
> a directory hierarchy using the group names, e.g.
>
>  tests/mttcg/tlb/all_other

So nodefault isn't enough for this?

>
> but I don't expect to have time for that myself anytime soon, so prefixes
> will likely have to do for now (or forever).
>
> Thanks,
> drew


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

