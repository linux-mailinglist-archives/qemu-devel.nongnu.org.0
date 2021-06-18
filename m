Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D52F3AD08F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:36:01 +0200 (CEST)
Received: from localhost ([::1]:53876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luHTL-0006Lt-Um
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1luHRy-00058U-0q
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:34:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1luHRv-0000tO-NN
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:34:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i94so11408342wri.4
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 09:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TinbHrBnfgJNsQTggV/8Mxf/hrQishZppw2+KT3ruQQ=;
 b=gDrwjJl+lAR7gxFYOP+E4aCNzHv2pgz0m9g0YmhwYI2tk3/spTIEnShsoaPIt7HreP
 M4yxQeoNeaLuRafE+hRZcRKLriJPVOsFdJEYgoi9fZMRs1w70YfqD/wSanFsyCxot7xW
 Um19LxR77M9Ra5FR36uGzM7MRZB3XELo+hgotKXzfClOr+glKpRxFq/P2j6Vuv7s/Zag
 W8FVVuoeF+xnh94ZDseYbDuKoNOAnnC4i5SRAAt5iqshMohGdcrEAKvVrJseFlb/+I4w
 9NsSemSfNkqBK6zwrwIGrpOKKnDZMm5lTA5DcLXFUTnsuYmYj4eVBduMHLspVja7sEp+
 H0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TinbHrBnfgJNsQTggV/8Mxf/hrQishZppw2+KT3ruQQ=;
 b=PDdS143YIEcGdfZkvPRau7CEZjT4WwfgErmLThc2sm4Gz9vvv0OWuUDj67fAX+Rydw
 MPEdCk8ZrkFkqD3sBHfIIvbMtC+7S7a4Dlb5s296fFoCv4Wt6WbAFqf83n9f1HnrY5dE
 bPwHAsU6N9VTeB4/cSNuybkBvzaVg1k6tXsIPl0NEMyOU9/8WfYDb3XLk9nXUdQgzdb1
 VTZsMqcIZE5f/tWPoFPdHonsZ7Xjzy6K7OT2lMQrYhQZkjtM8NQO0asTpgYE8Qb1EWg5
 9s8WImzVa5M1M3V0ueA6BIuBDwHh7YpCybkVAKb7evUpy2dIXBePNxhdqC4jU3U9TfNz
 gBKA==
X-Gm-Message-State: AOAM532+ItXTM+EoaI+fqMzsJlpVM7tSlfT+MvqCXFBGKMUB1xBXNJQ8
 lw5+METMqfLB0SG6prrzWAtanQ==
X-Google-Smtp-Source: ABdhPJx4ZHPzCi3gx92h7FK2LIldXV+eA2ex6t1LSOQIll94wQsOy07VXwntFj6BZZqUAIUzEWfLiA==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr13082159wrb.289.1624034069958; 
 Fri, 18 Jun 2021 09:34:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm11339741wmm.33.2021.06.18.09.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 09:34:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 463901FF7E;
 Fri, 18 Jun 2021 17:34:28 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-94-alex.bennee@linaro.org>
 <56411bc8-ffdf-babb-fc72-63bfb7db5df1@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v16 93/99] meson: Introduce target-specific Kconfig
Date: Fri, 18 Jun 2021 17:31:34 +0100
In-reply-to: <56411bc8-ffdf-babb-fc72-63bfb7db5df1@linaro.org>
Message-ID: <878s37dtd7.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Thomas Huth <thuth@redhat.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz <groug@kaod.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Paolo Bonzini <bonzini@gnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>,
 Philippe =?utf-8?Q?Mathieu?= =?utf-8?Q?-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/4/21 8:53 AM, Alex Benn=C3=A9e wrote:
>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Add a target-specific Kconfig.
>> Target foo now has CONFIG_FOO defined.
>> Two architecture have a particularity, ARM and MIPS:
>> their 64-bit version include the 32-bit subset.
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
>> ---
>>   meson.build               |  3 ++-
>>   Kconfig                   |  1 +
>>   target/Kconfig            | 23 +++++++++++++++++++++++
>>   target/alpha/Kconfig      |  2 ++
>>   target/arm/Kconfig        |  6 ++++++
>>   target/avr/Kconfig        |  2 ++
>>   target/cris/Kconfig       |  2 ++
>>   target/hppa/Kconfig       |  2 ++
>>   target/i386/Kconfig       |  5 +++++
>>   target/lm32/Kconfig       |  2 ++
>>   target/m68k/Kconfig       |  2 ++
>>   target/microblaze/Kconfig |  2 ++
>>   target/mips/Kconfig       |  6 ++++++
>>   target/moxie/Kconfig      |  2 ++
>>   target/nios2/Kconfig      |  2 ++
>>   target/openrisc/Kconfig   |  2 ++
>>   target/ppc/Kconfig        |  5 +++++
>>   target/riscv/Kconfig      |  5 +++++
>>   target/rx/Kconfig         |  2 ++
>>   target/s390x/Kconfig      |  2 ++
>>   target/sh4/Kconfig        |  2 ++
>>   target/sparc/Kconfig      |  5 +++++
>>   target/tilegx/Kconfig     |  2 ++
>>   target/tricore/Kconfig    |  2 ++
>>   target/unicore32/Kconfig  |  2 ++
>>   target/xtensa/Kconfig     |  2 ++
>>   26 files changed, 92 insertions(+), 1 deletion(-)
>>   create mode 100644 target/Kconfig
>>   create mode 100644 target/alpha/Kconfig
>>   create mode 100644 target/arm/Kconfig
>>   create mode 100644 target/avr/Kconfig
>>   create mode 100644 target/cris/Kconfig
>>   create mode 100644 target/hppa/Kconfig
>>   create mode 100644 target/i386/Kconfig
>>   create mode 100644 target/lm32/Kconfig
>>   create mode 100644 target/m68k/Kconfig
>>   create mode 100644 target/microblaze/Kconfig
>>   create mode 100644 target/mips/Kconfig
>>   create mode 100644 target/moxie/Kconfig
>>   create mode 100644 target/nios2/Kconfig
>>   create mode 100644 target/openrisc/Kconfig
>>   create mode 100644 target/ppc/Kconfig
>>   create mode 100644 target/riscv/Kconfig
>>   create mode 100644 target/rx/Kconfig
>>   create mode 100644 target/s390x/Kconfig
>>   create mode 100644 target/sh4/Kconfig
>>   create mode 100644 target/sparc/Kconfig
>>   create mode 100644 target/tilegx/Kconfig
>>   create mode 100644 target/tricore/Kconfig
>>   create mode 100644 target/unicore32/Kconfig
>>   create mode 100644 target/xtensa/Kconfig
>
> I guess you haven't rebased since unicore, moxie et al were removed?

Ahh it happily rebased them without realising their superfluousness.

>
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1359,7 +1359,8 @@ foreach target : target_dirs
>>         command: [minikconf,
>>                   get_option('default_devices') ? '--defconfig' : '--all=
noconfig',
>>                   config_devices_mak, '@DEPFILE@', '@INPUT@',
>> -                host_kconfig, accel_kconfig])
>> +                host_kconfig, accel_kconfig,
>> +                'CONFIG_' + config_target['TARGET_ARCH'].to_upper() + '=
=3Dy'])
>
> I can understand this,
>
>>         config_devices_data =3D configuration_data()
>>       config_devices =3D keyval.load(config_devices_mak)
>> diff --git a/Kconfig b/Kconfig
>> index d52ebd839b..fb6a24a2de 100644
>> --- a/Kconfig
>> +++ b/Kconfig
>> @@ -1,5 +1,6 @@
>>   source Kconfig.host
>>   source backends/Kconfig
>>   source accel/Kconfig
>> +source target/Kconfig
>>   source hw/Kconfig
>>   source semihosting/Kconfig
>> diff --git a/target/Kconfig b/target/Kconfig
>> new file mode 100644
>> index 0000000000..a6f719f223
>> --- /dev/null
>> +++ b/target/Kconfig
>> @@ -0,0 +1,23 @@
>> +source alpha/Kconfig
>> +source arm/Kconfig
>> +source avr/Kconfig
>> +source cris/Kconfig
>> +source hppa/Kconfig
>> +source i386/Kconfig
>> +source lm32/Kconfig
>> +source m68k/Kconfig
>> +source microblaze/Kconfig
>> +source mips/Kconfig
>> +source moxie/Kconfig
>> +source nios2/Kconfig
>> +source openrisc/Kconfig
>> +source ppc/Kconfig
>> +source riscv/Kconfig
>> +source rx/Kconfig
>> +source s390x/Kconfig
>> +source sh4/Kconfig
>> +source sparc/Kconfig
>> +source tilegx/Kconfig
>> +source tricore/Kconfig
>> +source unicore32/Kconfig
>> +source xtensa/Kconfig
>> diff --git a/target/alpha/Kconfig b/target/alpha/Kconfig
>> new file mode 100644
>> index 0000000000..267222c05b
>> --- /dev/null
>> +++ b/target/alpha/Kconfig
>> @@ -0,0 +1,2 @@
>> +config ALPHA
>> +    bool
>
> But not these.  I guess the whole Kconfig thing is processed
> unconditionally, and there must be some definition?

Pretty much - otherwise you get the Kconfig generator complaining:

  Configuring aarch64-softmmu-config-target.h using configuration
  Configuring aarch64-softmmu-config-devices.mak with command

  ../../meson.build:1372:4: ERROR: Running configure command failed.

  undefined symbol AARCH64
  Traceback (most recent call last):
    File "/home/alex/lsrc/qemu.git/scripts/minikconf.py", line 703, in <mod=
ule>
      config =3D data.compute_config()
    File "/home/alex/lsrc/qemu.git/scripts/minikconf.py", line 222, in comp=
ute_config
      raise KconfigDataError("there were undefined symbols")
  __main__.KconfigDataError: there were undefined symbols


  A full log can be found at /home/alex/lsrc/qemu.git/builds/arm.all/meson-=
logs/meson-log.txt
  ninja: error: rebuilding 'build.ninja': subcommand failed
  FAILED: build.ninja=20
  /usr/bin/python3 /home/alex/lsrc/qemu.git/meson/meson.py --internal regen=
erate /home/alex/lsrc/qemu.git /home/alex/lsrc/qemu.git/builds/arm.all --ba=
ckend ninja
  make: *** [Makefile:154: run-ninja] Error 1

I guess we can tweak minikconf to accept the symbol? Paolo?

--=20
Alex Benn=C3=A9e

