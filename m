Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444F5302321
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 10:10:58 +0100 (CET)
Received: from localhost ([::1]:36346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3xth-0007Xe-D7
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 04:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l3xsA-000762-UW
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:09:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l3xs8-0002RY-TF
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611565760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ccfnkKPCyERGsWy88ADVXgRkRaAjYKu796vfVgSeiY=;
 b=I2xjmnIZwUg7EDWYyv3knKkTANqAVshd1V25TY0nKUswxyqKjOUQPkKPn9Ls39UBtv4EsQ
 Sjgn2ph1GqJO0ZFPvcydIxru0jZrrg9IRvILd2R4zoXmsQKeO3mIvWQFlNtQ54RFlYaaRM
 W1RUsqvJyzjw+Z1BQSFYW+PJqLCochE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-4r4SCtgDNECZ9mTH3wpF_w-1; Mon, 25 Jan 2021 04:09:18 -0500
X-MC-Unique: 4r4SCtgDNECZ9mTH3wpF_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EA21AFA81
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 09:09:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-127.ams2.redhat.com [10.36.112.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C47AC10021AA;
 Mon, 25 Jan 2021 09:09:12 +0000 (UTC)
Subject: Re: [RFC PATCH] gitlab-ci.yml: Speed up CI by using "meson test
 --no-rebuild"
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210124075848.53971-1-thuth@redhat.com>
 <CABgObfbxY_ETKF6V9QYh2rQeF0fRD5EVWjJtnyyexc2qe5CMgQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <52506627-8150-bc83-2ac0-c0c8927126f9@redhat.com>
Date: Mon, 25 Jan 2021 10:09:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CABgObfbxY_ETKF6V9QYh2rQeF0fRD5EVWjJtnyyexc2qe5CMgQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2021 12.32, Paolo Bonzini wrote:
> check-block is not run by "meson test".

Thanks! I've just send a v1 now which also runs the iotests again.

  Thomas


> 
> Il dom 24 gen 2021, 08:58 Thomas Huth <thuth@redhat.com 
> <mailto:thuth@redhat.com>> ha scritto:
> 
>     Currently, our check-system-* jobs are recompiling the whole sources
>     again. This happens due to the fact that the jobs are checking out
>     the whole source tree and required submodules again, and only try
>     to use the "build" directory with the binaries and object files
>     as an artifact from the previous stage - which simply does not work
>     anymore (with the current version of meson). Due to some changed
>     time stamps, meson is always trying to rebuild the whole tree.
> 
>     To fix this problem, use "meson test --no-rebuild" instead of
>     "make check" to avoid rebuilding all binaries every time. This
>     saves ca. 15 - 20 minutes of precious CI cycles in each run.
> 
>     Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:thuth@redhat.com>>
>     ---
>       Marked as "RFC" since I'm not quite sure whether "meson test" has
>       the same test coverage as "make check"... Paolo?
> 
>       .gitlab-ci.yml | 41 ++++++++++++++++++++++-------------------
>       1 file changed, 22 insertions(+), 19 deletions(-)
> 
>     diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>     index de3a3d25b5..c9fb11c325 100644
>     --- a/.gitlab-ci.yml
>     +++ b/.gitlab-ci.yml
>     @@ -34,6 +34,19 @@ include:
>               make -j"$JOBS" $MAKE_CHECK_ARGS ;
>             fi
> 
>     +.native_meson_test_job:
>     +  stage: test
>     +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     +  script:
>     +    - cd build
>     +    - touch *
>     +    - make git-submodule-update
>     +    - if [ -x ../meson/meson.py ]; then
>     +          ../meson/meson.py test --no-rebuild -t 5 $MESON_TEST_ARGS ;
>     +      else
>     +          meson test --no-rebuild -t 5 $MESON_TEST_ARGS ;
>     +      fi
>     +
>       .native_test_job_template: &native_test_job_definition
>         stage: test
>         image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     @@ -83,17 +96,15 @@ build-system-alpine:
>         artifacts:
>           expire_in: 2 days
>           paths:
>     -      - .git-submodule-status
>             - build
> 
>       check-system-alpine:
>     -  <<: *native_test_job_definition
>     +  extends: .native_meson_test_job
>         needs:
>           - job: build-system-alpine
>             artifacts: true
>         variables:
>           IMAGE: alpine
>     -    MAKE_CHECK_ARGS: check
> 
>       acceptance-system-alpine:
>         <<: *native_test_job_definition
>     @@ -118,13 +129,12 @@ build-system-ubuntu:
>             - build
> 
>       check-system-ubuntu:
>     -  <<: *native_test_job_definition
>     +  extends: .native_meson_test_job
>         needs:
>           - job: build-system-ubuntu
>             artifacts: true
>         variables:
>           IMAGE: ubuntu2004
>     -    MAKE_CHECK_ARGS: check
> 
>       acceptance-system-ubuntu:
>         <<: *native_test_job_definition
>     @@ -149,13 +159,12 @@ build-system-debian:
>             - build
> 
>       check-system-debian:
>     -  <<: *native_test_job_definition
>     +  extends: .native_meson_test_job
>         needs:
>           - job: build-system-debian
>             artifacts: true
>         variables:
>           IMAGE: debian-amd64
>     -    MAKE_CHECK_ARGS: check
> 
>       # No targets are built here, just tools, docs, and unit tests. This
>       # also feeds into the eventual documentation deployment steps later
>     @@ -194,13 +203,12 @@ build-system-fedora:
>             - build
> 
>       check-system-fedora:
>     -  <<: *native_test_job_definition
>     +  extends: .native_meson_test_job
>         needs:
>           - job: build-system-fedora
>             artifacts: true
>         variables:
>           IMAGE: fedora
>     -    MAKE_CHECK_ARGS: check
> 
>       acceptance-system-fedora:
>         <<: *native_test_job_definition
>     @@ -226,13 +234,12 @@ build-system-centos:
>             - build
> 
>       check-system-centos:
>     -  <<: *native_test_job_definition
>     +  extends: .native_meson_test_job
>         needs:
>           - job: build-system-centos
>             artifacts: true
>         variables:
>           IMAGE: centos8
>     -    MAKE_CHECK_ARGS: check
> 
>       acceptance-system-centos:
>         <<: *native_test_job_definition
>     @@ -256,13 +263,12 @@ build-system-opensuse:
>             - build
> 
>       check-system-opensuse:
>     -  <<: *native_test_job_definition
>     +  extends: .native_meson_test_job
>         needs:
>           - job: build-system-opensuse
>             artifacts: true
>         variables:
>           IMAGE: opensuse-leap
>     -    MAKE_CHECK_ARGS: check
> 
>       acceptance-system-opensuse:
>          <<: *native_test_job_definition
>     @@ -525,13 +531,12 @@ build-crypto-old-nettle:
>             - build
> 
>       check-crypto-old-nettle:
>     -  <<: *native_test_job_definition
>     +  extends: .native_meson_test_job
>         needs:
>           - job: build-crypto-old-nettle
>             artifacts: true
>         variables:
>           IMAGE: centos7
>     -    MAKE_CHECK_ARGS: check
> 
> 
>       build-crypto-old-gcrypt:
>     @@ -546,13 +551,12 @@ build-crypto-old-gcrypt:
>             - build
> 
>       check-crypto-old-gcrypt:
>     -  <<: *native_test_job_definition
>     +  extends: .native_meson_test_job
>         needs:
>           - job: build-crypto-old-gcrypt
>             artifacts: true
>         variables:
>           IMAGE: centos7
>     -    MAKE_CHECK_ARGS: check
> 
> 
>       build-crypto-only-gnutls:
>     @@ -567,13 +571,12 @@ build-crypto-only-gnutls:
>             - build
> 
>       check-crypto-only-gnutls:
>     -  <<: *native_test_job_definition
>     +  extends: .native_meson_test_job
>         needs:
>           - job: build-crypto-only-gnutls
>             artifacts: true
>         variables:
>           IMAGE: centos7
>     -    MAKE_CHECK_ARGS: check
> 
>       # We don't need to exercise every backend with every front-end
>       build-trace-multi-user:
>     -- 
>     2.27.0
> 


