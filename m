Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A82D5BED33
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:56:04 +0200 (CEST)
Received: from localhost ([::1]:47398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaiPb-0002zi-A9
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oaeri-00060y-0Q
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:08:50 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oaerf-00051m-QG
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:08:49 -0400
Received: by mail-ej1-x62e.google.com with SMTP id u9so6938793ejy.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=n6MJTIDV0fPYN1WqP2v21NkodPjy/QccDPgWIDau5zc=;
 b=O3KodmbLuGMn/+G2jND/4OIW8NaOog43iJoQ7W4WQx/745X5udrED9m3jVttJRoG3u
 qrMUz8XI4LyzQhbvOtugtWM//QmrQAkmiNu0pjLUQRkflaBPR+6pFjVcv138KknhbibL
 kzFMJhzfFWa8c2bTEJYr1vGaGKn4Kno7bm2zlqveCKT/5xdHjcWxV2JPzlmVU9ADe2iP
 GVXrhwVQEzC7cT8+xpXbDUq9wqa/FPmyg3pJGBReopiGBvozmIUcxtfBuz9nmUinWrmZ
 HAC344RxmlfgRDuwTBaav5y8BBhmuhq+8ft36raRark1qF3XqqAVN5RWiAcD7pZTzH/s
 EseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=n6MJTIDV0fPYN1WqP2v21NkodPjy/QccDPgWIDau5zc=;
 b=y2O096Gb00ehR4ql+9IPVaTmJ+X5XDdWHlq1u7syeB+Uh+4gAlNhwVAf6RElyZSKzp
 t5EgnmdAjGN7QOtlvQ9TEZ/wYWeMW87X7aiIMMqeqgC0p2aE0WRzpwsNMhYjtKFht06I
 BnOAm7/+tuqOqS72vrENWHaruYbrfaV0iufEDPc5f1lKQYevY+Cnh3tvKgpTpu9LPYKj
 3ujbZMvtgOda2sOcP2K/oo/AF/NnU9QTBKp1+bsqjmEsGI1CLPWaW60qcykxiLn1fXwB
 6B3A+OTipjrskAbcwm1XDFNb6AN5kIv+ZUZCgqXJsOcuMSrF0aYNpDs9o/00SZwrdCG7
 2oRA==
X-Gm-Message-State: ACrzQf0H9PWaDZykfeCqcMZ2WXEv63nuFtm6MRUsgb7vTVGFanIf2h8d
 ka4ZE1XrZcXVBsBo/HFZgKso6g==
X-Google-Smtp-Source: AMsMyM5pdUu8tpcExA0N9u1wA5u0lDTM6wFUIoVfqzFY0q1GCgtvSVEwVfMz/JYj/keVazWx4naNiA==
X-Received: by 2002:a17:907:2bcf:b0:772:4b8e:6b29 with SMTP id
 gv15-20020a1709072bcf00b007724b8e6b29mr17072534ejc.412.1663686526352; 
 Tue, 20 Sep 2022 08:08:46 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a0564021f8600b0045081dc93dfsm162978edc.78.2022.09.20.08.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 08:08:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E8A01FFB7;
 Tue, 20 Sep 2022 16:08:45 +0100 (BST)
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-7-alex.bennee@linaro.org>
 <ab98f1e9-8d21-d0df-a7ef-9f562f89ff97@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal
 <bleal@redhat.com>
Subject: Re: [PATCH v2 06/30] tests/avocado: split the AST2x00Machine classes
Date: Tue, 20 Sep 2022 16:07:54 +0100
In-reply-to: <ab98f1e9-8d21-d0df-a7ef-9f562f89ff97@linaro.org>
Message-ID: <87tu5284n6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 9/14/22 16:59, Alex Benn=C3=A9e wrote:
>> The SDK tests take a lot longer to run and hence need a longer
>> timeout. As they run well over the 60 second maximum for CI lets also
>> disable them for CI as well.
>> I suspect they also suffer from the inability to detect the login
>> prompt due to no newlines being processed.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Message-Id: <20220826172128.353798-2-alex.bennee@linaro.org>
>> ---
>>   tests/avocado/machine_aspeed.py | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>> diff --git a/tests/avocado/machine_aspeed.py
>> b/tests/avocado/machine_aspeed.py
>> index 65d38f4efa..0f64eb636c 100644
>> --- a/tests/avocado/machine_aspeed.py
>> +++ b/tests/avocado/machine_aspeed.py
>> @@ -6,12 +6,14 @@
>>   # later.  See the COPYING file in the top-level directory.
>>     import time
>> +import os
>>     from avocado_qemu import QemuSystemTest
>>   from avocado_qemu import wait_for_console_pattern
>>   from avocado_qemu import exec_command
>>   from avocado_qemu import exec_command_and_wait_for_pattern
>>   from avocado.utils import archive
>> +from avocado import skipIf
>>       class AST1030Machine(QemuSystemTest):
>> @@ -176,6 +178,20 @@ def test_arm_ast2600_evb_builroot(self):
>>           self.do_test_arm_aspeed_buidroot_poweroff()
>>     +class AST2x00MachineSDK(QemuSystemTest):
>> +
>> +    # FIXME: Although these tests boot a whole distro they are still
>> +    # slower than comparable machine models. There may be some
>> +    # optimisations which bring down the runtime. In the meantime they
>> +    # have generous timeouts and are disable for CI which aims for all
>> +    # tests to run in less than 60 seconds.
>> +    timeout =3D 240
>> +
>> +    def wait_for_console_pattern(self, success_message, vm=3DNone):
>> +        wait_for_console_pattern(self, success_message,
>> +                                 failure_message=3D'Kernel panic - not =
syncing',
>> +                                 vm=3Dvm)
>
> Accidental patch squash?

No - I needed to have a concrete wait_for_console_pattern - although
looking at it I wonder if there is an implicit super() in there and if I
should make it explicit?

>
> But for the timeout+skipif part,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>
>> +
>>       def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
>>           self.vm.set_console()
>>           self.vm.add_args('-drive', 'file=3D' + image + ',if=3Dmtd,form=
at=3Draw',
>> @@ -187,6 +203,7 @@ def do_test_arm_aspeed_sdk_start(self, image, cpu_id=
):
>>           self.wait_for_console_pattern('Starting kernel ...')
>>           self.wait_for_console_pattern('Booting Linux on physical CPU '=
 + cpu_id)
>>   +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>>       def test_arm_ast2500_evb_sdk(self):
>>           """
>>           :avocado: tags=3Darch:arm
>> @@ -204,6 +221,7 @@ def test_arm_ast2500_evb_sdk(self):
>>               self.workdir + '/ast2500-default/image-bmc', '0x0')
>>           self.wait_for_console_pattern('ast2500-default login:')
>>   +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>>       def test_arm_ast2600_evb_sdk(self):
>>           """
>>           :avocado: tags=3Darch:arm


--=20
Alex Benn=C3=A9e

