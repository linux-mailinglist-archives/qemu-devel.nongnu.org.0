Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF526A0D47
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:47:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDnv-0007iI-2z; Thu, 23 Feb 2023 10:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDns-0007fT-LY
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:46:40 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDnq-0001Xh-PT
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:46:40 -0500
Received: by mail-wr1-x436.google.com with SMTP id bw19so393943wrb.13
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9CS+pAxjox9jdwdeXzmizD5qfRVpGY8b4Ckkn2t751Q=;
 b=hYUwzTlTe69pOrANRWd53bdEltGkPNWYsQO4n9qJdyu5UIY0kqzfnNa1BYY37Ab6VL
 1HD6cOz5++Sha1PVfFTIVtrTuzue/g6kyQGsCwirw6/gVCQD30eIEUJjeLe+oWMnKKMt
 J6YkpRFptxMfLIyVq+gvcl3vrNX83fOyK63FldzSoct3RCK6mSeMh5BOnpSdQTUy9yJp
 ISUDVB1dbyo1ntBP0tzyhGOflUzk8CPNOUwm5bwq0hyKEgnCwQLTcWse3N/KaEoHLM+8
 Kk/u0R0nv1tIyOwHQQli31J9bY5GEZSwtJnAwJcajxRmeOZ9yUhF2HX1I6sNYkfAAx5v
 v9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9CS+pAxjox9jdwdeXzmizD5qfRVpGY8b4Ckkn2t751Q=;
 b=0lPU3x6jGpne3+HMpswCUOQumpBaP7y/PWjGPxmgapQKoFNZ7B3ZgBtwxODjmBJN5x
 q42C58EVCKtgp8DiIltNwKpRonSV7c4sqQ88aO8nTFAGv19dbyV0pVj6qoOreGdFYoWS
 EjJj42naHeFZwk/dyl1rWgvTAlcYlj78PWG7D4POiYgscNIDopq8AYm6zejCEFYob9eV
 ASIwzZC9J0FjM6Fl97VBjyLDzKTmMq+JKLu6Cg8dVqqbinAXB2aKEYNn0itKy4wGE+V4
 reihS/W0wnnC39CBDmXLBq/5Hmj36a/yNEZiDS7hvwt8q21JSk0tTM5gyoHj6gT6UleS
 409g==
X-Gm-Message-State: AO0yUKWuKRWiqVq0w4Y0LVwThGIC+zKUbUsiWxs3uZFepgb/DaqCc/U/
 njhs5+vC1liGF5hNGawwB+HTzA==
X-Google-Smtp-Source: AK7set8lubcIow/Y72yOwioM6YwggWNpBAHJoSHkkZlPljkCLKXXEe1g7INrxDs/trdjKMP8TQDD0A==
X-Received: by 2002:adf:f082:0:b0:2c5:8736:c022 with SMTP id
 n2-20020adff082000000b002c58736c022mr9741842wro.62.1677167196189; 
 Thu, 23 Feb 2023 07:46:36 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a5d58d8000000b002c7066a6f77sm7505935wrf.31.2023.02.23.07.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:46:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D90F1FFB7;
 Thu, 23 Feb 2023 15:46:35 +0000 (GMT)
References: <20230223142154.31975-1-farosas@suse.de>
 <Y/d+9jsvwF5tySlv@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH 0/1] ci: Speed up container stage
Date: Thu, 23 Feb 2023 15:43:37 +0000
In-reply-to: <Y/d+9jsvwF5tySlv@redhat.com>
Message-ID: <877cw8pep0.fsf@linaro.org>
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Feb 23, 2023 at 11:21:53AM -0300, Fabiano Rosas wrote:
>> I'm not sure if this was discussed previously, but I noticed we're not
>> pulling the images we push to the registry at every pipeline run.
>>=20
>> I would expect we don't actually need to rebuild container images at
>> _every_ pipeline run, so I propose we add a "docker pull" to the
>> container templates. We already have that for the docker-edk2|opensbi
>> images.
>>=20
>> Some containers can take a long time to build (14 mins) and pulling
>> the image first without building can cut the time to about 3
>> mins. With this we can save almost 2h of cumulative CI time per
>> pipeline run:
>
> The docker.py script that we're invoking is already pulling the
> image itself eg to pick a random recent job:
>
>   https://gitlab.com/qemu-project/qemu/-/jobs/3806090058
>
> We can see
>
>   $ ./tests/docker/docker.py --engine docker build -t "qemu/$NAME" -f
> "tests/docker/dockerfiles/$NAME.docker" -r
> $CI_REGISTRY/qemu-project/qemu 03:54
>   Using default tag: latest
>   latest: Pulling from qemu-project/qemu/qemu/debian-arm64-cross
>   bb263680fed1: Pulling fs layer
>   ...snip...
>
> none the less it still went ahead and rebuilt the image from scratch
> so something is going wrong here. I don't know why your change adding
> an extra 'docker pull' would have any effect, given we're already
> pulling, so I wonder if that's just coincidental apparent change
> due to the initial state of your fork's container registery.
>
> Whenever I look at this I end up wishing out docker.py didn't exist
> and that we could just directly do
>
>   - docker pull "$TAG"
>   - docker build --cache-from "$TAG" --tag "$TAG" -f "tests/docker/$NAME.=
docker"
>
> as that sould be sufficient to build the image with caching.

I think we should be ready to do that now as we have flattened all our
dockerfiles. The only other thing that docker.py does is nicely add a
final step for the current user so you can ensure all files generated in
docker cross compile images are still readable on the host.

>> We would need to devise a mechanism (not included here) to force the
>> re-build of the container images when needed, perhaps an environment
>> variable or even a whole new "container build" stage before the
>> "container" stage.
>>=20
>> What do you think?
>
> We definitely want the rebuild to be cached. So whatever is
> broken in that regard needs fixing, as this used to work AFAIK.
>
>
> Ideally we would skip the container stage entirely for any
> pull request that did NOT include changes to the dockerfile.

That would be ideal.

> The problem is that the way we're using gitlab doesn't let
> that work well. We need to setup rules based on filepath.
> Such rules are totally unreliable for push events in
> practice, because they only evaluate the delta between what
> you just pushed and what was already available on the server.
> This does not match the content of the pull request, it might
> be just a subset.
>
> If we had subsystem maintainers opening a merge request for
> their submission, then we could reliably write rules based
> on what files are changed by the pull request, and entirely
> skip the containers stage most of the time, which would be
> an even bigger saving.

Our first tentative steps away from an email process?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

