Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6504F478C22
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 14:22:33 +0100 (CET)
Received: from localhost ([::1]:36126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDBw-0008WS-Hg
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 08:22:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1myD8p-0006p0-9l
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:19:19 -0500
Received: from [2a00:1450:4864:20::32f] (port=55944
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1myD8n-0000SZ-FU
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:19:18 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p18so1568776wmq.5
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 05:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZsaEJrruBmye0yFhJBa9hC8CjRoPdOnQTJ8nDWAT/GY=;
 b=jxssmGgzMiph9OHBzwuQRMpfXnsfMXHq2bMcuX6BX3Ad3+k2ujEXhHsOjp2pOQ+q7r
 NrHX/T3g4AsZ+N+OYiiod0BmKJT73wiT9CQ1ZwpbIra2C42zB0A0a9dmt3oFKkguU8CM
 OgXZJ9qGwSYMXbMyUGJV3Zl+vJDES0Gn92N6sz/QKcMFbqIiCbLyByJmknYllXFTF8py
 iI1NvVHVqX+nSh+9xzZGK+yuJ+zYxu+BPmEB6Wx9Kqhp0mkMiuWGUNDrHX+HO5GK/q0f
 JnxUF49pMjPpXkBV82mLNaECkDaRxDxVNNQMfKVLXHt4+Yhq0uZr74knjHkLBXB1xAB0
 P5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZsaEJrruBmye0yFhJBa9hC8CjRoPdOnQTJ8nDWAT/GY=;
 b=AKpxEx8j9XKuBJtpl/24HWpdAmJJ+lAzl7WIXYLigMw7tyGdnV/tacqmdkMbOqtOdu
 V55mIhRTP1VoGZihGQ/CT4+pu2Ip1rK1fdnBKi+D5Ry+9ecN7H/GabhgYGbG1nzWTk1d
 9zsVPQzyZf/EZcxN5C3/FhAs7LynNeeIh8ryoGM6VguWC1nO+XbbLCikdjjc4pT8lSIy
 zzoFbb45Q6YjQOWoliSMPOPcXA/h4uq+SlFbVkNlMtg7okf4b5/P0wqrO4BuBLET/CNx
 h5cxwxiGxtQVnygk5LJpUE3qQxNNz7vyKziQq40U+hx4nfzyz3lbBWU/H2vqtPzgtgBr
 8zPg==
X-Gm-Message-State: AOAM5339ILivGvbQH2cK2/LZUCfJOK+IQjMad9I1uqx7k4Il7pB5TV2u
 yZs8jGxwasUU6+q7v5g3LO06ew==
X-Google-Smtp-Source: ABdhPJxKXnFrNvetINHi7pfu00TDilvYE8SmYXMH9pSmmw6nTdDhL5f/a7TcPTg1m1g8VUsvdhSbZQ==
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr2710941wmb.174.1639747151107; 
 Fri, 17 Dec 2021 05:19:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l5sm8643499wrs.59.2021.12.17.05.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 05:19:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E6B81FF96;
 Fri, 17 Dec 2021 13:19:09 +0000 (GMT)
References: <20211216144442.2270605-1-alex.bennee@linaro.org>
 <b905eba0-b724-60ad-ab3c-8033bfab0f32@vivier.eu>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [RFC PATCH] linux-user: don't adjust base of found hole
Date: Fri, 17 Dec 2021 13:18:33 +0000
In-reply-to: <b905eba0-b724-60ad-ab3c-8033bfab0f32@vivier.eu>
Message-ID: <87mtkze5de.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Laurent Vivier <laurent@vivier.eu> writes:

> Le 16/12/2021 =C3=A0 15:44, Alex Benn=C3=A9e a =C3=A9crit=C2=A0:
>> The pgb_find_hole function goes to the trouble of taking account of
>> both mmap_min_addr and any offset we've applied to decide the starting
>> address of a potential hole. This is especially important for
>> emulating 32bit ARM in a 32bit build as we have applied the offset to
>> ensure there will be space to map the ARM_COMMPAGE bellow the main
>> guest map (using wrapped arithmetic).
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/690
>> ---
>>   linux-user/elfload.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
>> index 238979b8b6..8d839b79fb 100644
>> --- a/linux-user/elfload.c
>> +++ b/linux-user/elfload.c
>> @@ -2334,7 +2334,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_loa=
ddr, uintptr_t guest_size,
>>             /* Record the lowest successful match. */
>>           if (ret < 0) {
>> -            ret =3D align_start - guest_loaddr;
>> +            ret =3D align_start;
>>           }
>>           /* If this hole contains the identity map, select it. */
>>           if (align_start <=3D guest_loaddr &&
>>=20
>
> It seems not consistent with what we have with fallback where we substrac=
t the guest_loadaddr:
>
> 2289     if (!maps) {
> 2290         ret =3D pgd_find_hole_fallback(guest_size, brk, align, offse=
t);
> 2291         return ret =3D=3D -1 ? -1 : ret - guest_loaddr;
> 2292     }

Hmm yeah. I can just make that a straight:

  return pgd_find_hole_fallback(guest_size, brk, align, offset);

>
> Thanks,
> Laurent


--=20
Alex Benn=C3=A9e

