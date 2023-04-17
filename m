Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C816E4E9D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:52:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poS3j-0002Ri-9Q; Mon, 17 Apr 2023 12:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1poS3f-0002P7-8D
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:50:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1poS3c-0002s2-5d
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681750220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZYb6wB5wi2bPpLSTO7isOkM0GXEXq1uxyXyPygDCBs=;
 b=gqlINlo4pQKcpjg0dTRyHnvT9eRR0cEJ6fgMzNF7Dmtvbe1kHizBghWfKcG+YdJjsXSU3i
 Nz5CAYanswNdxf0Kb4mDG0XNC7FLl24XdIa2/bXdX+5DSg2gHxpt6Dl92nltQQ2fDSgxZ0
 17DK7uuIMqUTJDLIbFudya9rrFpJQQY=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-m1w7QglQNg-0thLD8cysGg-1; Mon, 17 Apr 2023 12:50:19 -0400
X-MC-Unique: m1w7QglQNg-0thLD8cysGg-1
Received: by mail-pg1-f197.google.com with SMTP id
 19-20020a630113000000b0051b61a0035bso4896438pgb.10
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681750218; x=1684342218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qZYb6wB5wi2bPpLSTO7isOkM0GXEXq1uxyXyPygDCBs=;
 b=ZJwuyh6l0gLUJT+fgklEqT2Wh5YZhgAkKTPfa4ZHuBy+0FiRzzv9F4pkBNfluCnSjT
 HyEmMEAzCNPXpInasgghbumaPDDHlWJ/T6qzI3Akq2IS84/WxHoLsl/QOmQ/zuPPyxvV
 o+flZiPwYJxxt6jwkKaSOd34XRslDGJ3XkcDaqEft1z27KV2DW9a15mynJkR3ynhyRzA
 kf/sIMcJ6a3q47xOiJmwQOBIfrN25PPtuhtwTrn6M2zcVknrMf6cVAa3X6m9txltutJ4
 kRqPgdENuMf0loIHoLF7/CrGPwoqWNvO6igU2C3fJ9bQPpt5XkQpIWUAZx44AMgAn0Ev
 fT/g==
X-Gm-Message-State: AAQBX9fdhwt+fIYx4gkrFmL4Eh++M0rnLrG5N2dhggLZUYN995QW0oHz
 sL/KAonzcov63PJ0YAuR+exD9oPvFZAk0EGPmA53yfniPOGbElsXx65hXgEIAz+8Cjl0UyrxXG7
 X0TCNImDA4YCpaz7/ZoccrVbu3DMcHzY=
X-Received: by 2002:a17:90a:cc0e:b0:247:9d19:311f with SMTP id
 b14-20020a17090acc0e00b002479d19311fmr3301254pju.30.1681750217810; 
 Mon, 17 Apr 2023 09:50:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bXsXOd66SSO7UCsdiycA5DqJEHTf678Pxr5jsjWN17JBKovUOkZSwge7dWs55i3ERifu65qNoeltnMyjKMtF0=
X-Received: by 2002:a17:90a:cc0e:b0:247:9d19:311f with SMTP id
 b14-20020a17090acc0e00b002479d19311fmr3301217pju.30.1681750217432; Mon, 17
 Apr 2023 09:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
In-Reply-To: <20230417134321.3627231-2-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 17 Apr 2023 12:50:06 -0400
Message-ID: <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Jan Richter <jarichte@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, 
 Kautuk Consul <kconsul@linux.vnet.ibm.com>, 
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
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
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Apr 17, 2023 at 9:43=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>
> Avocado version 101.0 has a fix to re-compute the checksum
> of an asset file if the algorithm used in the *-CHECKSUM
> file isn't the same as the one being passed to it by the
> avocado user (i.e. the avocado_qemu python module).
> In the earlier avocado versions this fix wasn't there due
> to which if the checksum wouldn't match the earlier
> checksum (calculated by a different algorithm), the avocado
> code would start downloading a fresh image from the internet
> URL thus making the test-cases take longer to execute.
>
> Bump up the avocado-framework version to 101.0.
>
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
>
> ---
> v2
>   - limit --max-parallel-tasks $(JOBS_OPTION:-j%=3D%)
> ---
>  tests/Makefile.include | 18 +++++++++++-------
>  tests/requirements.txt |  2 +-
>  2 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 9422ddaece..a4de0ad5a2 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>  # download all vm images, according to defined targets
>  get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDOR=
A_31_DOWNLOAD))
>
> +JOBS_OPTION=3D$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS))=
))
> +
>  check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> -       $(call quiet-command, \
> -            $(TESTS_PYTHON) -m avocado \
> -            --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_RES=
ULTS_DIR) \
> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
> -                       --filter-by-tags-include-empty-key) \
> -            $(AVOCADO_CMDLINE_TAGS) \
> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
> +       $(call quiet-command,                                            =
       \
> +            $(TESTS_PYTHON) -m avocado                                  =
               \
> +            --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_RES=
ULTS_DIR)  \
> +            $(if $(AVOCADO_TAGS),,                                      =
       \
> +                       --filter-by-tags-include-empty                   =
       \
> +                       --filter-by-tags-include-empty-key)              =
       \
> +               --max-parallel-tasks $(JOBS_OPTION:-j%=3D%)              =
         \
> +            $(AVOCADO_CMDLINE_TAGS)                                     =
       \
> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS),            =
       \
>              "AVOCADO", "tests/avocado")
>
>  check-acceptance-deprecated-warning:
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 0ba561b6bd..a6f73da681 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -2,5 +2,5 @@
>  # in the tests/venv Python virtual environment. For more info,
>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>  # Note that qemu.git/python/ is always implicitly installed.
> -avocado-framework=3D=3D88.1
> +avocado-framework=3D=3D101.0
>  pycdlib=3D=3D1.11.0
> --
> 2.39.2
>

I thought there were test failures that prohibited us from bumping the
Avocado-Framework version. Did those get rectified recently?


