Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14776A4D0E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:20:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWktj-0002Bo-Ls; Mon, 27 Feb 2023 16:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pWkti-0002BW-CN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:19:02 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pWktg-0000up-Az
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:19:02 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8AEA321A24;
 Mon, 27 Feb 2023 21:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677532738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TbELPdw7dx/XihJRPHDnU2kIsyq+fNRa8rOEERQ/UH4=;
 b=d/JTflaBlzhgGeFUoscR/WtydCx7eWUOgCXX3gMBaZecnsdvQNr0zA2yKK35wdbLXRVBGP
 sdrKqnqoKoiwoI1ficPxIYT5Q55a6GdXWbebycUxWJFmC1ovaRNqgx6eGiRkKecwgBOgEl
 ylMAoSDmdhmPvIEEDgaBgvpYke+Jyqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677532738;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TbELPdw7dx/XihJRPHDnU2kIsyq+fNRa8rOEERQ/UH4=;
 b=+e38If1khaNUT+5aqsdRXGsjnYz9IikezGA0H23jlY7T3rSocgmrXPnD7VlEihbDB80MlT
 LtgaJnkfmS4ODhDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C0BD13A43;
 Mon, 27 Feb 2023 21:18:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cGK8NUEe/WOcOgAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 27 Feb 2023 21:18:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v3 1/1] gitlab: Use plain docker in
 container-template.yml
In-Reply-To: <87lekiyfr5.fsf@suse.de>
References: <20230227151110.31455-1-farosas@suse.de>
 <20230227151110.31455-2-farosas@suse.de> <87fsargc9w.fsf@linaro.org>
 <87lekiyfr5.fsf@suse.de>
Date: Mon, 27 Feb 2023 18:18:55 -0300
Message-ID: <87ilfmyfgg.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Fabiano Rosas <farosas@suse.de> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> Fabiano Rosas <farosas@suse.de> writes:
>>
>>> Our dockerfiles no longer reference layers from other qemu images so
>>> we can now use 'docker build' on them.
>>>
>>> Also reinstate the caching that was disabled due to bad interactions
>>> with certain runners. See commit 6ddc3dc7a8 ("tests/docker: don't use
>>> BUILDKIT in GitLab either"). We now believe those issues to be fixed.
>>>
>>> The COMMON_TAG needed to be fixed for the caching to work. The
>>> docker.py script was not using the variable, but constructing the
>>> correct URL directly.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> ---
>>>  .gitlab-ci.d/container-template.yml | 9 ++++-----
>>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/contain=
er-template.yml
>>> index c434b9c8f3..519b8a9482 100644
>>> --- a/.gitlab-ci.d/container-template.yml
>>> +++ b/.gitlab-ci.d/container-template.yml
>>> @@ -6,17 +6,16 @@
>>>      - docker:dind
>>>    before_script:
>>>      - export TAG=3D"$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
>>> -    - export COMMON_TAG=3D"$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
>>> +    - export COMMON_TAG=3D"$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:l=
atest"
>>>      - apk add python3
>>>      - docker info
>>>      - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTR=
Y_PASSWORD"
>>>    script:
>>>      - echo "TAG:$TAG"
>>>      - echo "COMMON_TAG:$COMMON_TAG"
>>> -    - ./tests/docker/docker.py --engine docker build
>>> -          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
>>> -          -r $CI_REGISTRY/qemu-project/qemu
>>> -    - docker tag "qemu/$NAME" "$TAG"
>>> +    - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$COM=
MON_TAG"
>>> +      --build-arg BUILDKIT_INLINE_CACHE=3D1
>>> +      -f "tests/docker/dockerfiles/$NAME.docker" "."
>>
>> I wonder why this doesn't injest a bunch of context. If I run:
>>
>>   docker build --cache-from registry.gitlab.com/stsquad/qemu/qemu/debian=
-alpha-cross --build-arg BUILDKIT_INLINE_CACHE=3D1  --build-arg USER=3Dalex=
 --build-arg UID=3D1000 -t qemu
>>   /debian-alpha-cross -f "/home/alex/lsrc/qemu.git/tests/docker/dockerfi=
les/debian-alpha-cross.docker" .
>>
>> it attempts to bring my entire build directory in as build context. This
>> is why we use the - < docker form in the Makefile.
>>
>
> I only see that without DOCKER_BUILDKIT=3D1. With the variable set it does
> like in the CI jobs. I presume it is being set automatically by gitlab,
> but we could add it to the script to be explicit.
>
>>>      - docker push "$TAG"
>>>    after_script:
>>>      - docker logout
>>
>> So what I don't understand is if I do:
>>
>>   docker pull registry.gitlab.com/stsquad/qemu/qemu/debian-alpha-cross
>>   docker build --cache-from registry.gitlab.com/stsquad/qemu/qemu/debian=
-alpha-cross --build-arg
>>     BUILDKIT_INLINE_CACHE=3D1 -t qemu/debian-alpha-cross - <
>>     /home/alex/lsrc/qemu.git/tests/docker/dockerfiles/debian-alpha-cross=
.docker
>>
>> I still see pretty much a full rebuild of the image.
>
> I don't use docker and podman does not support caching. I have
> fresh-installed docker today and indeed it seems to not use the cache at
> every build. We're missing something.
>
> Sometimes it works:
>

Oops, sorry about the long lines, here it is again:

=3D=3D=3D
$ docker system prune -a -f
Deleted build cache objects:
xzbxmzaib3a8s0ufetop5ikhi
0ce9qln4ipd2vgf9xw9to0fdb
se4hq3rce3lad20t9sqqnubob

Total reclaimed space: 5.845kB

$ docker images -a
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

$ DOCKER_BUILDKIT=3D1 docker build --tag
registry.gitlab.com/farosas/qemu/qemu/debian-amd64:latest --cache-from
registry.gitlab.com/farosas/qemu/qemu/debian-amd64:latest --build-arg
BUILDKIT_INLINE_CACHE=3D1 -f debian-amd64.docker .

[+] Building 57.8s (12/12) FINISHED
 =3D> [internal] load build definition from debian-amd64.docker
 =3D> =3D> transferring dockerfile: 5.90kB
 =3D> [internal] load .dockerignore
 =3D> =3D> transferring context: 2B
 =3D> [internal] load metadata for docker.io/library/debian:11-slim
 =3D> importing cache manifest from registry.gitlab.com/farosas/qemu/qemu/d=
ebian-amd64:latest
 =3D> [1/6] FROM
docker.io/library/debian:11-slim@sha256:8eaee63a5ea83744e62d5bf88e7d472d7f1=
9b5feda3bfc6a2304cc074f269269
 =3D> CACHED [2/6] RUN export DEBIAN_FRONTEND=3Dnoninteractive &&     apt-g=
et update &&     apt-get install -y eatmydata
&&     eatmydata apt-get dist-upgrade -y &&     eatmydata apt-get i
 =3D> CACHED [3/6] RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata   apt ins=
tall -y --no-install-recommends   cscope=20
global  linux-headers-amd64
 =3D> CACHED [4/6] RUN git clone https://github.com/luigirizzo/netmap.git /=
usr/src/netmap
 =3D> CACHED [5/6] RUN cd /usr/src/netmap && git checkout v11.3
 =3D> CACHED [6/6] RUN cd /usr/src/netmap/LINUX && ./configure --no-drivers=
 --no-apps --kernel-dir=3D$(ls -d
/usr/src/linux-headers-*-amd64) && make install
 =3D> =3D> pulling sha256:bb263680fed18eecdc67f885094df6f589bafc19004839d7f=
df141df236a61aa
 =3D> =3D> pulling sha256:f63092d28e024c119d6a4e257d0c62bb2117be93605f1f236=
3b1d9cb8fc9dc6c
 =3D> =3D> pulling sha256:30fcedea9de9f22da43e20a79b40516c6e4a55e70eea401ac=
acca18912e86769
 =3D> =3D> pulling sha256:6f498daa6d20055a31e4681ec878e86129c3c1eaf5cf40f7e=
d87631accef1906
 =3D> =3D> pulling sha256:79b1b0d7bce9a16b4a01e2055cd402d93e04efded50e2ffcf=
6be0d7c67e4895a
 =3D> =3D> pulling sha256:250b927c5ce2d6d3e9d24bf085f649ce951966c9ec9c9e00a=
b8292dfb02c8b17
 =3D> exporting to image
 =3D> =3D> exporting layers
 =3D> =3D> writing image sha256:3663223c0a31c2be678c2fe110ba284b80b8d04d2d3=
290c14be7a4d7320f8a67
 =3D> =3D> naming to registry.gitlab.com/farosas/qemu/qemu/debian-amd64:lat=
est
 =3D> exporting cache
 =3D> =3D> preparing build cache for export
=3D=3D=3D

>
> There are issues pointing to some general unreliability of the cache:
>
> https://github.com/moby/buildkit/issues/2274
> https://github.com/moby/buildkit/issues/1981
>
> What is your docker version? Mine is 20.10.17-ce and Gitlab's is
> 23.0.1. The issues above are on 20.10.11.

