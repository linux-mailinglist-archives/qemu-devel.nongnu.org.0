Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EF44E708F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 11:07:51 +0100 (CET)
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXgrG-0001Dq-RT
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 06:07:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nXgne-0007rV-MM
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 06:04:06 -0400
Received: from [2a00:1450:4864:20::433] (port=44772
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nXgnc-0001dm-Rp
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 06:04:06 -0400
Received: by mail-wr1-x433.google.com with SMTP id b19so10116670wrh.11
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uf03P2QNRo1L3cdWjJlHAEcWGzO1FcwSuK2DhjQjEx4=;
 b=n92LeZz7OzQSxoE5v2fourXbsFyXOFcN1IvHakPoahFjTbls7I8h0fHuC7PsfE4NaA
 dQeQt888zAfH7TkUuOL9jXmgMh6njCYVPz2ZdTJMkNBqwmzX79dlEXrDLZIz0nLDDVp4
 ixbW65+aOI1K0vWrEKHgQfiDB9By5859vq53NAvoVO84nqqJX/VCiffslCVGcaRpLlUl
 iVbPrv+yd/6z8i7xfx/rZZ15VlGEND3LwjlcWYp3RLuzMl32b3+7FFyfp++St962ZHEd
 79RKhEwqTEfBauJXm8Qopw8M/1LeL3ijQAMgjEfaEGFo8u6w2FddWKUIv0805xsy75ji
 SH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uf03P2QNRo1L3cdWjJlHAEcWGzO1FcwSuK2DhjQjEx4=;
 b=ROBptBU+8LlFvNq895ypXQVPk9foWcDYiHHX9+cznmKgi7Tc8BZo0A2l7nVVFwcxnI
 VfFMz3P9bVhUDUSjYuSV1VqD98nRoyWwalG/xXcK7cGElAtIQwUA+qRMc1lVj80kTwav
 M6walna9Gr9hFDpb1iNHnL6cN3V6jcAPrUu11Prr8Z1xkJtS2/GVGty2CEsIEL93Zyw5
 bLJerNRgGiHFZycscuC4A/huTUs5Wupc/A6g+Y0QSrtFsSZ4Az2Vs3eRhcEjLhji06s7
 jzn63WDSUvZuzlZOEb2rV3/gDo1ohCwkLlRAuInqXEfhWgEbXofJPcl1wfIzSO95xx6+
 QCog==
X-Gm-Message-State: AOAM53129gXG6hJsCPN4ywO6oED9OoAd32oSOGyJzXFk5p9Vin7NeiIy
 +APRH6GJgslbeDuRrnkLOLo9Jg==
X-Google-Smtp-Source: ABdhPJwFyf80MgwhLO+2a7DriVXvzCUVNzCCN3wCNIfus3zTd3pKKAZCFK4o1z/+VEMLrXkX6RAFfw==
X-Received: by 2002:adf:e241:0:b0:203:f56e:51e3 with SMTP id
 bl1-20020adfe241000000b00203f56e51e3mr8302007wrb.473.1648202641629; 
 Fri, 25 Mar 2022 03:04:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m10-20020adfe94a000000b002059e530da1sm2086693wrn.1.2022.03.25.03.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 03:04:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DB7C1FFB7;
 Fri, 25 Mar 2022 10:03:59 +0000 (GMT)
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
 <20220324190854.156898-5-leandro.lupori@eldorado.org.br>
 <87k0cj2imn.fsf@linaro.org>
 <50ab5422-d294-dc8f-44bc-ece42473141d@eldorado.org.br>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [RFC PATCH 4/6] tests/tcg: add support for ppc64le softmmu tests
Date: Fri, 25 Mar 2022 09:50:25 +0000
In-reply-to: <50ab5422-d294-dc8f-44bc-ece42473141d@eldorado.org.br>
Message-ID: <87bkxu2vsg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Leandro Lupori <leandro.lupori@eldorado.org.br> writes:

> On 24/03/2022 17:34, Alex Benn=C3=A9e wrote:
>> Leandro Lupori <leandro.lupori@eldorado.org.br> writes:
>>=20
>>> Adding a new, "virtual" TCG test target, ppc64le-softmmu, seems to
>>> be the cleanest way to support both BE and LE tests for
>>> ppc64-softmmu.
>>>
>>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>>> ---
>>>   tests/Makefile.include                    |  7 ++++---
>>>   tests/tcg/configure.sh                    | 11 ++++++++++-
>>>   tests/tcg/ppc64/Makefile.softmmu-target   |  2 ++
>>>   tests/tcg/ppc64le/Makefile.softmmu-target |  7 +++++++

Don't forget to add new files to MAINTAINERS by the way ;-)

>>>   4 files changed, 23 insertions(+), 4 deletions(-)
>>>   create mode 100644 tests/tcg/ppc64le/Makefile.softmmu-target
>>>
>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>> index e7153c8e91..4001fedbc3 100644
>>> --- a/tests/Makefile.include
>>> +++ b/tests/Makefile.include
>>> @@ -40,9 +40,10 @@ SPEED =3D quick
>>>   TARGETS=3D$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-=
targets)))
>>>
>>>   # Per guest TCG tests
>>> -BUILD_TCG_TARGET_RULES=3D$(patsubst %,build-tcg-tests-%, $(TARGETS))
>>> -CLEAN_TCG_TARGET_RULES=3D$(patsubst %,clean-tcg-tests-%, $(TARGETS))
>>> -RUN_TCG_TARGET_RULES=3D$(patsubst %,run-tcg-tests-%, $(TARGETS))
>>> +TCG_TARGETS=3D$(patsubst tests/tcg/config-%.mak, %, $(wildcard tests/t=
cg/config-*.mak))
>>> +BUILD_TCG_TARGET_RULES=3D$(patsubst %,build-tcg-tests-%, $(TCG_TARGETS=
))
>>> +CLEAN_TCG_TARGET_RULES=3D$(patsubst %,clean-tcg-tests-%, $(TCG_TARGETS=
))
>>> +RUN_TCG_TARGET_RULES=3D$(patsubst %,run-tcg-tests-%, $(TCG_TARGETS))
>> I'm not following what is going on here. Are we creating a new
>> target
>> type? Is this just to avoid duplication in tests/tcg subdirs?
>>=20
> Yes, together with the change in test/tcg/configure.sh, a new
> ppc64le-softmmu target is created, in the context of TCG tests only.
> But it isn't just to avoid duplication in tests/tcg subdirs.
>
> Without a ppc64le-softmmu target, the tcg tests' makefiles will only
> include tests/tcg/ppc64/Makefile.softmmu-target file. They won't try
> to include tests/tcg/ppc64le/Makefile.softmmu-target, because there is
> no ppc64le-softmmu target.

So according to IRC this is because the ppc64-softmmu target can support
dynamically switching between BE/LE modes so there is only needs to be
one 64 bit ppc system binary.

> I've actually tried to do everything in
> tests/tcg/ppc64/Makefile.softmmu-target. But when it is included,
> everything is already setup to build for ppc64 (BE), such as CC,
> EXTRA_CFLAGS and other variables. So it seems that, to be able to also
> build and run the same tests for ppc64le, I would need to somehow
> change CC, EXTRA_CFLAGS, etc, to setup them for a ppc64le build and
> write another set of rules for the LE tests. Then I would also need to
> handle output file conflicts, to be able have both BE and LE binaries
> coexisting in the same ppc64-softmmu output directory.

There is another approach you can take which is to generate alternative
binaries from the same sources in the build. For example we build the
sha512 test with a couple of different compiler options and run with
slightly different QEMU_OPTS:

  sha512-vector: CFLAGS +=3D-mcpu=3Dpower10 -O3
  sha512-vector: sha512.c
          $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)

  run-sha512-vector: QEMU_OPTS+=3D-cpu POWER10
  run-plugin-sha512-vector-with-%: QEMU_OPTS+=3D-cpu POWER10

  PPC64LE_TESTS +=3D sha512-vector

So you could do something similar for le versions of the tests.

I'm ambivalent to which makes the best approach. I only worry the
"pseudo target" approach might break something else down the line.
However as long as the ppc maintainers are happy with the tests you can
have my:

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

for the check-tcg plumbing changes.

>
> So that's why I've added this new target, only for TCG tests, to avoid
> the issues above.
>
>>>
>>>   # Probe for the Docker Builds needed for each build
>>>   $(foreach PROBE_TARGET,$(TARGET_DIRS),                               \
>>> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
>>> index ed4b5ccb1f..a4ac7a4e44 100755
>>> --- a/tests/tcg/configure.sh
>>> +++ b/tests/tcg/configure.sh
>>> @@ -80,6 +80,10 @@ fi
>>>   : ${cross_as_tricore=3D"tricore-as"}
>>>   : ${cross_ld_tricore=3D"tricore-ld"}
>>>
>>> +# If target ppc64-softmmu is configured, also include the virtual test=
 target
>>> +# ppc64le-softmmu
>>> +target_list=3D`echo $target_list | sed 's/ppc64-softmmu/& ppc64le-soft=
mmu/'`
>>> +
>>>   for target in $target_list; do
>>>     arch=3D${target%%-*}
>>>
>>> @@ -237,7 +241,12 @@ for target in $target_list; do
>>>         ;;
>>>       *-softmmu)
>>>         echo "CONFIG_SOFTMMU=3Dy" >> $config_target_mak
>>> -      echo "QEMU=3D$PWD/qemu-system-$arch" >> $config_target_mak
>>> +      if test $arch =3D "ppc64le"; then
>>> +        sys_arch=3Dppc64
>>> +      else
>>> +        sys_arch=3D$arch
>>> +      fi
>>> +      echo "QEMU=3D$PWD/qemu-system-$sys_arch" >> $config_target_mak
>>>         ;;
>>>     esac
>>>
>>> diff --git a/tests/tcg/ppc64/Makefile.softmmu-target b/tests/tcg/ppc64/=
Makefile.softmmu-target
>>> index 8f9925ca5a..511b6322df 100644
>>> --- a/tests/tcg/ppc64/Makefile.softmmu-target
>>> +++ b/tests/tcg/ppc64/Makefile.softmmu-target
>>> @@ -2,6 +2,8 @@
>>>   # PowerPC64 system tests
>>>   #
>>>
>>> +BIG_ENDIAN ?=3D 1
>>> +
>>>   # For now, disable tests that are failing
>>>   DISABLED_TESTS :=3D memory
>>>   DISABLED_EXTRA_RUNS :=3D run-gdbstub-memory
>>> diff --git a/tests/tcg/ppc64le/Makefile.softmmu-target b/tests/tcg/ppc6=
4le/Makefile.softmmu-target
>>> new file mode 100644
>>> index 0000000000..d4162160ee
>>> --- /dev/null
>>> +++ b/tests/tcg/ppc64le/Makefile.softmmu-target
>>> @@ -0,0 +1,7 @@
>>> +#
>>> +# PowerPC64 LE system tests
>>> +#
>>> +
>>> +BIG_ENDIAN =3D 0
>>> +
>>> +include $(SRC_PATH)/tests/tcg/ppc64/Makefile.softmmu-target
>> --
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

