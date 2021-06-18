Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDD33ACCB5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 15:49:40 +0200 (CEST)
Received: from localhost ([::1]:42070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luEsN-0008Am-0Q
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 09:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1luEqu-0007Bs-Me; Fri, 18 Jun 2021 09:48:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1luEqr-00050t-Rb; Fri, 18 Jun 2021 09:48:08 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15IDXFZa015918; Fri, 18 Jun 2021 09:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=VTldRZBStjakeVsbkGunDI/PFGjdi+NcgbuiO6TpT/c=;
 b=OkAELLc3AwoxxeJg4MV4XiR6x0lH/YIlBhfa0Lp5rA/rHlrTtpfNFkGMOdjdKJVgutKZ
 XDs42kZGhWEYl4nKZRpJkHNGYzWFJp+i6xCl33uI7/m1eypF5445kAaiSh6iWjiTeNN4
 UDZyWNedl62aznAdUP+3DXn7QeB92i4vysV60hnXBES8YISA3PgXzRd63eF1zDo0/I0w
 iVVTXa7yodSQYJiYGvPIaO1RA8o82KHRe1jFjezqGU4TVaZ06VRYkq75MwOsN47/ai14
 LzRPxwlXqCAa72PE5fMT8ZJ8sxBZzM27V/yusuPyEcYIjDJSgklMaHcoekdyonHMFo1/ Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398u3auhjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:48:00 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15IDXhQE017586;
 Fri, 18 Jun 2021 09:48:00 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398u3auhjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:48:00 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15IDkROM022732;
 Fri, 18 Jun 2021 13:47:59 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 3980b9pcya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 13:47:59 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15IDlwxE26739124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 13:47:58 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DD10BE056;
 Fri, 18 Jun 2021 13:47:58 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9ECE8BE054;
 Fri, 18 Jun 2021 13:47:57 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 18 Jun 2021 13:47:57 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 18 Jun 2021 09:47:57 -0400
From: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v3 2/2] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
Organization: IBM
In-Reply-To: <20210602002210.3144559-3-iii@linux.ibm.com>
References: <20210602002210.3144559-1-iii@linux.ibm.com>
 <20210602002210.3144559-3-iii@linux.ibm.com>
Message-ID: <4fe4d6f25ec6c13d70645acd01284cc9@imap.linux.ibm.com>
X-Sender: jonathan.albrecht@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tcc9y_IJo1p9C2020lObOFvTe-nj_MrI
X-Proofpoint-ORIG-GUID: py4ubHdlb82_GL_GOOJ0GFpaDv4xbgWC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-18_07:2021-06-18,
 2021-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1011
 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106180079
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Qemu-devel <qemu-devel-bounces+qemu-devel=archiver.kernel.org@nongnu.org>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021-06-01 8:22 pm, Ilya Leoshkevich wrote:
> Verify that s390x-specific uc_mcontext.psw.addr is reported correctly.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/s390x/Makefile.target |   1 +
>  tests/tcg/s390x/signal.c        | 163 ++++++++++++++++++++++++++++++++
>  2 files changed, 164 insertions(+)
>  create mode 100644 tests/tcg/s390x/signal.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target 
> b/tests/tcg/s390x/Makefile.target
> index 241ef28f61..cdb7d85316 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -8,3 +8,4 @@ TESTS+=exrl-trtr
>  TESTS+=pack
>  TESTS+=mvo
>  TESTS+=mvc
> +TESTS+=signal
> diff --git a/tests/tcg/s390x/signal.c b/tests/tcg/s390x/signal.c
> new file mode 100644
> index 0000000000..c25d7dd019
> --- /dev/null
> +++ b/tests/tcg/s390x/signal.c
> @@ -0,0 +1,163 @@
> +#include <assert.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <ucontext.h>
> +#include <unistd.h>
> +
> +/*
> + * Various instructions that generate SIGILL and SIGSEGV. They could 
> have been
> + * defined in a separate .s file, but this would complicate the build, 
> so the
> + * inline asm is used instead.
> + */
> +
> +void illegal_op(void);
> +void after_illegal_op(void);
> +asm(".globl\tillegal_op\n"
> +    "illegal_op:\t.byte\t0x00,0x00\n"
> +    "\t.globl\tafter_illegal_op\n"
> +    "after_illegal_op:\tbr\t%r14");
> +
> +void stg(void *dst, unsigned long src);
> +asm(".globl\tstg\n"
> +    "stg:\tstg\t%r3,0(%r2)\n"
> +    "\tbr\t%r14");
> +
> +void mvc_8(void *dst, void *src);
> +asm(".globl\tmvc_8\n"
> +    "mvc_8:\tmvc\t0(8,%r2),0(%r3)\n"
> +    "\tbr\t%r14");
> +
> +static void safe_puts(const char *s)
> +{
> +    write(0, s, strlen(s));
> +    write(0, "\n", 1);
> +}
> +
> +enum exception {
> +    exception_operation,
> +    exception_translation,
> +    exception_protection,
> +};
> +
> +static struct {
> +    int sig;
> +    void *addr;
> +    unsigned long psw_addr;
> +    enum exception exception;
> +} expected;
> +
> +static void handle_signal(int sig, siginfo_t *info, void *ucontext)
> +{
> +    void *page;
> +    int err;
> +
> +    if (sig != expected.sig) {
> +        safe_puts("[  FAILED  ] wrong signal");
> +        _exit(1);
> +    }
> +
> +    if (info->si_addr != expected.addr) {
> +        safe_puts("[  FAILED  ] wrong si_addr");
> +        _exit(1);
> +    }
> +
> +    if (((ucontext_t *)ucontext)->uc_mcontext.psw.addr != 
> expected.psw_addr) {
> +        safe_puts("[  FAILED  ] wrong psw.addr");
> +        _exit(1);
> +    }
> +
> +    switch (expected.exception) {

When I try to run 'make test-tcg' gcc 9.3.0 is complaining about a 
missing case:
/home/jalbrecht/src/qemu/tests/tcg/s390x/signal.c: In function 
'handle_signal':
/home/jalbrecht/src/qemu/tests/tcg/s390x/signal.c:70:5: error: 
enumeration value 'exception_operation' not handled in switch 
[-Werror=switch]
    70 |     switch (expected.exception) {
       |     ^~~~~~
cc1: all warnings being treated as errors

> +    case exception_translation:
> +        page = mmap(expected.addr, 4096, PROT_READ | PROT_WRITE,
> +                    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
> +        if (page != expected.addr) {
> +            safe_puts("[  FAILED  ] mmap() failed");
> +            _exit(1);
> +        }
> +        break;
> +    case exception_protection:
> +        err = mprotect(expected.addr, 4096, PROT_READ | PROT_WRITE);
> +        if (err != 0) {
> +            safe_puts("[  FAILED  ] mprotect() failed");
> +            _exit(1);
> +        }
> +        break;
> +    }
> +}
> +
> +static void check_sigsegv(void *func, enum exception exception,
> +                          unsigned long val)
> +{
> +    int prot;
> +    unsigned long *page;
> +    unsigned long *addr;
> +    int err;
> +
> +    prot = exception == exception_translation ? PROT_NONE : PROT_READ;
> +    page = mmap(NULL, 4096, prot, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +    assert(page != MAP_FAILED);
> +    if (exception == exception_translation) {
> +        /* Hopefully nothing will be mapped at this address. */
> +        err = munmap(page, 4096);
> +        assert(err == 0);
> +    }
> +    addr = page + (val & 0x1ff);
> +
> +    expected.sig = SIGSEGV;
> +    expected.addr = page;
> +    expected.psw_addr = (unsigned long)func;
> +    expected.exception = exception;
> +    if (func == stg) {
> +        stg(addr, val);
> +    } else {
> +        assert(func == mvc_8);
> +        mvc_8(addr, &val);
> +    }
> +    assert(*addr == val);
> +
> +    err = munmap(page, 4096);
> +    assert(err == 0);
> +}
> +
> +int main(void)
> +{
> +    struct sigaction act;
> +    int err;
> +
> +    memset(&act, 0, sizeof(act));
> +    act.sa_sigaction = handle_signal;
> +    act.sa_flags = SA_SIGINFO;
> +    err = sigaction(SIGILL, &act, NULL);
> +    assert(err == 0);
> +    err = sigaction(SIGSEGV, &act, NULL);
> +    assert(err == 0);
> +
> +    safe_puts("[ RUN      ] Operation exception");
> +    expected.sig = SIGILL;
> +    expected.addr = illegal_op;
> +    expected.psw_addr = (unsigned long)after_illegal_op;
> +    expected.exception = exception_operation;
> +    illegal_op();
> +    safe_puts("[       OK ]");
> +
> +    safe_puts("[ RUN      ] Translation exception from stg");
> +    check_sigsegv(stg, exception_translation, 42);
> +    safe_puts("[       OK ]");
> +
> +    safe_puts("[ RUN      ] Translation exception from mvc");
> +    check_sigsegv(mvc_8, exception_translation, 4242);
> +    safe_puts("[       OK ]");
> +
> +    safe_puts("[ RUN      ] Protection exception from stg");
> +    check_sigsegv(stg, exception_protection, 424242);
> +    safe_puts("[       OK ]");
> +
> +    safe_puts("[ RUN      ] Protection exception from mvc");
> +    check_sigsegv(mvc_8, exception_protection, 42424242);
> +    safe_puts("[       OK ]");
> +
> +    safe_puts("[  PASSED  ]");
> +
> +    return 0;
> +}

