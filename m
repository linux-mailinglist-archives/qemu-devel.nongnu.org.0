Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CD4617BA6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 12:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqYUQ-0000wj-24; Thu, 03 Nov 2022 07:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqYUJ-0000uy-HK
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:34:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqYU0-0006Pt-6v
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:34:23 -0400
Received: by mail-wr1-x430.google.com with SMTP id h9so2381824wrt.0
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 04:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZPONCYfKswvttIDg8UIJQ8yu1wyjSJHELEt0bmG3ic=;
 b=Ptj1O7hc86GXOoObjYN2B+egQZ/Yu9OL0nu/rcVgJGUBud6jpBHoeWqajfvt0GeZKO
 8wOVJd/2DjPZEiEZFMLHuuE+uz5zeKO4qWu+20Hinakubh07Qn9IlweczswFcBFutVdj
 gN3gPdfn+VQ+V4Jgid6ocgqh2L/9YJpybqwVCAAa0Xj4BthUNReZle3NgBtC5k+KKLb+
 +DXFjQMImn+j9lN+z5BKm2LSTFAG8rXIy8oKau+4UTXPoRMwSke3KkOOtAntX70C0gSa
 xUR4EuQR5fHCTyiglVaTgxznM/0G/hoGyASZ8IbQ1rkSRzMKtpCsKihYh/m6ayBoLloy
 vXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YZPONCYfKswvttIDg8UIJQ8yu1wyjSJHELEt0bmG3ic=;
 b=7TFACMCdxtnMMqYqhZoLGQ6Z+aG5tjtwhO6nZr/epRnHUenIacG5KfNu1FuyFe2J3Z
 mtqQbhXElHOQVVtv6TuyT5Ssa5efmhWsvkthowKaNt0dXMha4E0SpvGeJsSrwU6vcrEq
 pVBZDatGLtGrJiAxuVx9gMRe6l0CB01USjuTgliBRdwP1MomxQClNNwNN/xZ3X5iDy2I
 68Dz8BUI/MeYjLzbcQQdCBuWRqQQVLZLr5YYdGbMV3J2tIaMm4WBLeDayRn8Vx7b5drS
 izAe1Qk1mFcZdjMj33/lKa0bjHEpDRqr+5tQn0fVWwPgS4sRmxqmERy5P3RzdxXr1woR
 0nGg==
X-Gm-Message-State: ACrzQf0pNmQvJXj59w4RQEIwp88lQ13iDB+P58IcdAYKuIxUbtLBtUom
 U+YKog16yLaIMm1Z7sIPv91BAPiUVTr5+A==
X-Google-Smtp-Source: AMsMyM5hCXo3MSsxRKbr3jrxnJE7Vt+DrL4feRqGJunOUPZjSGbY79cDwG+e9OWeFApi1SOQjGuiNA==
X-Received: by 2002:a5d:4484:0:b0:236:574f:2536 with SMTP id
 j4-20020a5d4484000000b00236574f2536mr18970683wrq.7.1667475239832; 
 Thu, 03 Nov 2022 04:33:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a05600c4fd500b003c71358a42dsm6113014wmq.18.2022.11.03.04.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 04:33:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ACF941FFB7;
 Thu,  3 Nov 2022 11:33:58 +0000 (GMT)
References: <20221103102329.2581508-1-alex.bennee@linaro.org>
 <94f8b6c2-ca50-9f4b-cf9d-d4cc8aa569c5@vivier.eu>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH] tests/unit: simpler variable sequence for test-io-channel
Date: Thu, 03 Nov 2022 11:32:51 +0000
In-reply-to: <94f8b6c2-ca50-9f4b-cf9d-d4cc8aa569c5@vivier.eu>
Message-ID: <87wn8cjmqh.fsf@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Laurent Vivier <laurent@vivier.eu> writes:

> Le 03/11/2022 =C3=A0 11:23, Alex Benn=C3=A9e a =C3=A9crit=C2=A0:
>> This avoids some compilers complaining about a potentially
>> un-initialised [src|dst]argv. In retrospect using GString was overkill
>> for what we are constructing.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/unit/test-io-channel-command.c | 14 ++++----------
>>   1 file changed, 4 insertions(+), 10 deletions(-)
>> diff --git a/tests/unit/test-io-channel-command.c
>> b/tests/unit/test-io-channel-command.c
>> index 43e29c8cfb..19f72eab96 100644
>> --- a/tests/unit/test-io-channel-command.c
>> +++ b/tests/unit/test-io-channel-command.c
>> @@ -33,19 +33,13 @@ static void test_io_channel_command_fifo(bool async)
>>   {
>>       g_autofree gchar *tmpdir =3D g_dir_make_tmp("qemu-test-io-channel.=
XXXXXX", NULL);
>>       g_autofree gchar *fifo =3D g_strdup_printf("%s/%s", tmpdir, TEST_F=
IFO);
>> -    g_autoptr(GString) srcargs =3D g_string_new(socat);
>> -    g_autoptr(GString) dstargs =3D g_string_new(socat);
>> -    g_auto(GStrv) srcargv;
>> -    g_auto(GStrv) dstargv;
>> +    g_autofree gchar *srcargs =3D g_strdup_printf("%s - PIPE:%s,wronly"=
, socat, fifo);
>> +    g_autofree gchar *dstargs =3D g_strdup_printf("%s PIPE:%s,rdonly -"=
, socat, fifo);
>> +    g_auto(GStrv) srcargv =3D g_strsplit(srcargs, " ", -1);
>> +    g_auto(GStrv) dstargv =3D g_strsplit(dstargs, " ", -1);
>>       QIOChannel *src, *dst;
>>       QIOChannelTest *test;
>>   -    g_string_append_printf(srcargs, " - PIPE:%s,wronly", fifo);
>> -    g_string_append_printf(dstargs, " PIPE:%s,rdonly -", fifo);
>> -
>> -    srcargv =3D g_strsplit(srcargs->str, " ", -1);
>> -    dstargv =3D g_strsplit(dstargs->str, " ", -1);
>> -
>>       src =3D QIO_CHANNEL(qio_channel_command_new_spawn((const char **) =
srcargv,
>>                                                       O_WRONLY,
>>                                                       &error_abort));
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>
> Do you want this be merged via trivial branch?

I'm easy either way. I've got a for-7.2/misc-fixes branch which I'll
send once I can figure out whats going on with the avocado console
interaction code.

>
> Thanks,
> Laurent


--=20
Alex Benn=C3=A9e

