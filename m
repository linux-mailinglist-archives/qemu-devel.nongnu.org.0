Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58D6A85BF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:03:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlOf-0004Or-MW; Thu, 02 Mar 2023 11:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXlOa-0004La-TJ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:03:05 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXlOY-0001Qo-5H
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:03:04 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so3636164pjn.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 08:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677772980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WWqq/IWW8i1PFjLExVHmxIlT895UcxyTBgxx5q5Z8lI=;
 b=wD4lWB2dldYTEVwstS/Ed848lh5Gx6HOw6HTkhNWrRxge+PuBLA3WPzxtUyA+VweYq
 B+Gy2c6ok40c1YuoSKZS3LsL47EBTw7P31+ZXn3TSw9GZfMp8wpy6Fclor33Rmegd4Lx
 ijzhAhoPXi0J//ZwKiYcO6NLbvrnp8AlGZK25EtTlwj61WKP+VRtXOV9WkPkwd0g2cfY
 Iu+087tEqHO1IWY3jiAbI+6xTN15zjBXbfU1YYopbRlWPgtx3ZpftA5rha7tWtT2CP+k
 AFmoViwTClc8mENDS4jHR8SuAniJxXGeJ/6agzCB5p8or1I6GUqrX+9WQ/hcF6Ogazg+
 HlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677772980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WWqq/IWW8i1PFjLExVHmxIlT895UcxyTBgxx5q5Z8lI=;
 b=d82VerqLfKwF3+W1XLBJsvx3s5gyXKT+A/3NBG+z+orFJN/tkxEawd7zowiwuHGCnj
 ri+P/GzUDCU5AcCr03c9M0DJF4XHVVM+kZ6MNYxM2zL+Y0KJf4vSCfcyMv3xzGLm2LvT
 wI6E0a+2tHrLqO9iLVJEWG814J/5xxvWpswCXRSsMWGAGUpKO4+4Jlk8qYem/QY3Ik8r
 hkqvcaOABSCewK3SgbKAPnB2I4nWnN6RcnAWRhI8/6lF5pJra71o/3h5KF1mbalreq3W
 +wOmaAhKhO8aXehd7QK/rfl5xOszF8qVL8vH/7gImMC9ajm402LKWglAmgHf1sP4TtAv
 AvIw==
X-Gm-Message-State: AO0yUKVeFl+iqH4I4ukeWInABZS0hfQg/7skJPFgcqIXEZ5Tt/zitXJy
 lfzUg+Z9H/zyJD9x1fPJ16KQgCLkMkBrBeCYXFyJ+g==
X-Google-Smtp-Source: AK7set9ZJqen6BKhq/VSkszQ7q8sVG7GQQ7QoBQobBn0+7hXS7IIAPchjvkX0yD6uK7SZjBiK3zNiQ81N82fF2GscsE=
X-Received: by 2002:a17:90a:4a09:b0:233:be3d:8a42 with SMTP id
 e9-20020a17090a4a0900b00233be3d8a42mr4265044pjh.0.1677772979769; Thu, 02 Mar
 2023 08:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2023 16:02:48 +0000
Message-ID: <CAFEAcA9CzA=072dBPAMxUC2OsFvPfooL7prbS58hErmAApXmgA@mail.gmail.com>
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker, avocado,
 windows)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
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

On Wed, 1 Mar 2023 at 15:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit 627634031092e1514f363fd8659a579398de0f=
0e:
>
>   Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/=
qemu into staging (2023-02-28 15:09:18 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-010323-1
>
> for you to fetch changes up to c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb:
>
>   tests/avocado: disable BootLinuxPPC64 test in CI (2023-03-01 12:51:01 +=
0000)
>
> ----------------------------------------------------------------
> testing updates:
>
>   - ensure socat available for tests
>   - skip socat tests for MacOS
>   - properly clean up fifos after use
>   - make fp-test less chatty
>   - store test artefacts on Cirrus
>   - control custom runners with QEMU_CI knobs
>   - disable benchmark runs under tsan build
>   - update ubuntu 2004 to 2204
>   - skip nios2 kernel replay test
>   - add tuxrun baselines to avocado
>   - binary build of tricore tools
>   - export test results on cross builds
>   - improve windows builds
>   - ensure we properly print TAP headers
>   - migrate away from docker.py for building containers
>   - be more efficient in our handling of build artefacts between stages
>   - enable ztsd in containers so we can run tux_baselines
>   - disable heavyweight PPC64 Boot Linux test in CI
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

