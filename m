Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23323421411
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 18:28:23 +0200 (CEST)
Received: from localhost ([::1]:60052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXQpB-0003rj-LM
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 12:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mXQmf-0001rL-Nu
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 12:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mXQmY-00008p-Qc
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 12:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633364736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfLi0b7D2Segw8U2NJlsdUoJLY1FycnhKu0IYQcDvfE=;
 b=cvhu3KAqcQupdksI932h8lRPNVmalmnCaR4dZbJwXtz6fauiPuEif7p1PPN3kY9LaR1oEw
 OiumiBJHtZV12/6iowJFT+PjOF8QGBYM3AJSIAZK2dJ7KWQ9E5aBwTpu5PDoruiZTjraX9
 9NrpfWoy7O2EZQYcMarulC5oCxXzdag=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-TKfrYWwlPyqHAziQbVWr8g-1; Mon, 04 Oct 2021 12:25:33 -0400
X-MC-Unique: TKfrYWwlPyqHAziQbVWr8g-1
Received: by mail-pg1-f199.google.com with SMTP id
 s19-20020a63e813000000b00287d976d152so10869132pgh.3
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 09:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tfLi0b7D2Segw8U2NJlsdUoJLY1FycnhKu0IYQcDvfE=;
 b=4alV8gUJkfG6a+KLkmX5FH2mf+P3ir3RptCWXu2uqOq6eYzkUo5bm+XDVW+ifAhAsw
 ezfqgkUmdbGX8GWNzqRbamUMiFKrS48lHFiKpNE5u4vTfX1xkNyvUyi74jeP+u2d7VXB
 FBzu+LsVhXwHLkVhhmzNNXL2AjykU5a95x4eEnuVOnVjAVLBMZeAvl9BywN+WGI3vBcT
 Bty9Ccc6vJwkW9oTy1zIy2T/Q9UzatGuuWsF1RiOrhdtl8bGDyOrkBGPN/4RkKOP1jZu
 QMYnRm2p0pFYLy8JpqXLefRjl4p3UhhuN5so5hP3mktThT/2MKpsdxEymx+A5aV1lVMM
 IgsA==
X-Gm-Message-State: AOAM531aBSP+p0lC0miblOLFIa7mT/nhip7IvFM9g1cHusbvrRF/rpOD
 EBDw+lxvLXLc/m+MVbDGUfWNmOtAf64/3c7YbcN9C6FBx9/08LRlLevbmwnVz/qEMQDIw/J8YlL
 nTykKE1Jwcii4dvNWia1Ph9qE+GL1Bqs=
X-Received: by 2002:a05:6a00:130c:b0:444:f9d4:d800 with SMTP id
 j12-20020a056a00130c00b00444f9d4d800mr27344858pfu.38.1633364732458; 
 Mon, 04 Oct 2021 09:25:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK7yy9oV4KrAJw0c1r90NnWmCKcmxofJXhkRFgL3oTmnVUaUn7ahRZH2JXFYdDxxKbFog0NLzDYEcgfv093f0=
X-Received: by 2002:a05:6a00:130c:b0:444:f9d4:d800 with SMTP id
 j12-20020a056a00130c00b00444f9d4d800mr27344818pfu.38.1633364732117; Mon, 04
 Oct 2021 09:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211004154308.2114870-1-alex.bennee@linaro.org>
In-Reply-To: <20211004154308.2114870-1-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 4 Oct 2021 13:25:05 -0300
Message-ID: <CAKJDGDZCJPJpOrzwAhWUFroHsZz=MbqxrOF2MuoKSH9OxoPJKA@mail.gmail.com>
Subject: Re: [RFC PATCH] .github: move repo lockdown to the v2 configuration
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 4, 2021 at 12:45 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> I was getting prompted by GitHub for new permissions but it turns out
> per https://github.com/dessant/repo-lockdown/issues/6:
>
>   Repo Lockdown has been rewritten for GitHub Actions, offering new
>   features and better control over your automation presets. The legacy
>   GitHub App has been deprecated, and the public instance of the app
>   has been shut down.
>
> So this is what I've done.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .github/lockdown.yml           | 34 ------------------------
>  .github/workflows/lockdown.yml | 47 ++++++++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+), 34 deletions(-)
>  delete mode 100644 .github/lockdown.yml
>  create mode 100644 .github/workflows/lockdown.yml
>
> diff --git a/.github/lockdown.yml b/.github/lockdown.yml
> deleted file mode 100644
> index d3546bd2bc..0000000000
> --- a/.github/lockdown.yml
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -# Configuration for Repo Lockdown - https://github.com/dessant/repo-lock=
down
> -
> -# Close issues and pull requests
> -close: true
> -
> -# Lock issues and pull requests
> -lock: true
> -
> -issues:
> -  comment: |
> -    Thank you for your interest in the QEMU project.
> -
> -    This repository is a read-only mirror of the project's repostories h=
osted
> -    at https://gitlab.com/qemu-project/qemu.git.
> -    The project does not process issues filed on GitHub.
> -
> -    The project issues are tracked on GitLab:
> -    https://gitlab.com/qemu-project/qemu/-/issues
> -
> -    QEMU welcomes bug report contributions. You can file new ones on:
> -    https://gitlab.com/qemu-project/qemu/-/issues/new
> -
> -pulls:
> -  comment: |
> -    Thank you for your interest in the QEMU project.
> -
> -    This repository is a read-only mirror of the project's repostories h=
osted
> -    on https://gitlab.com/qemu-project/qemu.git.
> -    The project does not process merge requests filed on GitHub.
> -
> -    QEMU welcomes contributions of code (either fixing bugs or adding ne=
w
> -    functionality). However, we get a lot of patches, and so we have som=
e
> -    guidelines about contributing on the project website:
> -    https://www.qemu.org/contribute/
> diff --git a/.github/workflows/lockdown.yml b/.github/workflows/lockdown.=
yml
> new file mode 100644
> index 0000000000..20e6208487
> --- /dev/null
> +++ b/.github/workflows/lockdown.yml
> @@ -0,0 +1,47 @@
> +# Configuration for Repo Lockdown - https://github.com/dessant/repo-lock=
down
> +
> +name: 'Repo Lockdown'
> +
> +on:
> +  issues:
> +    types: opened

I see the "issues" tab is already disabled on the QEMU repository at
GitHub. Maybe we don't need an action for that.

> +  pull_request_target:
> +    types: opened
> +
> +permissions:
> +  issues: write
> +  pull-requests: write
> +
> +jobs:
> +  action:
> +    runs-on: ubuntu-latest
> +    steps:
> +      - uses: dessant/repo-lockdown@v2
> +        with:
> +          issue-comment: |
> +            Thank you for your interest in the QEMU project.
> +
> +            This repository is a read-only mirror of the project's repos=
tories hosted
> +            at https://gitlab.com/qemu-project/qemu.git.
> +            The project does not process issues filed on GitHub.
> +
> +            The project issues are tracked on GitLab:
> +            https://gitlab.com/qemu-project/qemu/-/issues
> +
> +            QEMU welcomes bug report contributions. You can file new one=
s on:
> +            https://gitlab.com/qemu-project/qemu/-/issues/new
> +          lock-issue: true
> +          close-issue: true
> +          pull-comment: |
> +            Thank you for your interest in the QEMU project.
> +
> +            This repository is a read-only mirror of the project's repos=
tories hosted
> +            on https://gitlab.com/qemu-project/qemu.git.
> +            The project does not process merge requests filed on GitHub.
> +
> +            QEMU welcomes contributions of code (either fixing bugs or a=
dding new
> +            functionality). However, we get a lot of patches, and so we =
have some
> +            guidelines about contributing on the project website:
> +            https://www.qemu.org/contribute/
> +          lock-pull: true
> +          close-pull: true
> --
> 2.30.2
>
>

Besides the "issues" comment, it looks good to me.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


