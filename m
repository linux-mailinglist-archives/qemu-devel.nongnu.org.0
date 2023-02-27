Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9906A3FFE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:09:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbNq-0000Sv-RF; Mon, 27 Feb 2023 06:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWbNo-0000Qo-S2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:09:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWbNm-0000IP-Iw
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677496165;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xwDto3RGPe7nMDBWvkTaFoAg8mpttDebalNFKNAMrMk=;
 b=gNOyjBmOCA+Coa1E/HLwXUiwbdVP4CQL40dOWzyJsacNLlmk4q1fkD6rpgsPsnD3I1Ll/0
 PS3sxB7ZqNxSnWhpPUMs68lCB/bdp3rkERVjWy5of0y7z2WSBUG7OANRJSD6tr/Mfs6j7q
 sHmN3yPzJf3aGTHW1wdVjLty0je4A9I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-gEBfp37LMxGHISn5dphYiA-1; Mon, 27 Feb 2023 06:09:22 -0500
X-MC-Unique: gEBfp37LMxGHISn5dphYiA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9750101B450;
 Mon, 27 Feb 2023 11:09:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A3E4404BEC5;
 Mon, 27 Feb 2023 11:09:20 +0000 (UTC)
Date: Mon, 27 Feb 2023 11:09:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH v2 2/3] gitlab: Cache container images
Message-ID: <Y/yPXQrys5P8WmBl@redhat.com>
References: <20230224125207.19616-1-farosas@suse.de>
 <20230224125207.19616-3-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230224125207.19616-3-farosas@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Fri, Feb 24, 2023 at 09:52:06AM -0300, Fabiano Rosas wrote:
> Make use of the --cache-from option from 'docker build' by including
> build layers when building and then pulling a previously built image
> before the next build.
> 
> This was previously done by the docker.py script, but got disabled due
> to bad interactions with certain runners. See commit 6ddc3dc7a8
> ("tests/docker: don't use BUILDKIT in GitLab either").
> 
> We now believe those issues to be fixed, so restore the caching
> functionality as it brings a significant reduction in container build
> times.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  .gitlab-ci.d/container-template.yml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
> index f417452212..31e4e36a7d 100644
> --- a/.gitlab-ci.d/container-template.yml
> +++ b/.gitlab-ci.d/container-template.yml
> @@ -13,7 +13,10 @@
>    script:
>      - echo "TAG:$TAG"
>      - echo "COMMON_TAG:$COMMON_TAG"
> -    - docker build --tag $TAG -f "tests/docker/dockerfiles/$NAME.docker" "."
> +    - docker pull "$TAG" || true
> +    - docker build --tag "$TAG" --cache-from "$TAG"

We should have

   --cache-from "$TAG" --cache-from "$COMMON_TAG"

The reason is that users may not keep their branches up2date on a regular
basis. As such the registry associated with the fork may not be useful
as a caching source. Thus if we include cache from the upstream repo, this
will benefit forks.  This was the rational behind having TAG + COMMON_TAG
originally, but we lost it somewhere along the way.

> +      --build-arg BUILDKIT_INLINE_CACHE=1
> +      -f "tests/docker/dockerfiles/$NAME.docker" "."
>      - docker push "$TAG"
>    after_script:
>      - docker logout

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


