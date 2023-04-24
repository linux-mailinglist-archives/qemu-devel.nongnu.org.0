Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1106EC86A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:08:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsBP-0008HR-MG; Mon, 24 Apr 2023 05:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsBJ-00082F-J5
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:08:23 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsBG-0001Wq-T3
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:08:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f7c281a015so2433137f8f.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682327296; x=1684919296;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQQ/M84VdXV+sFflrcfQTOJNz8ZZLyV8/lFJ1/359T0=;
 b=okOwcBmPQ8SmYfl2J08efeTuTDHZkDva4TGQsb/BYoG4vM564ESK1yZRJdJ3uUuM+m
 PF/NOa9Fm9tC1/CDPt60yE7guWKaGCz2xPQ4Prp5zeUzAGghd6LxF8tauLlTM1nEMOQg
 yu+16s27XSG+eympyTjmdk9sHMoSl7miWWnjvHsOR8tcucN3SvP+jQHBrTMuxCrn6rYj
 YviZy4JLtb7fmVX61c+ui7mmbXad4uX8vV5Niz3ZqUJwgdWRfVNIcsYfmKVkACqBY8KY
 2tOfMLqcFy/iXlpb4zO8uLw6exklXGr7CPJXQQwKJbt5ykT8US/g3rVQtxVbuvAaC1cT
 C6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327296; x=1684919296;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mQQ/M84VdXV+sFflrcfQTOJNz8ZZLyV8/lFJ1/359T0=;
 b=O09NJYJR1Fj6ycDUstgkm9ROxXePbx2JIWVWgei14/4MQ+JdA9YUVMPehIDyjZzZVG
 PKam/2Cn9h/8tPkrZQ1fFVm+BcU8zY5Ujdc3pmIXlWIH0EUbgfO76KNBAIJWEpPj236J
 AK6b8a4LvVdaVobPakZJlTfoRbq2FLC8FCQ12lLg5UQzuP/73gpHN2tr+wW39S7IsT4T
 SLcQnBi0kyoBEhjRNv8KSx6KpUIvjVdJ7ZOrG3pfgGzqZ2xQv5s2fzZhepVbtHSgzKlt
 lw0ESp4EqgM9ND6M78swL/5HhiJ4EsqDLdfyPx5lNxzTjkmI9C4avVihZygejmgUvzNM
 RvGg==
X-Gm-Message-State: AAQBX9fIo/5ciymrvDTPxGAsxoecaNAeiefWE0fAzCOcahggdHvEr1Il
 Lg3t7Hx/yJWq+NA7sSz+mtNzaQ==
X-Google-Smtp-Source: AKy350ZVogtkIoJHhfub7k47N29ecpa+ZLKZswRObKkNrSJJ4RoIEubrR0BE+lcU+m6Pl4QMKfOr2Q==
X-Received: by 2002:a5d:614e:0:b0:2ff:460e:bb49 with SMTP id
 y14-20020a5d614e000000b002ff460ebb49mr10251984wrt.24.1682327296160; 
 Mon, 24 Apr 2023 02:08:16 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a5d50d1000000b002e5f6f8fc4fsm10253084wrt.100.2023.04.24.02.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:08:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3DF4D1FFB7;
 Mon, 24 Apr 2023 10:08:15 +0100 (BST)
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-10-alex.bennee@linaro.org>
 <c2e905e0-2e2a-9666-3ea5-c2453d58a54b@yandex-team.ru>
User-agent: mu4e 1.11.3; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, John G Johnson
 <john.g.johnson@oracle.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 9/9] docs/style: call out the use of GUARD macros
Date: Mon, 24 Apr 2023 10:07:33 +0100
In-reply-to: <c2e905e0-2e2a-9666-3ea5-c2453d58a54b@yandex-team.ru>
Message-ID: <87sfcpabr4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:

> On 20.04.23 18:57, Alex Benn=C3=A9e wrote:
>> There use makes our code safer so we should mention them.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
>
>> ---
>>   docs/devel/style.rst | 36 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
>> index 0bd01f3fca..b50a981a86 100644
>> --- a/docs/devel/style.rst
>> +++ b/docs/devel/style.rst
>> @@ -657,6 +657,42 @@ that declaration and the new code.
>>     See :ref:`qom` for more details.
>>   +QEMU GUARD macros
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +QEMU provides a number of ``_GUARD`` macros intended to make the
>> +handling of multiple exit paths easier. For example using
>> +``QEMU_LOCK_GUARD`` to take a lock will ensure the lock is released on
>> +exit from the function.
>> +
>> +.. code-block:: c
>> +
>> +    static int my_critical_function(SomeState *s, void *data)
>> +    {
>> +        QEMU_LOCK_GUARD(&s->lock);
>> +        do_thing1(data);
>> +        if (check_state2(data)) {
>> +            return -1;
>> +        }
>> +        do_thing3(data);
>> +        return 0;
>> +    }
>
> For more clearness, maybe add an equivalent code with qemu_mutex_lock() /=
 qemu_mutex_unlock(), I mean:
>
> The equivalent code without _GUARD macro makes us to carefully put qemu_m=
utex_unlock() on all exit points:
>
> .. code-block:: c
>
>     static int my_critical_function(SomeState *s, void *data)
>     {
>         qemu_mutex_lock(&s->lock);
>         do_thing1(data);
>         if (check_state2(data)) {
>             qemu_mutex_unlock(&s->lock);
>             return -1;
>         }
>         do_thing3(data);
>         qemu_mutex_unlock(&s->lock);
>         return 0;
>     }
>
>> +
>> +will ensure s->lock is released however the function is exited. There
>> +are often ``WITH_`` forms of macros which more easily wrap around a
>> +block inside a function.
>> +
>> +.. code-block:: c
>> +
>> +    WITH_RCU_READ_LOCK_GUARD() {
>> +        QTAILQ_FOREACH_RCU(kid, &bus->children, sibling) {
>> +            err =3D do_the_thing(kid->child);
>> +            if (err < 0) {
>> +                return err;
>> +            }
>> +        }
>> +    }
>> +
>
> and maybe similar here.

I added the example although I didn't repeat it for the WITH form
because readers should hopefully have understood the idea with the first
example.


>
>>   Error handling and reporting
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>>=20=20=20


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

