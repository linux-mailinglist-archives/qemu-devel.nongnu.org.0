Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D084061853A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdNt-00036F-5E; Thu, 03 Nov 2022 12:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqdNd-00031X-12
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:48:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqdNX-0004iy-AE
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667494062;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QLYz0Dn1VglPnnCxtg49N07CT3i2MfE5R88I4thMm50=;
 b=TqkdVKWC+KwXEOhWb+PznZ4pZzLop3ijer5CgnInnlQaxQGyKoe7VifNiJw/3T+vDkeGL/
 kFrL8ly7mLzqeylx0tpEKDguXSg7Ko5smqFMzAo70WQ0nIS1l1COtT6a0lieA7AUqYWtUW
 1DEyw/6Y3LHWNDn/kQlp1QP7SFjHpAo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464--GZGyWgzMx6SRFdmTbCvIg-1; Thu, 03 Nov 2022 12:47:41 -0400
X-MC-Unique: -GZGyWgzMx6SRFdmTbCvIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EF9E811E67;
 Thu,  3 Nov 2022 16:47:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E7501121325;
 Thu,  3 Nov 2022 16:47:38 +0000 (UTC)
Date: Thu, 3 Nov 2022 16:47:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>, Ani Sinha <ani@anisinha.ca>,
 philmd@linaro.org, mst@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <Y2PwqB+Y/O1Q4IHE@redhat.com>
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAJSP0QXxO_1WYL-FUZrRFOE9guOEVVr9Ss2jubkdHvAMwPwZqA@mail.gmail.com>
 <Y2Plai60TK1kErl5@redhat.com>
 <CAJSP0QUk4iWY6B7-oxjLtW22OMyAfR-KH7M6QMmQVjvOhwQ+nQ@mail.gmail.com>
 <Y2Pui+kYDyJ1Rgja@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2Pui+kYDyJ1Rgja@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 03, 2022 at 04:38:35PM +0000, Daniel P. Berrangé wrote:
> On Thu, Nov 03, 2022 at 12:25:49PM -0400, Stefan Hajnoczi wrote:
> > On Thu, 3 Nov 2022 at 11:59, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > >
> > > On Thu, Nov 03, 2022 at 11:49:21AM -0400, Stefan Hajnoczi wrote:
> > > > gitlab-runner can run locally with minimal setup:
> > > > https://bagong.gitlab.io/posts/run-gitlab-ci-locally/
> > > >
> > > > I haven't tried it yet, but that seems like the most reliable (and
> > > > easiest) way to reproduce the CI environment.
> > >
> > > IMHO that is total overkill.
> > >
> > > Just running the containers directly is what I'd recommend for any
> > > attempt to reproduce problems. There isn't actually anything gitlab
> > > specific in our CI environment, gitlab merely provides the harness
> > > for invoking jobs. This is good as it means we can move our CI to
> > > another systems if we find Gitlab no longer meets our needs, and
> > > our actual build env won't change, as it'll be the same containers
> > > still.
> > >
> > > I wouldn't recommend QEMU contributors to tie their local workflow
> > > into the use of gitlab-runner, when they can avoid that dependency.
> > 
> > If there was a complete list of commands to run I would agree with
> > you. Unfortunately there is no easy way to run the container locally:
> > 1. The container image path is hidden in the GitLab output and easy to
> > get wrong (see Ani's reply).
> 
> That is bizarre
> 
>    Pulling docker image registry.gitlab.com/qemu-project/[MASKED]/fedora:latest ...
> 
> I've not seen any other gitlab project where the paths are 'MASKED' in
> this way. Makes me wonder if there's some setting in the QEMU gitlab
> project causing this, as its certainly not expected behaviour.

Spoke with Peter on IRC, and we had a variable set CIRRUS_GITHUB_REPO
with value 'qemu/qemu' that was marked as 'masked'. This caused gitlab
to scrub that string from the build logs.  We've unmasked that now,
so the container URLs should be intact from the next CI pipeline
onwards.  Masking is only needed for security sensitive variables
like tokens, passwords, etc

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


