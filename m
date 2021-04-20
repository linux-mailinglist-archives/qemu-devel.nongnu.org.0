Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F4F365B46
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 16:36:28 +0200 (CEST)
Received: from localhost ([::1]:42936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYrUJ-0007NB-5m
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 10:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lYrPU-0006aC-19; Tue, 20 Apr 2021 10:31:28 -0400
Received: from [201.28.113.2] (port=32833 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lYrPR-0005nN-70; Tue, 20 Apr 2021 10:31:27 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 20 Apr 2021 11:31:18 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id B3AD58010EF;
 Tue, 20 Apr 2021 11:31:17 -0300 (-03)
Subject: Re: [PATCH 1/2] tests/docker: gcc-10 based images for ppc64{,le} tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
 <20210420013308.813323-2-matheus.ferst@eldorado.org.br>
 <YH5RkjCx2Bk4mbop@yekko.fritz.box> <87eef587qc.fsf@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <0558f25b-2329-c0fa-5b86-4e5b25428c86@eldorado.org.br>
Date: Tue, 20 Apr 2021 11:31:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87eef587qc.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Apr 2021 14:31:18.0150 (UTC)
 FILETIME=[D370E260:01D735F1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bruno.larsen@eldorado.org.br, gustavo.romero@protonmail.com,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2021 09:20, Alex Bennée wrote:
> 
> David Gibson <david@gibson.dropbear.id.au> writes:
> 
>> On Mon, Apr 19, 2021 at 10:33:07PM -0300, matheus.ferst@eldorado.org.br wrote:
>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>
>>> A newer compiler is needed to build tests for Power10 instructions. As
>>> done for arm64 on c729a99d2701, a new '-test-cross' image is created for
>>> ppc64 and ppc64le. As done on 936fda4d771f, a test for compiler support
>>> is added to verify that the toolchain in use has '-mpower10'.
>>>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> ---
>>>   tests/docker/Makefile.include                   |  2 ++
>>>   .../debian-powerpc-test-cross.docker            | 17 +++++++++++++++++
>>>   tests/tcg/configure.sh                          | 12 ++++++++----
>>>   3 files changed, 27 insertions(+), 4 deletions(-)
>>>   create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker
>>>
>>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
>>> index 9f464cb92c..f1dbcc639f 100644
>>> --- a/tests/docker/Makefile.include
>>> +++ b/tests/docker/Makefile.include
>>> @@ -152,10 +152,12 @@ docker-image-debian-sparc64-cross: docker-image-debian10
>>>   docker-image-debian-tricore-cross: docker-image-debian10
>>>   docker-image-debian-all-test-cross: docker-image-debian10
>>>   docker-image-debian-arm64-test-cross: docker-image-debian11
>>> +docker-image-debian-power-test-cross: docker-image-debian11
>>>   
>>>   # These images may be good enough for building tests but not for test builds
>>>   DOCKER_PARTIAL_IMAGES += debian-alpha-cross
>>>   DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
>>> +DOCKER_PARTIAL_IMAGES += debian-power-test-cross
>>
>> You add these "power" (as opposed to "powerpc" or "ppc64" or whatever)
>> images here, but they don't seem to be referenced anywhere else.
>>

It's a typo. Probably worked on my machine because a correctly named image
was created outside qemu build before. I'll nuke docker and test again.

>>>   DOCKER_PARTIAL_IMAGES += debian-hppa-cross
>>>   DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
>>>   DOCKER_PARTIAL_IMAGES += debian-powerpc-cross debian-ppc64-cross
> 
> I was expecting the new debian-power-test-cross to replace both
> debian-powerpc-cross and debian-ppc64-cross.
> 

OK, I'll change for powerpc too.

>>> diff --git a/tests/docker/dockerfiles/debian-powerpc-test-cross.docker b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
>>> new file mode 100644
>>> index 0000000000..36b336f709
>>> --- /dev/null
>>> +++ b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
>>> @@ -0,0 +1,17 @@
>>> +#
>>> +# Docker powerpc/ppc64/ppc64le cross-compiler target
>>> +#
>>> +# This docker target builds on the debian Bullseye base image.
>>> +#
>>> +FROM qemu/debian11
>>> +
>>> +RUN apt update && \
>>> +    DEBIAN_FRONTEND=noninteractive eatmydata \
>>> +    apt install -y --no-install-recommends \
>>> +        gcc-powerpc-linux-gnu \
>>> +        libc6-dev-powerpc-cross \
>>> +        gcc-10-powerpc64-linux-gnu \
>>> +        libc6-dev-ppc64-cross \
>>> +        gcc-10-powerpc64le-linux-gnu \
>>> +        libc6-dev-ppc64el-cross
>>
>> I'm not really clear on what distinguishes a -cross.docker image and a
>> -test-cross.docker image.
> 
> The normal cross image (debian-ppc64le-cross) can cross build QEMU. The
> -test-cross images are just used for building check-tcg test cases.
> 
>>
>>> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
>>> index fa1a4261a4..a0be066499 100755
>>> --- a/tests/tcg/configure.sh
>>> +++ b/tests/tcg/configure.sh
>>> @@ -170,13 +170,13 @@ for target in $target_list; do
>>>         ;;
>>>       ppc64-*)
>>>         container_hosts=x86_64
>>> -      container_image=debian-ppc64-cross
>>> -      container_cross_cc=powerpc64-linux-gnu-gcc
>>> +      container_image=debian-powerpc-test-cross
>>> +      container_cross_cc=powerpc64-linux-gnu-gcc-10
>>>         ;;
>>>       ppc64le-*)
>>>         container_hosts=x86_64
>>> -      container_image=debian-ppc64el-cross
>>> -      container_cross_cc=powerpc64le-linux-gnu-gcc
>>> +      container_image=debian-powerpc-test-cross
>>> +      container_cross_cc=powerpc64le-linux-gnu-gcc-10
>>
>> Doesn't this remove all uses of the debian-pp64-cross and
> 
> Yes this should be removed.
> 

Done.

>> debian-ppc64el-cross images, in which case you could remove the
>> matching docker files and so forth too, no?
> 
> Well I assume you still want to check cross building of QEMU. Arguably
> we could still use that for the test cases as well.
>

But then we have the old gcc that can't handle the new instructions, which
is why I started the series :)

>>
>>>         ;;
>>>       riscv64-*)
>>>         container_hosts=x86_64
>>> @@ -280,6 +280,10 @@ for target in $target_list; do
>>>                  -mpower8-vector -o $TMPE $TMPC; then
>>>                   echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
>>>               fi
>>> +            if do_compiler "$target_compiler" $target_compiler_cflags \
>>> +               -mpower10 -o $TMPE $TMPC; then
>>> +                echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
>>> +            fi
>>>           ;;
>>>           i386-linux-user)
>>>               if do_compiler "$target_compiler" $target_compiler_cflags \
> 
> 

Oh, about nesting "ppc64-*" and "ppc64le-*" in tests/tcg/configure.sh:

 >>> +# Specify the cross prefix for this image (see tests/docker/common.rc)
 >>> +#ENV QEMU_CONFIGURE_OPTS --cross-prefix=powerpc64le-linux-gnu-
 >>> +#ENV DEF_TARGET_LIST 
ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
 >>> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
 >>> index fa1a4261a4..5f5db91a01 100755
 >>> --- a/tests/tcg/configure.sh
 >>> +++ b/tests/tcg/configure.sh
 >>> @@ -170,13 +170,13 @@ for target in $target_list; do
 >>>        ;;
 >>>      ppc64-*)
 >>>        container_hosts=x86_64
 >>> -      container_image=debian-ppc64-cross
 >>> -      container_cross_cc=powerpc64-linux-gnu-gcc
 >>> +      container_image=debian-ppc64-test-cross
 >>> +      container_cross_cc=powerpc64-linux-gnu-gcc-10
 >>>        ;;
 >>>      ppc64le-*)
 >>>        container_hosts=x86_64
 >>> -      container_image=debian-ppc64el-cross
 >>> -      container_cross_cc=powerpc64le-linux-gnu-gcc
 >>> +      container_image=debian-ppc64el-test-cross
 >>> +      container_cross_cc=powerpc64le-linux-gnu-gcc-10
 >>>        ;;
 >>
 > I don't know if it's possible to nest the cases but if it's not too
 > ugly bringing all the cases into one place and just differentiating the
 > container_cross_cc would be nice.

We could do something like:
 > ppc64*-|ppc64le-*)
 >     container_hosts=x86_64
 >     container_image=debian-powerpc-test-cross
 >     container_cross_cc=${target%%-*}-linux-gnu-gcc-10
 >     container_cross_cc=powerpc${container_cross_cc#ppc}
But I think it's kind of ugly to repeat container_cross_cc line. If we do
that, we can bring ppc-* too, but another line would be needed to handle
ppc64abi32-*...

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

