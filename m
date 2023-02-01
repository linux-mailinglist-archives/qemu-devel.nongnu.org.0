Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D57E6865F0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 13:31:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNCFq-0008DG-36; Wed, 01 Feb 2023 07:30:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pNCFm-0008Ab-R2
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 07:30:18 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pNCFj-0007YY-Ht
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 07:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WybUc5qn4aVBa/dSGhUJijhaocaWNszreHLQ/B65TXE=; b=ezAI1FnrRpJ1CjWsx3r+tOm2N4
 1AvNmLvaqI1m/KVgUDNvoc4cpUM1AvJXJgtTyYZlF9rlnh+u2y3i4A8/4zOiO53/7raLcSoq2/9Ib
 Pt5/RgIeQqoBBGfyl48YIe4RFTIuIeZ+b41EP7Y+Z9Ge4RL7x1uSkbSZaW1eQq/JaZSU=;
Message-ID: <c87a9757-5caf-cbd7-13c3-6afc08ab4af2@rev.ng>
Date: Wed, 1 Feb 2023 13:29:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 03/14] Hexagon (target/hexagon) Add overrides for
 endloop1/endloop01
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-4-tsimpson@quicinc.com>
Organization: rev.ng
In-Reply-To: <20230131225647.25274-4-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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


> +
> +static void gen_endloop01(DisasContext *ctx)
> +{
> +    TCGv lpcfg = tcg_temp_local_new();
Move label declarations here per coding style
> +
> +    GET_USR_FIELD(USR_LPCFG, lpcfg);
> +
> +    /*
> +     *    if (lpcfg == 1) {
> +     *        hex_new_pred_value[3] = 0xff;
> +     *        hex_pred_written |= 1 << 3;
> +     *    }
> +     */
> +    TCGLabel *label1 = gen_new_label();
> +    tcg_gen_brcondi_tl(TCG_COND_NE, lpcfg, 1, label1);
> +    {
> +        tcg_gen_movi_tl(hex_new_pred_value[3], 0xff);
> +        tcg_gen_ori_tl(hex_pred_written, hex_pred_written, 1 << 3);
> +    }
> +    gen_set_label(label1);
> +
> +    /*
> +     *    if (lpcfg) {
> +     *        SET_USR_FIELD(USR_LPCFG, lpcfg - 1);
> +     *    }
> +     */
> +    TCGLabel *label2 = gen_new_label();
> +    tcg_gen_brcondi_tl(TCG_COND_EQ, lpcfg, 0, label2);
> +    {
> +        tcg_gen_subi_tl(lpcfg, lpcfg, 1);
> +        SET_USR_FIELD(USR_LPCFG, lpcfg);
> +    }
> +    gen_set_label(label2);
Move tcg_temp_free(lpcfg) here
> +
> +    /*
> +     *    if (hex_gpr[HEX_REG_LC0] > 1) {
> +     *        PC = hex_gpr[HEX_REG_SA0];
> +     *        hex_new_value[HEX_REG_LC0] = hex_gpr[HEX_REG_LC0] - 1;
> +     *    } else {
> +     *        if (hex_gpr[HEX_REG_LC1] > 1) {
> +     *            hex_next_pc = hex_gpr[HEX_REG_SA1];
> +     *            hex_new_value[HEX_REG_LC1] = hex_gpr[HEX_REG_LC1] - 1;
> +     *        }
> +     *    }
> +     */
> +    TCGLabel *label3 = gen_new_label();
> +    TCGLabel *done = gen_new_label();
> +    tcg_gen_brcondi_tl(TCG_COND_LEU, hex_gpr[HEX_REG_LC0], 1, label3);
> +    {
> +        gen_jumpr(ctx, hex_gpr[HEX_REG_SA0]);
> +        tcg_gen_subi_tl(hex_new_value[HEX_REG_LC0], hex_gpr[HEX_REG_LC0], 1);
> +        tcg_gen_br(done);
> +    }
> +    gen_set_label(label3);
> +    tcg_gen_brcondi_tl(TCG_COND_LEU, hex_gpr[HEX_REG_LC1], 1, done);
> +    {
> +        gen_jumpr(ctx, hex_gpr[HEX_REG_SA1]);
> +        tcg_gen_subi_tl(hex_new_value[HEX_REG_LC1], hex_gpr[HEX_REG_LC1], 1);
> +    }
> +    gen_set_label(done);
> +    tcg_temp_free(lpcfg);
> +}
> +
>   static void gen_cmp_jumpnv(DisasContext *ctx,
>                              TCGCond cond, TCGv val, TCGv src, int pc_off)
>   {

Otherwise this patch looks good,

Reviewed-by: Anton Johansson <anjo@rev.ng>


