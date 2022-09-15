Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2615B96B7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 10:56:17 +0200 (CEST)
Received: from localhost ([::1]:50392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYkfQ-0006lB-Jr
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 04:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkAo-00008t-KM
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:24:38 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:47041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkAm-0008U7-6l
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:24:37 -0400
Received: by mail-il1-x12f.google.com with SMTP id l6so9287653ilk.13
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=iW/1f8u+b5vzuIrtpaS2+Hra3wMyy72GLArGGQzM6A8=;
 b=elICd5A3LtD8GopOCvVEljg4pmss9yvYe5OhGsjV5p0475hA4mLtT9j+TzbYcL8VWw
 TIJZ4WmKbjLCXLbpLmvM32cmst5qCjxPD9YiEKijLaDZeGeC7swlQ0Qpve8YsUM4+GzI
 eJ0dBhdJ4i6eT+f0iXqurbBy4glg467tos+9jcTkeHOiKbzMi954Wd4/USq14T07glDy
 xpcGZg1/RYeWEHy3yDC4prpJO8btnXT03hysgZ3hR1WUNyrp/ky3uzAz/y+KO310Hn5m
 RiIe6Mxm9Q5J6yr+xzlOeN096zvKQxlk3qosDd9G7/YbzzG/H7wSvro/9z3FThxAhB27
 Xwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=iW/1f8u+b5vzuIrtpaS2+Hra3wMyy72GLArGGQzM6A8=;
 b=qhJGDheCiWj2jGRP9okA32E6HRymc7csQMoz/MoF+ULSnmCbhMWd5hsP+Cj1J3mLef
 unyXM0CSyBUstCOi1ZPw7lFvAI9BmOXfDqfrXmCMmvpRKaKQKv0FuZfV1PIKjMXzJqlt
 DEsvm2TtFNN6TQ8X5KXma9p4SzpR2EJXNuTqrljFLOBIE/jxf5DrY5B6UMerdStIpz4h
 fJjKaqZyHfizVDgspaY74dFxN0v+BdBzRPmF+keZZaPAxJw+HXTV1w+a1dQlOfKFM9fa
 BSyEbYAUV1VrUkj+AzaghHbQ6XMetODagJ/r5dScx8fZvDyoE7Ql9nwCQILSZXgIMQkq
 9ZXw==
X-Gm-Message-State: ACgBeo2r2V4R0hq928l9czwZZitYltpmo2MeVPlGvlcI2H1M1Rf6ULw9
 Y9sXgq8+YcikCyNA04gDJ3bAZA==
X-Google-Smtp-Source: AA6agR5/6rZV0Vwn5NOboZw/R8crnldkbxdft42ZCjW58XZ+SdO4B7nXcBAG5gx6dQaJyFi+w28mBw==
X-Received: by 2002:a05:6e02:158a:b0:2d3:f198:9f39 with SMTP id
 m10-20020a056e02158a00b002d3f1989f39mr17336397ilu.206.1663230274997; 
 Thu, 15 Sep 2022 01:24:34 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056638214c00b00356726330a4sm795509jaj.154.2022.09.15.01.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:24:34 -0700 (PDT)
Message-ID: <ab98f1e9-8d21-d0df-a7ef-9f562f89ff97@linaro.org>
Date: Thu, 15 Sep 2022 09:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 06/30] tests/avocado: split the AST2x00Machine classes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12f.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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

On 9/14/22 16:59, Alex Bennée wrote:
> The SDK tests take a lot longer to run and hence need a longer
> timeout. As they run well over the 60 second maximum for CI lets also
> disable them for CI as well.
> 
> I suspect they also suffer from the inability to detect the login
> prompt due to no newlines being processed.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20220826172128.353798-2-alex.bennee@linaro.org>
> ---
>   tests/avocado/machine_aspeed.py | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index 65d38f4efa..0f64eb636c 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -6,12 +6,14 @@
>   # later.  See the COPYING file in the top-level directory.
>   
>   import time
> +import os
>   
>   from avocado_qemu import QemuSystemTest
>   from avocado_qemu import wait_for_console_pattern
>   from avocado_qemu import exec_command
>   from avocado_qemu import exec_command_and_wait_for_pattern
>   from avocado.utils import archive
> +from avocado import skipIf
>   
>   
>   class AST1030Machine(QemuSystemTest):
> @@ -176,6 +178,20 @@ def test_arm_ast2600_evb_builroot(self):
>           self.do_test_arm_aspeed_buidroot_poweroff()
>   
>   
> +class AST2x00MachineSDK(QemuSystemTest):
> +
> +    # FIXME: Although these tests boot a whole distro they are still
> +    # slower than comparable machine models. There may be some
> +    # optimisations which bring down the runtime. In the meantime they
> +    # have generous timeouts and are disable for CI which aims for all
> +    # tests to run in less than 60 seconds.
> +    timeout = 240
> +
> +    def wait_for_console_pattern(self, success_message, vm=None):
> +        wait_for_console_pattern(self, success_message,
> +                                 failure_message='Kernel panic - not syncing',
> +                                 vm=vm)

Accidental patch squash?

But for the timeout+skipif part,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> +
>       def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
>           self.vm.set_console()
>           self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
> @@ -187,6 +203,7 @@ def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
>           self.wait_for_console_pattern('Starting kernel ...')
>           self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
>   
> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>       def test_arm_ast2500_evb_sdk(self):
>           """
>           :avocado: tags=arch:arm
> @@ -204,6 +221,7 @@ def test_arm_ast2500_evb_sdk(self):
>               self.workdir + '/ast2500-default/image-bmc', '0x0')
>           self.wait_for_console_pattern('ast2500-default login:')
>   
> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>       def test_arm_ast2600_evb_sdk(self):
>           """
>           :avocado: tags=arch:arm


