Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CDB4D9CF5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:03:15 +0100 (CET)
Received: from localhost ([::1]:47094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7la-0002XL-W2
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:03:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU7k7-000167-AT
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:01:43 -0400
Received: from [2a00:1450:4864:20::532] (port=45960
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU7k5-000320-J2
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:01:42 -0400
Received: by mail-ed1-x532.google.com with SMTP id m12so24276030edc.12
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 07:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4aBNyXthZDFZGmYdhR1ixZ2EwclguP4lowYESIA1xdw=;
 b=UOQBorGrCOazf//auvGZ+5GcLqBvS79kjRndaskZj5YqQaCcn/9sW1o6hcE9+n+ZQM
 5SOhqXFslBSKldQYAa9oupDoyks/Qg7Oexo08JhRVARF6iTGnkMRPj4m8RwId0L7TA5F
 Jbh9fXUtF1O7PPdxBwIrgMhkuH/JN7fBe8bADWgeYFvQa2a5so7leEIALTOa51lg3Q9N
 Nt8SLOOiEUVQiSSK03nSexYkrPC2lkmUGoPuuYnRAKMPHa1j4teVjxNXQiEMLFcKLU1z
 kqfWPzjpsd4ZLYILsA1zwhUdcWmEJNDsqEGTeOIOVXQPfEsA6wpRtNBYVYun7lo64HDc
 7xmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4aBNyXthZDFZGmYdhR1ixZ2EwclguP4lowYESIA1xdw=;
 b=4oLcDNaycMOB4f9RmJYDccUeB65guFjRuqg1gez6Vo7dw0jUmT4ktOj+hC2SJcxdyc
 4DPuRxWWzIALp5x/8ZaC9XZRR4ckWX4oI/OZ3oqqHNqHqb2gUJSRfYBFhRN7e5IGNNUz
 J5+vHhlTh8ErvPBIUBLcPWkKfyhtTlhAdC37tYs5DlMLm9ckx/WIKnekYmIZY5yy6/ga
 bAAwgJrcky2old00IKrClOovfkh5x738shY3LaF10gGEFzBSBis9aI11Qag29/e9iwul
 kQON3sDE8aujm2HwkgdY2Zwstfl6yV1b0bPKBnx9Z1SMbVtCJcgXN7u9hdaRw2S53Ill
 SnOQ==
X-Gm-Message-State: AOAM533NXoahr7s8GyFzyd6cj9vDL5zZ6UzWzW65bHeHHy0UOeQdQVet
 TnWvnq4WNSr1RxsNKrNnvajlJQ==
X-Google-Smtp-Source: ABdhPJwBKcbC/sanqpaFFbxWPcJuoPFfKlwGhiIxEZrzX8nNatJG4E4jMFtudhj0yls2xRlHwgOdtg==
X-Received: by 2002:aa7:c5d7:0:b0:415:ee77:d6f2 with SMTP id
 h23-20020aa7c5d7000000b00415ee77d6f2mr25356805eds.208.1647352899659; 
 Tue, 15 Mar 2022 07:01:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 eq18-20020a170907291200b006da97b09661sm8133596ejc.17.2022.03.15.07.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 07:01:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DBDF01FFB7;
 Tue, 15 Mar 2022 14:01:37 +0000 (GMT)
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-8-alex.bennee@linaro.org>
 <6c7bdb98-ad58-e48e-caa5-a9747b8ad90b@gmail.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 7/8] semihosting: clean up handling of expanded argv
Date: Tue, 15 Mar 2022 13:59:59 +0000
In-reply-to: <6c7bdb98-ad58-e48e-caa5-a9747b8ad90b@gmail.com>
Message-ID: <87a6dr48n2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, sw@weilnetz.de,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:

> On 15/3/22 13:12, Alex Benn=C3=A9e wrote:
>> Another cleanup patch tripped over the fact we weren't being careful
>> in our casting. Fix the casts, allow for a non-const and switch from
>> g_realloc to g_renew.
>> The whole semihosting argument handling could do with some tests
>> though.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   semihosting/config.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>> diff --git a/semihosting/config.c b/semihosting/config.c
>> index 137171b717..50d82108e6 100644
>> --- a/semihosting/config.c
>> +++ b/semihosting/config.c
>> @@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
>>       bool enabled;
>>       SemihostingTarget target;
>>       Chardev *chardev;
>> -    const char **argv;
>> +    char **argv;
>>       int argc;
>>       const char *cmdline; /* concatenated argv */
>>   } SemihostingConfig;
>> @@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
>>       if (strcmp(name, "arg") =3D=3D 0) {
>>           s->argc++;
>>           /* one extra element as g_strjoinv() expects NULL-terminated a=
rray */
>> -        s->argv =3D g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
>> -        s->argv[s->argc - 1] =3D val;
>> +        s->argv =3D g_renew(char *, s->argv, s->argc + 1);
>> +        s->argv[s->argc - 1] =3D g_strdup(val);
>
> Why strdup()?

The compiler was having issues with adding a const char * into the array
and it was the quickest way to stop it complaining. I'm not sure what
guarantees you can make about a const char * after you leave the scope
of the function.

>
>>           s->argv[s->argc] =3D NULL;
>>       }
>>       return 0;


--=20
Alex Benn=C3=A9e

