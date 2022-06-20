Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC4551F0A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:39:05 +0200 (CEST)
Received: from localhost ([::1]:36732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3IYT-0008DQ-23
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3IVE-0003s6-6V
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:35:44 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:35584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3IV9-00037Q-9O
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:35:43 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-317741c86fdso100710427b3.2
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3tAgCpYxKyWeN01wVJIxZfuypc3TwgnF/7kyebd/niw=;
 b=LtxtTstVz5pNfzBt352/WKkuxAGoJSYRAIUja8T52/gxLKEVuFW+WmFB9nLgoNS+Vt
 lvXpA7zr2TfqSu+UMiaqWR41GF5SowIpDYHvQIXrPgGJ67AiMnIeEixI2ycnyNG7xNhe
 8dxlZQqA8BXPdFT6zxNlAjOCWdrhVd1v2kNlnv1CdTqCPmtrYW8o0NbxxOI5too5bjng
 gsnXhCr3RDZzenAztGil05/BZS1M8sLnaVXQwdhxTmeHuaas3Z2AcpXgmAwEH41Am/P2
 8NgUHwfZt5uy8MwD2cUqh9PdrouH3Vf1SYDnxu9JjSQhlodEMQWaSue5OOEN70nh/WJN
 D+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3tAgCpYxKyWeN01wVJIxZfuypc3TwgnF/7kyebd/niw=;
 b=kS8IXH3iRUsVje7UinZHXY4u2clayoMfYOMEgT63WLcPqLRvoGnFu720gUplMasplc
 M1JonjjbeWWFBWwTFepwAZGNIV4zwP5R+QfykhCYjZWVQXc8o1fOdfYlG6mhmxOC0ZHI
 EE8VV2ohF/PQKTFJ4jHakMsOXVdon5ifii8YTTzYEIy2aLFaKZ90oku5U8yIRxXM5JO+
 fkxGzgFMwivUNOFKccaQuhWeq3ROlmwAAn6cBX9Zt9UwJq5UCwAZUzCr2WI5ms0r/5XJ
 PfNbbva27avgun2gszZIq88YGJ1qDrU6FYLvgfL/+U9UrLXf8Sznd6dnXSHLe3dAlCNn
 JI3A==
X-Gm-Message-State: AJIora9xn3urCuaRJSymAlr1WOjw5yL43y9kr1Ejoh9PZP+D7pu8r/ll
 ya5bB7JfA2781XsuneD/+woEXiTG5wSbYlXXVS/CZw==
X-Google-Smtp-Source: AGRyM1vbsLyQmbv9JS7yaveMWxD4sGwACVrNQGxVF+MrzaQYr/jvRV4oVuP3kAFFMKiuFutV5oYudCmaP9yMiu+KA2s=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr12389485ywb.10.1655735738048; Mon, 20
 Jun 2022 07:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220620142426.15040-1-lmichel@kalray.eu>
In-Reply-To: <20220620142426.15040-1-lmichel@kalray.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2022 15:35:26 +0100
Message-ID: <CAFEAcA-++01L_S=G13AtMO9n4H0vvHZf3M68SOTAJ4sOzu9KGw@mail.gmail.com>
Subject: Re: [PATCH 0/7] semihosting: proper QEMU exit on semihosted exit
 syscall
To: Luc Michel <lmichel@kalray.eu>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Jun 2022 at 15:25, Luc Michel <lmichel@kalray.eu> wrote:
> This series implements a clean way for semihosted exit syscalls to
> terminate QEMU with a given return code.
>
> Until now, exit syscalls implementations consisted in calling exit()
> with the wanted return code. The problem with this approach is that
> other CPUs are not properly stopped, leading to possible crashes in
> MTTCG mode, especially when at_exit callbacks have been registered. This
> can be the case e.g., when plugins are in use. Plugins can register
> at_exit callbacks. Those will be called on the CPU thread the exit
> syscall is comming from, while other CPUs can continue to run and thus
> call other plugin callbacks.

The other option would be to say "if you register an atexit
callback in your plugin that's your problem to sort out" :-)
There's lots of situations where code inside QEMU might just
call exit(), not just this one. (Mostly these are "we detected
an error and decided to just bail out" codepaths.)

Is there a situation where we get a crash that doesn't involve
code in a plugin doing something odd?

thanks
-- PMM

