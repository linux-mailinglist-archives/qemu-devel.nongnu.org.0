Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0099B52D1B4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 13:45:40 +0200 (CEST)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nreau-0001dh-SE
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 07:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nreQZ-000223-8x; Thu, 19 May 2022 07:34:48 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9128
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nreQW-0003DL-NR; Thu, 19 May 2022 07:34:46 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JAxslS032493;
 Thu, 19 May 2022 11:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ZKWEKWVYggwlzYSsSgviLk4EijstQBj1/Ceh8fbe/xo=;
 b=U911tTlakubWCjBbAbYrGOd8zUN62aAxtXS75izwvjJA+S8UXAhVUJqSiNk3q6IHorR9
 Nrgqtw60y6SDdAyOtGXgZfQJDx3Emfk4AVL1ekIZZI7UsLZklZSAHbEKWKX88fCVsqno
 CY9OEtcrXyZwElrsgK+UCIt8jE5YxxNY4qXV5KyOcLaw+Wbk0wsJ2OG6S6J9IWBAM4OH
 e0KYQxURiKPdueMcYxr9Nkz/JuIcjVShhWYU+lQAvWxPtFFQndL5TLg901Wn4/1DOobk
 oGn0gVA/SApIFRxoBITFwvHkk6LGhLw4++LR9Z5kTpBoTxeUcLnkFQiQIVd/gCRpDwZH hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5mmt8rm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 11:34:41 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24JBNh7M030233;
 Thu, 19 May 2022 11:34:40 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5mmt8rkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 11:34:40 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24JBXIkT009654;
 Thu, 19 May 2022 11:34:38 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3g2429f78n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 11:34:38 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24JBYZDf47579596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 May 2022 11:34:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE6E24C050;
 Thu, 19 May 2022 11:34:35 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E9534C046;
 Thu, 19 May 2022 11:34:35 +0000 (GMT)
Received: from [9.155.208.113] (unknown [9.155.208.113])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 May 2022 11:34:35 +0000 (GMT)
Message-ID: <03b9e56549edc455d8afe89a9fcad01715b88475.camel@linux.ibm.com>
Subject: PING: [PATCH 2/2] tests/tcg/s390x: Test unwinding from signal handlers
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Ulrich Weigand <ulrich.weigand@de.ibm.com>
Date: Thu, 19 May 2022 13:34:35 +0200
In-Reply-To: <20220503225157.1696774-3-iii@linux.ibm.com>
References: <20220503225157.1696774-1-iii@linux.ibm.com>
 <20220503225157.1696774-3-iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Bs8xkxEJJ5zr6y1ZDFduP4-1usOlh-vK
X-Proofpoint-GUID: -nyuOmBL7D6DlVgIygSTYTfDrCGeQ-9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_03,2022-05-19_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1011 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205190065
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-05-04 at 00:51 +0200, Ilya Leoshkevich wrote:
> Add a small test to prevent regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/s390x/signals-s390x.c | 69 ++++++++++++++++++++++++++-----
> --
>  1 file changed, 55 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/tcg/s390x/signals-s390x.c
> b/tests/tcg/s390x/signals-s390x.c
> index dc2f8ee59a..48c3b6cdfd 100644
> --- a/tests/tcg/s390x/signals-s390x.c
> +++ b/tests/tcg/s390x/signals-s390x.c
> @@ -1,4 +1,5 @@
>  #include <assert.h>
> +#include <execinfo.h>
>  #include <signal.h>
>  #include <string.h>
>  #include <sys/mman.h>
> @@ -11,22 +12,28 @@
>   * inline asm is used instead.
>   */
>  
> +#define DEFINE_ASM_FUNCTION(name, body) \
> +    asm(".globl " #name "\n" \
> +        #name ":\n" \
> +        ".cfi_startproc\n" \
> +        body "\n" \
> +        "br %r14\n" \
> +        ".cfi_endproc");
> +
>  void illegal_op(void);
> -void after_illegal_op(void);
> -asm(".globl\tillegal_op\n"
> -    "illegal_op:\t.byte\t0x00,0x00\n"
> -    "\t.globl\tafter_illegal_op\n"
> -    "after_illegal_op:\tbr\t%r14");
> +extern const char after_illegal_op;
> +DEFINE_ASM_FUNCTION(illegal_op,
> +    ".byte 0x00,0x00\n"
> +    ".globl after_illegal_op\n"
> +    "after_illegal_op:")
>  
>  void stg(void *dst, unsigned long src);
> -asm(".globl\tstg\n"
> -    "stg:\tstg\t%r3,0(%r2)\n"
> -    "\tbr\t%r14");
> +DEFINE_ASM_FUNCTION(stg, "stg %r3,0(%r2)")
>  
>  void mvc_8(void *dst, void *src);
> -asm(".globl\tmvc_8\n"
> -    "mvc_8:\tmvc\t0(8,%r2),0(%r3)\n"
> -    "\tbr\t%r14");
> +DEFINE_ASM_FUNCTION(mvc_8, "mvc 0(8,%r2),0(%r3)")
> +
> +extern const char return_from_main_1;
>  
>  static void safe_puts(const char *s)
>  {
> @@ -49,8 +56,9 @@ static struct {
>  
>  static void handle_signal(int sig, siginfo_t *info, void *ucontext)
>  {
> +    int err, i, n_frames;
> +    void *frames[16];
>      void *page;
> -    int err;
>  
>      if (sig != expected.sig) {
>          safe_puts("[  FAILED  ] wrong signal");
> @@ -86,6 +94,17 @@ static void handle_signal(int sig, siginfo_t
> *info, void *ucontext)
>      default:
>          break;
>      }
> +
> +    n_frames = backtrace(frames, sizeof(frames) /
> sizeof(frames[0]));
> +    for (i = 0; i < n_frames; i++) {
> +        if (frames[i] == &return_from_main_1) {
> +            break;
> +        }
> +    }
> +    if (i == n_frames) {
> +        safe_puts("[  FAILED  ] backtrace() is broken");
> +        _exit(1);
> +    }
>  }
>  
>  static void check_sigsegv(void *func, enum exception exception,
> @@ -122,7 +141,7 @@ static void check_sigsegv(void *func, enum
> exception exception,
>      assert(err == 0);
>  }
>  
> -int main(void)
> +int main_1(void)
>  {
>      struct sigaction act;
>      int err;
> @@ -138,7 +157,7 @@ int main(void)
>      safe_puts("[ RUN      ] Operation exception");
>      expected.sig = SIGILL;
>      expected.addr = illegal_op;
> -    expected.psw_addr = (unsigned long)after_illegal_op;
> +    expected.psw_addr = (unsigned long)&after_illegal_op;
>      expected.exception = exception_operation;
>      illegal_op();
>      safe_puts("[       OK ]");
> @@ -163,3 +182,25 @@ int main(void)
>  
>      _exit(0);
>  }
> +
> +/*
> + * Define main() in assembly in order to test that unwinding from
> signal
> + * handlers until main() works. This way we can define a specific
> point that
> + * the unwinder should reach. This is also better than defining
> main() in C
> + * and using inline assembly to call main_1(), since it's not easy
> to get all
> + * the clobbers right.
> + */
> +
> +DEFINE_ASM_FUNCTION(main,
> +    "stmg %r14,%r15,112(%r15)\n"
> +    ".cfi_offset 14,-48\n"
> +    ".cfi_offset 15,-40\n"
> +    "lay %r15,-160(%r15)\n"
> +    ".cfi_def_cfa_offset 320\n"
> +    "brasl %r14,main_1\n"
> +    ".globl return_from_main_1\n"
> +    "return_from_main_1:\n"
> +    "lmg %r14,%r15,272(%r15)\n"
> +    ".cfi_restore 15\n"
> +    ".cfi_restore 14\n"
> +    ".cfi_def_cfa_offset 160");

Ping.

