Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0A26A2290
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:54:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVe8I-0005lE-Ui; Fri, 24 Feb 2023 14:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVe8E-0005hz-HF
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:53:28 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVe8B-0000vZ-UG
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:53:26 -0500
Received: by mail-wm1-x333.google.com with SMTP id k37so441159wms.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 11:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=heQJMkPWeRo/E1Ll4MrthG977DZ0aqLXG1p6t8inyAE=;
 b=WcIOZ9hKp+NH+w0voWRhabbA4I9pUyPozKp61GqS1NWkGaUlQQMsuojUWwOn0taIbA
 nLRKyRbEU1EXIhHc6u27BrAEpupFzCj0TCfXzLxRW9/4zPg1xSq/oURk89m0R0sTvQrH
 dD9Jza+NAEHPjxOAOR8qIUg2PUOl4g0O1Fc1bQxF/cF2v0L+WGBrfv6PkEs0wUxSDIfW
 AyWWden2IGVRDqaZA32zmn24N+j2CTtLFomaK6dquxNSAf6ta7eHdQO/qhMFeddEKiRM
 9Se+T5cIeudXHY6s8uCQmZ5XaACysYv/y85spniAcITbooJF7bBvQDgy9vwG6VShUsbt
 Y40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=heQJMkPWeRo/E1Ll4MrthG977DZ0aqLXG1p6t8inyAE=;
 b=o7tpTmjhCAv0xTut6V4kMqGQwlukqlfAZ7kg2Xu1naSzTrxX3N4wFQW3YgxwX8g5zm
 t58aE9sbfLy8nSxJfBX5cIfFZeiuKS9zb5yIulcEmHqxJHDI7I6zhL7ZG+FRQZr+AJ5g
 TQ/qQZKv77X9N+lCFlBxBX6xYD005zbNpXZb2Mgpfv6N0SHeWZL8slrhplmFWN2cPQrD
 UOiBwNQlikVwzkxmlqxNizPzSrzbu3gWHVpn44IJwhWrswpFCjcFlEIFTLbeJIcc+jgE
 lVwjvjRk+YNlbNvTPpPfZ99SIQn5Z2T8QoPGqBq/IUjVeFrfEXc5SGvqEPbPkq+qBQyj
 yCow==
X-Gm-Message-State: AO0yUKWv3s1KaHB/4wIoKTP6/59HUaaFGulJZB5jQu2TAGMmtV5XzOq7
 MjaDCtDIBlGStJ+mznTSSgYOpA==
X-Google-Smtp-Source: AK7set8ybaWn/RwP/rr7uYx4F+3zIOcvRu0GNUBFZ3JFjGVp+ODqJXemfMe1aGXX5UXxO9MwdV5G3g==
X-Received: by 2002:a05:600c:6015:b0:3ea:f883:4f5 with SMTP id
 az21-20020a05600c601500b003eaf88304f5mr3302812wmb.17.1677268400652; 
 Fri, 24 Feb 2023 11:53:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a05600c348200b003e8f0334db8sm4046463wmq.5.2023.02.24.11.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 11:53:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DDA9A1FFB7;
 Fri, 24 Feb 2023 19:53:19 +0000 (GMT)
References: <20230223155720.310593-1-alex.bennee@linaro.org>
 <CAFEAcA_bqLjiF6VHABTRop7HsdgTpd1KVJzTgpXvXgo+uuABtg@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/13] testing updates (gitlab, cirrus, docker, avocado,
 windows)
Date: Fri, 24 Feb 2023 19:52:14 +0000
In-reply-to: <CAFEAcA_bqLjiF6VHABTRop7HsdgTpd1KVJzTgpXvXgo+uuABtg@mail.gmail.com>
Message-ID: <87sfeurgb4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

> On Thu, 23 Feb 2023 at 15:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce6=
9b8:
>>
>>   Merge tag 'net-pull-request' of https://github.com/jasowang/qemu
>> into staging (2023-02-21 11:28:31 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-230223-1
>>
>> for you to fetch changes up to e9969376f01180d7bcbee25ae8333983da7eda2c:
>>
>>   cirrus.yml: Improve the windows_msys2_task (2023-02-23 15:48:23 +0000)
>>
>> ----------------------------------------------------------------
>> testing updates:
>>
>>   - ensure socat available for tests
>>   - skip socat tests for MacOS
>>   - properly clean up fifos after use
>>   - make fp-test less chatty
>>   - store test artefacts on Cirrus
>>   - control custom runners with QEMU_CI knobs
>>   - disable benchmark runs under tsan build
>>   - update ubuntu 2004 to 2204
>>   - skip nios2 kernel replay test
>>   - add tuxrun baselines to avocado
>>   - binary build of tricore tools
>>   - export test results on cross builds
>>   - improve windows builds
>>
>> ----------------------------------------------------------------
>
> So I've been applying pullreqs relying on a combination of the
> private-runner CI jobs plus using the free minutes allowance
> on my personal gitlab account, and ad-hoc local builds. I'm
> a bit reluctant to do that for this one though, because it's
> touching all the gitlab config and we won't be able test that
> that is OK until we can do a full run with the standard config.
> What do you think ?

This was my run of the tag:

  https://gitlab.com/stsquad/qemu/-/pipelines/787068318/

The FreeBSD failure is the dodgy migration test and the openbsi/edk2
builds fails as 18.04 just went EOL I think. I don't currently have the
s390x runner on my config.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

