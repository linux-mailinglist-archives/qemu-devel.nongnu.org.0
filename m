Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3576724C8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 18:23:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIC8E-0007Mm-Gl; Wed, 18 Jan 2023 12:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIC7p-0007ME-AI
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 12:21:25 -0500
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIC7m-0007xY-0T
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 12:21:23 -0500
Received: by mail-oo1-xc31.google.com with SMTP id
 j10-20020a4aa64a000000b004f9b746ee29so1183209oom.0
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 09:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VuhYWrxzrG4RM3diXsbUYTSQUKCJGPr4Ife1w7aV/RM=;
 b=gofqJKh/QJz/thphZkAxmkKjE/jcySiQy94/TNbJbz71LtYsuoyi0P4w0QdcQ8Ehu1
 FVVuOgBxxj2RBL0DZ4yJ6aw5rxtbFDs8nvYJetQnizARRcrWjoAI504Phsjs4l4tZbJA
 idOTLRwwrYf3eR+SZ9rJ/NKYEiPpfoD3DO/ALtgcpKTGuuEGbBMlrlg2Hwqn0lh13qav
 Ahk5ka9wd9GnUMkJ2lzaiWHDGwPu88eQrGvvPQUcEIDi26RkRMFzoiguqIxq7buqAqKj
 4afiUVsk3W7zTrGMG2MpokE8qIaL0zVGNW2nHeo6Be1hmPYF5leSND/y9sSbn1x+i8IE
 VZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VuhYWrxzrG4RM3diXsbUYTSQUKCJGPr4Ife1w7aV/RM=;
 b=ibUzH6lEnNsu5HEWI0M3VMc0iI2mDOFbcagh8H/pwA4qBZckhT19WLOcqUfZ+jb7yw
 7aVe+dnltdUgn8FLyCKKspOzOEmRjtTQMCBTsfd1aOtsHNCTclECJXgLH7AjP6xRmpNg
 uSh8NDWKKQNzZx2sBBvJKM+zjxFV8hHcm7JC9xesOz1CfjEn/+GfcBItH3YkTPU7DW8e
 CpUQ0zYjigtVe+TNQD4BlVXFFQF7YlwMfWDv4BIGzhoLxOYCDc8q0fS2i/Y4/KSaCI7/
 OMxRZxyeuqU3lY236LfKo800+cau5m0E/o9Kk20MPJakSyw52K8GF7lB2w3fZDdXFC0P
 lrwA==
X-Gm-Message-State: AFqh2koPNT/8pH4QNYVRFVJ+ETuyrzYVRblaW9X3bzgPyMULCdSijfzd
 LQcW1vPCUq3QVqeScBb6ymkxPg==
X-Google-Smtp-Source: AMrXdXunui5crT6b/NJ8MSTe0ybqxYt8wyxffUUKuqzOXv9jmParZw7az5QR/1f2UqpNB86SOeWJ2w==
X-Received: by 2002:a4a:4f56:0:b0:49f:d0ed:be4c with SMTP id
 c83-20020a4a4f56000000b0049fd0edbe4cmr4111447oob.9.1674062480567; 
 Wed, 18 Jan 2023 09:21:20 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 bb9-20020a056820160900b0049be9c3c15dsm16734362oob.33.2023.01.18.09.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 09:21:20 -0800 (PST)
Message-ID: <005bad40-129c-7785-8fa3-c8a4eaee9da6@ventanamicro.com>
Date: Wed, 18 Jan 2023 14:21:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/3] avocado_qemu: add AVOCADO_DEFAULT_MACHINE
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Beraldo Leal <bleal@redhat.com>
References: <20230118124348.364771-1-dbarboza@ventanamicro.com>
 <20230118124348.364771-4-dbarboza@ventanamicro.com> <874jsndf2g.fsf@suse.de>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <874jsndf2g.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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



On 1/18/23 12:42, Fabiano Rosas wrote:
> Daniel Henrique Barboza <dbarboza@ventanamicro.com> writes:
>
>> Allow users to control which machine to use in tests where no particular
>> machine is specified. This is a good way to run tests in a machine
>> that's not the arch default, e.g. for qemu-system-x86_64 tests can be
>> run using a machine other than pc-i440fx.
>>
>> This env var has greater effect when used together with the recently
>> added AVOCADO_DEFAULT_ARCH, allowing full control of what the tests
>> should use if no default arch/machine is given. In this example, a
>> check-avocado run will use the RISC-V 'virt' machine if no default
>> arch/machine is set:
>>
>> AVOCADO_DEFAULT_ARCH=riscv64 AVOCADO_DEFAULT_MACHINE=virt make check-avocado
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   docs/devel/testing.rst                 | 8 +++++---
>>   tests/avocado/avocado_qemu/__init__.py | 3 +++
>>   2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
>> index 95d0a3e626..128b6ae964 100644
>> --- a/docs/devel/testing.rst
>> +++ b/docs/devel/testing.rst
>> @@ -1178,9 +1178,11 @@ The machine type that will be set to all QEMUMachine instances created
>>   by the test.
>>   
>>   The ``machine`` attribute will be set to the test parameter of the same
>> -name.  If one is not given explicitly, it will either be set to
>> -``None``, or, if the test is tagged with one (and only one)
>> -``:avocado: tags=machine:VALUE`` tag, it will be set to ``VALUE``.
>> +name.  If one is not given explicitly, an env variable
>> +AVOCADO_DEFAULT_MACHINE can be used as default value if set.  Otherwise
>> +it will either be set to ``None``, or, if the test is tagged with one
>> +(and only one) ``:avocado: tags=machine:VALUE`` tag, it will be set to
>> +``VALUE``.
>>   
>>   qemu_bin
>>   ''''''''
>> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
>> index bc42985cbb..75eaaa9265 100644
>> --- a/tests/avocado/avocado_qemu/__init__.py
>> +++ b/tests/avocado/avocado_qemu/__init__.py
>> @@ -282,6 +282,9 @@ def setUp(self):
>>           self.machine = self.params.get('machine',
>>                                          default=self._get_unique_tag_val('machine'))
>>   
> Would it work for you to replicate the AVOCADO_CMDLINE_TAGS behavior?
>
> In Makefile.include:
>
> ifdef AVOCADO_PARAMS
> 	AVOCADO_CMDLINE_PARAMS=$(addprefix -p , $(AVOCADO_PARAMS))
> endif
>
> make V=1 check-avocado AVOCADO_PARAMS=machine=foo AVOCADO_TESTS=../tests/avocado/migration.py
>
> Results in:
>
> ./qemu-system-x86_64 -display none -vga none ... -machine foo

This doesn't work as is (tested with no patches applied, only added AVOCADO_PARAMS in
Makefile.include).

At this moment it seems that there is no way of changing Avocado internal behavior
by using command line parameters/tags.


Thanks,


Daniel





