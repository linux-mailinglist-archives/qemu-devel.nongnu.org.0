Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB346A0C58
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 15:58:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVD30-0008JS-Nv; Thu, 23 Feb 2023 09:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVD2y-0008Ih-AE
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:58:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVD2u-0006sq-1A
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677164286;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=rm9rrCp0tGXmPys+xzp8Lwhp09lMnHUMTOQl7lse+Y0=;
 b=IHHIG030EdhxAzI9/cWaJkvrpdAK23XLpGRyowUvRzloszP+Bv91V2TL30l2ZVgV+p3bJ9
 5tWDInNfrNTEtD+rnJNNvSwEYdEtCvQ/h8OG8251K3F4PNd/wgJaCL+avYU4yz2YAAcrRb
 9sMTYW3n6ZM/pMylPYNOUqciCc9AWjk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-a3dfXCQvOXuRJ9jq2JdSig-1; Thu, 23 Feb 2023 09:58:05 -0500
X-MC-Unique: a3dfXCQvOXuRJ9jq2JdSig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5768858F0E;
 Thu, 23 Feb 2023 14:58:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12997C15BAE;
 Thu, 23 Feb 2023 14:58:01 +0000 (UTC)
Date: Thu, 23 Feb 2023 14:57:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH 0/1] ci: Speed up container stage
Message-ID: <Y/d+9jsvwF5tySlv@redhat.com>
References: <20230223142154.31975-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230223142154.31975-1-farosas@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 23, 2023 at 11:21:53AM -0300, Fabiano Rosas wrote:
> I'm not sure if this was discussed previously, but I noticed we're not
> pulling the images we push to the registry at every pipeline run.
> 
> I would expect we don't actually need to rebuild container images at
> _every_ pipeline run, so I propose we add a "docker pull" to the
> container templates. We already have that for the docker-edk2|opensbi
> images.
> 
> Some containers can take a long time to build (14 mins) and pulling
> the image first without building can cut the time to about 3
> mins. With this we can save almost 2h of cumulative CI time per
> pipeline run:

The docker.py script that we're invoking is already pulling the
image itself eg to pick a random recent job:

  https://gitlab.com/qemu-project/qemu/-/jobs/3806090058

We can see

  $ ./tests/docker/docker.py --engine docker build -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker" -r $CI_REGISTRY/qemu-project/qemu 03:54
  Using default tag: latest
  latest: Pulling from qemu-project/qemu/qemu/debian-arm64-cross
  bb263680fed1: Pulling fs layer
  ...snip...

none the less it still went ahead and rebuilt the image from scratch
so something is going wrong here. I don't know why your change adding
an extra 'docker pull' would have any effect, given we're already
pulling, so I wonder if that's just coincidental apparent change
due to the initial state of your fork's container registery.

Whenever I look at this I end up wishing out docker.py didn't exist
and that we could just directly do

  - docker pull "$TAG"
  - docker build --cache-from "$TAG" --tag "$TAG" -f "tests/docker/$NAME.docker"

as that sould be sufficient to build the image with caching.

> We would need to devise a mechanism (not included here) to force the
> re-build of the container images when needed, perhaps an environment
> variable or even a whole new "container build" stage before the
> "container" stage.
> 
> What do you think?

We definitely want the rebuild to be cached. So whatever is
broken in that regard needs fixing, as this used to work AFAIK.


Ideally we would skip the container stage entirely for any
pull request that did NOT include changes to the dockerfile.

The problem is that the way we're using gitlab doesn't let
that work well. We need to setup rules based on filepath.
Such rules are totally unreliable for push events in
practice, because they only evaluate the delta between what
you just pushed and what was already available on the server.
This does not match the content of the pull request, it might
be just a subset.

If we had subsystem maintainers opening a merge request for
their submission, then we could reliably write rules based
on what files are changed by the pull request, and entirely
skip the containers stage most of the time, which would be
an even bigger saving.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


