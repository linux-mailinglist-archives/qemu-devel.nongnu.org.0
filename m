Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0D34C71E7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:46:08 +0100 (CET)
Received: from localhost ([::1]:43278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOj9y-0002vn-LG
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:46:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOj82-0002EF-7c
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:44:06 -0500
Received: from [2a00:1450:4864:20::62d] (port=33729
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOj80-0005G0-JN
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:44:05 -0500
Received: by mail-ej1-x62d.google.com with SMTP id vz16so26098155ejb.0
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 08:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IsqpI/8o3x3RcYaFpVbHpVbyYeLvHnsuZnqh4I0Ms5Q=;
 b=a+cVYZGvTSMpZtyvMvvnfruyCfyi2K1JjZhBMLbUvsi6N7JEnO4mUc5w/8PG2051wQ
 kTLrKSw7/9HICnu2/r4WU+pICE/z9G32v5Tp4qgVzmLwpVl0pW5d1h/6D8tRx2kOyhpF
 QyTv+XNPa70V/34eyajYM2IV6B7S2CK4asj2I7g47iyZkvMo5g7ArLi0+WpQRWCrpArw
 19Evw8gBkSVNd0GF59xMcMhQHhxmvOrdWVNLz/baNOSiuPA8Fimfy8kcSAb3nemSciDg
 fTgbMSQIfD0eSy/Wb8D3Qsqn4mS/4tgz0R+bO3uGnECGkp+mihfxgBJrYBhmz6rMYhOj
 +aSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IsqpI/8o3x3RcYaFpVbHpVbyYeLvHnsuZnqh4I0Ms5Q=;
 b=WNHPXYSJTiqgcPN4XF63JN26RdR9XAeFgWsIakLFeuDFG/j7ovEOVp96OFkX21mgf0
 0EF02GnVlMwY7zb8IQ5A+ELqNooLpHG/7z3IjrgqIuu2big61hxn1nyrGAHLBSIHwUuS
 M15tUDWjLx9oOUBwjraO8LN5xenFn4sTU4IaNX0HwIJLmCLsLqrtrUSmdQIs/95ZUnSi
 gbqkwP+ZAFD81Pq72aJF0j39JGV8b+rLPD8iQxHY/B0pHN5hJ4XbEJL+6TjPxNtHLAtF
 TIB8WYppa3z45UvmUqq+J/NmSfJ2o1NqOGv3a1AuQpK/w3FrUABBwZ8o3WEKFLvk27tS
 utMA==
X-Gm-Message-State: AOAM533JvsJDn9h8NK9yQWiKQ4aoYz7XREqYOpHQU3sYb6ku2auF3wh9
 PNDijkm8PkjugRqUPQF82qyHXg==
X-Google-Smtp-Source: ABdhPJy2GUBxr7dOJcOsfd8NSMyOd4Pqm5Pm+npT0gDQBIisBaV6Oeh+ulTjPGe66rGX98AV8aeTbg==
X-Received: by 2002:a17:906:9be0:b0:6d6:da70:df7 with SMTP id
 de32-20020a1709069be000b006d6da700df7mr1361369ejc.580.1646066642735; 
 Mon, 28 Feb 2022 08:44:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a170906284500b006cc551d6cabsm4513860ejc.63.2022.02.28.08.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 08:44:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 36CD51FFB7;
 Mon, 28 Feb 2022 16:44:01 +0000 (GMT)
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-14-alex.bennee@linaro.org>
 <61d197db-c44e-3354-f1e5-bea48019bb1e@linaro.org>
 <87zgmbm6os.fsf@linaro.org>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 13/18] tests/tcg: add vectorised sha512 versions
Date: Mon, 28 Feb 2022 16:43:28 +0000
In-reply-to: <87zgmbm6os.fsf@linaro.org>
Message-ID: <87ilszlz5a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> On 2/25/22 07:20, Alex Benn=C3=A9e wrote:
>>> +++ b/tests/tcg/i386/Makefile.target
>>> @@ -71,3 +71,9 @@ TESTS=3D$(MULTIARCH_TESTS) $(I386_TESTS)
>>>     # On i386 and x86_64 Linux only supports 4k pages (large pages
>>> are a different hack)
>>>   EXTRA_RUNS+=3Drun-test-mmap-4096
>>> +
>>> +sha512-sse: CFLAGS=3D-msse4.1 -O3
>>> +sha512-sse: sha512.c
>>> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>>> +
>>> +TESTS+=3Dsha512-sse
>>
>> The default cpu, qemu32, only implements sse3, not sse4.1, so we get a
>> guest SIGILL.  We can execute this with -cpu max, or we could limit
>> the vectorization.
>
> OK I'll add:
>
> run-sha512-vector: QEMU_OPTS+=3D-cpu max
>
> TESTS+=3Dsha512-sse

Or you know something that will actually work :-/

  sha512-sse: CFLAGS=3D-msse4.1 -O3
  sha512-sse: sha512.c
          $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)

  run-sha512-sse: QEMU_OPTS+=3D-cpu max
  run-plugin-sha512-sse-with-%: QEMU_OPTS+=3D-cpu max

  TESTS+=3Dsha512-sse

>
>>
>>
>> r~


--=20
Alex Benn=C3=A9e

