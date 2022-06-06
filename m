Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B8B53E428
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 13:07:11 +0200 (CEST)
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyAZi-0005vb-7Z
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 07:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nyAUP-0003A4-Ba
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 07:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nyAUN-0003h2-36
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 07:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654513298;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhJjjoRpOV9W71+5gvKlQQTl7CDrlqANhn/mXto7SxI=;
 b=VJd4ZulI6+nb/75dEmlD3fGyTaJgrjb7bgu8yfQsuVr+thqwsPD0VidXr6Hru2AhFbDafB
 iXYqO/WLGttsqVuhyzBMn5r0oUItm1MW6eoeSQkeUqM7SqxdjOzXpob41xFsF47Bv44YA4
 Dug6yvY+cXY1RwMwCsaWHhN2L34F+eg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-8UpcsMoqNk6zwB4Bu3UqRA-1; Mon, 06 Jun 2022 07:01:35 -0400
X-MC-Unique: 8UpcsMoqNk6zwB4Bu3UqRA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF338299E743;
 Mon,  6 Jun 2022 11:01:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D271492C3B;
 Mon,  6 Jun 2022 11:01:33 +0000 (UTC)
Date: Mon, 6 Jun 2022 12:01:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PULL 32/33] gitlab: don't run CI jobs in forks by default
Message-ID: <Yp3ei+C3khj/2Wo+@redhat.com>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
 <20220601180537.2329566-33-alex.bennee@linaro.org>
 <279dc7dd-9423-ce0e-788f-6cebce8878b1@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <279dc7dd-9423-ce0e-788f-6cebce8878b1@amsat.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 02, 2022 at 12:50:21PM +0200, Philippe Mathieu-Daudé wrote:
> Cc'ing qemu-stable@

If you want this in stable, you'll need the 5 preceeding patches
too. I wouldn't be surprised if there are conflicts too. So it
might well need a custom set of patches spinning just for stable.

> 
> Thank you Daniel / Thomas / Alex!
> 
> On 1/6/22 20:05, Alex Bennée wrote:
> > From: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > To preserve CI shared runner credits we don't want to run
> > pipelines on every push.
> > 
> > This sets up the config so that pipelines are never created
> > for contributors by default. To override this the QEMU_CI
> > variable can be set to a non-zero value. If set to 1, the
> > pipeline will be created but all jobs will remain manually
> > started. The contributor can selectively run jobs that they
> > care about. If set to 2, the pipeline will be created and
> > all jobs will immediately start.
> > 
> > This behavior can be controlled using push variables
> > 
> >    git push -o ci.variable=QEMU_CI=1
> > 
> > To make this more convenient define an alias
> > 
> >     git config --local alias.push-ci "push -o ci.variable=QEMU_CI=1"
> >     git config --local alias.push-ci-now "push -o ci.variable=QEMU_CI=2"
> > 
> > Which lets you run
> > 
> >    git push-ci
> > 
> > to create the pipeline, or
> > 
> >    git push-ci-now
> > 
> > to create and run the pipeline
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > Message-Id: <20220526110705.59952-6-berrange@redhat.com>
> > [AJB: fix typo, replicate alias tips in ci.rst]
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Message-Id: <20220527153603.887929-33-alex.bennee@linaro.org>
> > 
> > diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
> > index 0b4926e537..9118a61a17 100644
> > --- a/docs/devel/ci-jobs.rst.inc
> > +++ b/docs/devel/ci-jobs.rst.inc
> > @@ -28,6 +28,32 @@ For further information about how to set these variables, please refer to::
> >     https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
> > +Setting aliases in your git config
> > +----------------------------------
> > +
> > +You can use aliases to make it easier to push branches with different
> > +CI configurations. For example define an alias for triggering CI:
> > +
> > +.. code::
> > +
> > +   git config --local alias.push-ci "push -o ci.variable=QEMU_CI=1"
> > +   git config --local alias.push-ci-now "push -o ci.variable=QEMU_CI=2"
> > +
> > +Which lets you run:
> > +
> > +.. code::
> > +
> > +   git push-ci
> > +
> > +to create the pipeline, or:
> > +
> > +.. code::
> > +
> > +   git push-ci-now
> > +
> > +to create and run the pipeline
> > +
> > +
> >   Variable naming and grouping
> >   ----------------------------
> > @@ -98,6 +124,18 @@ Contributor controlled runtime variables
> >   The following variables may be set by contributors to control
> >   job execution
> > +QEMU_CI
> > +~~~~~~~
> > +
> > +By default, no pipelines will be created on contributor forks
> > +in order to preserve CI credits
> > +
> > +Set this variable to 1 to create the pipelines, but leave all
> > +the jobs to be manually started from the UI
> > +
> > +Set this variable to 2 to create the pipelines and run all
> > +the jobs immediately, as was historicaly behaviour
> > +
> >   QEMU_CI_AVOCADO_TESTING
> >   ~~~~~~~~~~~~~~~~~~~~~~~
> >   By default, tests using the Avocado framework are not run automatically in
> > diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> > index 4f091d5aad..f334f3ded7 100644
> > --- a/.gitlab-ci.d/base.yml
> > +++ b/.gitlab-ci.d/base.yml
> > @@ -28,6 +28,10 @@
> >       - if: '$QEMU_JOB_ONLY_FORKS == "1" && $CI_PROJECT_NAMESPACE == "qemu-project"'
> >         when: never
> > +    # Forks don't get pipelines unless QEMU_CI=1 or QEMU_CI=2 is set
> > +    - if: '$QEMU_CI != "1" && $QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != "qemu-project"'
> > +      when: never
> > +
> >       # Avocado jobs don't run in forks unless $QEMU_CI_AVOCADO_TESTING is set
> >       - if: '$QEMU_JOB_AVOCADO && $QEMU_CI_AVOCADO_TESTING != "1" && $CI_PROJECT_NAMESPACE != "qemu-project"'
> >         when: never
> > @@ -59,5 +63,10 @@
> >       # an earlier criteria
> >       #############################################################
> > +    # Forks pipeline jobs don't start automatically unless
> > +    # QEMU_CI=2 is set
> > +    - if: '$QEMU_CI != "2" && $CI_PROJECT_NAMESPACE != "qemu-project"'
> > +      when: manual
> > +
> >       # Jobs can run if any jobs they depend on were successfull
> >       - when: on_success
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


