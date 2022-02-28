Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B034C65E6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 10:44:45 +0100 (CET)
Received: from localhost ([::1]:37108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOcaC-00081K-Qu
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 04:44:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOcYT-0006Ex-Jq
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:42:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOcYP-0002kl-8v
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646041365;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zj4ORi+r6+QcDfeZvD6rIiq7dCuAx8mcjLOA14axWms=;
 b=QEijR9b7LYwCFQT5ofJOlTntT9MaEkoZ15ocYeaAYV6P9Bp92XOKHlwan1sVnfI+yITLKD
 Dn/hrvoREAV1UJ6xLcC67XwAM487dnBh1LAwHoNZsqpG3wD0t+Evp1zpBcX8zTjZYh6GTe
 WDV1d9YKezS4mQZtkVefKgMA+2WGztg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-cckYyu2GMi2AVlN5pBCsrw-1; Mon, 28 Feb 2022 04:42:42 -0500
X-MC-Unique: cckYyu2GMi2AVlN5pBCsrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFA47801DDB;
 Mon, 28 Feb 2022 09:42:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CBBC827AC;
 Mon, 28 Feb 2022 09:42:30 +0000 (UTC)
Date: Mon, 28 Feb 2022 09:42:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 1/9] Avocado GitLab CI jobs: don't reset TARGETS and
 simplify commands
Message-ID: <YhyZA2augINEEdr1@redhat.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-2-crosa@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225210156.2032055-2-crosa@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Eric Farman <farman@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 04:01:48PM -0500, Cleber Rosa wrote:
> The Avocado tests rely on the TARGETS variable, which is computed
> based on the built targets.  The current set of commands on the
> inherited scripts section will reset those, leaving TARGETS empty and
> consequently the AVOCADO_CMDLINE_TAGS empty too.
> 
> This is causing the list of tests to have no filtering by tags, which
> can be seen by the large number of CANCEL/SKIP statuses (because of
> the lack of a matching qemu-system-$(ARCH) binary).
> 
> With this change, the TARGETS variable is properly computed, and so is
> the AVOCADO_CMDLINE_TAGS.  This causes a reduction in the number of
> tests attempted to be run on each job, and less noise on the test
> results.

This description isn't making sense to me.

AFAICT, none of the avocado-system-$DISTRO  jobs in buildtest.yml
are setting the $TARGETS variable before/after this change.

> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  .gitlab-ci.d/buildtest-template.yml | 3 +++
>  .gitlab-ci.d/buildtest.yml          | 9 ---------
>  2 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index 2c7980a4f6..c038a0910f 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -64,6 +64,9 @@
>          du -chs ${CI_PROJECT_DIR}/avocado-cache ;
>        fi
>      - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
> +  script:
> +    - cd build
> +    - make check-avocado

The parent template has a 'script:' block we currently inherit 

    - scripts/git-submodule.sh update
        $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
    - cd build
    - find . -type f -exec touch {} +
    # Avoid recompiling by hiding ninja with NINJA=":"
    - make NINJA=":" $MAKE_CHECK_ARGS

so replacing this is loosing the potential git submodule update
and looses the protection against recompilation.

I'm not seeing what in this old inherited is breaking the $TARGETS
variable, not least because it was never set before/after AFAICT.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


