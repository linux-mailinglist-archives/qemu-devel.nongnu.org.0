Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948EF3AB15B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:30:06 +0200 (CEST)
Received: from localhost ([::1]:48392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltpHh-0007Sk-HY
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltowL-0004CX-VQ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:08:01 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltowJ-000753-17
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:08:01 -0400
Received: by mail-wm1-x32e.google.com with SMTP id n23so3050770wms.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 03:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=InRjzQ4LcsTe0/FcC0k3+I8w60xnEk4ZpYr4hU+GWmc=;
 b=BR/+RCffZAkuGrTE+hP5fxmbcuQCoAqVHeYfnNXUC8l8G68etpc7CYTsjG7R2ty6wa
 Wa1w4yjAqE/pp5YZhypNBy0FWOuMEG7gLTtrUsyXfLsk9zlemP0tnCTu+UABrRpytK/U
 e88P2pAmSAxeF+c4AtA+HwnWyQYkkMFIBz3HfJJ2WDC6oqfpm9PITFeUT6g+eWBHcqe7
 MfYVO3rdyk2GQIZDq0XW4wFZbATwET7JNuxbuqXct0yC1y6GbwWs2QUFNZWcU/ezwLoe
 bBculqY/KNrT7jzNYXqpgwZdKwjvmhKgL/0N6ubDzuouMfUD3I/ctA6Wgve3W/Yv8/2d
 wW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=InRjzQ4LcsTe0/FcC0k3+I8w60xnEk4ZpYr4hU+GWmc=;
 b=LMjuAh8p6oS/bTtBIVnUibhpWIp9udFzd2QlOplsWAnrOyWuW2KzkQ3aEX2Yxe0hDR
 1c8q5X/rlz5vPqRAO3lXN+wmXAoWya9le5rczVMVZmP+hhaD0h4j9MAVpoMwc60w+MAF
 KauRd+pXwZjgR6DWOLXhPZW9gj23kaiNQDf2Impc2blDTHKUyIgkmQZ3K2WJe9c7OtLX
 SadnW6LS/raCgEgY0w0rodMmgb1/DAQXM+1VJ7kUcUKZKB/LhWy2be8ZDhbWj9hQ2TkX
 dwdbjbs6h5hglew80mH8vjcEwfYknLoZ5zxMTjH2Xd1bAc1JYXmOZrUzhJQrN31OYzMq
 RFww==
X-Gm-Message-State: AOAM531qfUGgIBFjHky9d8+Qa1ouWOVh+BWRhNuroG80XiDB/VYMPYx2
 MMdkXGOgIHi74qEOmIACtKG9EQ==
X-Google-Smtp-Source: ABdhPJz3vO8lar0dPwV6jD+NV+vvBg+UJOtufrmaM7ffgLKn6/Kg9kmh/hXxbQci85SY8aOLzhG6yQ==
X-Received: by 2002:a7b:c853:: with SMTP id c19mr4192908wml.30.1623924477345; 
 Thu, 17 Jun 2021 03:07:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g10sm4929941wrq.12.2021.06.17.03.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 03:07:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA5311FF7E;
 Thu, 17 Jun 2021 11:07:55 +0100 (BST)
References: <20210615133855.775687-1-pbonzini@redhat.com>
 <CAFEAcA_LNDqvLS7g7RqPHB54nrphjkuF3w=K2x-wX9D_oJfhKA@mail.gmail.com>
 <7b25ff29-4f7e-aca5-d3b1-7732b35c018c@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PULL 00/33] Misc patches for 2021-06-15
Date: Thu, 17 Jun 2021 11:06:58 +0100
In-reply-to: <7b25ff29-4f7e-aca5-d3b1-7732b35c018c@amsat.org>
Message-ID: <87czskg5xg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 6/15/21 4:17 PM, Peter Maydell wrote:
>> On Tue, 15 Jun 2021 at 14:42, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>
>>> The following changes since commit 894fc4fd670aaf04a67dc7507739f914ff4b=
acf2:
>>>
>>>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request'=
 into staging (2021-06-11 09:21:48 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>>
>>> for you to fetch changes up to 429f60abe15cca9046e6aeaffd81e991e34c9bf6:
>>>
>>>   configure: map x32 to cpu_family x86_64 for meson (2021-06-14 20:17:5=
5 +0200)
>>>
>>> ----------------------------------------------------------------
>>> * avoid deprecation warnings for SASL on macOS 10.11 or newer
>>> * fix -readconfig when config blocks have an id (like [chardev "qmp"])
>>> * Error* initialization fixes
>>> * Improvements to ESP emulation (Mark)
>>> * Allow creating noreserve memory backends (David)
>>> * Improvements to query-memdev (David)
>>=20
>> Fails to build on all the BSDs and OSX:
>
> FWIW I sent a series adding FreeBSD to GitLab:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg809453.html
>
> But we might get it even quicker apparently, by plugging our
> cirrus-ci to gitlab-ci:
> https://potyarkin.ml/posts/2020/cirrus-ci-integration-for-gitlab-projects/

I wonder if the mirror between github/gitlab is kept upto date quick
enough? I guess we need to clone of the real URL to work across peoples
personal repos.

--=20
Alex Benn=C3=A9e

