Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520056F5647
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:35:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9pq-0002nt-1B; Wed, 03 May 2023 06:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu9pj-0002hY-QH
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:35:40 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu9ph-0007eC-WD
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:35:39 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30639daee76so1249706f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683110136; x=1685702136;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3Bqajuwj+MyrNw46AGwBXETn4LJKbwzahDvuQ80Sjg=;
 b=yeYUaOmSCBgPHRiMV0SrTgJZNaivXshFf3y9jNEd+0R+dkD249tSg2rZW7ln5l41bz
 oNi83RkbcPO1G4hvXroY1ZKuU0mVaa/q+KnRoRVy3BPUVL2diwPLOr5MZ+FZ6yGkmdt2
 eTUK3dHjj5Vm2j8ADoi3/H8GNiQor6G/Y1tEGm32JNlwHNSgs0d8i8/QN1Ljr5XA8ayb
 bZ4QFZUhaiyzNCkjMWdo3yyIhgQfODThAvk6hEx6HFt5qJpIiFNNjV6EUOb07L0ogrR6
 EamZ3+H+oQMecNndlhDbmsa57rWtimtqGN6gTqPlp75I9/fBUnnxyPOcz/xyxFsyIBsI
 /ezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683110136; x=1685702136;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/3Bqajuwj+MyrNw46AGwBXETn4LJKbwzahDvuQ80Sjg=;
 b=L4varmGB8e0kOU9twOBi9+obXQPmqBS3uKel/ET4f3JXTNVnGZySfFzENsXv9hCWj5
 DXhiW4LnnoQa33a0dqwBOG/Ja2V7fKBkhbl3H5587pfLh3FX9GorJ3CJbehaSOYqSIHV
 ssWhD0Ht3+VKan6jT67hx6x0BTHZU6Ogu4cuM57W2lOqsKNjkL6dWd2IdB/zyZM7fqKH
 gsVaVPSSHIKXtbz9u0MSOzM2g1n4LuxzDfjZ/ekWj3o+h9thG0Tg+v6L1JCoi2BoGOr2
 Nb9hcumV/GebvxkvQkqaZLNs9P43AcE/sIEHN9cagGxhPiyM3PipQpjJwOpPKdIea848
 eRWw==
X-Gm-Message-State: AC+VfDzRp5XxBr5+wYGGoWuUslvHjNRNhYfPKBW6DRWt4wjxyjDtH6We
 DjtXvDmqCaB0IQ2DHlB5MnP8Pg==
X-Google-Smtp-Source: ACHHUZ5atLVMhKKoWEfaVn8wiRTUu3X9CGOAzh4WKCpXLYX/VH0HRzFd7niCxqfa5K/nWXvo3uYBBQ==
X-Received: by 2002:a05:6000:50f:b0:2fa:631a:9f38 with SMTP id
 a15-20020a056000050f00b002fa631a9f38mr14360300wrf.2.1683110136358; 
 Wed, 03 May 2023 03:35:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d4d8c000000b003063408dd62sm5391765wru.65.2023.05.03.03.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 03:35:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 87B471FFBA;
 Wed,  3 May 2023 11:35:35 +0100 (BST)
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-23-alex.bennee@linaro.org>
 <a4fe1cc0-aad3-c77e-5e05-b5e6e32d69bf@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Artyom
 Tarasenko <atar4qemu@gmail.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Helge
 Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Stefan
 Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Mark
 Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno
 <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 22/22] tests/qtest: skip bcm2835-test if no raspi3b model
Date: Wed, 03 May 2023 11:34:53 +0100
In-reply-to: <a4fe1cc0-aad3-c77e-5e05-b5e6e32d69bf@redhat.com>
Message-ID: <877ctpu2h4.fsf@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> On 03/05/2023 11.12, Alex Benn=C3=A9e wrote:
>> We can't assume the machine exists and should gracefully skip the test
>> if we haven't built the model. This is ostensibly fixed by
>> db2237c459 (tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI)
>> but I still hit it during my tests.
>
> The problem is likely that you build aarch64-softmmu with the minimal
> config, but still keep arm-softmmu around with the full config? Then
> CONFIG_RASPI will still be set at the meson.build level since it is
> taken from config-all-devices.mak here.
>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/qtest/bcm2835-dma-test.c | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>> diff --git a/tests/qtest/bcm2835-dma-test.c
>> b/tests/qtest/bcm2835-dma-test.c
>> index 8293d822b9..2e6245e9e2 100644
>> --- a/tests/qtest/bcm2835-dma-test.c
>> +++ b/tests/qtest/bcm2835-dma-test.c
>> @@ -107,12 +107,11 @@ static void bcm2835_dma_test_interrupts(void)
>>     int main(int argc, char **argv)
>>   {
>> -    int ret;
>>       g_test_init(&argc, &argv, NULL);
>> -    qtest_add_func("/bcm2835/dma/test_interrupts",
>> +    if (qtest_has_machine("raspi3b")) {
>> +        qtest_add_func("/bcm2835/dma/test_interrupts",
>>                      bcm2835_dma_test_interrupts);
>> -    qtest_start("-machine raspi3b");
>> -    ret =3D g_test_run();
>> -    qtest_end();
>
> Where did the qtest_end() go?

Yeah I dropped it because other tests seem to use the return
g_test_run() pattern. Maybe they are wrong?

>
> It's maybe cleaner if you move the qtest_start() and qtest_end() calls
> into the bcm2835_dma_test_interrupts() function instead.
>
>  Thomas
>
>
>> -    return ret;
>> +        qtest_start("-machine raspi3b");
>> +    }
>> +    return g_test_run();
>>   }


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

