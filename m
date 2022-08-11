Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119FC58FD69
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:32:02 +0200 (CEST)
Received: from localhost ([::1]:56142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM8I3-000143-05
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM8EC-0005yD-8K
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:28:02 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM8EA-0005Nw-Ln
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:27:59 -0400
Received: by mail-ej1-x636.google.com with SMTP id y13so33435373ejp.13
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=vEptXsSlasGUAyH8eK8XuR191iOvDXmqf6tzC9G0BUI=;
 b=ii97SSgtpBbfBEHtZ2VsGRX8CPbKNq3611oEAMf4GhBQI72br1XxTgYknZNVpis5KY
 4EEoSkpdf6SWP2aSwvptFDZT/uZ+YZylSGjdzwSpTDaVZzjsKev3UilO3n8cJfpUfD25
 xlNbihvJ7S9RbxXKwDdz7pBmmob7vUsMduDCsbZ84Jn7JL5Yar6cznJXGDRswEj/RkFz
 moLF4YAAhjYRcrPRzWs9sxUSJXF8s4m0+mjN0/0a2zksrz6zrHNN5b2YaV3/4apGzr8F
 WfB/NdKRZzoMHjqGWBwMn1fEt11wp7G5ysLUrZGFPUuCj3b2QuQLzoM5/GUAVBoNtMvy
 CZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=vEptXsSlasGUAyH8eK8XuR191iOvDXmqf6tzC9G0BUI=;
 b=FpQFWafTU4QBAbQl5weK7BSEhbv7fdo0DyhHuMpZAThL0F5t5zGjIoZOOLL+GY4zfg
 JZZGeEdBwZ4fdn4ArQl3pPOHnp+5F4+AWb8kw6NE+PtDywM5rK8VTF235jJTYcd7Lavx
 Hw5ZKXlKvKXXKnVwmuykTX7+Tye9r69pkudJpaSPxTzQ+PVfqXNG7QPZLEnFnwqdZXHk
 IC+kqlssqQdny/9w6gN+mOU8gkC3tnjjv5E5AIEpfX9HzJ9QYzXj99Iukfa9pxfPhjw7
 53TRM168zNZSGJikft8sgupECSpgSiGor5bgXMSuSVnLhiptJi/c11sUJCbpJ1EUP53D
 E5Iw==
X-Gm-Message-State: ACgBeo2w5XsFnUAqpfVqtPcrn21niY/AnAeu8RCjlQY7dFrI+FwAVoqR
 LhwLz23pwQrfs6yr0zSFdXPUIA==
X-Google-Smtp-Source: AA6agR6aDbtyigspwYrclKAG/uPrETPzm5cCyp0wpcAerVRz2th89mzLruTZU6YJOeZsnqk3oqK5vw==
X-Received: by 2002:a17:907:1c26:b0:730:960f:118 with SMTP id
 nc38-20020a1709071c2600b00730960f0118mr23441165ejc.650.1660224475680; 
 Thu, 11 Aug 2022 06:27:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 kv21-20020a17090778d500b0072b33e91f96sm3476707ejc.190.2022.08.11.06.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 06:27:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EF871FFB7;
 Thu, 11 Aug 2022 14:27:54 +0100 (BST)
References: <20220811114315.3065951-1-alex.bennee@linaro.org>
 <d5d5f7cf-83ef-ca3d-f192-31efc56d055f@kaod.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos
 Santos  Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: apply a band aid to aspeed-evb login
Date: Thu, 11 Aug 2022 14:27:40 +0100
In-reply-to: <d5d5f7cf-83ef-ca3d-f192-31efc56d055f@kaod.org>
Message-ID: <874jyikizp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 8/11/22 13:43, Alex Benn=C3=A9e wrote:
>> This is really a limitation of the underlying console code which
>> doesn't allow us to detect the login: and following "#" prompts
>> because it reads input line wise. By adding a small delay we ensure
>> that the login prompt has appeared so we don't accidentally spaff the
>> shell commands to a confused getty in the guest.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
>> Cc: John Snow <jsnow@redhat.com>
>
>
> May be you should also add the missing timeout setting ?

That's in another patch - I'll post the whole series now.
>
> Anyhow,
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Thanks,
>
> C.
>
>> ---
>>   tests/avocado/machine_aspeed.py | 2 ++
>>   1 file changed, 2 insertions(+)
>> diff --git a/tests/avocado/machine_aspeed.py
>> b/tests/avocado/machine_aspeed.py
>> index c54da0fd8f..65d38f4efa 100644
>> --- a/tests/avocado/machine_aspeed.py
>> +++ b/tests/avocado/machine_aspeed.py
>> @@ -101,7 +101,9 @@ def do_test_arm_aspeed_buidroot_start(self, image, c=
pu_id):
>>           self.wait_for_console_pattern('Starting kernel ...')
>>           self.wait_for_console_pattern('Booting Linux on physical CPU '=
 + cpu_id)
>>           self.wait_for_console_pattern('lease of 10.0.2.15')
>> +        # the line before login:
>>           self.wait_for_console_pattern('Aspeed EVB')
>> +        time.sleep(0.1)
>>           exec_command(self, 'root')
>>           time.sleep(0.1)
>>=20=20=20


--=20
Alex Benn=C3=A9e

