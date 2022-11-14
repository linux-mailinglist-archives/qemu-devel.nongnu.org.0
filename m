Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E158F628EDF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:05:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouik8-0004wY-JQ; Mon, 14 Nov 2022 18:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouiew-0004Q9-He
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:35 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oucJk-0007c4-QV
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 11:28:18 -0500
Received: by mail-pl1-x634.google.com with SMTP id p21so10508856plr.7
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 08:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DsTTNMx2DGzAR/oRRNHspqQtmy4mSbL6HshZ8XxhJQI=;
 b=lHEeucxxucCH1HsZQfCOBwdR395kmcfj5YjmghbPQVSgODVHPizyzjK0xhPH+V5BP5
 dfp3e3fGWwsuSUgNT4ZfyvJkhKyelIKzCBT0pSeosvIrkgAF3WYG8RkmqYitczn2XGnz
 VRxDuNqeCOfbRMsgEVy8NQMUCE5cdfHMRylCSbA2vdio22e3h3GYxzOcgLVPQKbBJY0U
 tB3tXSv8XY337e0bokBEK56+jaF6xCndHnfixvM28//oeFklYp+1F3qtvTAYcb7HR/wU
 0zx+W3nglxVDqp+6kvktyGcTxpiTYY9APsiN3R9SOif2xDPAFO5doxX/KqPNWcyLQ19v
 uxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DsTTNMx2DGzAR/oRRNHspqQtmy4mSbL6HshZ8XxhJQI=;
 b=7wt8HuG8dWeYv9UxJZD8XIp+TgrLzqsJuQkjBgyxRU9pW1ofqVEgEEWXOrWvCE0QRo
 0FdPz4QjD4zyGQQFzw57QjRcqYL0gjchOl9j6TEHF2KjRkDH14GAFedx6R73S62iSOTW
 oe6yfpXem6de91yAyHeDG0Y8h8yA+w8Pr2bvqYIScYAELfk8I/ouLhc9mOkPgsyNAmOh
 9ID9OHA2wpzeJ+IfVeoY3oMQYzh7ICPYeoXkr8KwtS5uxlNlfyP2Ho7u9JHog3aClTym
 sjHe6v27YXDC1/o862pKuPcJJKXU2yDqZ5GCy+1+0Gyn+muO5n3CbXcxmISP/hPZAuvQ
 zEEw==
X-Gm-Message-State: ANoB5pkmzP7sh3w7vf1OZ20NCsFVussAJPMxohPQ1Haf7px4PWr66DEh
 DQMQop4xZ4r10XxOFfFM/iHMUTK+NF3sTMZSeEEy9A==
X-Google-Smtp-Source: AA0mqf6ThdC7BsredSWrhMaBUZLJp21zRZx9lynFWsTSUJWVswWBV6VaNcxE4AjuW2OM9bJO/ZrPecwcu6cbVLVxslE=
X-Received: by 2002:a17:902:cf03:b0:186:9295:2012 with SMTP id
 i3-20020a170902cf0300b0018692952012mr133547plg.19.1668443295020; Mon, 14 Nov
 2022 08:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
 <20221111145529.4020801-3-alex.bennee@linaro.org>
In-Reply-To: <20221111145529.4020801-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Nov 2022 16:28:03 +0000
Message-ID: <CAFEAcA_dv=iDyi8ubMsP9dEvP=71x3ns8ykT3gDnqqr8FS0dqw@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] tests/avocado: improve behaviour waiting for
 login prompts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com, 
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com, 
 stefanha@redhat.com, crosa@redhat.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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

On Fri, 11 Nov 2022 at 14:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This attempts to deal with the problem of login prompts not being
> guaranteed to be terminated with a newline. The solution to this is to
> peek at the incoming data looking to see if we see an up-coming match
> before we fall back to the old readline() logic. The reason to mostly
> rely on readline is because I am occasionally seeing the peek stalling
> despite data being there.
>
> This seems kinda hacky and gross so I'm open to alternative approaches
> and cleaner python code.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

With this patch, the evb_sdk test fails:

Fetching asset from
./build/arm-clang/tests/avocado/machine_aspeed.py:AST2x00MachineSDK.test_ar=
m_ast2500_evb_sdk
JOB ID     : 542e050c4f7e1ddd6d5cdd350e4c26e1bdfcdee4
JOB LOG    : /home/petmay01/avocado/job-results/job-2022-11-14T16.21-542e05=
0/job.log
 (1/1) ./build/arm-clang/tests/avocado/machine_aspeed.py:AST2x00MachineSDK.=
test_arm_ast2500_evb_sdk:
ERROR: log() missing 1 required positional argument: 'msg' (82.57 s)
RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
| CANCEL 0
JOB TIME   : 84.09 s

The avocado log reports a traceback where Python has thrown a
UnicodeDecodeError, and then subsequently an attempted debug
message in the error-handling path has a syntax error
("log() missing 1 required positional argument"):

2022-11-14 16:22:47,952 __init__         L0240 DEBUG| Stopping Host
logger for ttyVUART0...
2022-11-14 16:22:48,240 __init__         L0240 DEBUG| Starting Wait
for /xyz/ope=E2=80=A6control/host0/boot/one_time...
2022-11-14 16:22:48,570 stacktrace       L0039 ERROR|
2022-11-14 16:22:48,570 stacktrace       L0041 ERROR| Reproduced
traceback from: /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm
-clang/tests/venv/lib/python3.8/site-packages/avocado/core/test.py:770
2022-11-14 16:22:48,572 stacktrace       L0045 ERROR| Traceback (most
recent call last):
2022-11-14 16:22:48,572 stacktrace       L0045 ERROR|   File
"/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/avocad
o/avocado_qemu/__init__.py", line 149, in _peek_ahead
2022-11-14 16:22:48,572 stacktrace       L0045 ERROR|     peek_ahead =3D
console.peek(min_match).decode()
2022-11-14 16:22:48,572 stacktrace       L0045 ERROR|
UnicodeDecodeError: 'utf-8' codec can't decode bytes in position
44-45: unexpec
ted end of data
2022-11-14 16:22:48,572 stacktrace       L0045 ERROR|
2022-11-14 16:22:48,572 stacktrace       L0045 ERROR| During handling
of the above exception, another exception occurred:
2022-11-14 16:22:48,572 stacktrace       L0045 ERROR|
2022-11-14 16:22:48,572 stacktrace       L0045 ERROR| Traceback (most
recent call last):
2022-11-14 16:22:48,572 stacktrace       L0045 ERROR|   File
"/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/venv/l
ib/python3.8/site-packages/avocado/core/decorators.py", line 90, in wrapper
2022-11-14 16:22:48,572 stacktrace       L0045 ERROR|     return
function(obj, *args, **kwargs)
2022-11-14 16:22:48,572 stacktrace       L0045 ERROR|   File
"/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/avocad
o/machine_aspeed.py", line 225, in test_arm_ast2500_evb_sdk
2022-11-14 16:22:48,572 stacktrace       L0045 ERROR|
self.wait_for_console_pattern('ast2500-default login:')
2022-11-14 16:22:48,573 stacktrace       L0045 ERROR|   File
"/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/avocad
o/machine_aspeed.py", line 193, in wait_for_console_pattern
2022-11-14 16:22:48,573 stacktrace       L0045 ERROR|
wait_for_console_pattern(self, success_message,
2022-11-14 16:22:48,573 stacktrace       L0045 ERROR|   File
"/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/avocad
o/avocado_qemu/__init__.py", line 286, in wait_for_console_pattern
2022-11-14 16:22:48,573 stacktrace       L0045 ERROR|
_console_interaction(test, success_message, failure_message, None,
vm=3Dvm)
2022-11-14 16:22:48,573 stacktrace       L0045 ERROR|   File
"/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/avocad
o/avocado_qemu/__init__.py", line 226, in _console_interaction
2022-11-14 16:22:48,573 stacktrace       L0045 ERROR|     msg =3D
_peek_ahead(console, min_match, success_message)
2022-11-14 16:22:48,573 stacktrace       L0045 ERROR|   File
"/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/avocad
o/avocado_qemu/__init__.py", line 180, in _peek_ahead
2022-11-14 16:22:48,573 stacktrace       L0045 ERROR|
console_logger.log("error in decode of peek")
2022-11-14 16:22:48,573 stacktrace       L0045 ERROR| TypeError: log()
missing 1 required positional argument: 'msg'
2022-11-14 16:22:48,573 stacktrace       L0046 ERROR|
2022-11-14 16:22:48,573 test             L0775 DEBUG| Local variables:
2022-11-14 16:22:48,605 test             L0778 DEBUG|  -> obj <class
'machine_aspeed.AST2x00MachineSDK'>:
1-./build/arm-clang/tests/avocado/machine_aspeed.py:AST2x00MachineSDK.test_=
arm_ast2500_evb_sdk
2022-11-14 16:22:48,605 test             L0778 DEBUG|  -> args <class
'tuple'>: ()
2022-11-14 16:22:48,605 test             L0778 DEBUG|  -> kwargs
<class 'dict'>: {}
2022-11-14 16:22:48,605 test             L0778 DEBUG|  -> condition
<class 'NoneType'>: None
2022-11-14 16:22:48,605 test             L0778 DEBUG|  -> function
<class 'function'>: <function
AST2x00MachineSDK.test_arm_ast2500_evb_sdk at 0x7f05ee0678b0>
2022-11-14 16:22:48,606 test             L0778 DEBUG|  -> message
<class 'str'>: Running on GitLab
2022-11-14 16:22:48,606 test             L0778 DEBUG|  -> negate
<class 'bool'>: False

thanks
-- PMM

