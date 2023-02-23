Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6986A1144
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:31:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIFG-0003Zm-S6; Thu, 23 Feb 2023 15:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pVIFB-0003Z6-4k
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:31:12 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pVIF6-0004FJ-HF
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:31:08 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5EC2C37D62;
 Thu, 23 Feb 2023 20:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677184261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxlfS5ALPZ0zAWgnRCoPfFxfIrPOEN6tARBkRjy7Ta4=;
 b=vCkyM6mVng09hPgX28Sq1IRKcDfH1U1bU37qBytWaPzvPLZcpC+b1pYupQDpAVTyxl3S2v
 sHZaYS080x58LXirDt/71VnQUFlVzmuSCHJdmADo3+18wcWIrdacHI3fPL8Ln6XyYHNoy5
 qWff/zDomulKqz9jWtkMHMghhx12SyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677184261;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxlfS5ALPZ0zAWgnRCoPfFxfIrPOEN6tARBkRjy7Ta4=;
 b=bqhMOJes0gyOMRls7g2QwNzRiPqmxsRHANsJnHT6EJZBgx+ywfwlN/m8HNpkXZ4ZBoZzbX
 +Pa/ZyGxhhm8MNCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E273E13928;
 Thu, 23 Feb 2023 20:31:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fm+LKgTN92NEXQAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 20:31:00 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, =?utf-8?Q?Danie?=
 =?utf-8?Q?l_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH 0/1] ci: Speed up container stage
In-Reply-To: <877cw8pep0.fsf@linaro.org>
References: <20230223142154.31975-1-farosas@suse.de>
 <Y/d+9jsvwF5tySlv@redhat.com> <877cw8pep0.fsf@linaro.org>
Date: Thu, 23 Feb 2023 17:30:58 -0300
Message-ID: <87wn48jf99.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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


Hi Alex,

> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>
>> On Thu, Feb 23, 2023 at 11:21:53AM -0300, Fabiano Rosas wrote:
>>> I'm not sure if this was discussed previously, but I noticed we're not
>>> pulling the images we push to the registry at every pipeline run.
>>>=20
>>> I would expect we don't actually need to rebuild container images at
>>> _every_ pipeline run, so I propose we add a "docker pull" to the
>>> container templates. We already have that for the docker-edk2|opensbi
>>> images.
>>>=20
>>> Some containers can take a long time to build (14 mins) and pulling
>>> the image first without building can cut the time to about 3
>>> mins. With this we can save almost 2h of cumulative CI time per
>>> pipeline run:
>>
>> The docker.py script that we're invoking is already pulling the
>> image itself eg to pick a random recent job:
>>
>>   https://gitlab.com/qemu-project/qemu/-/jobs/3806090058
>>
>> We can see
>>
>>   $ ./tests/docker/docker.py --engine docker build -t "qemu/$NAME" -f
>> "tests/docker/dockerfiles/$NAME.docker" -r
>> $CI_REGISTRY/qemu-project/qemu 03:54
>>   Using default tag: latest
>>   latest: Pulling from qemu-project/qemu/qemu/debian-arm64-cross
>>   bb263680fed1: Pulling fs layer
>>   ...snip...
>>
>> none the less it still went ahead and rebuilt the image from scratch
>> so something is going wrong here. I don't know why your change adding
>> an extra 'docker pull' would have any effect, given we're already
>> pulling, so I wonder if that's just coincidental apparent change
>> due to the initial state of your fork's container registery.
>>
>> Whenever I look at this I end up wishing out docker.py didn't exist
>> and that we could just directly do
>>
>>   - docker pull "$TAG"
>>   - docker build --cache-from "$TAG" --tag "$TAG" -f "tests/docker/$NAME=
.docker"
>>
>> as that sould be sufficient to build the image with caching.
>
> I think we should be ready to do that now as we have flattened all our
> dockerfiles. The only other thing that docker.py does is nicely add a
> final step for the current user so you can ensure all files generated in
> docker cross compile images are still readable on the host.
>

Just so you know this command line worked:

docker build --cache-from $TAG --tag $TAG --build-arg BUILDKIT_INLINE_CACHE=
=3D1 \
  -f "tests/docker/dockerfiles/$NAME.docker" "."

building the cache: https://gitlab.com/farosas/qemu/-/jobs/3825838177
using the cache:    https://gitlab.com/farosas/qemu/-/jobs/3825926944

But we might still have this issue:

commit 6ddc3dc7a882f2e7200fa7fecf505a8d0d8bbea9
Author: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Date:   Fri Jul 9 15:29:35 2021 +0100

    tests/docker: don't use BUILDKIT in GitLab either
=20=20=20=20
    Using BUILDKIT breaks with certain container registries such as CentOS,
    with docker build reporting an error such as
=20=20=20=20
      failed to solve with frontend dockerfile.v0:
      failed to build LLB: failed to load cache key:
      unexpected status code
      https://registry.centos.org/v2/centos/manifests/7:
      403 Forbidden

We might need to go the route of skipping the docker build when the
docker pull succeeds.

