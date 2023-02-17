Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B815069A402
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 03:44:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSqie-0004zB-8W; Thu, 16 Feb 2023 21:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqic-0004yq-H6; Thu, 16 Feb 2023 21:43:26 -0500
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqiZ-0000Jb-Pg; Thu, 16 Feb 2023 21:43:26 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R241e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqTi48_1676601795; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqTi48_1676601795) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 10:43:16 +0800
Message-ID: <28694a32-f689-c4ac-44aa-74e8379a668d@linux.alibaba.com>
Date: Fri, 17 Feb 2023 10:43:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 11/18] target/riscv: gdbstub: Drop the vector CSRs in
 riscv-vector.xml
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-12-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230213180215.1524938-12-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.99;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-99.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/2/14 2:02, Bin Meng wrote:
> It's worth noting that the vector CSR predicate() has a similar
> run-time check logic to the FPU CSR. With the previous patch our
> gdbstub can correctly report these vector CSRs via the CSR xml.
>
> Commit 719d3561b269 ("target/riscv: gdb: support vector registers for rv64 & rv32")
> inserted these vector CSRs in an ad-hoc, non-standard way in the
> riscv-vector.xml. Now we can treat these CSRs no different from
> other CSRs.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>   target/riscv/gdbstub.c | 75 ------------------------------------------
>   1 file changed, 75 deletions(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index ef52f41460..6048541606 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -127,40 +127,6 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
>       return 0;
>   }
>   
> -/*
> - * Convert register index number passed by GDB to the correspond
> - * vector CSR number. Vector CSRs are defined after vector registers
> - * in dynamic generated riscv-vector.xml, thus the starting register index
> - * of vector CSRs is 32.
> - * Return 0 if register index number is out of range.
> - */
> -static int riscv_gdb_vector_csrno(int num_regs)
> -{
> -    /*
> -     * The order of vector CSRs in the switch case
> -     * should match with the order defined in csr_ops[].
> -     */
> -    switch (num_regs) {
> -    case 32:
> -        return CSR_VSTART;
> -    case 33:
> -        return CSR_VXSAT;
> -    case 34:
> -        return CSR_VXRM;
> -    case 35:
> -        return CSR_VCSR;
> -    case 36:
> -        return CSR_VL;
> -    case 37:
> -        return CSR_VTYPE;
> -    case 38:
> -        return CSR_VLENB;
> -    default:
> -        /* Unknown register. */
> -        return 0;
> -    }
> -}
> -
>   static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
>   {
>       uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> @@ -174,19 +140,6 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
>           return cnt;
>       }
>   
> -    int csrno = riscv_gdb_vector_csrno(n);
> -
> -    if (!csrno) {
> -        return 0;
> -    }
> -
> -    target_ulong val = 0;
> -    int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
> -
> -    if (result == RISCV_EXCP_NONE) {
> -        return gdb_get_regl(buf, val);
> -    }
> -
>       return 0;
>   }
>   
> @@ -201,19 +154,6 @@ static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
>           return vlenb;
>       }
>   
> -    int csrno = riscv_gdb_vector_csrno(n);
> -
> -    if (!csrno) {
> -        return 0;
> -    }
> -
> -    target_ulong val = ldtul_p(mem_buf);
> -    int result = riscv_csrrw_debug(env, csrno, NULL, val, -1);
> -
> -    if (result == RISCV_EXCP_NONE) {
> -        return sizeof(target_ulong);
> -    }
> -
>       return 0;
>   }
>   
> @@ -361,21 +301,6 @@ static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
>           num_regs++;
>       }
>   
> -    /* Define vector CSRs */
> -    const char *vector_csrs[7] = {
> -        "vstart", "vxsat", "vxrm", "vcsr",
> -        "vl", "vtype", "vlenb"
> -    };
> -
> -    for (i = 0; i < 7; i++) {
> -        g_string_append_printf(s,
> -                               "<reg name=\"%s\" bitsize=\"%d\""
> -                               " regnum=\"%d\" group=\"vector\""
> -                               " type=\"int\"/>",
> -                               vector_csrs[i], TARGET_LONG_BITS, base_reg++);
> -        num_regs++;
> -    }
> -

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       g_string_append_printf(s, "</feature>");
>   
>       cpu->dyn_vreg_xml = g_string_free(s, false);

