Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9015A63C277
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 15:29:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p01bV-0003NC-FX; Tue, 29 Nov 2022 09:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p01bR-0003My-Tz
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:28:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p01bP-0007Wg-77
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:28:53 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ATEPXCM019629; Tue, 29 Nov 2022 14:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=xyd5gjPAtHw5KIrUYTjAK2YGsS5D9eyc9sQOBv6aXN4=;
 b=ObuO8kOhCaeLFq4+EoMYrGW5EUi0zuSLDJ/9xMsE5f744PuysFuol6I38UPQPyeoKgLc
 ywFsPs9UOmnlZYfes+B11GC0CwvDDLgraL2nMFfz+S4ah0RI6/EtOgatvw2fSMVd6Bkq
 EFqd0LKaa7o+irylBW639hXbaFAwNLP9tydZzh0p4wBS2RiTY+rTCsUT7BHuCjAEoyG3
 w5kZYIWoHjknhS2EuEvjKTbL9nTk+s6YIlho34X8PqfqLQw0bNMXPXSD7nezxXbxHoFH
 zemYIDf2GktLiTPcgjJb1NL7qT7SVnCdFvZ6ohNO4UUYdCNbW+cNVITrvD+KBPADIdkN eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5ckmmm7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 14:28:48 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ATEQux1028727;
 Tue, 29 Nov 2022 14:28:48 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5ckmmm6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 14:28:47 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATE6ITo026597;
 Tue, 29 Nov 2022 14:28:45 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3m3ae931hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 14:28:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2ATETQJI65667488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Nov 2022 14:29:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50169A405F;
 Tue, 29 Nov 2022 14:28:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 145CEA405B;
 Tue, 29 Nov 2022 14:28:43 +0000 (GMT)
Received: from heavy (unknown [9.171.21.28])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 29 Nov 2022 14:28:43 +0000 (GMT)
Date: Tue, 29 Nov 2022 15:28:41 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/tcg/s390x: Add cdsg.c
Message-ID: <20221129142841.bxfur7qpkwb42fsi@heavy>
References: <20221128234051.7j3tre72owh4eyif@heavy>
 <20221128234813.46685-1-iii@linux.ibm.com>
 <2fb2b364-231d-1087-c516-c0144bac0979@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fb2b364-231d-1087-c516-c0144bac0979@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Fdr3nqU6S0oRkq7CDZz8R70Wq7ktjMdh
X-Proofpoint-ORIG-GUID: 9TXt2eGZNJSYpxBObZm_LxFtvsEJ3aLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_08,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 mlxlogscore=730 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290081
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 29, 2022 at 09:54:13AM +0100, David Hildenbrand wrote:
> On 29.11.22 00:48, Ilya Leoshkevich wrote:
> > Add a simple test to prevent regressions.
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >   tests/tcg/s390x/Makefile.target |  4 ++
> >   tests/tcg/s390x/cdsg.c          | 73 +++++++++++++++++++++++++++++++++
> >   2 files changed, 77 insertions(+)
> >   create mode 100644 tests/tcg/s390x/cdsg.c
> > 
> > diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> > index 1d454270c0e..523214dac33 100644
> > --- a/tests/tcg/s390x/Makefile.target
> > +++ b/tests/tcg/s390x/Makefile.target
> > @@ -27,6 +27,7 @@ TESTS+=noexec
> >   TESTS+=div
> >   TESTS+=clst
> >   TESTS+=long-double
> > +TESTS+=cdsg
> >   Z13_TESTS=vistr
> >   $(Z13_TESTS): CFLAGS+=-march=z13 -O2
> > @@ -66,3 +67,6 @@ sha512-mvx: sha512.c
> >   	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
> >   TESTS+=sha512-mvx
> > +
> > +cdsg: CFLAGS+=-pthread
> > +cdsg: LDFLAGS+=-pthread
> > diff --git a/tests/tcg/s390x/cdsg.c b/tests/tcg/s390x/cdsg.c
> > new file mode 100644
> > index 00000000000..83313699f7d
> > --- /dev/null
> > +++ b/tests/tcg/s390x/cdsg.c
> > @@ -0,0 +1,73 @@
> > +#include <assert.h>
> > +#include <pthread.h>
> > +#include <stdbool.h>
> > +#include <stdlib.h>
> > +
> > +static volatile bool start;
> > +static unsigned long val[2] __attribute__((__aligned__(16)));
> > +
> > +void *cdsg_loop(void *arg)
> > +{
> > +    unsigned long orig0, orig1, new0, new1;
> > +    register unsigned long r0 asm("r0");
> > +    register unsigned long r1 asm("r1");
> > +    register unsigned long r2 asm("r2");
> > +    register unsigned long r3 asm("r3");
> > +    int cc;
> > +    int i;
> > +
> > +    while (!start) {
> > +    }
> > +
> > +    orig0 = val[0];
> > +    orig1 = val[1];
> > +    for (i = 0; i < 1000;) {
> 
> Are 1000 iterations sufficient to catch the race window reliably?

Good point, I had to raise it to 10k.
If I break the code like this:

--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3509,7 +3509,7 @@ void tcg_gen_atomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
 {
     gen_atomic_cx_i128 gen;
 
-    if (!(tcg_ctx->tb_cflags & CF_PARALLEL)) {
+    if (true) {
         tcg_gen_nonatomic_cmpxchg_i128(retv, addr, cmpv, newv, idx, memop);
         return;
     }
 
the test with 10k iterations fails consistently.
And it's still fast:

$ time -p ./qemu-s390x ./tests/tcg/s390x-linux-user/cdsg
real 0.01

> > +        new0 = orig0 + 1;
> > +        new1 = orig1 + 2;
> > +
> > +        r0 = orig0;
> > +        r1 = orig1;
> > +        r2 = new0;
> > +        r3 = new1;
> > +        asm("cdsg %[r0],%[r2],%[db2]\n"
> > +            "ipm %[cc]"
> > +            : [r0] "+r" (r0)
> > +            , [r1] "+r" (r1)
> > +            , [db2] "=m" (val)
> > +            , [cc] "=r" (cc)
> > +            : [r2] "r" (r2)
> > +            , [r3] "r" (r3)
> > +            : "cc");
> 
> Nit: I'd suggest a simple cdsg helper function that makes this code easier
> to digest.

Ok.

> 
> > +        orig0 = r0;
> > +        orig1 = r1;
> > +        cc = (cc >> 28) & 3;
> > +
> > +        if (cc == 0) {
> > +            orig0 = new0;
> > +            orig1 = new1;
> > +            i++;
> > +        } else {
> > +            assert(cc == 1);
> > +        }
> > +    }
> > +
> > +    return NULL;
> > +}
> > +
> > +int main(void)
> > +{
> > +    pthread_t thread;
> > +    int ret;
> > +
> > +    ret = pthread_create(&thread, NULL, cdsg_loop, NULL);
> > +    assert(ret == 0);
> > +    start = true;
> > +    cdsg_loop(NULL);
> > +    ret = pthread_join(thread, NULL);
> > +    assert(ret == 0);
> > +
> > +    assert(val[0] == 2000);
> > +    assert(val[1] == 4000);
> > +
> > +    return EXIT_SUCCESS;
> > +}
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 
> 

