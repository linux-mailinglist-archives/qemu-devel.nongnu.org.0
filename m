Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B70519BF8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:36:08 +0200 (CEST)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBQV-000056-Nz
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmBBw-0001sD-2q
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmBBu-00033I-0a
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651656061;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qijcgCvqjI1SgEhVr29vftW+LVa3h3Joeu+dYsndsmk=;
 b=eTQZjoZgUEDQJnQ14sJ/KqADqOEXM4KnQ6jezKLLRtrrIhIlyH3bQE0annzstXPOxs42Kh
 zUnEX8wKJlxvmPaFhj/65LCwh0zIAjGK64OiTivrsr7mrK8cEpVj6THkKFySuSPVBc5Enp
 hORWizE4VrzxM4SKA0lvIJfTL4uSQBM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-AiOXZQYrP76A39vrIqyxqQ-1; Wed, 04 May 2022 05:21:00 -0400
X-MC-Unique: AiOXZQYrP76A39vrIqyxqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB82C899ECD;
 Wed,  4 May 2022 09:20:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65546400D277;
 Wed,  4 May 2022 09:20:58 +0000 (UTC)
Date: Wed, 4 May 2022 10:20:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] gitlab-ci: Switch the 'check-patch' & 'check-dco'
 jobs to use python-container
Message-ID: <YnJFd8D11TAsjx9o@redhat.com>
References: <20220503203621.243153-1-thuth@redhat.com>
 <YnJDZp809F14a0DB@redhat.com>
 <e3fe483b-f304-38af-bbfb-a65b2f350843@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3fe483b-f304-38af-bbfb-a65b2f350843@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 04, 2022 at 11:18:30AM +0200, Thomas Huth wrote:
> On 04/05/2022 11.12, Daniel P. Berrangé wrote:
> > On Tue, May 03, 2022 at 10:36:21PM +0200, Thomas Huth wrote:
> > > The 'check-patch' and 'check-dco' jobs only need Python and git for
> > > checking the patches, so it's not really necessary to use a container
> > > here that has all the other build dependencies installed. By installing
> > > "git" in the python container, we can use this light-weight container
> > > for these jobs instead.
> > 
> > Our python container is far from light-weight....
> > 
> > $ time podman pull registry.gitlab.com/qemu-project/qemu/qemu/python
> > 
> > real	1m52.717s
> > user	1m32.327s
> > sys	0m19.453s
> > 
> > vs
> > 
> > $ time podman pull python:3.8-alpine
> > 
> > real	0m4.509s
> > user	0m3.780s
> > sys	0m1.052s
> > 
> > 
> > It is quicker to use the alpine python container and then just
> > install 'git' on every job, than it is to use the pre-built
> > qemu python container
> > 
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   Mark as RFC since I'm not sure whether we want to have "git" in
> > >   the python container or not?
> > > 
> > >   .gitlab-ci.d/static_checks.yml         | 8 ++++----
> > >   tests/docker/dockerfiles/python.docker | 1 +
> > >   2 files changed, 5 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
> > > index 5e955540d3..0e080bd0a0 100644
> > > --- a/.gitlab-ci.d/static_checks.yml
> > > +++ b/.gitlab-ci.d/static_checks.yml
> > > @@ -1,8 +1,8 @@
> > >   check-patch:
> > >     stage: build
> > > -  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> > > +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
> > >     needs:
> > > -    job: amd64-centos8-container
> > > +    job: python-container
> > >     script:
> > >       - .gitlab-ci.d/check-patch.py
> > >     variables:
> > > @@ -15,9 +15,9 @@ check-patch:
> > >   check-dco:
> > >     stage: build
> > > -  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> > > +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
> > >     needs:
> > > -    job: amd64-centos8-container
> > > +    job: python-container
> > >     script: .gitlab-ci.d/check-dco.py
> > >     variables:
> > >       GIT_DEPTH: 1000
> > 
> > IOW this is sufficient:
> > 
> >    image: python:3.8-alpine
> >    needs: []
> >    before_script:
> >      - apk update
> >      - apk add git
> >    script: ./gitlab-ci.d/check-dco.py
> > 
> > 
> > I expect the same would work for check-patch.py container
> 
> ... or would it make sense to switch tests/docker/dockerfiles/python.docker
> to use alpine instead of fedora?

That could work too

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


