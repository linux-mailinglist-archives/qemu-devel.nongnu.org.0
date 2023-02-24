Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2C26A1D64
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZ0D-0006fK-U0; Fri, 24 Feb 2023 09:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pVZ0B-0006ee-Tl
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:24:48 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pVZ06-0001kB-EH
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iSHqtdGOGZRX/C8dF4FjyDWfXDV/lvptyy25e21xLG8=; b=vtpXza5vEpwhdbRGzGAzMhdV40
 6ZEE1DS0rEy7P+1CpfYXpE8wFvc2tWbDJqTC5rv9iHRaVvmlDMgM7wV0P37VmGpZ6HlryNg/Vvhfj
 coEFhS71RHXnAfWMB+CwlK1sunTT9NsGJw5YhIdwrueW/Fg4XWgxUpJz0byV1xRGy1qU=;
Message-ID: <2eb2c248-8a14-345c-1a54-7c28a1458123@rev.ng>
Date: Fri, 24 Feb 2023 15:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 13/14] Hexagon (target/hexagon) Reduce manipulation of
 slot_cancelled
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-14-tsimpson@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230131225647.25274-14-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 1/31/23 23:56, Taylor Simpson wrote:
>   /* Called during packet commit when there are two scalar stores */
> -void HELPER(probe_pkt_scalar_store_s0)(CPUHexagonState *env, int mmu_idx)
> +void HELPER(probe_pkt_scalar_store_s0)(CPUHexagonState *env, int args)
>   {
> -    probe_store(env, 0, mmu_idx);
> +    int mmu_idx = args & 0x3;
> +    bool is_predicated = (args >> 2) & 1;
> +    probe_store(env, 0, mmu_idx, is_predicated);
>   }
Can we use bitmasks for the fields of args?
>   void HELPER(probe_hvx_stores)(CPUHexagonState *env, int mmu_idx)
> @@ -489,12 +492,14 @@ void HELPER(probe_pkt_scalar_hvx_stores)(CPUHexagonState *env, int mask,
>       bool has_st0        = (mask >> 0) & 1;
>       bool has_st1        = (mask >> 1) & 1;
>       bool has_hvx_stores = (mask >> 2) & 1;
> +    bool s0_is_pred     = (mask >> 3) & 1;
> +    bool s1_is_pred     = (mask >> 4) & 1;
also used here
>       if (has_st0) {
> -        probe_store(env, 0, mmu_idx);
> +        probe_store(env, 0, mmu_idx, s0_is_pred);
>       }
>       if (has_st1) {
> -        probe_store(env, 1, mmu_idx);
> +        probe_store(env, 1, mmu_idx, s1_is_pred);
>       }
>       if (has_hvx_stores) {
>           HELPER(probe_hvx_stores)(env, mmu_idx);
> @@ -1444,12 +1449,6 @@ void HELPER(vwhist128qm)(CPUHexagonState *env, int32_t uiV)
>       }
>   }
>   
> -void cancel_slot(CPUHexagonState *env, uint32_t slot)
> -{
> -    HEX_DEBUG_LOG("Slot %d cancelled\n", slot);
> -    env->slot_cancelled |= (1 << slot);
> -}
> -
>   /* These macros can be referenced in the generated helper functions */
>   #define warn(...) /* Nothing */
>   #define fatal(...) g_assert_not_reached();
> diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
> index 53fd935db7..6ee8784910 100644
> --- a/target/hexagon/translate.c
> +++ b/target/hexagon/translate.c
> @@ -248,7 +248,16 @@ static bool check_for_attrib(Packet *pkt, int attrib)
>   
>   static bool need_slot_cancelled(Packet *pkt)
>   {
> -    return check_for_attrib(pkt, A_CONDEXEC);
> +    /* We only need slot_cancelled for conditional store and HVX instructions */
> +    for (int i = 0; i < pkt->num_insns; i++) {
> +        uint16_t opcode = pkt->insn[i].opcode;
> +        if (GET_ATTRIB(opcode, A_CONDEXEC) &&
> +            (GET_ATTRIB(opcode, A_STORE) ||
> +             GET_ATTRIB(opcode, A_CVI))) {
> +            return true;
> +        }
> +    }
> +    return false;
>   }
>   
>   static bool need_pred_written(Packet *pkt)
> @@ -860,6 +869,12 @@ static void gen_commit_packet(DisasContext *ctx)
>               if (has_hvx_store) {
>                   mask |= (1 << 2);
>               }
> +            if (has_store_s0 && slot_is_predicated(pkt, 0)) {
> +                mask |= (1 << 3);
> +            }
> +            if (has_store_s1 && slot_is_predicated(pkt, 1)) {
> +                mask |= (1 << 4);
> +            }
>               mask_tcgv = tcg_constant_tl(mask);
>               gen_helper_probe_pkt_scalar_hvx_stores(cpu_env, mask_tcgv, mem_idx);
>           }
and here
> @@ -868,8 +883,12 @@ static void gen_commit_packet(DisasContext *ctx)
>            * process_store_log will execute the slot 1 store first,
>            * so we only have to probe the store in slot 0
>            */
> -        TCGv mem_idx = tcg_constant_tl(ctx->mem_idx);
> -        gen_helper_probe_pkt_scalar_store_s0(cpu_env, mem_idx);
> +        int args = ctx->mem_idx;
> +        if (slot_is_predicated(pkt, 0)) {
> +            args |= (1 << 2);
> +        }
> +        TCGv args_tcgv = tcg_constant_tl(args);
> +        gen_helper_probe_pkt_scalar_store_s0(cpu_env, args_tcgv);
>       }
and here

Otherwise,

Reviewed-by: Anton Johansson <anjo@rev.ng>


