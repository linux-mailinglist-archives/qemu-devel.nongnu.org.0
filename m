Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E453BA02B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 14:03:21 +0200 (CEST)
Received: from localhost ([::1]:56576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzHtA-00007H-Kw
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 08:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lzHrt-0007oD-O8; Fri, 02 Jul 2021 08:02:01 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:49833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lzHrr-0005W5-E1; Fri, 02 Jul 2021 08:02:01 -0400
Received: from [192.168.100.1] ([82.142.16.182]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N8GdE-1lD9Hp2jke-014Bcm; Fri, 02 Jul 2021 14:01:49 +0200
Subject: Re: [PATCH v5 0/2] target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr
 reporting
To: Cornelia Huck <cohuck@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20210623023250.3667563-1-iii@linux.ibm.com>
 <87a6n5j976.fsf@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3624d483-dd11-6464-bbfd-ed2921b2fcfe@vivier.eu>
Date: Fri, 2 Jul 2021 14:01:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87a6n5j976.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eY3/jwt7nwpin7poZMOSPcEozlX5GdtPxDiq68nGMlPtWXPVNwf
 H38bilPcK2yGTrvokewBO6ihx7lbOCWz7rcnfMJt+mghUJvSThu/YwNK5LV2rF6p+hgDKSC
 KJ9YJHTNk0+w4gliAJ/AiTd2nebf74oTk2ed8JbDpVDKhnH2tqBjp5kYqZ/z1N26ApwWESe
 6jmp1qJMheUpjWql6IOWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FfOMkSWqEjs=:ZQvDiW6FmTNfbofW4FzUcf
 VV33OHau3hDuXMh61Rq+Suo/GnVR3unGgn073taIoYH+ZtwDYdB/daGjYFBwAu2qHlmNDYdBY
 8oUfVeOFeLaGx7dplyQa7cqxV/UQ/hprurXo0xm2aF9a9wQ7ukbZf04NPoGc6V1StDYr7b/eW
 6itWuXK+KQtkWDiRs/bIEk8cxqpAArr8pMnQsHMUPbc8NgJrVypbmH0EhvnlwXEtVkIHn6+R/
 hlx6ZJ82GlWZMztIKqKzTJ6Rosn44OEs9E6ozaEjICPEkvb9ZUo04ngpw5qRsfe2BM694tD4D
 qvX+iRDdH8zsZoBAzyAJ30PFgBvfB5UnEgcxkZPqKlerNmgl0yZYxDiGW6xkzO7NwwdjM3NC4
 kLL+uTVFkY65PlwmJRe077J9WHlxvbKEEF/V50qK19TwpvKH7foWDby4AIgxblL3efO2p0RDl
 SBxyNWfKjGUJKFT/HkjNWgcrFa/NTDaQLyASS9j8GvMrEcjljOuu5LAdwOiz3UO6PrX/WF/Yu
 x8JaR3to2xi+gaByFObrY53z7jFuB3oy+eTrYpuS+AGawkdx9BjSOvhZPCgdmpJ7qb18aZ6GJ
 kmWaJUpk0+ojr1oHY7GXcqASTvHqs/ViaAZrt9yzloRtBhZHV/rDBTNPhGee4bxYA/zCiWA/z
 kx/Ji4b71fakXJNVmUnqfo5Y6U1kk2oCQmySLvQAMvQOAVCZfqLq79Vx5iGn/FrszZq5aLi/D
 Vmkvb0cR8oipzbSwZaX42zpcBBu+TIR7ex1QuiNybBL8fOBl7KunKq1i/PZDYz5cxkjjjjBua
 OAhFbvc7PT1CB/hrp96Q8kvhxmgzoPkX6d51tGloG6p+4kDYRmF2j1pp8UAyZtSdbAl1FUs
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/07/2021 à 12:34, Cornelia Huck a écrit :
> On Wed, Jun 23 2021, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> 
>> qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr: it
>> should be a pointer to the instruction following the illegal
>> instruction, but at the moment it is a pointer to the illegal
>> instruction itself. This breaks OpenJDK, which relies on this value.
>> A similar problem exists for SIGFPE and SIGTRAP.
>>
>> Patch 1 fixes the issue, patch 2 adds a test.
>>
>> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
>> v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
>>           magic in the test and add an explanation (David).
>>
>> v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06649.html
>> v2 -> v3: Fix SIGSEGV handling (found when trying to run valgrind under
>>           qemu-user).
>>
>> v3: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg00299.html
>> v3 -> v4: Fix compiling the test on Ubuntu 20.04 (Jonathan).
>>
>> v4: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05848.html
>> v4 -> v5: Greatly simplify the fix (Ulrich).
>>
>> Note: the compare-and-trap SIGFPE issue is being fixed separately.
>> https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05690.html
>>
>> Ilya Leoshkevich (2):
>>   target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr reporting
>>   tests/tcg/s390x: Test SIGILL and SIGSEGV handling
>>
>>  linux-user/s390x/cpu_loop.c     |   5 +
>>  tests/tcg/s390x/Makefile.target |   1 +
>>  tests/tcg/s390x/signal.c        | 165 ++++++++++++++++++++++++++++++++
>>  3 files changed, 171 insertions(+)
>>  create mode 100644 tests/tcg/s390x/signal.c
> 
> What's the status of this and
> <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>? linux-user
> is not really my turf, but it would be sad if this fell through the
> cracks.
> 

If from the S390x point of view they are correct, I can collect them via linux-user.

Thanks,
Laurent

