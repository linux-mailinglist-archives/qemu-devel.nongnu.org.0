Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBC363DCB5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 19:08:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0RUM-0001FU-3C; Wed, 30 Nov 2022 13:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p0RUI-0001F5-TL; Wed, 30 Nov 2022 13:07:16 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p0RUG-00088a-PO; Wed, 30 Nov 2022 13:07:14 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AUHJ1eZ020695; Wed, 30 Nov 2022 18:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=9UwQg8GZ9qg/WS2Oj/HZ8Tkd3PiaER4Pizzp4gnq4uc=;
 b=mM3DyhbJkbAucC+Fx/7f9AZ6cX3A3FTHF1s/gI5R1jktvUjl199/raFHNJQhrlp2jnAC
 jqRin4KwVYCUClwxrlh3m7dr4LOc6bpHXm9fizfJjG/cxO7VfqEfcKp8QajdXSdwlEqM
 qSXMmX2aLHC3fg38dwZmoWy18UYKfaQpTJRPsLo/F8eLlXRZvZxTQ1FL/jbTkQvnkwON
 LYmtO7a7KG1yNYKSjdZnNfFKEhSvBVFlIgWpQJQUsZL0NiLYc1GVMwDIJ92WPlOqPhm1
 mHWL/fvm4jPrxeLIjHZrFBGzFvl18V7K+YUaFOaTyzHCCuU7+MZw5U74t5pkSqkneNCB eQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6bfg9dq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 18:07:10 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AUI69hZ004100;
 Wed, 30 Nov 2022 18:07:08 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3m3ae94g4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 18:07:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AUI75Ii63570296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Nov 2022 18:07:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 801354C046;
 Wed, 30 Nov 2022 18:07:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1E664C040;
 Wed, 30 Nov 2022 18:07:04 +0000 (GMT)
Received: from heavy (unknown [9.171.36.196])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 30 Nov 2022 18:07:04 +0000 (GMT)
Date: Wed, 30 Nov 2022 19:07:03 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 24/26] tcg: Introduce tcg_temp_ebb_new_*
Message-ID: <20221130180703.dprt7lzmppgfihtp@heavy>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-25-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006034421.1179141-25-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4oahnZS6DLrdhRVKF07FpCCeQgJQw7Zc
X-Proofpoint-GUID: 4oahnZS6DLrdhRVKF07FpCCeQgJQw7Zc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211300126
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

On Wed, Oct 05, 2022 at 08:44:19PM -0700, Richard Henderson wrote:
> Allow targets to allocate extended-basic-block temps.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-op.h |  2 ++
>  include/tcg/tcg.h    | 20 +++++++++++++++++++-
>  tcg/tcg.c            | 16 ++++------------
>  3 files changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
> index 209e168305..0ebbee6e24 100644
> --- a/include/tcg/tcg-op.h
> +++ b/include/tcg/tcg-op.h
> @@ -848,6 +848,7 @@ static inline void tcg_gen_plugin_cb_end(void)
>  #define tcg_temp_new() tcg_temp_new_i32()
>  #define tcg_global_mem_new tcg_global_mem_new_i32
>  #define tcg_temp_local_new() tcg_temp_local_new_i32()
> +#define tcg_temp_ebb_new() tcg_temp_ebb_new_i32()
>  #define tcg_temp_free tcg_temp_free_i32
>  #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i32
>  #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i32
> @@ -855,6 +856,7 @@ static inline void tcg_gen_plugin_cb_end(void)
>  #define tcg_temp_new() tcg_temp_new_i64()
>  #define tcg_global_mem_new tcg_global_mem_new_i64
>  #define tcg_temp_local_new() tcg_temp_local_new_i64()
> +#define tcg_temp_ebb_new() tcg_temp_ebb_new_i64()
>  #define tcg_temp_free tcg_temp_free_i64
>  #define tcg_gen_qemu_ld_tl tcg_gen_qemu_ld_i64
>  #define tcg_gen_qemu_st_tl tcg_gen_qemu_st_i64
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index e01a47ec20..3835711d52 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -609,7 +609,7 @@ struct TCGContext {
>  #endif
>  
>      GHashTable *const_table[TCG_TYPE_COUNT];
> -    TCGTempSet free_temps[TCG_TYPE_COUNT * 2];
> +    TCGTempSet free_temps[TCG_TYPE_COUNT * 3];
>      TCGTemp temps[TCG_MAX_TEMPS]; /* globals first, temps after */
>  
>      QTAILQ_HEAD(, TCGOp) ops, free_ops;
> @@ -890,6 +890,12 @@ static inline TCGv_i32 tcg_temp_local_new_i32(void)
>      return temp_tcgv_i32(t);
>  }
>  
> +static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
> +{
> +    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
> +    return temp_tcgv_i32(t);
> +}
> +
>  static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
>                                                const char *name)
>  {
> @@ -909,6 +915,12 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
>      return temp_tcgv_i64(t);
>  }
>  
> +static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
> +{
> +    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
> +    return temp_tcgv_i64(t);
> +}
> +
>  static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
>                                                const char *name)
>  {
> @@ -928,6 +940,12 @@ static inline TCGv_ptr tcg_temp_local_new_ptr(void)
>      return temp_tcgv_ptr(t);
>  }
>  
> +static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
> +{
> +    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
> +    return temp_tcgv_ptr(t);
> +}
> +
>  #if defined(CONFIG_DEBUG_TCG)
>  /* If you call tcg_clear_temp_count() at the start of a section of
>   * code which is not supposed to leak any TCG temporaries, then
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index acdbd5a9a2..7aa6cc3451 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -948,17 +948,8 @@ TCGTemp *tcg_temp_new_internal(TCGType type, TCGTempKind kind)
>      TCGTemp *ts;
>      int idx, k;
>  
> -    switch (kind) {
> -    case TEMP_NORMAL:
> -        k = 0;
> -        break;
> -    case TEMP_LOCAL:
> -        k = TCG_TYPE_COUNT;
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -    k += type;
> +    assert(kind >= TEMP_NORMAL && kind <= TEMP_LOCAL);

Nit: maybe also add QEMU_BUILD_BUG_ON(TEMP_NORMAL != 0)
and QEMU_BUILD_BUG_ON(TEMP_LOCAL != 2), since we are using this for
0-based array indexing here? Alternatively, subtract TEMP_NORMAL
from kind.

> +    k = TCG_TYPE_COUNT * kind + type;
>  
>      idx = find_first_bit(s->free_temps[k].l, TCG_MAX_TEMPS);
>      if (idx < TCG_MAX_TEMPS) {
> @@ -1046,6 +1037,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
>           */
>          return;
>      case TEMP_NORMAL:
> +    case TEMP_EBB:
>      case TEMP_LOCAL:
>          break;
>      default:
> @@ -1063,7 +1055,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
>      ts->temp_allocated = 0;
>  
>      idx = temp_idx(ts);
> -    k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
> +    k = ts->base_type + ts->kind * TCG_TYPE_COUNT;
>      set_bit(idx, s->free_temps[k].l);
>  }
>  
> -- 
> 2.34.1
> 
> 

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

While not directly related to this patch, it would be good to update
tcg/README with all the new kinds of temporaries. E.g. the EBB ones are
not mentioned there:

    TCG instructions operate on variables which are temporaries, local
    temporaries or globals.

