Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BB268DCA1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:12:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPdL-0005cf-E4; Tue, 07 Feb 2023 10:11:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pPPdJ-0005XO-EE
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:11:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pPPdH-0008NB-Qm
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:11:45 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so11733871wms.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AekG1XvVnwRtod/UuQKztjSbdV46VQDUFMzZjW7xa44=;
 b=XapIs9jMp9Bf5NHuR4sx7JDlYVAZGF2SR9lBLTN0cI3/Jn/ykpJymxr3gAL1s/OkZH
 0uS5ugzmBwRhGu/9ZeeG7p+ujatTvDwLMFPS4PltjfSXIX8fH0i02915ddfgAq2q9Pgy
 OktIAgYVbo/gno6rRl6559koPP38gxhSVC0sf+b5POQFX23eQYE/JY+MQIwvr4i+cdjM
 PhzbiW1J5a7LwDhiF7CMVIIl+CFd/Y6Mum9JKS/KQO0fleT47ZAqVT81RoUCstLImds8
 z238pdMns8+F913yCgBXirW7PJJN0I2BYSJwtYxEWjEwcaepz9Gj/DLAsrggCwTXpbFH
 ITyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AekG1XvVnwRtod/UuQKztjSbdV46VQDUFMzZjW7xa44=;
 b=dD9pc8o00wNTSqEInmwWK7ShlU5TyDSOGPK1Klw28BR+CwyZ1dDtPpwc7uiOuGpY8S
 tB8YZiRC2huPdizKCUaQKebW0Yc2VYK54Gg2x2OYBVWf1do+kliDeLWVO8GFn6hM25xq
 gRIf3u5VuDgXBrOasy83XrSwBjfNt+k4jRKksqFlneRrEQgj5mQQwjMHByp2JvcKJY40
 qiSnu1SuGK88FlTtPGMstrdxXiMM39brqIWK2lh8qBKh7maxBJgSaJzoNXh2BD+H24MR
 ukfk97aB7mAxYtPseso3wB/pZjH4b4ZU6G1Ioo7+bhta5GuLkafjZ4nneU+x8j0Dd8Jp
 GvQg==
X-Gm-Message-State: AO0yUKU1w4JVxJ/Nj3xJX8MiltYk4zLYJpDD2EHilim1BfQGCoSQB2LZ
 LmwKEnmN56KbniVYqRL1VSHUlA==
X-Google-Smtp-Source: AK7set94/8lM12CilRzjXrdJkY1QgShJc/uwx5ll2jw3LPR5KWsW1VArFNm4AtORdWbOB9Iqxgo++w==
X-Received: by 2002:a05:600c:708:b0:3e0:17d:aeaf with SMTP id
 i8-20020a05600c070800b003e0017daeafmr3329779wmn.7.1675782701875; 
 Tue, 07 Feb 2023 07:11:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a05600c1c9300b003dc43a10fa5sm15293810wms.13.2023.02.07.07.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 07:11:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 02F4D1FFB7;
 Tue,  7 Feb 2023 15:11:41 +0000 (GMT)
References: <20230203100551.2445547-1-alex.bennee@linaro.org>
 <87cz6loahb.fsf@suse.de>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Ilias  Apalodimas
 <ilias.apalodimas@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH] target/arm: disable FEAT_SME if we turn off SVE
Date: Tue, 07 Feb 2023 15:09:57 +0000
In-reply-to: <87cz6loahb.fsf@suse.de>
Message-ID: <877cwtpl1v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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


Fabiano Rosas <farosas@suse.de> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> Before this change booting a -cpu max,sve=3Doff would trigger and
>> assert:
>>
>>   qemu-system-aarch64: ../../target/arm/helper.c:6647: sve_vqm1_for_el_s=
m: Assertion `sm' failed.
>>
>> when the guest attempts to write to SMCR which shouldn't even exist if
>> SVE has been turned off.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>> ---
>>  target/arm/cpu64.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 0e021960fb..a38d43421a 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -409,6 +409,13 @@ static void cpu_arm_set_sve(Object *obj, bool value=
, Error **errp)
>>      t =3D cpu->isar.id_aa64pfr0;
>>      t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, value);
>>      cpu->isar.id_aa64pfr0 =3D t;
>> +
>> +    /* FEAT_SME requires SVE, so disable it if no SVE */
>> +    if (!value) {
>> +        t =3D cpu->isar.id_aa64pfr1;
>> +        t =3D FIELD_DP64(t, ID_AA64PFR1, SME, 0);
>> +        cpu->isar.id_aa64pfr1 =3D t;
>> +    }
>
> What about -cpu max,sve=3Doff,sme=3Don ?

Gah - I bet this is going to depend on ordering of parameters as well.

Markus,

Is there any way to represent optionA implies optionB in our argument parsi=
ng?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

