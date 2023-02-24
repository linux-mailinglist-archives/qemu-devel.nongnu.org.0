Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B6B6A1CAE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 14:07:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXlx-0000OI-Tl; Fri, 24 Feb 2023 08:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pVXlv-0000O3-UC
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:06:00 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pVXlt-00059I-6j
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qSGdrGUh8ep2ktYEgbz/7J7me+Ape+okph93iOJ0PCg=; b=vXbAYtCAnyeavYCTTvviQfOZcL
 2FJLpCgZVjPhlfJOkwv9T/E5NtVBImoUhINLOjWcjzgTbNJh+QIAHASryCeOXEp1rSjuuUldcNFbB
 bnF3afyvkoQykmXjXcx/HDCaWoNCPTBHwMRl//DnMqZAWvf+DaqviWWTidnkMmL01RGo=;
Message-ID: <60f644b7-bdd3-0161-2156-75ee9039316b@rev.ng>
Date: Fri, 24 Feb 2023 14:05:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 12/14] Hexagon (target/hexagon) Remove
 gen_log_predicated_reg_write[_pair]
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-13-tsimpson@quicinc.com>
Organization: rev.ng
In-Reply-To: <20230131225647.25274-13-tsimpson@quicinc.com>
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
>   static void gen_log_reg_write_pair(int rnum, TCGv_i64 val)
>   {
>       const target_ulong reg_mask_low = reg_immut_masks[rnum];
> @@ -167,6 +120,7 @@ static void gen_log_reg_write_pair(int rnum, TCGv_i64 val)
>       }
>   
>       tcg_temp_free(val32);
> +    tcg_temp_free_i64(val);
>   }
>   
>   void gen_log_pred_write(DisasContext *ctx, int pnum, TCGv val)
> @@ -306,12 +260,14 @@ static inline void gen_write_ctrl_reg_pair(DisasContext *ctx, int reg_num,
>                                              TCGv_i64 val)
>   {
>       if (reg_num == HEX_REG_P3_0_ALIASED) {
> +        TCGv result = get_result_gpr(ctx, reg_num + 1);
>           TCGv val32 = tcg_temp_new();
>           tcg_gen_extrl_i64_i32(val32, val);
>           gen_write_p3_0(ctx, val32);
>           tcg_gen_extrh_i64_i32(val32, val);
> -        gen_log_reg_write(reg_num + 1, val32);
> +        tcg_gen_mov_tl(result, val32);
>           tcg_temp_free(val32);
> +        tcg_temp_free_i64(val);
>       } else {
>           gen_log_reg_write_pair(reg_num, val);
>           if (reg_num == HEX_REG_QEMU_PKT_CNT) {

Hiding the free of a TCGv argument scares me a bit, it's bound to cause 
annoying bugs down
the line, I feel.

Any reason we can't keep the frees in the same scope as allocation?

Otherwise, the patch looks good,

Reviewed-by: Anton Johansson <anjo@rev.ng>


