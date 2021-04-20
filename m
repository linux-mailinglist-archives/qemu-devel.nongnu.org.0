Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01108365BE8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:10:19 +0200 (CEST)
Received: from localhost ([::1]:48090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYs14-0007C6-2C
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lYrxU-00065X-8Y; Tue, 20 Apr 2021 11:06:36 -0400
Received: from [201.28.113.2] (port=42167 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lYrxR-0002to-OY; Tue, 20 Apr 2021 11:06:35 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 20 Apr 2021 12:06:30 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 9E4688010EF;
 Tue, 20 Apr 2021 12:06:29 -0300 (-03)
Subject: Re: [PATCH 1/2] tests/docker: gcc-10 based images for ppc64{, le}
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
 <20210420013308.813323-2-matheus.ferst@eldorado.org.br>
 <YH5RkjCx2Bk4mbop@yekko.fritz.box> <87eef587qc.fsf@linaro.org>
 <2e297129-ed1e-4620-982b-27546ce554ff@amsat.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <943b7c21-a5cd-d845-9b1b-f73d60ba54f4@eldorado.org.br>
Date: Tue, 20 Apr 2021 12:06:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2e297129-ed1e-4620-982b-27546ce554ff@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Apr 2021 15:06:30.0065 (UTC)
 FILETIME=[BE3D8A10:01D735F6]
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
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2021 09:35, Philippe Mathieu-Daudé wrote:
> On 4/20/21 2:20 PM, Alex Bennée wrote:
>> David Gibson <david@gibson.dropbear.id.au> writes:
>>> On Mon, Apr 19, 2021 at 10:33:07PM -0300, matheus.ferst@eldorado.org.br wrote:
>>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>>
>>>> A newer compiler is needed to build tests for Power10 instructions. As
>>>> done for arm64 on c729a99d2701, a new '-test-cross' image is created for
>>>> ppc64 and ppc64le. As done on 936fda4d771f, a test for compiler support
>>>> is added to verify that the toolchain in use has '-mpower10'.
>>>>
>>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>> ---
>>>>   tests/docker/Makefile.include                   |  2 ++
>>>>   .../debian-powerpc-test-cross.docker            | 17 +++++++++++++++++
>>>>   tests/tcg/configure.sh                          | 12 ++++++++----
>>>>   3 files changed, 27 insertions(+), 4 deletions(-)
>>>>   create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker
>>>>
>>>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
>>>> index 9f464cb92c..f1dbcc639f 100644
>>>> --- a/tests/docker/Makefile.include
>>>> +++ b/tests/docker/Makefile.include
>>>> @@ -152,10 +152,12 @@ docker-image-debian-sparc64-cross: docker-image-debian10
>>>>   docker-image-debian-tricore-cross: docker-image-debian10
>>>>   docker-image-debian-all-test-cross: docker-image-debian10
>>>>   docker-image-debian-arm64-test-cross: docker-image-debian11
>>>> +docker-image-debian-power-test-cross: docker-image-debian11
>>>>   
>>>>   # These images may be good enough for building tests but not for test builds
>>>>   DOCKER_PARTIAL_IMAGES += debian-alpha-cross
>>>>   DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
>>>> +DOCKER_PARTIAL_IMAGES += debian-power-test-cross
>>>
>>> You add these "power" (as opposed to "powerpc" or "ppc64" or whatever)
>>> images here, but they don't seem to be referenced anywhere else.
>>>
>>>>   DOCKER_PARTIAL_IMAGES += debian-hppa-cross
>>>>   DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
>>>>   DOCKER_PARTIAL_IMAGES += debian-powerpc-cross debian-ppc64-cross
>>
>> I was expecting the new debian-power-test-cross to replace both
>> debian-powerpc-cross and debian-ppc64-cross.
> 
> Maybe rename the images as:
> 
> DISTRIB-TARGET-crossbuild and DISTRIB-TARGET-crosstest-tcg?
> (as it is not obvious for every contributor than 'cross' imply
> emulation and not virtualization).
> 

If I grep'ed it correctly, in a separate patch we'd mv:
debian-alpha-cross{,test-tcg}.docker
debian-arm64-{test-cross,crosstest-tcg}.docker
debian-hppa-cross{,test-tcg}.docker
debian-m68k-cross{,test-tcg}.docker
debian-mips64-cross{,test-tcg}.docker
debian-powerpc-cross{,test-tcg}.docker
debian-riscv64-cross{,test-tcg}.docker
debian-sh4-cross{,test-tcg}.docker
debian-sparc64-cross{,test-tcg}.docker
debian-tricore-cross{,test-tcg}.docker
debian-xtensa-cross{,test-tcg}.docker
debian-amd64-cross{,build}.docker
debian-arm64-cross{,build}.docker
debian-armel-cross{,build}.docker
debian-armhf-cross{,build}.docker
debian-mips64el-cross{,build}.docker
debian-mips-cross{,build}.docker
debian-mipsel-cross{,build}.docker
debian-ppc64{el-cross,le-crossbuild}.docker
debian-s390x-cross{,build}.docker

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

