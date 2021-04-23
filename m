Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F9F3692F1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:19:50 +0200 (CEST)
Received: from localhost ([::1]:51714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvin-0002jm-DR
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lZvfn-00018q-69; Fri, 23 Apr 2021 09:16:43 -0400
Received: from [201.28.113.2] (port=10348 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lZvfk-0000om-Oa; Fri, 23 Apr 2021 09:16:42 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 23 Apr 2021 10:16:36 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 1D2F280139F;
 Fri, 23 Apr 2021 10:16:36 -0300 (-03)
Subject: Re: [PATCH v2 1/2] tests/docker: gcc-10 based images for ppc64{, le}
 tests
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210422112754.1099177-1-matheus.ferst@eldorado.org.br>
 <20210422112754.1099177-2-matheus.ferst@eldorado.org.br>
 <87a6ppf9fk.fsf@linux.ibm.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <190bc337-9c12-d416-6e2e-d8c9fe14f8a7@eldorado.org.br>
Date: Fri, 23 Apr 2021 10:16:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87a6ppf9fk.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 23 Apr 2021 13:16:36.0467 (UTC)
 FILETIME=[E3639430:01D73842]
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
Cc: gustavo.romero@protonmail.com, f4bug@amsat.org, qemu-ppc@nongnu.org,
 bruno.larsen@eldorado.org.br, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/04/2021 09:54, Fabiano Rosas wrote:
> matheus.ferst@eldorado.org.br writes:
> 
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> A newer compiler is needed to build tests for Power10 instructions. As
>> done for arm64 on c729a99d2701, a new '-test-cross' image is created for
>> ppc64 and ppc64le. As done on 936fda4d771f, a test for compiler support
>> is added to verify that the toolchain in use has '-mpower10'. Finally,
>> unused images (docker-power-cross and docker-ppc64-cross) are removed.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   .gitlab-ci.d/containers.yml                   | 11 ++--------
>>   tests/docker/Makefile.include                 |  5 ++---
>>   .../dockerfiles/debian-powerpc-cross.docker   | 12 -----------
>>   .../debian-powerpc-test-cross.docker          | 17 ++++++++++++++++
>>   .../dockerfiles/debian-ppc64-cross.docker     | 11 ----------
>>   tests/tcg/configure.sh                        | 20 +++++++++----------
>>   6 files changed, 31 insertions(+), 45 deletions(-)
>>   delete mode 100644 tests/docker/dockerfiles/debian-powerpc-cross.docker
>>   create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker
>>   delete mode 100644 tests/docker/dockerfiles/debian-ppc64-cross.docker
>>
>> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
>> index 33e4046e23..32f1b5887f 100644
>> --- a/.gitlab-ci.d/containers.yml
>> +++ b/.gitlab-ci.d/containers.yml
>> @@ -144,19 +144,12 @@ mipsel-debian-cross-container:
>>     variables:
>>       NAME: debian-mipsel-cross
>>   
>> -powerpc-debian-cross-container:
>> +powerpc-test-debian-cross-container:
>>     <<: *container_job_definition
>>     stage: containers-layer2
>>     needs: ['amd64-debian10-container']
> 
> Should this be debian11?
> 

Yes, I'll send a new version.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

