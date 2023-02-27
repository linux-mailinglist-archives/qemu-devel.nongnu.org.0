Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AF46A4B4D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:40:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWjLt-0001EJ-AP; Mon, 27 Feb 2023 14:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWjLr-00017g-9u
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:39:59 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWjLp-0004xS-Eu
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:39:59 -0500
Received: by mail-wm1-x32f.google.com with SMTP id p16so4953780wmq.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 11:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waV2fZHa/GIfzkZaMDNJzuEkLKng0aFqCGk+Q4MbQIk=;
 b=FLY1yh3r4l61gv1lz417QoH3fJKFDlKxe8kr6mp2GkXpeKWLhgvnNhZIi9mpqByiWJ
 a+c1oVTgUpafzUJebq+F9lJM4LlOeKWbf6yEQtLCbzGpO0LbCDgvTrUIYX/Jtnd0hK/g
 Ocwot4xOeiUlwXhGPh2BDjmfV8z6zlcSahQn+RVw18enFAC+ukd3XrTAgAbcIwK0ZffR
 ECDV+3LeyXVTP82UDCthJzuRrs/3V2CZjhz0lHYohMnlbtdTSNV/+FXPxEXo8i3eaK3w
 AH9sX6Re5c4jyooX9Zo32T+R6RcvQOU6p8jQuT2AELSiMfTbwLb7QehGWoLYmBFhWZUc
 17Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=waV2fZHa/GIfzkZaMDNJzuEkLKng0aFqCGk+Q4MbQIk=;
 b=e66h3Nu0onc13AjwwMAQy8eo9z6ysDBZmbyMWH5duALM6SoQN5Uc3p86NGstHPxMdQ
 blLBA8lq0IT0AmRD+zRiT+gBJDeoAx7FvLBc9G2tZEmVN7vga8kBoNptmf8QAPBNigBY
 ah0s4tT8BthYV5kKalPdKmFyYJ4/2CbmwDck64n2g6Tvw5edNRd7xYT8c5WofO6CeUxS
 om5/cMEQEy2dQ09zai9f/bR6Nhb9joOFApMcC7BcFpVPAu9QTj3tDf3c82B96yzNjapS
 k71NWe1v4aKEl/vWxxQ20F31h3XJMMMBeECgk/toszf6InZTXU5S83I8AQHCYRwZie+m
 zyYw==
X-Gm-Message-State: AO0yUKUg98r72WZV/c7ko9+X67iKXt6op7Mub2d1TlLR6YYc1qOO9pgC
 MHZ02S69JlohQgGv/IaSL6M/ZQ==
X-Google-Smtp-Source: AK7set/S6v7yweef4NhXrd+zQRVIgL39B5obydK7q7D/Z0WYxj8H6yTng9Wasvon9+tA/pGiKLx1oA==
X-Received: by 2002:a05:600c:3ac7:b0:3ea:f6c4:5f3f with SMTP id
 d7-20020a05600c3ac700b003eaf6c45f3fmr226689wms.13.1677526795737; 
 Mon, 27 Feb 2023 11:39:55 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a1c7315000000b003b47b80cec3sm13724515wmb.42.2023.02.27.11.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 11:39:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE2991FFB7;
 Mon, 27 Feb 2023 19:39:54 +0000 (GMT)
References: <20230227151110.31455-1-farosas@suse.de>
 <20230227151110.31455-2-farosas@suse.de> <87fsargc9w.fsf@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Philippe  =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer
 dos Santos  Moschetta <wainersm@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [RFC PATCH v3 1/1] gitlab: Use plain docker in
 container-template.yml
Date: Mon, 27 Feb 2023 19:39:11 +0000
In-reply-to: <87fsargc9w.fsf@linaro.org>
Message-ID: <877cw2hp85.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Fabiano Rosas <farosas@suse.de> writes:
>
>> Our dockerfiles no longer reference layers from other qemu images so
>> we can now use 'docker build' on them.
>>
>> Also reinstate the caching that was disabled due to bad interactions
>> with certain runners. See commit 6ddc3dc7a8 ("tests/docker: don't use
>> BUILDKIT in GitLab either"). We now believe those issues to be fixed.
>>
>> The COMMON_TAG needed to be fixed for the caching to work. The
>> docker.py script was not using the variable, but constructing the
>> correct URL directly.
>>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>  .gitlab-ci.d/container-template.yml | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/containe=
r-template.yml
>> index c434b9c8f3..519b8a9482 100644
>> --- a/.gitlab-ci.d/container-template.yml
>> +++ b/.gitlab-ci.d/container-template.yml
>> @@ -6,17 +6,16 @@
>>      - docker:dind
>>    before_script:
>>      - export TAG=3D"$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
>> -    - export COMMON_TAG=3D"$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
>> +    - export COMMON_TAG=3D"$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:la=
test"
>>      - apk add python3
>>      - docker info
>>      - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY=
_PASSWORD"
>>    script:
>>      - echo "TAG:$TAG"
>>      - echo "COMMON_TAG:$COMMON_TAG"
>> -    - ./tests/docker/docker.py --engine docker build
>> -          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
>> -          -r $CI_REGISTRY/qemu-project/qemu
>> -    - docker tag "qemu/$NAME" "$TAG"
>> +    - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$COMM=
ON_TAG"
>> +      --build-arg BUILDKIT_INLINE_CACHE=3D1
>> +      -f "tests/docker/dockerfiles/$NAME.docker" "."
>
> I wonder why this doesn't injest a bunch of context. If I run:
>
>   docker build --cache-from
> registry.gitlab.com/stsquad/qemu/qemu/debian-alpha-cross --build-arg
> BUILDKIT_INLINE_CACHE=3D1 --build-arg USER=3Dalex --build-arg UID=3D1000 =
-t
> qemu
>   /debian-alpha-cross -f "/home/alex/lsrc/qemu.git/tests/docker/dockerfil=
es/debian-alpha-cross.docker" .
>
> it attempts to bring my entire build directory in as build context. This
> is why we use the - < docker form in the Makefile.
>
>>      - docker push "$TAG"
>>    after_script:
>>      - docker logout
>
> So what I don't understand is if I do:
>
>   docker pull registry.gitlab.com/stsquad/qemu/qemu/debian-alpha-cross
>   docker build --cache-from registry.gitlab.com/stsquad/qemu/qemu/debian-=
alpha-cross --build-arg
>     BUILDKIT_INLINE_CACHE=3D1 -t qemu/debian-alpha-cross - <
>     /home/alex/lsrc/qemu.git/tests/docker/dockerfiles/debian-alpha-cross.=
docker
>
> I still see pretty much a full rebuild of the image.

For reference at the end:

  =F0=9F=95=9919:37:36 alex@zen:container-diff.git  on =EE=82=A0 master too=
k 19s=20
  =E2=9E=9C  ./out/container-diff diff daemon://registry.gitlab.com/stsquad=
/qemu/qemu/debian-alpha-cross daemon://qemu/debian-alpha-cross --type=3Dfile

  -----File-----

  These entries have been added to qemu/debian-alpha-cross:
  FILE                                 SIZE
  /usr/share/doc/base-files/FAQ        6B
  /usr/share/info/dir                  781B

  These entries have been deleted from qemu/debian-alpha-cross: None

  These entries have been changed between registry.gitlab.com/stsquad/qemu/=
qemu/debian-alpha-cross and qemu/debian-alpha-cross:
  FILE                                        SIZE1         SIZE2
  /var/cache/debconf/templates.dat            762.2K        764.1K
  /var/cache/debconf/templates.dat-old        762.2K        764.1K
  /var/lib/dpkg/available                     70.7K         70.7K
  /var/log/dpkg.log                           12.9K         20.2K
  /var/log/apt/term.log                       7.4K          15.5K
  /var/cache/ldconfig/aux-cache               5.5K          5.5K
  /var/cache/debconf/config.dat-old           4.5K          4.7K
  /var/log/apt/history.log                    1.5K          2K
  /etc/shadow                                 501B          501B
  /etc/shadow-                                501B          501B
  /etc/apt/sources.list                       430B          430B

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

