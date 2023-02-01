Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED38D6865B8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 13:09:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNBvD-0004DY-AI; Wed, 01 Feb 2023 07:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pNBv4-00046u-Gy
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 07:08:57 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pNBv2-0001HL-MY
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 07:08:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j1LCqLYaUKa2SlHhLngqCa6PyTqIDS2CM7g4N6wK0uk=; b=ebrUjx9+Os8YpQ0jFkJBET7F7Y
 uxJG5lL0+L6l3/lnIOTvCeushElT4rPSu2FBQavw2rrIV+zv05vcVgQD8Kw/zjzRmqtFqz8PIqYbT
 alEVaWxW0OV74jc+PWXRlz4Q4dEFn4VbYnElfwd8/f4vZrsPuBgP9d2REIf09DPi1Zak=;
Message-ID: <4ad67b5e-4d40-2c4c-22e5-f630ab8f32c4@rev.ng>
Date: Wed, 1 Feb 2023 13:08:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 02/14] Hexagon (target/hexagon) Add overrides for callr
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-3-tsimpson@quicinc.com>
Organization: rev.ng
In-Reply-To: <20230131225647.25274-3-tsimpson@quicinc.com>
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

> +static void gen_callr(DisasContext *ctx, TCGv new_pc)
> +{
> +    TCGv next_PC =
> +        tcg_constant_tl(ctx->pkt->pc + ctx->pkt->encod_pkt_size_in_bytes);
Could we not use ctx->next_PC here?
> +    gen_log_reg_write(HEX_REG_LR, next_PC);
> +    gen_write_new_pc_addr(ctx, new_pc, TCG_COND_ALWAYS, NULL);
> +}
> +

Otherwise,

Reviewed-by: Anton Johansson <anjo@rev.ng>


