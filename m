Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE1D57186F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 13:22:23 +0200 (CEST)
Received: from localhost ([::1]:37590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBDyA-00059w-C7
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 07:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oBDuW-0001vL-D6
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:18:36 -0400
Received: from [200.168.210.66] (port=2792 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1oBDuT-00022N-VS
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:18:35 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 12 Jul 2022 08:17:26 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id B7B49800146;
 Tue, 12 Jul 2022 08:17:26 -0300 (-03)
Message-ID: <3653bc8d-6505-badf-bd99-882001b897e6@eldorado.org.br>
Date: Tue, 12 Jul 2022 08:17:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RISU PATCH v4 26/29] ppc64: Clean up reginfo handling
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-27-richard.henderson@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <20220708154700.18682-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 12 Jul 2022 11:17:26.0932 (UTC)
 FILETIME=[F7C1DD40:01D895E0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 08/07/2022 12:46, Richard Henderson wrote:
> Several of the gp_reg[] elements are not relevant -- e.g. orig r3,
> which is related to system calls.  Omit those from the original
> reginfo_init(), so that any differences are automatically hidden.
> 
> Do not only compare bit 4 of CCR -- this register is 32 bits wide
> with 8 cr subfields.  We should compare all of them.
> 
> Tidy reginfo_dump() output.  Especially, do not dump the non-
> relevant fields.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   risu_reginfo_ppc64.c | 114 +++++++++++++++++--------------------------
>   1 file changed, 44 insertions(+), 70 deletions(-)
> 
> diff --git a/risu_reginfo_ppc64.c b/risu_reginfo_ppc64.c
> index 134a152..eeb0460 100644
> --- a/risu_reginfo_ppc64.c
> +++ b/risu_reginfo_ppc64.c
> @@ -21,19 +21,30 @@
>   #include "risu.h"
>   #include "risu_reginfo_ppc64.h"
> 
> -#define XER 37
> -#define CCR 38
> +/* Names for indexes within gregset_t, ignoring those irrelevant here */
> +enum {
> +    NIP = 32,
> +    MSR = 33,
> +    CTR = 35,
> +    LNK = 36,
> +    XER = 37,
> +    CCR = 38,
> +};
> 
>   const struct option * const arch_long_opts;
>   const char * const arch_extra_help;
> 
>   static const char * const greg_names[NGREG] = {
> -    "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
> -    "r8",  "r9", "r10", "r11", "r12", "r13", "r14", "r15",
> -   "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
> -   "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
> -   [XER] = "xer",
> -   [CCR] = "ccr",
> +     "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
> +     "r8",  "r9", "r10", "r11", "r12", "r13", "r14", "r15",
> +    "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
> +    "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
> +    [NIP] = "nip",
> +    [MSR] = "msr",
> +    [CTR] = "ctr",
> +    [LNK] = "lnk",
> +    [XER] = "xer",
> +    [CCR] = "ccr",
>   };
> 
NIP value depends on image_start address, and LNK will be the return 
address, so I guess we shouldn't compare them. Some MSR bits are defined 
from start under linux-user (e.g. FE0 and FE1), but I think we can work 
around that.

CTR will likely be image_start since calling a function pointer is 
usually implemented with mtctr/bctr, but risugen doesn't initialize it, 
so the comparison will fail at the first checkpoint. VRSAVE is also not 
initialized, so I guess we need something like

 >    write_mov_ri(0, rand(0xffffffff));
 >    insn32(0x7c0903a6); # mtctr r0
 >
 >    write_mov_ri(0, rand(0xffffffff));
 >    insn32(0x7c0043a6); # mtvrsave r0

in write_random_regdata

>   void process_arch_opt(int opt, const char *arg)
> @@ -61,8 +72,13 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
>       ri->nip = uc->uc_mcontext.regs->nip - image_start_address;
> 
>       for (i = 0; i < NGREG; i++) {
> -        ri->gregs[i] = uc->uc_mcontext.gp_regs[i];
> +        /* Do not copy gp_reg entries not relevant to the context. */
> +        if (greg_names[i]) {
> +            ri->gregs[i] = uc->uc_mcontext.gp_regs[i];
> +        }
>       }
> +    ri->gregs[1] = 0xdeadbeef;   /* sp */
> +    ri->gregs[13] = 0xdeadbeef;  /* gp */
> 
>       memcpy(ri->fpregs, uc->uc_mcontext.fp_regs, 32 * sizeof(double));
>       ri->fpscr = uc->uc_mcontext.fp_regs[32];
> @@ -76,79 +92,37 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
>   /* reginfo_is_eq: compare the reginfo structs, returns nonzero if equal */
>   int reginfo_is_eq(struct reginfo *m, struct reginfo *a)
>   {
> -    int i;
> -    for (i = 0; i < 32; i++) {
> -        if (i == 1 || i == 13) {
> -            continue;
> -        }
> -
> -        if (m->gregs[i] != a->gregs[i]) {
> -            return 0;
> -        }
> -    }
> -
> -    if (m->gregs[XER] != a->gregs[XER]) {
> -        return 0;
> -    }
> -
> -    if ((m->gregs[CCR] & 0x10) != (a->gregs[CCR] & 0x10)) {
> -        return 0;
> -    }
> -
> -    for (i = 0; i < 32; i++) {
> -        if (m->fpregs[i] != a->fpregs[i]) {
> -            return 0;
> -        }
> -    }
> -
> -    for (i = 0; i < 32; i++) {
> -        if (m->vrregs.vrregs[i][0] != a->vrregs.vrregs[i][0] ||
> -            m->vrregs.vrregs[i][1] != a->vrregs.vrregs[i][1] ||
> -            m->vrregs.vrregs[i][2] != a->vrregs.vrregs[i][2] ||
> -            m->vrregs.vrregs[i][3] != a->vrregs.vrregs[i][3]) {
> -            return 0;
> -        }
> -    }
> -    return 1;
> +    return memcmp(m, a, sizeof(*m)) == 0;
>   }
> 
>   /* reginfo_dump: print state to a stream */
>   void reginfo_dump(struct reginfo *ri, FILE * f)
>   {
> -    int i;
> +    const char *sep;
> +    int i, j;
> 
> -    fprintf(f, "  faulting insn 0x%x\n", ri->faulting_insn);
> -    fprintf(f, "  prev insn     0x%x\n", ri->prev_insn);
> -    fprintf(f, "  prev addr    0x%" PRIx64 "\n\n", ri->nip);
> +    fprintf(f, "%6s: %08x\n", "insn", ri->faulting_insn);
> +    fprintf(f, "%6s: %016lx\n", "pc", ri->nip) >
> -    for (i = 0; i < 16; i++) {
> -        fprintf(f, "\tr%2d: %16lx\tr%2d: %16lx\n", i, ri->gregs[i],
> -                i + 16, ri->gregs[i + 16]);
> +    sep = "";
> +    for (i = j = 0; i < NGREG; i++) {
> +        if (greg_names[i] != NULL) {
> +            fprintf(f, "%s%6s: %016lx", sep, greg_names[i], ri->gregs[i]);
> +            sep = (++j & 1 ? "  " : "\n");
> +        }
>       }
> 
> -    fprintf(f, "\n");
> -    fprintf(f, "\tnip    : %16lx\n", ri->gregs[32]);
> -    fprintf(f, "\tmsr    : %16lx\n", ri->gregs[33]);
> -    fprintf(f, "\torig r3: %16lx\n", ri->gregs[34]);
> -    fprintf(f, "\tctr    : %16lx\n", ri->gregs[35]);
> -    fprintf(f, "\tlnk    : %16lx\n", ri->gregs[36]);
> -    fprintf(f, "\txer    : %16lx\n", ri->gregs[37]);
> -    fprintf(f, "\tccr    : %16lx\n", ri->gregs[38]);
> -    fprintf(f, "\tmq     : %16lx\n", ri->gregs[39]);
> -    fprintf(f, "\ttrap   : %16lx\n", ri->gregs[40]);
> -    fprintf(f, "\tdar    : %16lx\n", ri->gregs[41]);
> -    fprintf(f, "\tdsisr  : %16lx\n", ri->gregs[42]);
> -    fprintf(f, "\tresult : %16lx\n", ri->gregs[43]);
> -    fprintf(f, "\tdscr   : %16lx\n\n", ri->gregs[44]);
> -
> -    for (i = 0; i < 16; i++) {
> -        fprintf(f, "\tf%2d: %016lx\tf%2d: %016lx\n", i, ri->fpregs[i],
> -                i + 16, ri->fpregs[i + 16]);
> +    sep = "\n";
> +    for (i = j = 0; i < 32; i++) {
> +        fprintf(f, "%s%*s%d: %016lx",
> +                sep, 6 - (i < 10 ? 1 : 2), "f", i, ri->fpregs[i]);
> +        sep = (++j & 1 ? "  " : "\n");
>       }
> -    fprintf(f, "\tfpscr: %016lx\n\n", ri->fpscr);
> +    fprintf(f, "\n%6s: %016lx\n", "fpscr", ri->fpscr);
> 
>       for (i = 0; i < 32; i++) {
> -        fprintf(f, "vr%02d: %8x, %8x, %8x, %8x\n", i,
> +        fprintf(f, "%*s%d: %08x %08x %08x %08x\n",
> +                6 - (i < 10 ? 1 : 2), "vr", i,
>                   ri->vrregs.vrregs[i][0], ri->vrregs.vrregs[i][1],
>                   ri->vrregs.vrregs[i][2], ri->vrregs.vrregs[i][3]);
>       }
> --
> 2.34.1
> 
>
Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

