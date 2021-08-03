Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F293DEAB7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 12:17:39 +0200 (CEST)
Received: from localhost ([::1]:36410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mArUP-00007t-Ql
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 06:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mArTb-0007rI-Ur; Tue, 03 Aug 2021 06:16:47 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:40235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mArTa-0005Ff-2g; Tue, 03 Aug 2021 06:16:47 -0400
Received: from [192.168.100.1] ([82.142.21.182]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MUokB-1mb5TG1a3V-00Qfzm; Tue, 03 Aug 2021 12:16:35 +0200
Subject: Re: [PATCH v6 0/2] target/s390x: Fix SIGILL and SIGFPE psw.addr
 reporting
To: Cornelia Huck <cohuck@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20210705210434.45824-1-iii@linux.ibm.com>
 <87pmuvymi0.fsf@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c1c33e21-0e89-d2b6-8fc1-71fd34efa1e9@vivier.eu>
Date: Tue, 3 Aug 2021 12:16:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87pmuvymi0.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dBo93dqsJ08bNzsao3k3ynr+tVaer5RvD6ZdM6PBTsqPhzU1toS
 tJz8iFq6NJSiAfsRlNW3VpwY/214DEhmjiAJp9+QKk17gRkv2n87QANHkxT7In6iCa7ITku
 MEM2OBATgdgwo9MVmaAiJ8IVz7tl1vKmfP6lOWXYILeIhoer+KStJwSrCa/bqyiZwBWq0Is
 kqPsVCwyoiy+3km5i3VQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:av1gOKdhcmE=:i4XXF/u7Zm96tWBTbPs0aR
 /Zkurt1LfZr8u9Tq6UPy8OGn0ovlzuNPVmuSVvFRsFa35ulcMichH32bfxG2wgVmxWKRBFjiz
 lscHZDHvReu+ydan0bmeD4CDYXG6KUDqSeTflYCO6k/EkGgE+tbOD5a5vYxuhTHQD+z8Z657L
 iK9KdbueYtoPcdgfUSc6lAu0rxLCZRYsCaLG4eWTMw/9okPMBDq7DuuCU10XlX8kKfXqzoptW
 XlHkCAWqEkitSJYVLrbTIZlR9orRIKziIEM8XlgWoK4xM2ZrTjB40+r6sXI/F3N1b/DY2JgwU
 nCp66y/4UPq3UwncFuUyOSU+6bKL8DuNpHC9NROGtTFIZJsbd2zNu40V+IcvYY6ZAvrJe4Bu0
 rtJPzc4ACOT9pu3kmIS7fVaxDDzKrVfCFVsM/EdQRHxXcJu6uSww66EC8f86LSggPxXdvU4+a
 I1hnc0MUxOTr1YjATuvqGrdR2ZbGvfFNM9TuOYN2FUilYunjJcEG7uAUw8OMVsX133puXLVVk
 tw8zgb7MlkbMgqLil+MkDE7rNQdzUlicwn+7mf1ueJAyqyuFXYru5TpxbKg3SVa0w==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 03/08/2021 à 10:13, Cornelia Huck a écrit :
> On Mon, Jul 05 2021, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> 
>> qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr: it
>> should be a pointer to the instruction following the illegal
>> instruction, but at the moment it is a pointer to the illegal
>> instruction itself. This breaks OpenJDK, which relies on this value.
>> A similar problem exists for SIGFPE.
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
>> v5: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg06244.html
>> v5 -> v6: Fix breakpoints (David). Add gdbstub test.
>>
>> Note: the compare-and-trap SIGFPE issue is being fixed separately.
>> https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05690.html
>>
>> Ilya Leoshkevich (2):
>>   target/s390x: Fix SIGILL and SIGFPE psw.addr reporting
>>   tests/tcg/s390x: Test SIGILL and SIGSEGV handling
>>
>>  linux-user/s390x/cpu_loop.c                   |  12 +-
>>  tests/tcg/s390x/Makefile.target               |  18 +-
>>  tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
>>  tests/tcg/s390x/signals-s390x.c               | 165 ++++++++++++++++++
>>  4 files changed, 269 insertions(+), 2 deletions(-)
>>  create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
>>  create mode 100644 tests/tcg/s390x/signals-s390x.c
> 
> So, I'd like to see this merged, but I'm unsure on what we agreed -- I
> thought this would go via linux-user. Do I misremember?
> 

Please, take them via the s390x branch.

Thanks,
Laurent

