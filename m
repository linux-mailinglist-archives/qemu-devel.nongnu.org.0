Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F086D279D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 12:59:14 +0200 (CEST)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIWA5-00034x-0F
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 06:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45932)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iIW9C-0002eM-1g
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 06:58:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iIW99-000659-Ep
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 06:58:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51716)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iIW99-00064V-95
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 06:58:15 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5A8218C4283;
 Thu, 10 Oct 2019 10:58:13 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8697610013A1;
 Thu, 10 Oct 2019 10:58:10 +0000 (UTC)
Date: Thu, 10 Oct 2019 11:58:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 5/5] travis.yml: Compile on arm64, too
Message-ID: <20191010105808.GH28562@redhat.com>
References: <20191009170701.14756-1-thuth@redhat.com>
 <20191009170701.14756-6-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191009170701.14756-6-thuth@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Thu, 10 Oct 2019 10:58:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 09, 2019 at 07:07:01PM +0200, Thomas Huth wrote:
> Travis now features an arm64 build host, so let's check compilation
> there, too.
> 
> Unfortunately, there are some quirks:
> - block/ssh.c does not compile properly in this environment, so we have
>   to use --disable-libssh until that problem is fixed.
> - test-util-filemonitor fails, so we can not run the unit tests there

Do you have any more info on this failure ?

Running tests with FILEMONITOR_DEBUG=1 env variable set will make
it print more info


Skipping unit tests seems to throw away the main benefit of using
the travis arm64 hosts, as it is the tests which add value over
our cross-compiled arm builds.

> - The file system size seems to be very limited, so the iotest tests
>   can't be used and the hd-geo-test fails (thus we can't compile
>   x86_64-softmmu here and run "check-qtest" afterwards)
> - Compiling seems to be quite a bit slower than on the x86 builders,
>   so we better limit the target list to some few architectures.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .travis.yml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 0c88e8757b..357ca02890 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -342,3 +342,9 @@ matrix:
>          - CONFIG="--target-list=xtensa-softmmu,arm-softmmu,aarch64-softmmu,alpha-softmmu"
>          - TEST_CMD="make -j3 check-tcg V=1"
>          - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
> +
> +    # Non-x86 builds:
> +    - env:
> +        - CONFIG="--disable-libssh --target-list=aarch64-softmmu,ppc64-softmmu,s390x-softmmu,x86_64-linux-user"
> +        - TEST_CMD="make check-qtest check-softfloat -j3 V=1"
> +      arch: arm64
> -- 
> 2.18.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

