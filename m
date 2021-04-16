Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459193621F9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 16:18:47 +0200 (CEST)
Received: from localhost ([::1]:56388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXPJ0-0003A9-8e
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 10:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lXPEJ-0001Hs-56; Fri, 16 Apr 2021 10:13:55 -0400
Received: from [201.28.113.2] (port=19358 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lXPEH-0007Dg-B8; Fri, 16 Apr 2021 10:13:54 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 16 Apr 2021 11:13:49 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id DE8AA8005F0;
 Fri, 16 Apr 2021 11:13:48 -0300 (-03)
Subject: Re: [RFC PATCH 0/3] tests/tcg/ppc64le: paddi tests
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210415214138.563795-1-matheus.ferst@eldorado.org.br>
 <YHkJ52c/ysoS00qk@yekko.fritz.box>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <338d679e-6619-4f60-5620-24de3ed3bf6d@eldorado.org.br>
Date: Fri, 16 Apr 2021 11:13:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHkJ52c/ysoS00qk@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Apr 2021 14:13:49.0383 (UTC)
 FILETIME=[B8ACBD70:01D732CA]
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
Cc: thuth@redhat.com, gustavo.romero@protonmail.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, f4bug@amsat.org, luis.pires@eldorado.org.br,
 qemu-ppc@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/04/2021 00:52, David Gibson wrote:
> On Thu, Apr 15, 2021 at 06:41:35PM -0300, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> Based-on: <20210413211129.457272-1-luis.pires@eldorado.org.br>
> 
> First things first: it's unclear to me if this is testing stuff that's
> already merged, or it's speculative tests for the in-progress prefixed
> instruction stuff.  i.e. If these tests are applied right now, will
> they pass?

GCC-10 images can be used to test already merged Power10 instructions, 
such as brh/brw/brd, but I haven't writen tests for them (yet?). Both 
tests are targeting paddi, whose implementation is in-progress, so 
applying them now will fail. Maybe I should split the series? Patch 1 
for now, and Patch 2 and 3 when paddi are merged?

>> This series adds gcc-10 based images to enable the build of tests with Power10
>> instructions. Then two tests for paddi are added:
>> - The first one checks a weird behavior observed on POWER10 Functional Simulator
>>    1.1.0, where the 34-bit immediate is treated as a 32-bits one;
>> - The second one exercises the R=1 path of paddi, where CIA is used instead of RA.
>>    The test is failing with the current implementation because we use cpu_nip,
>>    which is not updated all the time. Luis already has the fix, it should be
>>    applied on the next version of his patch series.
>>
>> The main reason to submit this patch as an RFC first is the docker part. I would
>> lie if I tell you that I understand half of what is going on there.
>>   - 'make docker-test-tcg' fails, but apparently on unrelated things;
>>   - 'make docker-run-test-tcg@debian-ppc64el-cross' passes, but it looks
>>     like the test is skipped?
>>   - 'make check-tcg' runs the test and passes (with the fix in place for the
>>     second).
> 
> What sort of host was that on?  Unfortunately 'make check-tcg' has
> been broken on a POWER host for some time, and I've never had time to
> look into it.
> 

I'm testing on amd64, but I can also try on ppc64le.

>>
>> Finally, get_maintainer.pl found no maintainers for
>> tests/tcg/ppc64{,le}/Makefile.target. Would it be Mr. Gibson?
> 
> Uh... sorta?  I also don't know much about what's going on here, but
> I'm probably maintainer by default.
> 

So, should I update MAINTAINERS in this series?

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

