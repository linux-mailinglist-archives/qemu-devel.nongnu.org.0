Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40F831B6CB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:57:45 +0100 (CET)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBadU-0007xE-Ha
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBac3-0006yI-4s
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:56:15 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBac0-0001Rl-Nd
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:56:14 -0500
Received: by mail-wr1-x42d.google.com with SMTP id g6so8087712wrs.11
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SUSrQfK6rV4esqvleKy4eisqUROARpTuGpGG4gMSY/Y=;
 b=v5fexGNtKy6CJSnXz+cMQcGmZr0h/AnyVcUxGZj2DkSgAyRsHb5hc2xvMQoflFall7
 2VF3C23ODEHah6d55R7WqqDB8zrrNmb9oNnN2FXOneaFd9+2s8REYxwAd1dLkn5Fjdi0
 w/c05Y5V8RU8GyN5t7+kkhM1ry7NhEcL26qaPQQsUj4aj49Da4AKkQmELN7cH/ulvHI7
 vPZwPNU8cZ5jSAxf28kB8UKmMiMYWmcUn/hEHpxsSu+qMnixNtdxcyDUCFUjvJclBqm7
 sIb28A76EH/zEBMKv/qbgwdNOOz6zI4O7tQ2jBLU6WqtAKOdQ6mus1celETooIwQ+asR
 1UQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SUSrQfK6rV4esqvleKy4eisqUROARpTuGpGG4gMSY/Y=;
 b=DmmszJU3R4DBclURy4Frh2xl25bZIMlif+1NMVxJA1KT5B/gG9c49ihO8gtHCJDWte
 C4XhbrqEbnzkM7MIdfCdFKmEC5AiQdGWLxcso7wZ1EG/Xl0/bSnzbz2Ca8MNIz6czzwe
 qpi5Xqz4dbm+U3A3hb4wc1UqJkNEvgdBwxiuLmRKQCiJ5zitSUsr2nvRBK4OEPdGy7ZD
 qUIO/WG5+uSzVHXuDf9i/kjF+wki1szm4HddgbQN+g+Enz7XqsYvg9bU92PRY0xyoxBY
 JSSFGC7U28bTKrOwzW8B5IC7nDO9aSh5PVT0V5Aw0xXmqqav07ran7rjJE9CFRy9nVsM
 2GlA==
X-Gm-Message-State: AOAM533JEe1tYjgl3K9EGbFT9ek/bFSyAbQ7Cq0VMPNMwLmgCqyyxo1Y
 tVpB4IBfHXOMgaurZfkNTALvNSk8i/HneDkk
X-Google-Smtp-Source: ABdhPJy7KzPqvOw10BGn4vi9jfNYuSSy2GfSlr0pVOTV/BdfBAkIrM5WFbdcjy+t2z+BeoSt7if1Iw==
X-Received: by 2002:a5d:558b:: with SMTP id i11mr18296282wrv.125.1613382971279; 
 Mon, 15 Feb 2021 01:56:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r12sm23466775wmg.44.2021.02.15.01.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:56:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 835381FF7E;
 Mon, 15 Feb 2021 09:56:09 +0000 (GMT)
References: <20210131061930.14554-1-vfazio@xes-inc.com>
 <87o8gmc2k5.fsf@linaro.org>
 <78c75d31-f8be-a98a-8649-87ceca224b8b@vivier.eu>
 <CAOrEah7X3H7g7gSKFf-jD0nQ7YqnE+hUP7eq7Ozk8HfwYaxuqA@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vincent Fazio <vfazio@gmail.com>
Subject: Re: [PATCH] linux-user/elfload: do not assume MAP_FIXED_NOREPLACE
 kernel support
Date: Mon, 15 Feb 2021 09:52:26 +0000
In-reply-to: <CAOrEah7X3H7g7gSKFf-jD0nQ7YqnE+hUP7eq7Ozk8HfwYaxuqA@mail.gmail.com>
Message-ID: <87o8glveme.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Vincent Fazio <vfazio@xes-inc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Vincent Fazio <vfazio@gmail.com> writes:

> On Sun, Feb 14, 2021 at 6:50 AM Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 14/02/2021 =C3=A0 12:24, Alex Benn=C3=A9e a =C3=A9crit :
>> >
>> > Vincent Fazio <vfazio@xes-inc.com> writes:
>> >
>> >> From: Vincent Fazio <vfazio@gmail.com>
>> >>
>> >> Previously, pgd_find_hole_fallback assumed that if the build host's l=
ibc
>> >> had MAP_FIXED_NOREPLACE defined that the address returned by mmap wou=
ld
>> >> match the requested address. This is not a safe assumption for Linux
>> >> kernels prior to 4.17
>> >
>> > It doesn't as we have in osdep.h:
>> >
>> >   #ifndef MAP_FIXED_NOREPLACE
>> >   #define MAP_FIXED_NOREPLACE 0
>> >   #endif
>> >
>> > which is to say to assume if MAP_FIXED_NOREPLACE is defined the kernel
>> > should have given us what we want otherwise we do the check.
>>
>>
>> But what is the purpose of the "if (MAP_FIXED_NOREPLACE !=3D 0 ||"?
>> Can't we rely only on "mmap_start =3D=3D (void *) align_start"?
>>
>> Thanks,
>> Laurent
>>
>
> I think we have to rely on address matching. The problem is
> specifically when MAP_FIXED_NOREPLACE is defined and is passed to mmap
> but the running kernel doesn't know what to do with the flag so
> returns a value that is not what was hinted at. Previously the code
> assumed that if MAP_FIXED_NOREPLACE was defined that the returned
> address would match, but that isn't always the case if the kernel
> doesn't have support for the flag. The 4.4, 4.9 and 4.14 LTS kernels
> are still in use and could run into this problem.

Ahh right so I think this is a case of binaries being built on a
different platform than kernel they are running on. In which case the
flag would be defined but the underlying kernel fails to identify it. Is
this a container like case by any chance?

If I'd read the man page closer:

   Note   that   older   kernels   which   do   not  recognize  the
   MAP_FIXED_NOREPLACE flag will typically (upon detecting a colli=E2=80=90
   sion  with a preexisting mapping) fall back to a "non-MAP_FIXED"
   type of behavior: they will return an address that is  different
   from  the  requested  address.   Therefore,  backward-compatible
   software should check the returned address against the requested
   address.

so yes we should avoid short circuiting the return address check.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

