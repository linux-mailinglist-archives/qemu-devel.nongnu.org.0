Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743CB6E4FD6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 20:05:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poTCW-0005kP-59; Mon, 17 Apr 2023 14:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1poTCR-0005hV-T8
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 14:03:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1poTCP-0007GU-ET
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 14:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681754612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIMFLhKFmQImPl1qfpvTE4q/2phmpZqK5GqbApgg/iE=;
 b=dt15Tk5De24E6GF9te/8HC9qp6EXLM/A1Q+VvDYv7ITAVyqvuTcWrz+6XE5Z3ayK1eeg5l
 yZ3erPAS3REfsmxmfzZv00jnb87KPzsS45colAQm/C5PG1t1pXwTIPPwBq+oSuBgVOP8Ni
 r34soWYEHe9jylywKTk4gBexm5qMssE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-cHHcP346PUuUTtOnfmyWew-1; Mon, 17 Apr 2023 14:03:28 -0400
X-MC-Unique: cHHcP346PUuUTtOnfmyWew-1
Received: by mail-pj1-f69.google.com with SMTP id
 q7-20020a17090a7a8700b002474decceddso2263596pjf.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 11:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681754607; x=1684346607;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jIMFLhKFmQImPl1qfpvTE4q/2phmpZqK5GqbApgg/iE=;
 b=OtPRUGIzYgLXR6oxqwfP1xesDBnFvqRInEFuu9W8F34p9c8YIXivPj0tmAcDVlUMzp
 d6KaMTVACEkiVts3tTtCsHnMQdpYUWm7LWvURhNTiRFPKIQ102TUxVkgoiC8+bFLT8UA
 z70DlgeVZGFnOz3oNZijfiyG3nbmI4Imd9D7AphFsBOh+s98W+TrWs3pfKMCofc/Lfrn
 WyFOZx2xbSZKHryOFJz11fy5+aZQ0mFhP2YvjAoy9bpbnywdaRKofrvtNqh8GB2g50U2
 83CinlIlVtOnGsGRLZ+q2j9A4Ur4pcgWXN4qKGZrfxakRQV2bihGrmDV3XUvnplhhnE0
 g1eg==
X-Gm-Message-State: AAQBX9dpgzWKNntd8kdbSZzQsqEEeCqXBo0dZyYAr0bKngWXsTt68LML
 R3BHzF2KqzGH4RoIkAqv8c0vqlae2cv4ricTL2jsqAuz3R7kumg/2f0yY216KUjHrwm+o1Xas0z
 ohZGcZ9BH13an9Xaj90j3ezLpySVc6Yk=
X-Received: by 2002:a17:90a:4d48:b0:246:97d2:dc0d with SMTP id
 l8-20020a17090a4d4800b0024697d2dc0dmr16899611pjh.39.1681754607307; 
 Mon, 17 Apr 2023 11:03:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350btSwPsfx9ILGHuP+BYHaD3pw32SVsEhLiyqJUdrmrExvgEiAwuNWRpBxCk6ugg98yif74brtHeXxhfyp4ka5I=
X-Received: by 2002:a17:90a:4d48:b0:246:97d2:dc0d with SMTP id
 l8-20020a17090a4d4800b0024697d2dc0dmr16899568pjh.39.1681754606929; Mon, 17
 Apr 2023 11:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
In-Reply-To: <20230417134321.3627231-1-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 17 Apr 2023 14:03:15 -0400
Message-ID: <CAFn=p-aVB_Gwm2Rsa0zvDOdQuCQNURvwz53yg+sSy3JZK7Cg2A@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] testing/next: avocado, docs, gitlab
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Apr 17, 2023 at 9:43=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> This is the current state of my testing tree. It contains a few
> patches that didn't make it into 8.0 and more testing fixes including
> a bump to the avocado release including Thomas' --max-parallel-tasks
> hack to avoid running the tests in parallel. So far it doesn't look
> like its causing any problems although I am seeing some timeouts on
> the BSDs.

Oh, looks like you answered my question here. OK then!


>
> The following patches need review:
>
> tests/avocado: use the new snapshots for testing
> tests/requirements.txt: bump up avocado-framework version to 101.0 (0 ack=
s, 1 sobs, 1 tbs)
>
> Alex Benn=C3=A9e (2):
>   tests/avocado: use the new snapshots for testing
>   qemu-options: finesse the recommendations around -blockdev
>
> Kautuk Consul (1):
>   tests/requirements.txt: bump up avocado-framework version to 101.0
>
> Philippe Mathieu-Daud=C3=A9 (1):
>   tests/avocado: Add set of boot tests on SBSA-ref
>
> Thomas Huth (2):
>   gitlab-ci: Avoid to re-run "configure" in the device-crash-test jobs
>   scripts/device-crash-test: Add a parameter to run with TCG only
>
>  MAINTAINERS                              |   1 +
>  .gitlab-ci.d/buildtest.yml               |   6 +-
>  qemu-options.hx                          |  24 +++-
>  scripts/device-crash-test                |   4 +-
>  tests/Makefile.include                   |  18 ++-
>  tests/avocado/machine_aarch64_sbsaref.py | 158 +++++++++++++++++++++
>  tests/avocado/tuxrun_baselines.py        | 170 +++++++++++++++++++----
>  tests/requirements.txt                   |   2 +-
>  8 files changed, 343 insertions(+), 40 deletions(-)
>  create mode 100644 tests/avocado/machine_aarch64_sbsaref.py
>
> --
> 2.39.2
>


