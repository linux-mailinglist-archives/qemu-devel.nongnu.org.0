Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48256A0D5B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:55:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDue-000437-Ib; Thu, 23 Feb 2023 10:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pVDuc-00042l-20
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:53:38 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pVDuZ-0003fT-Uf
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:53:37 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B9145C57D;
 Thu, 23 Feb 2023 15:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677167611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmddq4wMKH6YuVzIv6IKSOW9lmuULJHTo8dpdrYaE80=;
 b=Tt+TXu5T01MPS0bAxqU3NCFp2DxsZbM4Om/65Kg5z2GtVHrqQxmxH1HGrdYLTyDuw0yJ1F
 uU3nkEAIoPJRB38nxufIA7sZCzN6OX0FzuzV9X+tBOdlsBoWlw9385z4DHya6rUcXyDOqp
 1d+7KjdlZ5VthRKQTvm3PFKKioP3ljg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677167611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmddq4wMKH6YuVzIv6IKSOW9lmuULJHTo8dpdrYaE80=;
 b=1q0rQjqKr0hMNKejoXN9YePDb/ZxNiwtJAluoZezVVnrpcN3U1US1t/pUvIfAOakhuuY+o
 2wmfrj1dKjAD30Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECD55139B5;
 Thu, 23 Feb 2023 15:53:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZofxLPqL92NTTQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 15:53:30 +0000
From: Fabiano Rosas <farosas@suse.de>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal
 <bleal@redhat.com>
Subject: Re: [RFC PATCH 0/1] ci: Speed up container stage
In-Reply-To: <Y/d+9jsvwF5tySlv@redhat.com>
References: <20230223142154.31975-1-farosas@suse.de>
 <Y/d+9jsvwF5tySlv@redhat.com>
Date: Thu, 23 Feb 2023 12:53:28 -0300
Message-ID: <87cz601ipz.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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
>   $ ./tests/docker/docker.py --engine docker build -t "qemu/$NAME" -f "te=
sts/docker/dockerfiles/$NAME.docker" -r $CI_REGISTRY/qemu-project/qemu 03:54
>   Using default tag: latest
>   latest: Pulling from qemu-project/qemu/qemu/debian-arm64-cross
>   bb263680fed1: Pulling fs layer
>   ...snip...

Ah right, so this is different for user's pipelines because the push at
the end of the build goes to the user's registry:

registry.gitlab.com/farosas/qemu/qemu/debian-arm64-cross

So we're fetching from one place and pushing to a different one. That is
why I see the improvement.

> none the less it still went ahead and rebuilt the image from scratch

It seems docker.py does not see that we're trying to build a tag that is
already there. Could this be due to --cache-from being "disabled"?

        if ("docker" in self._command and
            "TRAVIS" not in os.environ and
            "GITLAB_CI" not in os.environ):
            os.environ["DOCKER_BUILDKIT"] =3D "1"
            self._buildkit =3D True
        else:
            self._buildkit =3D False


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

I see that in the docker-openbsi image we do just that.

> as that sould be sufficient to build the image with caching.
>
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

Agreed.


