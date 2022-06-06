Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F6A53E420
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 12:57:13 +0200 (CEST)
Received: from localhost ([::1]:34804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyAQ4-0006uw-2o
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 06:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nyAJf-0002YU-P5
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nyAJd-00025z-Oo
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654512632;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYW+g4YSCYnn/h1agY8Gj1QhbVA8ZDC2TpBkoNg3Elo=;
 b=WGJZBrJoEzYA2cmHNK4XPHjInEwMrzz3KcVL7Rr/2JZYdWpXbeYQuFZef3UG80jlG0LDhj
 AAIti+gm72DBCRker9q/u3iHAL8BrhXG0QsHljAX7prHgLmlLZ1h6zNFA3CBtLSxMjwVaD
 ZWZRgDtu7WZi2qh6Cj7zAQAbpykNje0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-VjZvFcTCNO2jRBCAIn0dEQ-1; Mon, 06 Jun 2022 06:50:30 -0400
X-MC-Unique: VjZvFcTCNO2jRBCAIn0dEQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FA0F802809;
 Mon,  6 Jun 2022 10:50:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FE8C492C3B;
 Mon,  6 Jun 2022 10:50:29 +0000 (UTC)
Date: Mon, 6 Jun 2022 11:50:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 4/5] gitlab: convert build/container jobs to
 .base_job_template
Message-ID: <Yp3b879bfJG6mT76@redhat.com>
References: <20220526110705.59952-1-berrange@redhat.com>
 <20220526110705.59952-5-berrange@redhat.com>
 <05ef1192-eb81-c49f-d08c-61ed2ac7072b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05ef1192-eb81-c49f-d08c-61ed2ac7072b@redhat.com>
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

On Thu, Jun 02, 2022 at 07:41:59PM +0200, Thomas Huth wrote:
> On 26/05/2022 13.07, Daniel P. Berrangé wrote:
> > This converts the main build and container jobs to use the
> > base job rules, defining the following new variables
> > 
> >   - QEMU_JOB_SKIPPED - jobs that are known to be currently
> >     broken and should not be run. Can still be manually
> >     launched if desired.
> > 
> >   - QEMU_JOB_AVOCADO - jobs that run the Avocado integration
> >     test harness.
> > 
> >   - QEMU_JOB_PUBLISH - jobs that publish content after the
> >     branch is merged upstream
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   .gitlab-ci.d/base.yml                | 22 ++++++++++++++++++++++
> >   .gitlab-ci.d/buildtest-template.yml  | 16 ++++------------
> >   .gitlab-ci.d/buildtest.yml           | 28 +++++++++++++---------------
> >   .gitlab-ci.d/container-cross.yml     |  6 ++----
> >   .gitlab-ci.d/container-template.yml  |  1 +
> >   .gitlab-ci.d/crossbuild-template.yml |  3 +++
> >   .gitlab-ci.d/windows.yml             |  1 +
> >   docs/devel/ci-jobs.rst.inc           | 19 +++++++++++++++++++
> >   8 files changed, 65 insertions(+), 31 deletions(-)
> ...
> > diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> > index e9620c3074..ecac3ec50c 100644
> > --- a/.gitlab-ci.d/buildtest.yml
> > +++ b/.gitlab-ci.d/buildtest.yml
> > @@ -360,12 +360,11 @@ build-cfi-aarch64:
> >       expire_in: 2 days
> >       paths:
> >         - build
> > -  rules:
> > +  variables:
> >       # FIXME: This job is often failing, likely due to out-of-memory problems in
> >       # the constrained containers of the shared runners. Thus this is marked as
> > -    # manual until the situation has been solved.
> > -    - when: manual
> > -      allow_failure: true
> > +    # skipped until the situation has been solved.
> > +    QEMU_JOB_SKIPPED: 1
> >   check-cfi-aarch64:
> >     extends: .native_test_job_template
> > @@ -402,12 +401,11 @@ build-cfi-ppc64-s390x:
> >       expire_in: 2 days
> >       paths:
> >         - build
> > -  rules:
> > +  variables:
> >       # FIXME: This job is often failing, likely due to out-of-memory problems in
> >       # the constrained containers of the shared runners. Thus this is marked as
> > -    # manual until the situation has been solved.
> > -    - when: manual
> > -      allow_failure: true
> > +    # skipped until the situation has been solved.
> > +    QEMU_JOB_SKIPPED: 1
> 
> FYI, this patch broke the build-cfi-aarch64 and build-cfi-ppc64-s390x jobs
> since they've now got two "variables:" sections and apparently only the
> second one is taken into account...

Opps, sorry about that, and of course I didn't notice as it is a skipped
job and I forgot to try running it :-(

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


