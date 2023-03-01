Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E596A6A80
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:08:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJKi-0001zU-83; Wed, 01 Mar 2023 05:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXJIx-0000bb-8F
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:03:23 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXJIv-00055k-Cf
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:03:22 -0500
Received: by mail-wr1-x432.google.com with SMTP id bx12so9444228wrb.11
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+RFilx9s21tfgq+Juq/fgx06MGhetNBy/bKvbJWj64=;
 b=Iy8yIaPnTHNkLuZ8yChw+oXkIngUG+I3UQgHLQM+McRbDBun3qRhIeXq9Hk3RR1cB5
 qLPi/QwCcN3P7Ka6Fu+H3y5Rr8m/xP5F89Yb6gZpTvlXlpowKL4ds3EsIglhJSduBjp0
 +eUe6C/vP6fKtLjaDJEaMwhfzfNCmlw3cA6uavcBBJYOsYII58ECYZkqgVnxvhdwqVuE
 V13Ssly8RdEmY1iODmjiNmmDAZEwj/lUWf/0D84BRqtZ5jmkMP5rc4ZjbXkEcp0G5lo7
 gpdkW4JkC6pGO+spNRfB/VDyJlHBxCnMcmZuN+cCErG15v+s+8p+LF19EsVq5kidJi/2
 /DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u+RFilx9s21tfgq+Juq/fgx06MGhetNBy/bKvbJWj64=;
 b=2jmVOXTvqLNrdCtGNW/igWqefN5I9E+bJ2XlhDV8SllqEDUktFbK22GWEUTyimva+m
 ZNWICTxCA5SraqcgVaL+47N6exgH8eFYmKf7lVQJf22RekSfe7NLM/9800tdi9CfvJDC
 5n7I6aTrPTlfJtpw4Xvf4R8c+OQy9u/No1OluQ+0vjaX9iJuGslLwJBH3vw8hck+0L7E
 dBRRHvqunRHtWkFMzasvAFXoLH+I2SpZrcpPiOwozz+N7opKDAo/+w6pNnVzK33VoHW1
 iA6coJE3JwVBHM041d+HKUJVFUPLDqvivCDk9tulf0aHHuCXzF8gh7eGM/RTKiIAwAq3
 cF/g==
X-Gm-Message-State: AO0yUKU+Y+h1slMiQrI53BRl8tNUKBfVNfk4cFdWZSwEQIJExY53x4m2
 DoAf8/m/SGhxPF+o6PA8iBSzSQ==
X-Google-Smtp-Source: AK7set/HIZZexr9TWS0+6lxokRRW0hmXVtCjAD6YK6WAd2W54FGONLkIOjWC5uWPKRGEb9ZdZ41JPg==
X-Received: by 2002:a5d:5489:0:b0:2c8:cdde:c28a with SMTP id
 h9-20020a5d5489000000b002c8cddec28amr3988823wrv.59.1677664998772; 
 Wed, 01 Mar 2023 02:03:18 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a5d49c3000000b002c5804b6afasm12476595wrs.67.2023.03.01.02.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 02:03:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BD6C1FFB7;
 Wed,  1 Mar 2023 10:03:18 +0000 (GMT)
References: <20230223155720.310593-1-alex.bennee@linaro.org>
 <CAFEAcA_bqLjiF6VHABTRop7HsdgTpd1KVJzTgpXvXgo+uuABtg@mail.gmail.com>
 <87sfeurgb4.fsf@linaro.org>
 <8fe14d63-ebe1-4a1c-ab1d-ea96718e278e@linaro.org>
 <CAFEAcA8Ae0vQmo4AZkkKKJHruR5EeC9kxVYHcPzU23gurwa0zw@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PULL 00/13] testing updates (gitlab, cirrus, docker, avocado,
 windows)
Date: Wed, 01 Mar 2023 10:02:38 +0000
In-reply-to: <CAFEAcA8Ae0vQmo4AZkkKKJHruR5EeC9kxVYHcPzU23gurwa0zw@mail.gmail.com>
Message-ID: <87o7pcdc0p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

> On Fri, 24 Feb 2023 at 21:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
>>
>> On 24/2/23 20:52, Alex Benn=C3=A9e wrote:
>> >
>> > Peter Maydell <peter.maydell@linaro.org> writes:
>> >
>> >> On Thu, 23 Feb 2023 at 15:57, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
>> >>>
>> >>> The following changes since commit 79b677d658d3d35e1e776826ac4abb28c=
dce69b8:
>> >>>
>> >>>    Merge tag 'net-pull-request' of https://github.com/jasowang/qemu
>> >>> into staging (2023-02-21 11:28:31 +0000)
>> >>>
>> >>> are available in the Git repository at:
>> >>>
>> >>>    https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-230223=
-1
>> >>>
>> >>> for you to fetch changes up to e9969376f01180d7bcbee25ae8333983da7ed=
a2c:
>> >>>
>> >>>    cirrus.yml: Improve the windows_msys2_task (2023-02-23 15:48:23 +=
0000)
>> >>>
>> >>> ----------------------------------------------------------------
>> >>> testing updates:
>> >>>
>> >>>    - ensure socat available for tests
>> >>>    - skip socat tests for MacOS
>> >>>    - properly clean up fifos after use
>> >>>    - make fp-test less chatty
>> >>>    - store test artefacts on Cirrus
>> >>>    - control custom runners with QEMU_CI knobs
>> >>>    - disable benchmark runs under tsan build
>> >>>    - update ubuntu 2004 to 2204
>> >>>    - skip nios2 kernel replay test
>> >>>    - add tuxrun baselines to avocado
>> >>>    - binary build of tricore tools
>> >>>    - export test results on cross builds
>> >>>    - improve windows builds
>> >>>
>> >>> ----------------------------------------------------------------
>> >>
>> >> So I've been applying pullreqs relying on a combination of the
>> >> private-runner CI jobs plus using the free minutes allowance
>> >> on my personal gitlab account, and ad-hoc local builds. I'm
>> >> a bit reluctant to do that for this one though, because it's
>> >> touching all the gitlab config and we won't be able test that
>> >> that is OK until we can do a full run with the standard config.
>> >> What do you think ?
>>
>> What is the alternative, waiting 5 days up to March 1st?
>
> That would be the other option, yes.

As the PR needs a re-base anyway please drop this and I'll respin with
the additional patches from yesterday's testing/next post.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

