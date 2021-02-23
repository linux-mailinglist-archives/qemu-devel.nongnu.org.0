Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BD5322DF0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:50:18 +0100 (CET)
Received: from localhost ([::1]:34612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZx3-0005DJ-Mi
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEZwE-0004cX-Tx
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:49:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEZwC-0004q8-W8
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614095362;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aX41Nk2sdqG7zVnvvzPStxLWvwms4DJVolSd+i73l+4=;
 b=Rbzxy7iqsq5aB1GgiUbk/kBydXuTVG5YQlXC+cSFN7568v8TVoS3kgLHxOkTeEpgjMaG28
 qfmqXvo0ish8JMuoSWP8ulEWbrC4P/yUbThpoAwapz/4TYGaBsYaTTzoWgFxP0jsfPqDY2
 GOKOPYXAT1oUc3uOc+XZro5BxH5oxhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-7QCFtL2VN9-lddxojVy8PA-1; Tue, 23 Feb 2021 10:49:11 -0500
X-MC-Unique: 7QCFtL2VN9-lddxojVy8PA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5683B803654;
 Tue, 23 Feb 2021 15:45:25 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 295855D9D3;
 Tue, 23 Feb 2021 15:45:18 +0000 (UTC)
Date: Tue, 23 Feb 2021 15:45:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
Message-ID: <YDUjDGLnfjinbE3F@redhat.com>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-5-crosa@redhat.com>
 <1fc95a8d-e1f6-ef77-99c6-6b6876af0637@redhat.com>
 <6377685f-046c-8802-2e2e-c489b9785c1b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6377685f-046c-8802-2e2e-c489b9785c1b@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 04:35:41PM +0100, Philippe Mathieu-Daudé wrote:
> On 2/23/21 4:27 PM, Philippe Mathieu-Daudé wrote:
> > On 2/19/21 10:58 PM, Cleber Rosa wrote:
> >> The QEMU project has two machines (aarch64 and s390x) that can be used
> >> for jobs that do build and run tests.  This introduces those jobs,
> >> which are a mapping of custom scripts used for the same purpose.
> >>
> >> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> >> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> >> ---
> >>  .gitlab-ci.d/custom-runners.yml | 204 ++++++++++++++++++++++++++++++++
> >>  1 file changed, 204 insertions(+)
> >>
> >> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> >> index 3004da2bda..a9166c82a2 100644
> >> --- a/.gitlab-ci.d/custom-runners.yml
> >> +++ b/.gitlab-ci.d/custom-runners.yml
> >> @@ -12,3 +12,207 @@
> >>  # strategy.
> >>  variables:
> >>    GIT_SUBMODULE_STRATEGY: recursive
> >> +
> >> +# All ubuntu-18.04 jobs should run successfully in an environment
> >> +# setup by the scripts/ci/setup/build-environment.yml task
> >> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> >> +ubuntu-18.04-s390x-all-linux-static:
> >> + allow_failure: true
> >> + needs: []
> >> + stage: build
> >> + tags:
> >> + - ubuntu_18.04
> >> + - s390x
> >> + rules:
> >> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> > 
> > Maybe this is too restrictive, we might want to test /master too.
> 
> Also now all fork pipelines are stuck...
> 
>   This job is stuck because you don't have any active runners online
>   or available with any of these tags assigned to them: s390x
>   ubuntu_18.04
>   Go to project CI settings
> 
> https://gitlab.com/philmd/qemu/-/jobs/1050123478
> 
> What about using as starter:
> 
>   rules:
>     if: '$CI_PROJECT_PATH == 'qemu-project/qemu'

I'm having dejavu about this exact problem previously this series was
posted. Restricting based on CI_PROJECT_PATH is not desirable, because
users should be free to bring up their own runners for this by following
the instructions earlier in the series. Having to hack the .gitlab-ci.yml
change this rule is going to be super unplesant.

If we can't make it auto-skip when no runners are available, then we
should set a rule based on a custom env variable. eg

   if "$QEMU_CI_RUNNER_S390" == "on"

then all a contributor needs todo is set the variable in their gitlab
repo preferences.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


