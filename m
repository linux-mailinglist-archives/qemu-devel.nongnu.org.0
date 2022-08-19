Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C6B599D1C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 15:49:42 +0200 (CEST)
Received: from localhost ([::1]:58496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP2NZ-0005Ak-GM
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 09:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oP2Lu-0003gj-F4
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 09:47:58 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oP2Lm-0005NV-E2
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 09:47:58 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso2506098wmr.3
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 06:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=uNl5yJmogQXIEdqz0BeUYFgWgMK+/WCXI3l/MwhLrIE=;
 b=ACpEtIpsGlLFDBm1xvVKlzYBP+4b7ntpiUXXNCqPHA+5BF1leJnar6kpU83ZjzI0XD
 k7SY5QRJLuYwu3qiVK6yjhbDZ/dOjnJ4VDYK1WHVpkEGTx670yfpso/tH5vc5vV2O0li
 1+KwR0fTJm6O0pzRdjgZ5YDyDCsQ63KMp4wtzJaz+MSwxIAOhIhZ7xMx43d5SPUjp/G9
 NOSYnt3dc0xPVCUwDI7WfGgiP6DIUYw268jLR9enWKhzz45ChRQoKfKGHXPIfkCsnSMp
 LNFsBy6f9tPBO2mYax4Z49vY0bWrL5IbbW61nkVDzS3lkVffU2Wu410VevKnJhjI87gQ
 7O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=uNl5yJmogQXIEdqz0BeUYFgWgMK+/WCXI3l/MwhLrIE=;
 b=mGQJguHzvRk2NbyBneCyXDFhkyzdlM/Z++bTDdZ4qiKQ78Ir7e39zeHf/bmoaYNoiF
 o3A/eKe3Lu2fJFJftfidhFC5sad9JJz238JalWqL7bvciNYzGEPgZxN0OuaHnxPd2Zch
 bpAd0I6B2uKTr4pamJ84yy+C9XbUUisOBzjbLEOn5JNGT66cUc1LhrfxSLy0DhCGwupZ
 ointl+80+DlXdUrpj7u04vHG5dy0j0G5wwmLxxA+EyOTk4C/PmbWQOAOp51dYuy/SOIz
 OAMSCQJn15Z63cJDs2D9J6tVK2O8hDxK/hgPGUUUxYp2encLyurxMdYskDydBVzLePmG
 arKQ==
X-Gm-Message-State: ACgBeo1wNeYZoyN4vlceaNWPfCwJVhC7aETsI5pVPZqQ7Bow18UFDRJ3
 PlVd3QS4589O9jel7Q72242w0g==
X-Google-Smtp-Source: AA6agR4GQfVMnyOIkk9x1F21W90x+mNMPzc2k1V/PpPlvGIDG7NLdwKiEoKUh12DiyPZvTpCfPyQKA==
X-Received: by 2002:a05:600c:1551:b0:3a6:2f4d:aeca with SMTP id
 f17-20020a05600c155100b003a62f4daecamr2908674wmg.100.1660916868669; 
 Fri, 19 Aug 2022 06:47:48 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003a5ca627333sm8382247wme.8.2022.08.19.06.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 06:47:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82FC91FFB7;
 Fri, 19 Aug 2022 14:47:47 +0100 (BST)
References: <ae24ca7c-fc8e-ae34-5f0f-0d70840efdbe@eldorado.org.br>
 <b2c49e7f-9b62-86bc-d714-77367df702ca@eldorado.org.br>
 <CAFEAcA_8JUgKPM=XF4_94ecJtgrt1Tz1RcMHqZHbVpn_bWwMHQ@mail.gmail.com>
User-agent: mu4e 1.8.9; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc <qemu-ppc@nongnu.org>, Rafael Peria de
 Sene <rpsene@br.ibm.com>, Cleber Rosa <crosa@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>, =?utf-8?Q?C=C3=A9dric?=
 Le Goater
 <clg@kaod.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Using Unicamp's Minicloud for the QEMU CI
Date: Fri, 19 Aug 2022 14:31:34 +0100
In-reply-to: <CAFEAcA_8JUgKPM=XF4_94ecJtgrt1Tz1RcMHqZHbVpn_bWwMHQ@mail.gmail.com>
Message-ID: <87zgg02vlo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 18 Aug 2022 at 17:11, Lucas Mateus Martins Araujo e Castro
> <lucas.araujo@eldorado.org.br> wrote:
>> Lucas wrote:
>>> I would like gauge the interest in using Minicloud's infrastructure[1]
>>> for the CI, talking with some people from there they are interested.
>>> It has both ppc64 and pp64le images, multiple versions of 4 distros
>>> (Ubuntu, Fedora, Debian and CentOS).
>
>> ping
>>
>> Any interest in this?
>
> PPC host is something we're currently missing in our testing, so definite=
ly
> yes in principle. I don't know what the specifics of getting new runners
> set up is, though. Alex ?

So the first thing is can we have a minicloud VM dedicated to CI 24/7?
Our current usage of the GitLab CI model relies on the runner always
running on the host rather than being spun up on demand.

After that you need to extend:

  scripts/ci/setup/build-environment.yml
  scripts/ci/setup/gitlab-runner.yml

to setup a ppc64 host and setup the gitlab runner on it. We document
this at:

  https://qemu.readthedocs.io/en/latest/devel/ci.html#machine-setup-howto

After that we can define a new variable in the GitLab config
(PPC64_RUNNER_AVAILABLE) and then define some custom build jobs in:

  .gitlab-ci.d/custom-runners/

to run the build and test on the native ppc64 HW.

It looks like your branch has most of this stuff already but I couldn't
see any successful runs. I think this is tripped up by our switch to not
trigger CI by default. See the documentation about QEMU_CI:

  https://qemu.readthedocs.io/en/latest/devel/ci.html#setting-aliases-in-yo=
ur-git-config

--=20
Alex Benn=C3=A9e

