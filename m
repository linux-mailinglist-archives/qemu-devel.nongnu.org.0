Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658986D6638
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:56:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji5L-0001PV-5X; Tue, 04 Apr 2023 10:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji5D-0001DG-NM
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:56:30 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji5A-0003KN-UF
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:56:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id e18so33119770wra.9
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620183;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=obKEkwqIA/UnnZ7qcR4bdBjhT/6IB1/3ZLo8wtQ71b0=;
 b=ymxGALMqmeR3q85RJD29P/Fd/W4VOnPznkhxBCZAB0Z81aL79AcUy0nbR4+UxZRc/V
 NMeETudNfyggtu2xDFkpUuSfyTC7udWIXxny2EujN2Njo39E6MXkRxj7vkyWCQiV3s8M
 rH5S4wO8Dw1gVXZzwRvp3C04CfVpkX7/kGuRjtGTQ+0F8UkejvI5dQN8OOxlSK8COd4B
 vJSKGE3lsgASGVuv1rftPTBJvXqie6ug0mAtATb0x+AdQQGyR/NIS1GoJUD8eX6El0C7
 ShJOr7hlFHdM41X9ZDns+qlMEjFO7u48XngczegyOJS5ZQ0stpYGhF6GhfiCbFqdqFJV
 cNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620183;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=obKEkwqIA/UnnZ7qcR4bdBjhT/6IB1/3ZLo8wtQ71b0=;
 b=6YMS67+EymqWFgU+zxPcdKU0KcZk6I300BK8rD88VaDcxY38LMQup3jAOJUhdk3E+K
 6VGjYW442qNjl0hSkZp0kLgZSSm7OHyMBBN1TcnWeHtWRzPDFPlOwC/Z/TBDW/YORzQ0
 kcZ22pblSEwUYgMWMgQRMlqJRPGNP4Rrr+0yL5T2k1up9dnriIjgGRJxbX8HLLh490ZS
 4eC3xAu6/XntQjGid8hG1Y6P2ZhtNL6Y3cjZmelqwLwIfSsxSOyXZlK9n5KqPpcjr/b6
 id8LCr4eaNfydGqJr4cNBbxAv0yY9b8G83tLH0HWvyKDeTbee8S5/A/JN4yBEhl/o8ZS
 GKCQ==
X-Gm-Message-State: AAQBX9ez09snedbIvN5xCcl6lfSo22mSj4G8Y05wG09v1zZ37rKudARp
 QI5iTD1z+4BpRLR9V7gvOfquJg==
X-Google-Smtp-Source: AKy350ZtPqbSE0MQbkP1p/Uyy9dFn4+jmrWqAORR28S/M6WWKDeFMqwgtz2A/3AgNe6EHQhLPDOcOg==
X-Received: by 2002:adf:ef10:0:b0:2e4:abb1:3e8d with SMTP id
 e16-20020adfef10000000b002e4abb13e8dmr2114466wro.54.1680620183073; 
 Tue, 04 Apr 2023 07:56:23 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f16-20020adffcd0000000b002d5a8d8442asm12430275wrs.37.2023.04.04.07.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:56:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4943C1FFB7;
 Tue,  4 Apr 2023 15:56:22 +0100 (BST)
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
 <20230403134920.2132362-6-alex.bennee@linaro.org>
 <ZCwsvaxRzx4bzbXo@redhat.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Reinoud
 Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>, Warner Losh
 <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>, Philippe =?utf-8?Q?Mat?=
 =?utf-8?Q?hieu-Daud=C3=A9?=
 <philmd@linaro.org>, Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, Michael Tokarev
 <mjt@tls.msk.ru>, armbru@redhat.com
Subject: Re: [PATCH v2 05/11] qemu-options: finesse the recommendations
 around -blockdev
Date: Tue, 04 Apr 2023 15:55:34 +0100
In-reply-to: <ZCwsvaxRzx4bzbXo@redhat.com>
Message-ID: <87ttxvlmqx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Kevin Wolf <kwolf@redhat.com> writes:

> Am 03.04.2023 um 15:49 hat Alex Benn=C3=A9e geschrieben:
>> We are a bit premature in recommending -blockdev/-device as the best
>> way to configure block devices, especially in the common case.
>> Improve the language to hopefully make things clearer.
>>=20
>> Suggested-by: Michael Tokarev <mjt@tls.msk.ru>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Message-Id: <20230330101141.30199-5-alex.bennee@linaro.org>
>> ---
>>  qemu-options.hx | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 59bdf67a2c..9a69ed838e 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -1143,10 +1143,14 @@ have gone through several iterations as the feat=
ure set and complexity
>>  of the block layer have grown. Many online guides to QEMU often
>>  reference older and deprecated options, which can lead to confusion.
>>=20=20
>> -The recommended modern way to describe disks is to use a combination of
>> +The most explicit way to describe disks is to use a combination of
>>  ``-device`` to specify the hardware device and ``-blockdev`` to
>>  describe the backend. The device defines what the guest sees and the
>> -backend describes how QEMU handles the data.
>> +backend describes how QEMU handles the data. The ``-drive`` option
>> +combines the device and backend into a single command line options
>> +which is useful in the majority of cases. Older options like ``-hda``
>> +bake in a lot of assumptions from the days when QEMU was emulating a
>> +legacy PC, they are not recommended for modern configurations.
>
> Let's not make the use of -drive look more advisable than it really is.
> If you're writing a management tool/script and you're still using -drive
> today, you're doing it wrong.
>
> Maybe this is actually the point where we should just clearly define
> that -blockdev is the only supported stable API (like QMP), and that
> -drive etc. are convenient shortcuts for human users with no
> compatibility promise (like HMP).

OK I'll drop this patch from today's PR and await a better description
in due course.

>
> What stopped us from doing so is that there are certain boards that
> don't allow the user to configure the onboard devices, but that look at
> -drive. These wouldn't provide any stable API any more after this
> change. However, if this hasn't been solved in many years, maybe it's
> time to view it as the board's problem, and use this change to motivate
> them to implement ways to configure the devices. Or maybe some don't
> even want to bother with a stable API, who knows.
>
> Kevin


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

