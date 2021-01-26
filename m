Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F8D303ED7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 14:37:58 +0100 (CET)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4OXd-0001Tb-8N
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 08:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l4OWg-00013F-SX
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:36:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l4OWf-0007qo-5i
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611668216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0PXb3V1W06W/TaSr8RDnJxiOlda7OUtkdz+PnOLZiY=;
 b=jT0hYB4qcs8+NbUH7V+kTtFXCBjkH114fhYBEp7KfjF+xYHGHVj9y2bcZNUCyy0jxJDeb7
 n7CkQn4VfAro1IRuhL5urD4seA6OJI5rD2ECd4JWShepNY/mjXfNr94ZZLgxiFhVg5Pn/c
 ZbhcK0hrZL5Q0ViWaVFRrGoleSitAYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-doM37u_POhqvEWlgeZ2u1g-1; Tue, 26 Jan 2021 08:36:53 -0500
X-MC-Unique: doM37u_POhqvEWlgeZ2u1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C80F9102C85B
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 13:36:48 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38C62703B8;
 Tue, 26 Jan 2021 13:36:44 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci.yml: Avoid recompiling the sources in the test
 jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210126065757.403853-1-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <7fb12c4f-b554-67c9-169b-6ee6535b6394@redhat.com>
Date: Tue, 26 Jan 2021 10:36:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210126065757.403853-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/26/21 3:57 AM, Thomas Huth wrote:
> Currently, our check-system-* jobs are recompiling the whole sources
> again. This happens due to the fact that the jobs are checking out
> the whole source tree and required submodules again, and only try
> to use the "build" directory with the binaries and object files as an
> artifact from the previous stage - which simply does not work right
> anymore (with the current version of meson). Due to some changed
> time stamps, meson/ninja are always trying to rebuild the whole tree.
>
> In the long run, we could likely use "meson test --no-rebuild", but
> there is still some work going on in that area to improve the user
> experience. So until this has been done, simply avoid recompiling the
> sources with a trick: pass NINJA=":" to the make process in the test
> jobs. Also check out the submodules manually before updating the
> timestamps in the build folder, so that the binaries are definitely
> newer that all the source files.
> This saves ca. 10 - 15 minutes of precious CI cycles in each run.
Thanks for working on this!
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.yml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index de3a3d25b5..16fea25ba9 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -38,9 +38,11 @@ include:
>     stage: test
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     script:
> +    - scripts/git-submodule.sh update
> +        $(grep GIT_SUBMODULES build/config-host.mak | sed 's/GIT_SUBMODULES=//')
>       - cd build
>       - find . -type f -exec touch {} +
> -    - make $MAKE_CHECK_ARGS
> +    - make NINJA=":" $MAKE_CHECK_ARGS
>   
>   .acceptance_template: &acceptance_definition
>     cache:


