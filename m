Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A182ADA83
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:37:24 +0100 (CET)
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVhz-0003DQ-Ce
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcVg6-0002U1-Ue
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:35:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcVg2-0002OE-IQ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605022520;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7V4ITSQj+/de+ADK/eS4RbBdDHKIZ7V1WH2P8gkkDDQ=;
 b=bPxq+Ijvge2XOSqVzDcBUsF0W/1Rwk8Ir0nVHBc/LohuMmtA1L6pCZ/Hzd1OBl4aIibw9M
 z6JRHI9OfUDXYV0OrE3wY6wAS5gATjc1WsZaJ/kDfrnopU/ebp4xq54iw32izK1fJ1hy7y
 sICIEe8XgS9WJf1buZJ4JvDmuw2XZhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-hhi44rz-PBy6HcEJxs6JBw-1; Tue, 10 Nov 2020 10:35:12 -0500
X-MC-Unique: hhi44rz-PBy6HcEJxs6JBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 251A21074659;
 Tue, 10 Nov 2020 15:35:11 +0000 (UTC)
Received: from redhat.com (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A6C35B4D5;
 Tue, 10 Nov 2020 15:35:09 +0000 (UTC)
Date: Tue, 10 Nov 2020 15:35:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2 2/2] gitlab-ci: Avoid running the EDK2 job when
 not necessary
Message-ID: <20201110153505.GH869656@redhat.com>
References: <20201110121606.2792442-1-philmd@redhat.com>
 <20201110121606.2792442-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201110121606.2792442-3-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 10, 2020 at 01:16:06PM +0100, Philippe Mathieu-Daudé wrote:
> The EDK2 jobs use the 'changes' keyword, which "makes it
> possible to define if a job should be created based on files
> modified by a Git push event." (see [1]). This keyword comes
> with a warning:
> 
>   Caution:
> 
>     In pipelines with sources other than the three above
>     changes can’t determine if a given file is new or old
>     and always returns true."
> 
> In commit 922febe2af we moved the YAML config file from the
> repository root directory to the .gitlab-ci.d/ directory.
> 
> We didn't respect the previous warning and disabled the
> 'changes' filter rule, as the files are now in a (directory)
> three above the YAML config file.

This description is a bit wierd. I don't see how the location
in the directory tree has any relevance here.

IIUC the caution docs quoted above are referring to what triggered 
the pipeline. They're saying that if the trigger was not a "branch", 
"merge request", or "external pull request", then the "changes" rule 
always evaluates true.

The "branch" source us a bit wierd though, as I'm not seeing
how gitlab figures out which commits are "new" to the pipeline
and thus whether the files were modified or not.

Strangely qemu-project/qemu CI for master seems to be behaving
correctly and skipping the jobs.

Something is fishy here and clearly not working, so clearly
changes are needed, but the commit message is not explaining
it for me.

> This jobs takes ~40min, and needlessly burns the 2000 minutes
> available to GitLab free users. Follow the recommendations in
> [3] and disable this job by default (except if we push a tag
> or the branch contains 'edk2'). Note we do not remove the job
> from the pipeline, it can still be triggered manually from the
> WebUI.
> 
> [1] https://docs.gitlab.com/ee/ci/yaml/#onlychangesexceptchanges
> [2] https://about.gitlab.com/releases/2020/03/18/ci-minutes-for-free-users/
> [3] https://about.gitlab.com/pricing/faq-consumption-cicd/
> 
> Fixes: 922febe2af ("Move edk2 and opensbi YAML files to .gitlab-ci.d folder")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/edk2.yml | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
> index e1e04524166..335c99035c9 100644
> --- a/.gitlab-ci.d/edk2.yml
> +++ b/.gitlab-ci.d/edk2.yml
> @@ -1,10 +1,5 @@
>  docker-edk2:
>   stage: containers
> - rules: # Only run this job when the Dockerfile is modified
> - - changes:
> -   - .gitlab-ci.d/edk2.yml
> -   - .gitlab-ci.d/edk2/Dockerfile
> -   when: always
>   image: docker:19.03.1
>   services:
>   - docker:19.03.1-dind
> @@ -26,13 +21,15 @@ docker-edk2:
>  build-edk2:
>   stage: build
>   rules: # Only run this job when ...
> - - changes: # ... roms/edk2/ is modified (submodule updated)
> -   - roms/edk2/*
> + - if: $CI_COMMIT_TAG # we pushed a tag
>     when: always
>   - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
>     when: always
>   - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
>     when: always
> +   # ... else allow manual run on the WebUI
> + - when: manual
> +   allow_failure: true
>   artifacts:
>     paths: # 'artifacts.zip' will contains the following files:
>     - pc-bios/edk2*bz2
> -- 
> 2.26.2
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


