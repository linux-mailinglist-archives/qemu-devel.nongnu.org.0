Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735EC66A0E8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:43:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGNZk-0004lX-Ga; Fri, 13 Jan 2023 12:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pGNZh-0004l5-Ok
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:10:42 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pGNZf-0007ZA-VN
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:10:41 -0500
Received: by mail-wr1-x436.google.com with SMTP id bs20so21680508wrb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 09:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cSxi98EvvoPptHwQUMGVW0HJMESuIvS+JG1RYLDJ95o=;
 b=Fe3dD8+M5mjQozJ9CDy1G3S8B1f+iFE8VODJdRZocmazENQpCfaJ3kG+Odh5p12opx
 yk5dJCYW6r9Nlzv8NJcPiElNOGAepYYJyLlacQD3LIiK+2KkwGF9YnnfY6UTgadY2Vle
 lEc1smUI1J+gb8hDLE+obin3JfzcZX3rgNT/BqQ44X8wClWGOYQHXhQ22kJOCLlLWjyG
 JGKdEwTKj/oO26HuihIprnUUnNGL3unNvcLIrYi8C986XokRnxLo9bMqG5XRCCaMeiwW
 Sw1nR/a+CLTdBO7eDGLJ5jxXTsXXlbW9hdSa3qdi6zsUEr3HD4NeiU1oMLarVL/t/Mdl
 SrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cSxi98EvvoPptHwQUMGVW0HJMESuIvS+JG1RYLDJ95o=;
 b=4lKLlffTq2LtucTnTnO/DOtM2Yr7bznTjZ/1+yobgY+gsA6Dl2WmP8FjExLufbf2Qt
 AIWtJKMxyjRYW3MMjcLwEcHyxNmlMpv0XZbpPxIA3pIJIWq7Mo52gYkESxAQU3/CUX5k
 2zZXplgiO3i2gbp2Zk+txcxE0kTPP2CBUDi6UgI0Nd3LVqJDYzRcJSozpPdVod0VyOZG
 qoXpwjhw1iDyJdw5bECbGYI763Gm2OBEh7xLWmmd81LzAA14yOu/KeVVRto9tTUnyVYz
 l9vnRXJqtJlLNWckC75CNmyDuB6MUbsw86+UWXGzucgIPtf4jae3+gwsq0zx5YaPzKyk
 Ln+g==
X-Gm-Message-State: AFqh2krlTjA352CVUIP8A19Fd6HGdZuBnvMAz/0gaM5OOcLm/nQKLgjY
 qY4ojP8mR0HbU+DEugYkBn4qcXpnByVROAKq
X-Google-Smtp-Source: AMrXdXurHJFlyU4UnAezJW/4uZttZT3IoyOOvwhgmzLiuHxteio8yC4uRz1iD7I0peNmefX4ZGagcA==
X-Received: by 2002:a5d:4487:0:b0:2bd:d8f1:2edf with SMTP id
 j7-20020a5d4487000000b002bdd8f12edfmr4304025wrq.49.1673629838457; 
 Fri, 13 Jan 2023 09:10:38 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a5d6b0c000000b002366553eca7sm19252987wrw.83.2023.01.13.09.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 09:10:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 93B581FFB7;
 Fri, 13 Jan 2023 17:10:36 +0000 (GMT)
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-5-richard.henderson@linaro.org>
 <CAFEAcA_viCsMxSjcpFtxL+hj-n5TTff0npg1RjOnLUpwGu47DA@mail.gmail.com>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, iii@linux.ibm.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] tests/tcg/multiarch: add vma-pthread.c
Date: Fri, 13 Jan 2023 17:10:10 +0000
In-reply-to: <CAFEAcA_viCsMxSjcpFtxL+hj-n5TTff0npg1RjOnLUpwGu47DA@mail.gmail.com>
Message-ID: <87pmbil5rn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Sat, 24 Dec 2022 at 15:19, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> From: Ilya Leoshkevich <iii@linux.ibm.com>
>>
>> Add a test that locklessly changes and exercises page protection bits
>> from various threads. This helps catch race conditions in the VMA
>> handling.
>>
>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>> Message-Id: <20221223120252.513319-1-iii@linux.ibm.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> I've noticed that this newly added vma-pthread test seems to
> be flaky. Here's an example from a clang-user job:
> https://gitlab.com/qemu-project/qemu/-/jobs/3600385176
>
> TEST vma-pthread-with-libbb.so on aarch64
> fail indirect write 0x5500b1eff0 (Bad address)
> timeout: the monitored command dumped core
> Aborted
> make[1]: *** [Makefile:173: run-plugin-vma-pthread-with-libbb.so] Error 1=
34
>
> and another from a few days earlier:
> https://gitlab.com/qemu-project/qemu/-/jobs/3572970612
>
> TEST vma-pthread-with-libsyscall.so on s390x
> fail indirect read 0x4000999000 (Bad address)
> timeout: the monitored command dumped core
> Aborted
> make[1]: *** [Makefile:173: run-plugin-vma-pthread-with-libsyscall.so] Er=
ror 134
>
> thanks
> -- PMM

Interesting those are both with plugins. I wonder if the tsan plugin
fixes in my latest tree help?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

