Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF3F59CC06
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:18:20 +0200 (CEST)
Received: from localhost ([::1]:54442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGgV-00045Z-WB
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oQGeL-0002ee-Kf
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:16:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oQGeD-0004Zl-JA
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:16:01 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27MMftxa020099;
 Mon, 22 Aug 2022 23:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=dPy5WMbT9s2Ad9WovKF/SShtoHutiWsbu1TES9aegm0=;
 b=RiPw7/LXBoQXEFvOrIoaw5z8LmFC8ORipkhtUZ5oNlsBryjKjZdro+m/U3821eXOcX/D
 YH77NReaFep24DzsDjAY/h1vo6PYL0Fw9/SoFx8Sn7V8yE7o26tRHxG+ulmZE0y0YDMZ
 B8hmJHy9BIh+lzDLnQTSuwxmAeIIcnIR8bbwiq5VabQK1UdWNG/rwzMuvLuCq1v1okYN
 iDF5roObd57YJ09M0SExZ2AoV8BzZq0oDjQuOky/ogRHUtkMX6Hq6pw6NlE/NAvdrB/Z
 8zCHVaE+XzT5VlD26xLyV1U68TAb8Sa+981RqFge7d7ISYfCckUmgCk8rmzP7l8XiVXX ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j4jtr0nfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Aug 2022 23:15:52 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27MNFpo8014771;
 Mon, 22 Aug 2022 23:15:51 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j4jtr0nex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Aug 2022 23:15:51 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27MN5MXY010584;
 Mon, 22 Aug 2022 23:15:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3j2q88ty63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Aug 2022 23:15:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27MNFkhZ31851006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Aug 2022 23:15:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D982EA4053;
 Mon, 22 Aug 2022 23:15:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2068DA4051;
 Mon, 22 Aug 2022 23:15:45 +0000 (GMT)
Received: from ip6-localhost (unknown [9.171.3.159])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Aug 2022 23:15:44 +0000 (GMT)
Message-ID: <19357872c7c2c4e1443ef154e79157c64c286e68.camel@linux.ibm.com>
Subject: Re: [PATCH v6 17/21] accel/tcg: Add fast path for translator_ld*
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, dramforever@live.com, alistair.francis@wdc.com,
 alex.bennee@linaro.org
Date: Tue, 23 Aug 2022 01:15:44 +0200
In-Reply-To: <20220819032615.884847-18-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
 <20220819032615.884847-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ooywPfZQFglJqmr40sA8MXv6K9-dUDg4
X-Proofpoint-ORIG-GUID: olEfCv9QC-L1OwrwybC3NKi_pXwN7dOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_14,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1011 adultscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220095
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

On Thu, 2022-08-18 at 20:26 -0700, Richard Henderson wrote:
> Cache the translation from guest to host address, so we may
> use direct loads when we hit on the primary translation page.
> 
> Look up the second translation page only once, during translation.
> This obviates another lookup of the second page within tb_gen_code
> after translation.
> 
> Fixes a bug in that plugin_insn_append should be passed the bytes
> in the original memory order, not bswapped by pieces.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/translator.h |  63 +++++++++++--------
>  accel/tcg/translate-all.c |  26 +++-----
>  accel/tcg/translator.c    | 127 +++++++++++++++++++++++++++++-------
> --
>  3 files changed, 144 insertions(+), 72 deletions(-)
> 
> diff --git a/include/exec/translator.h b/include/exec/translator.h
> index 69db0f5c21..329a42fe46 100644
> --- a/include/exec/translator.h
> +++ b/include/exec/translator.h
> @@ -81,24 +81,14 @@ typedef enum DisasJumpType {
>   * Architecture-agnostic disassembly context.
>   */
>  typedef struct DisasContextBase {
> -    const TranslationBlock *tb;
> +    TranslationBlock *tb;
>      target_ulong pc_first;
>      target_ulong pc_next;
>      DisasJumpType is_jmp;
>      int num_insns;
>      int max_insns;
>      bool singlestep_enabled;
> -#ifdef CONFIG_USER_ONLY
> -    /*
> -     * Guest address of the last byte of the last protected page.
> -     *
> -     * Pages containing the translated instructions are made non-
> writable in
> -     * order to achieve consistency in case another thread is
> modifying the
> -     * code while translate_insn() fetches the instruction bytes
> piecemeal.
> -     * Such writer threads are blocked on mmap_lock() in
> page_unprotect().
> -     */
> -    target_ulong page_protect_end;
> -#endif
> +    void *host_addr[2];
>  } DisasContextBase;
>  
>  /**
> @@ -183,24 +173,43 @@ bool translator_use_goto_tb(DisasContextBase
> *db, target_ulong dest);
>   * the relevant information at translation time.
>   */
>  
> -#define GEN_TRANSLATOR_LD(fullname, type, load_fn,
> swap_fn)             \
> -    type fullname ## _swap(CPUArchState *env, DisasContextBase
> *dcbase, \
> -                           abi_ptr pc, bool
> do_swap);                   \
> -    static inline type fullname(CPUArchState
> *env,                      \
> -                                DisasContextBase *dcbase, abi_ptr
> pc)   \
> -    {                                                               
>     \
> -        return fullname ## _swap(env, dcbase, pc,
> false);               \
> +uint8_t translator_ldub(CPUArchState *env, DisasContextBase *db,
> abi_ptr pc);
> +uint16_t translator_lduw(CPUArchState *env, DisasContextBase *db,
> abi_ptr pc);
> +uint32_t translator_ldl(CPUArchState *env, DisasContextBase *db,
> abi_ptr pc);
> +uint64_t translator_ldq(CPUArchState *env, DisasContextBase *db,
> abi_ptr pc);
> +
> +static inline uint16_t
> +translator_lduw_swap(CPUArchState *env, DisasContextBase *db,
> +                     abi_ptr pc, bool do_swap)
> +{
> +    uint16_t ret = translator_lduw(env, db, pc);
> +    if (do_swap) {
> +        ret = bswap16(ret);
>      }
> +    return ret;
> +}
>  
> -#define
> FOR_EACH_TRANSLATOR_LD(F)                                       \
> -    F(translator_ldub, uint8_t, cpu_ldub_code, /* no swap
> */)           \
> -    F(translator_lduw, uint16_t, cpu_lduw_code,
> bswap16)                \
> -    F(translator_ldl, uint32_t, cpu_ldl_code,
> bswap32)                  \
> -    F(translator_ldq, uint64_t, cpu_ldq_code, bswap64)
> +static inline uint32_t
> +translator_ldl_swap(CPUArchState *env, DisasContextBase *db,
> +                    abi_ptr pc, bool do_swap)
> +{
> +    uint32_t ret = translator_ldl(env, db, pc);
> +    if (do_swap) {
> +        ret = bswap32(ret);
> +    }
> +    return ret;
> +}
>  
> -FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
> -
> -#undef GEN_TRANSLATOR_LD
> +static inline uint64_t
> +translator_ldq_swap(CPUArchState *env, DisasContextBase *db,
> +                    abi_ptr pc, bool do_swap)
> +{
> +    uint64_t ret = translator_ldq_swap(env, db, pc, false);
> +    if (do_swap) {
> +        ret = bswap64(ret);
> +    }
> +    return ret;
> +}
>  
>  /*
>   * Return whether addr is on the same page as where disassembly
> started.
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index b224f856d0..e44f40b234 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1385,10 +1385,10 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>  {
>      CPUArchState *env = cpu->env_ptr;
>      TranslationBlock *tb, *existing_tb;
> -    tb_page_addr_t phys_pc, phys_page2;
> -    target_ulong virt_page2;
> +    tb_page_addr_t phys_pc;
>      tcg_insn_unit *gen_code_buf;
>      int gen_code_size, search_size, max_insns;
> +    void *host_pc;
>  #ifdef CONFIG_PROFILER
>      TCGProfile *prof = &tcg_ctx->prof;
>      int64_t ti;
> @@ -1397,7 +1397,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      assert_memory_lock();
>      qemu_thread_jit_write();
>  
> -    phys_pc = get_page_addr_code_hostp(env, pc, false, NULL);
> +    phys_pc = get_page_addr_code_hostp(env, pc, false, &host_pc);
>  
>      if (phys_pc == -1) {
>          /* Generate a one-shot TB with 1 insn in it */
> @@ -1428,6 +1428,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      tb->flags = flags;
>      tb->cflags = cflags;
>      tb->trace_vcpu_dstate = *cpu->trace_dstate;
> +    tb->page_addr[0] = phys_pc;
> +    tb->page_addr[1] = -1;
>      tcg_ctx->tb_cflags = cflags;
>   tb_overflow:
>  
> @@ -1621,13 +1623,11 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>      }
>  
>      /*
> -     * If the TB is not associated with a physical RAM page then
> -     * it must be a temporary one-insn TB, and we have nothing to do
> -     * except fill in the page_addr[] fields. Return early before
> -     * attempting to link to other TBs or add to the lookup table.
> +     * If the TB is not associated with a physical RAM page then it
> must be
> +     * a temporary one-insn TB, and we have nothing left to do.
> Return early
> +     * before attempting to link to other TBs or add to the lookup
> table.
>       */
> -    if (phys_pc == -1) {
> -        tb->page_addr[0] = tb->page_addr[1] = -1;
> +    if (tb->page_addr[0] == -1) {
>          return tb;
>      }
>  
> @@ -1638,17 +1638,11 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>       */
>      tcg_tb_insert(tb);
>  
> -    /* check next page if needed */
> -    virt_page2 = (pc + tb->size - 1) & TARGET_PAGE_MASK;
> -    phys_page2 = -1;
> -    if ((pc & TARGET_PAGE_MASK) != virt_page2) {
> -        phys_page2 = get_page_addr_code(env, virt_page2);
> -    }
>      /*
>       * No explicit memory barrier is required -- tb_link_page()
> makes the
>       * TB visible in a consistent state.
>       */
> -    existing_tb = tb_link_page(tb, phys_pc, phys_page2);
> +    existing_tb = tb_link_page(tb, tb->page_addr[0], tb-
> >page_addr[1]);
>      /* if the TB already exists, discard what we just translated */
>      if (unlikely(existing_tb != tb)) {
>          uintptr_t orig_aligned = (uintptr_t)gen_code_buf;
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index 3eef30d93a..c8e9523e52 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -42,15 +42,6 @@ bool translator_use_goto_tb(DisasContextBase *db,
> target_ulong dest)
>      return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;
>  }
>  
> -static inline void translator_page_protect(DisasContextBase *dcbase,
> -                                           target_ulong pc)
> -{
> -#ifdef CONFIG_USER_ONLY
> -    dcbase->page_protect_end = pc | ~TARGET_PAGE_MASK;
> -    page_protect(pc);
> -#endif
> -}
> -
>  void translator_loop(CPUState *cpu, TranslationBlock *tb, int
> max_insns,
>                       target_ulong pc, void *host_pc,
>                       const TranslatorOps *ops, DisasContextBase *db)
> @@ -66,7 +57,12 @@ void translator_loop(CPUState *cpu,
> TranslationBlock *tb, int max_insns,
>      db->num_insns = 0;
>      db->max_insns = max_insns;
>      db->singlestep_enabled = cflags & CF_SINGLE_STEP;
> -    translator_page_protect(db, db->pc_next);
> +    db->host_addr[0] = host_pc;
> +    db->host_addr[1] = NULL;
> +
> +#ifdef CONFIG_USER_ONLY
> +    page_protect(pc);
> +#endif
>  
>      ops->init_disas_context(db, cpu);
>      tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
> @@ -151,31 +147,104 @@ void translator_loop(CPUState *cpu,
> TranslationBlock *tb, int max_insns,
>  #endif
>  }
>  
> -static inline void translator_maybe_page_protect(DisasContextBase
> *dcbase,
> -                                                 target_ulong pc,
> size_t len)
> +static void *translator_access(CPUArchState *env, DisasContextBase
> *db,
> +                               target_ulong pc, size_t len)
>  {
> -#ifdef CONFIG_USER_ONLY
> -    target_ulong end = pc + len - 1;
> +    void *host;
> +    target_ulong base, end;
> +    TranslationBlock *tb;
>  
> -    if (end > dcbase->page_protect_end) {
> -        translator_page_protect(dcbase, end);
> +    tb = db->tb;
> +
> +    /* Use slow path if first page is MMIO. */
> +    if (unlikely(tb->page_addr[0] == -1)) {
> +        return NULL;
>      }
> +
> +    end = pc + len - 1;
> +    if (likely(is_same_page(db, end))) {
> +        host = db->host_addr[0];
> +        base = db->pc_first;
> +    } else {
> +        host = db->host_addr[1];
> +        base = TARGET_PAGE_ALIGN(db->pc_first);
> +        if (host == NULL) {
> +            tb->page_addr[1] =
> +                get_page_addr_code_hostp(env, base, false,
> +                                         &db->host_addr[1]);
> +#ifdef CONFIG_USER_ONLY
> +            page_protect(end);
>  #endif
> +            /* We cannot handle MMIO as second page. */
> +            assert(tb->page_addr[1] != -1);
> +            host = db->host_addr[1];
> +        }
> +
> +        /* Use slow path when crossing pages. */
> +        if (is_same_page(db, pc)) {
> +            return NULL;
> +        }
> +    }
> +
> +    tcg_debug_assert(pc >= base);
> +    return host + (pc - base);
>  }
>  
> -#define GEN_TRANSLATOR_LD(fullname, type, load_fn,
> swap_fn)             \
> -    type fullname ## _swap(CPUArchState *env, DisasContextBase
> *dcbase, \
> -                           abi_ptr pc, bool
> do_swap)                    \
> -    {                                                               
>     \
> -        translator_maybe_page_protect(dcbase, pc,
> sizeof(type));        \
> -        type ret = load_fn(env,
> pc);                                    \
> -        if (do_swap)
> {                                                  \
> -            ret =
> swap_fn(ret);                                         \
> -        }                                                           
>     \
> -        plugin_insn_append(pc, &ret,
> sizeof(ret));                      \
> -        return
> ret;                                                     \
> +uint8_t translator_ldub(CPUArchState *env, DisasContextBase *db,
> abi_ptr pc)
> +{
> +    uint8_t ret;
> +    void *p = translator_access(env, db, pc, sizeof(ret));
> +
> +    if (p) {
> +        plugin_insn_append(pc, p, sizeof(ret));
> +        return ldub_p(p);
>      }
> +    ret = cpu_ldub_code(env, pc);
> +    plugin_insn_append(pc, &ret, sizeof(ret));
> +    return ret;
> +}
>  
> -FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
> +uint16_t translator_lduw(CPUArchState *env, DisasContextBase *db,
> abi_ptr pc)
> +{
> +    uint16_t ret, plug;
> +    void *p = translator_access(env, db, pc, sizeof(ret));
>  
> -#undef GEN_TRANSLATOR_LD
> +    if (p) {
> +        plugin_insn_append(pc, p, sizeof(ret));
> +        return lduw_p(p);
> +    }
> +    ret = cpu_lduw_code(env, pc);
> +    plug = tswap16(ret);
> +    plugin_insn_append(pc, &plug, sizeof(ret));
> +    return ret;
> +}
> +
> +uint32_t translator_ldl(CPUArchState *env, DisasContextBase *db,
> abi_ptr pc)
> +{
> +    uint32_t ret, plug;
> +    void *p = translator_access(env, db, pc, sizeof(ret));
> +
> +    if (p) {
> +        plugin_insn_append(pc, p, sizeof(ret));
> +        return ldl_p(p);
> +    }
> +    ret = cpu_ldl_code(env, pc);
> +    plug = tswap32(ret);
> +    plugin_insn_append(pc, &plug, sizeof(ret));
> +    return ret;
> +}
> +
> +uint64_t translator_ldq(CPUArchState *env, DisasContextBase *db,
> abi_ptr pc)
> +{
> +    uint64_t ret, plug;
> +    void *p = translator_access(env, db, pc, sizeof(ret));
> +
> +    if (p) {
> +        plugin_insn_append(pc, p, sizeof(ret));
> +        return ldq_p(p);
> +    }
> +    ret = cpu_ldq_code(env, pc);
> +    plug = tswap64(ret);
> +    plugin_insn_append(pc, &plug, sizeof(ret));
> +    return ret;
> +}

Hi,

I think you need the following fixup here:

--- a/tests/tcg/multiarch/noexec.c.inc
+++ b/tests/tcg/multiarch/noexec.c.inc
@@ -1,8 +1,5 @@
 /*
  * Common code for arch-specific MMU_INST_FETCH fault testing.
- *
- * Declare struct arch_noexec_test before including this file and
define
- * arch_check_mcontext() after that.
  */
 
 #define _GNU_SOURCE
@@ -13,6 +10,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <errno.h>
+#include <unistd.h>
 #include <sys/mman.h>
 #include <sys/ucontext.h>

After the simplifications the comment is no longer true or useful;
unistd.h is needed for getpagesize().

With that:

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>

for the series.

Best regards,
Ilya


