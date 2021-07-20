Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DCE3CFA95
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:33:30 +0200 (CEST)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5psH-0003qH-EA
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m5ppu-0002Q5-JO; Tue, 20 Jul 2021 09:31:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m5ppk-0001AH-Cs; Tue, 20 Jul 2021 09:30:56 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KD6I7X102170; Tue, 20 Jul 2021 09:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=tsJgegj94sO0zpJ7ll0vahDzAGnuL5Azm+GaCKH839g=;
 b=ULAHMw2KsNvkgqgIV8CACWvjP6gSrD1HIfaSfIMqp0knjoQw/BpAzRyBkU7pseCTv9U2
 pHSl7OSDjpdMsYn5hDnx31N670wS5WvgCVeb1K3l6GvsXssCSUj4bm6zKnvS+0xIV6M+
 /vElXtk5RB7r12I/wS5JYQ8Af2keOHgcZWmgoKpmbGVbbEwu4FU807meJNkLiWpS9JdJ
 wx+uNSU7FvwWeipLSjpSFa3lxaAmHsmCu4oDOhueXcFezDnOIRzvzRvdAmEbsiVIJt2p
 TnmuWmj+clP7nOXAkcLgvYE0ALvevJsiqDGXvW7WPkdSF4xn7lVTSrmeEL3LCpTsX0rn iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wuxsea1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 09:30:33 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16KD8ZcF115965;
 Tue, 20 Jul 2021 09:30:33 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wuxsea00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 09:30:33 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16KDRDSr025897;
 Tue, 20 Jul 2021 13:30:32 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 39upucckqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 13:30:32 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16KDUUDs22413618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 13:30:30 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DA8E112066;
 Tue, 20 Jul 2021 13:30:30 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FB2311206F;
 Tue, 20 Jul 2021 13:30:29 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 13:30:29 +0000 (GMT)
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Tue, 20 Jul 2021 09:30:29 -0400
From: "jonathan.albrecht" <jonathan.albrecht@linux.vnet.ibm.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v6 2/2] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
Organization: IBM
In-Reply-To: <20210705210434.45824-3-iii@linux.ibm.com>
References: <20210705210434.45824-1-iii@linux.ibm.com>
 <20210705210434.45824-3-iii@linux.ibm.com>
Message-ID: <9bcac508a78a6127d1ecd66c425a4a9f@imap.linux.ibm.com>
X-Sender: jonathan.albrecht@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YbFJNY5Q__LQBuMZGgHgoAc7PU5NyrBR
X-Proofpoint-ORIG-GUID: Don_icNRNCwkqSzjXtPL-yTzOZjZEcDu
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_07:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107200085
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x
 <qemu-s390x-bounces+jonathan.albrecht=linux.vnet.ibm.com@nongnu.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 qemu-s390x@nongnu.org, Andreas Krebbel <krebbel@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping. Could this patch be reviewed? The other code fix patch in this 
series has been reviewed so if these tests can be reviewed then both 
this series:

https://lore.kernel.org/qemu-devel/20210705210434.45824-1-iii@linux.ibm.com/

and the dependent series:

https://lore.kernel.org/qemu-devel/20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com/

will be reviewed and ready to go.

Thanks,

Jon

On 2021-07-05 5:04 pm, Ilya Leoshkevich wrote:
> Verify that s390x-specific uc_mcontext.psw.addr is reported correctly
> and that signal handling interacts properly with debugging.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/s390x/Makefile.target               |  18 +-
>  tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
>  tests/tcg/s390x/signals-s390x.c               | 165 ++++++++++++++++++
>  3 files changed, 258 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
>  create mode 100644 tests/tcg/s390x/signals-s390x.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target 
> b/tests/tcg/s390x/Makefile.target
> index 0036b8a505..0a5b25c156 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -1,4 +1,5 @@
> -VPATH+=$(SRC_PATH)/tests/tcg/s390x
> +S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
> +VPATH+=$(S390X_SRC)
>  CFLAGS+=-march=zEC12 -m64
>  TESTS+=hello-s390x
>  TESTS+=csst
> @@ -12,3 +13,18 @@ TESTS+=mvc
>  # This triggers failures on s390x hosts about 4% of the time
>  run-signals: signals
>  	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups")
> +
> +TESTS+=signals-s390x
> +
> +ifneq ($(HAVE_GDB_BIN),)
> +GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
> +
> +run-gdbstub-signals-s390x: signals-s390x
> +	$(call run-test, $@, $(GDB_SCRIPT) \
> +		--gdb $(HAVE_GDB_BIN) \
> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> +		--bin $< --test $(S390X_SRC)/gdbstub/test-signals-s390x.py, \
> +	"mixing signals and debugging on s390x")
> +
> +EXTRA_RUNS += run-gdbstub-signals-s390x
> +endif
> diff --git a/tests/tcg/s390x/gdbstub/test-signals-s390x.py
> b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
> new file mode 100644
> index 0000000000..80a284b475
> --- /dev/null
> +++ b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
> @@ -0,0 +1,76 @@
> +from __future__ import print_function
> +
> +#
> +# Test that signals and debugging mix well together on s390x.
> +#
> +# This is launched via tests/guest-debug/run-test.py
> +#
> +
> +import gdb
> +import sys
> +
> +failcount = 0
> +
> +
> +def report(cond, msg):
> +    """Report success/fail of test"""
> +    if cond:
> +        print("PASS: %s" % (msg))
> +    else:
> +        print("FAIL: %s" % (msg))
> +        global failcount
> +        failcount += 1
> +
> +
> +def run_test():
> +    """Run through the tests one by one"""
> +    illegal_op = gdb.Breakpoint("illegal_op")
> +    stg = gdb.Breakpoint("stg")
> +    mvc_8 = gdb.Breakpoint("mvc_8")
> +
> +    # Expect the following events:
> +    # 1x illegal_op breakpoint
> +    # 2x stg breakpoint, segv, breakpoint
> +    # 2x mvc_8 breakpoint, segv, breakpoint
> +    for _ in range(14):
> +        gdb.execute("c")
> +    report(illegal_op.hit_count == 1, "illegal_op.hit_count == 1")
> +    report(stg.hit_count == 4, "stg.hit_count == 4")
> +    report(mvc_8.hit_count == 4, "mvc_8.hit_count == 4")
> +
> +    # The test must succeed.
> +    gdb.Breakpoint("_exit")
> +    gdb.execute("c")
> +    status = int(gdb.parse_and_eval("$r2"))
> +    report(status == 0, "status == 0");
> +
> +
> +#
> +# This runs as the script it sourced (via -x, via run-test.py)
> +#
> +try:
> +    inferior = gdb.selected_inferior()
> +    arch = inferior.architecture()
> +    print("ATTACHED: %s" % arch.name())
> +except (gdb.error, AttributeError):
> +    print("SKIPPING (not connected)", file=sys.stderr)
> +    exit(0)
> +
> +if gdb.parse_and_eval("$pc") == 0:
> +    print("SKIP: PC not set")
> +    exit(0)
> +
> +try:
> +    # These are not very useful in scripts
> +    gdb.execute("set pagination off")
> +    gdb.execute("set confirm off")
> +
> +    # Run the actual tests
> +    run_test()
> +except (gdb.error):
> +    print("GDB Exception: %s" % (sys.exc_info()[0]))
> +    failcount += 1
> +    pass
> +
> +print("All tests complete: %d failures" % failcount)
> +exit(failcount)
> diff --git a/tests/tcg/s390x/signals-s390x.c 
> b/tests/tcg/s390x/signals-s390x.c
> new file mode 100644
> index 0000000000..dc2f8ee59a
> --- /dev/null
> +++ b/tests/tcg/s390x/signals-s390x.c
> @@ -0,0 +1,165 @@
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
> +    default:
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
> +    _exit(0);
> +}

