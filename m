Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC063B7B2F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 03:04:38 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyOeb-00075b-1z
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 21:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyOdI-0006PS-V6
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:03:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyOdG-0005cj-KT
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625014993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n8+pDrtaXPpDsGOs+vY8nqRIDArRPKmZrBaizNyWCD0=;
 b=Tqa8zhjEd/swb6ErlcXTquA/FvtmjvSooGDpwfkm1m84TCpYbCvWqVV5IQqhGLo2rNJSgE
 KJoq69gp0nDPUvuJIz8SvsQD0NrMryfQQnW3ew7dY6bhoaMebepI3mh5P8b53yWRnZqPXA
 cZTrVHh/R8dKlRKA8H380eV+E3D0+nY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-eit9keweMe-eje9G1JPAFw-1; Tue, 29 Jun 2021 21:03:11 -0400
X-MC-Unique: eit9keweMe-eje9G1JPAFw-1
Received: by mail-ed1-f69.google.com with SMTP id
 p13-20020a05640210cdb029039560ff6f46so259263edu.17
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 18:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n8+pDrtaXPpDsGOs+vY8nqRIDArRPKmZrBaizNyWCD0=;
 b=mDGn1uW4sw6k4uRhF6379qgfafZBCRpBUW0CotDXWktTkeK82ivOzI9R+PZOORMSO9
 2Qij76oApKHGgsSUutrG0CSJcGKVl5PTjh7UY23WqTTaVQgRxl0wv3AG8RqpG+nJxJUt
 qNjD5f4oc83U6KhD5Jom1fOkTYsBE+som1UsD8nnErstLrK5nYkgEbOZbjKJppEA+oxl
 1KZJqIRVtD++XYJwtmZpg1yohzKz8Jbj0NAyY8fd3wQVXP6RHHyymqpXPhFGdvByrlJs
 fZAmVOQr2LDCejlm6ku4PJbmSUQ0hJI2v4u9N5ttQPVnz+4B60vgnTuvg9uRMTqQHLcH
 gWsg==
X-Gm-Message-State: AOAM532nnZ3gakiHhqaiT/NO6RKnyyHGATYbMN9G56itOsxbfNbRXpeh
 SioHv5fGlN/uxsRVC3g9ZzwAh07/xq6Z6D1aHCTjVGUK5Gu4mb08ZOGaSD/4tCGNKT7ESi5DrLD
 KlFUMzB8CrBOysWgZsDjlB4n0VDInQBE=
X-Received: by 2002:a17:906:e03:: with SMTP id l3mr31738142eji.6.1625014990454; 
 Tue, 29 Jun 2021 18:03:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUWpDIdI/dFgfeu6B5HcrS/0AvGO7hCxBUxTZGIozZnULkoBrNLTRD75Eiqdzj59f6EHLZCJJg+Ka5+nRArW8=
X-Received: by 2002:a17:906:e03:: with SMTP id l3mr31738116eji.6.1625014990209; 
 Tue, 29 Jun 2021 18:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <971d069b-9ba1-073d-34aa-15beb1d1a751@redhat.com>
In-Reply-To: <971d069b-9ba1-073d-34aa-15beb1d1a751@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 29 Jun 2021 21:02:59 -0400
Message-ID: <CA+bd_6KU=mCPKsNsESaUGCk8c2Jn_t6O=UBcGbE4EPF2UGuw2A@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 2:18 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 08/06/2021 05.14, Cleber Rosa wrote:
> > The QEMU project has two machines (aarch64 and s390x) that can be used
> > for jobs that do build and run tests.  This introduces those jobs,
> > which are a mapping of custom scripts used for the same purpose.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >   .gitlab-ci.d/custom-runners.yml | 208 ++++++++++++++++++++++++++++++++
> >   1 file changed, 208 insertions(+)
> >
> > diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> > index a07b27384c..061d3cdfed 100644
> > --- a/.gitlab-ci.d/custom-runners.yml
> > +++ b/.gitlab-ci.d/custom-runners.yml
> > @@ -12,3 +12,211 @@
> >   # guarantees a fresh repository on each job run.
> >   variables:
> >     GIT_STRATEGY: clone
> > +
> > +# All ubuntu-18.04 jobs should run successfully in an environment
> > +# setup by the scripts/ci/setup/build-environment.yml task
> > +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> > +ubuntu-18.04-s390x-all-linux-static:
> > + allow_failure: true
> > + needs: []
> > + stage: build
> > + tags:
> > + - ubuntu_18.04
> > + - s390x
> > + rules:
> > + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
>
> I don't think this will work very well... sub-maintainers might want to push
> to a "staging" branch in their forked repositories, and without the s390x
> runner, the pipeline gets stuck now:
>
>   https://gitlab.com/thuth/qemu/-/pipelines/317812558
>

Hi Thomas,

As I put it in another response, I saw that actually as a feature, in
the sense that:

* people should indeed be allowed to push to their repos and leverage
their hardware, and
* "staging" is a pretty well scoped word, and has a reasonably well
defined meaning
* one would want to mimic as closely as possible what will be done
before a PR is merged

I agree that having the jobs stuck in any situation is not ideal, but
I honestly find that it would be reasonably hard to accidentally hit
that situation.  I also believe it will end up being inevitable for
entities to do a meta-analysis of the GitLab CI pipeline results,
possibly disregarding jobs that they can not run, or simply do not
care about, in their forks.

> We had the same issue in the kvm-unit-test CI, and we solved it there by
> rather making it depend on an environment variable that has to be set if the
> runner is available:
>
>   only:
>     variables:
>      - $S390X_RUNNER_AVAILABLE
>
> I think that's also nicer in case someone brings their own s390x runner and
> want to use the CI tests on other branches than staging.
>

The problem with this approach, is that it would not be enough to
protect the jobs based on variables for the architecture, as the OS
type and version also play a part in the possibility of running jobs.
For instance, suppose we get s390x machines from LinuxOne running
RHEL.  We'd need variables such as, say,
S390X_RHEL_8_4_RUNNER_AVAILABLE and S390X_RHEL_7_6_RUNNER_AVAILABLE.

> Could you please change your patch accordingly?
>

If you strongly believe now is the time to attempt to handle that
problem, I can go ahead and change it.  I stand behind my original
position that we should start with a simpler, "by convention" approach
and address the more complex scenarios as/if they come up.

>   Thanks,
>    Thomas
>

Thank you!
- Cleber.


