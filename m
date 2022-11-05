Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E7F61A6AB
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 02:34:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or83n-0004u0-E4; Fri, 04 Nov 2022 21:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or83l-0004tr-B8
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 21:33:21 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or83j-0000L4-0A
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 21:33:21 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-13d9a3bb27aso6554780fac.11
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 18:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7l31v8YfVNSkm6VRsC7DY5agfM5CLJRzmpDnHKKXlIs=;
 b=Bd/kbOPz+Vkpmj1AXbcz1m9jo1/82zpIwftR65euy6+RXiMNXzwHcmYk9RqjzXY7gM
 pAAidOzewmFG0Dwi5uvCRLcrOF5aeDtsjIz9lOFJhDNbXPiCle5hD46Uo34mtgrHAGOf
 kExftYNRKTxyTxr7rtL28YvtEdDzjc9h+DfZMMB1C5C72cF9kq261izsIcTXzp0K7qyW
 dRmuIu9X8LG3gACr/9Hm3yjzLlSo7Hf8R5evoz0FqiifPJN0NVvnmq8fnQQb0ZnSlYjy
 H0D8/2f8zxWsn6K5T4EvJQ8IFvNuqDO9yrWkAysTDbjXvaD5c/gmYzD4YWK1cJcXR3Zl
 64vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7l31v8YfVNSkm6VRsC7DY5agfM5CLJRzmpDnHKKXlIs=;
 b=oD8Z9lTCJcOU2g/xOk7TaJeTV0FYWs1ojyxcEGV0T+7Dlui45dtr+zhGlt0rcsp7pM
 gN34+WRF2W4JWMUC00Y2fThgoxUtOqTguWWHFq5RR1+s7Q3ptbOsBhEAZMNr2Vmi431P
 mePlMqSUb2s2StNDods/d2rrIHVatElXMoFw/Lxj7G3JJVwsb+0XFP4GikmuDNUbuJS7
 m8YmkrtwIaRripYOFLVJXO8PmkJa3LySMlOY+BykyBBVaBVEwhJeyzvh9bARcaLjqA1I
 Pu86vf0FslVuQ/qzsQJ/dTBHD6lak04815Js4X7EtjmxuiLKtzHTX33CiTyq66w5Pj1T
 gArg==
X-Gm-Message-State: ACrzQf31BVUTMa01Q3Nt24ixgr6iCv1b8auZakcEC95Dp+/UeW8tqbel
 OkcTx+NPefFaqc4KH3I2bkqkYg==
X-Google-Smtp-Source: AMsMyM4zLtucOnHYNL4EKZMNRVtUHtX8qAVXvKunJ2wYdyXthqdMlmdytI8tlasywv/9C31K7sO1pg==
X-Received: by 2002:a05:6870:470d:b0:13c:d3d5:3f3f with SMTP id
 b13-20020a056870470d00b0013cd3d53f3fmr21717963oaq.73.1667611996744; 
 Fri, 04 Nov 2022 18:33:16 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 j5-20020aca6545000000b0035a2f3e423esm257272oiw.32.2022.11.04.18.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 18:33:16 -0700 (PDT)
Message-ID: <1a998d59-4302-06f9-c62f-aba2079a0238@linaro.org>
Date: Sat, 5 Nov 2022 12:33:03 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 10/11] Hexagon (target/hexagon) Use direct block
 chaining for direct jump/branch
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-11-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104192631.29434-11-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 06:26, Taylor Simpson wrote:
> Direct block chaining is documented here
> https://qemu.readthedocs.io/en/latest/devel/tcg.html#direct-block-chaining
> 
> Recall that Hexagon allows packets with multiple jumps where only the first
> one with a true predicate will actually jump.  So, we can only use direct
> block chaining when the packet contains a single PC-relative jump.

Not quite accurate.

Only the first two direct branches can use direct block chaining.  Other exits from the 
translation block could use indirect block chaining (tcg_gen_lookup_and_goto_ptr).  You 
just have to remember which is taken.

That said, this is certainly an improvement.

> +    if (ctx->pkt->pkt_has_multi_cof) {
> +        gen_write_new_pc_addr(ctx, tcg_constant_tl(dest), pred);
> +    } else {
> +        /* Defer this jump to the end of the TB */
> +        g_assert(ctx->branch_cond == NULL);
> +        ctx->has_single_direct_branch = true;
> +        if (pred != NULL) {
> +            ctx->branch_cond = tcg_temp_local_new();
> +            tcg_gen_mov_tl(ctx->branch_cond, pred);
> +        }
> +        ctx->branch_dest = dest;

Perhaps re-use hex_branch_taken as branch_cond?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

