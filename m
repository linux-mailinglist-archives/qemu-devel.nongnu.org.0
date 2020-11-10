Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D084C2AD8DD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 15:35:08 +0100 (CET)
Received: from localhost ([::1]:33956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcUjj-0007qQ-Af
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 09:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcUiY-0007OE-3a
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 09:33:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcUiU-0006q1-7b
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 09:33:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605018828;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HaTARI28nqa4ZrPDwYYSQcERUY2cuomalWxDrR3HcL0=;
 b=cfi62jFqsJX+d/JBulMO9MDS7f9TK1p7jp4cCpKUhkSno8kWweRRhcrVKLPHPqynjx6jxE
 zicUgUFR/OND9Ic6zWaAp5r+E3icnAJA2sEO4eWY2jM3Ia0f76wXxmCrpqb2YZjUCKaWzS
 jm3ZBpVoAH164wpVDnDPApKt+lfCyys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-h0GaiVRDPh-7hL3UeRZQPQ-1; Tue, 10 Nov 2020 09:33:42 -0500
X-MC-Unique: h0GaiVRDPh-7hL3UeRZQPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C9A110866A9;
 Tue, 10 Nov 2020 14:33:41 +0000 (UTC)
Received: from redhat.com (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E5BE55789;
 Tue, 10 Nov 2020 14:33:39 +0000 (UTC)
Date: Tue, 10 Nov 2020 14:33:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2 1/2] gitlab-ci: Avoid running the OpenSBI job
 when not necessary
Message-ID: <20201110143335.GG869656@redhat.com>
References: <20201110121606.2792442-1-philmd@redhat.com>
 <20201110121606.2792442-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201110121606.2792442-2-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

$SUBJECT seems to contradict the comment message and code.

Shouldn't it say  "always run the OpenSBI job"  since you're
removing all the conditional logic ?

On Tue, Nov 10, 2020 at 01:16:05PM +0100, Philippe Mathieu-Daudé wrote:
> The OpenSBI jobs use the 'changes' keyword, which "makes it
> possible to define if a job should be created based on files
> modified by a Git push event." (see [*]). This keyword comes
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
> 
> As this job doesn't take much (less than 1min), run it by
> default.
> 
> [*] https://docs.gitlab.com/ee/ci/yaml/#onlychangesexceptchanges
> 
> Fixes: 922febe2af ("Move edk2 and opensbi YAML files to .gitlab-ci.d folder")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/opensbi.yml | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
> index 5b13047e2ab..b1fa244fda4 100644
> --- a/.gitlab-ci.d/opensbi.yml
> +++ b/.gitlab-ci.d/opensbi.yml
> @@ -1,10 +1,5 @@
>  docker-opensbi:
>   stage: containers
> - rules: # Only run this job when the Dockerfile is modified
> - - changes:
> -   - .gitlab-ci.d/opensbi.yml
> -   - .gitlab-ci.d/opensbi/Dockerfile
> -   when: always
>   image: docker:19.03.1
>   services:
>   - docker:19.03.1-dind
> @@ -25,14 +20,6 @@ docker-opensbi:
>  
>  build-opensbi:
>   stage: build
> - rules: # Only run this job when ...
> - - changes: # ... roms/opensbi/ is modified (submodule updated)
> -   - roms/opensbi/*
> -   when: always
> - - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
> -   when: always
> - - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
> -   when: always
>   artifacts:
>     paths: # 'artifacts.zip' will contains the following files:
>     - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
> -- 
> 2.26.2
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


