Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F372A5E8C64
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 14:24:25 +0200 (CEST)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc4Cn-0007gC-1C
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 08:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oc4Ac-0006HA-9e
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 08:22:10 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oc4Aa-0000H4-FP
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 08:22:09 -0400
Received: by mail-wm1-x333.google.com with SMTP id ay36so1745517wmb.0
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 05:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=Z1Y22CHrp0rc2acahr+++adUIYNOksVOHcBCgJEjp/4=;
 b=Ux6lCY5TnGPQ5uVGs3I77179fwtqrXb/EsYZX3P6Hbwa9tCXRCPTpch7R640ViyANo
 AtoOKA87UPnQ++SaODQTPBqaQ+jKbKUuuN8ckQnaXTJySeuss5tMyr2eo3VXwEXRshoB
 BOJiyCNANQf2qimnPjWmTSg5Jgm4q5imfE+LfBoYisaE+fbu32Zep6Rc+sfTJ7xpjsgy
 LVCHUhszlGGZJB0GROSWakXSe4OK3JJ1ESFQPhs9OiFdkF4qdc7T6kl5AbfuM+gT41zX
 WhIgIIfXp7PsnGIeAgns4ma8B1TGjAp7M8y02pvtQMFOEjphhBXIAV0iau0KEcMTmlNo
 D0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=Z1Y22CHrp0rc2acahr+++adUIYNOksVOHcBCgJEjp/4=;
 b=SXFIssGQoJbK6dhI3dsK8xsYxyOP4AS91pL0mErDkOqdMVVeKxYWeu0Vp4Mh1iJquI
 JsiHAVoM6Eq8U1nmGxAtXozRdfRX0jH2PErsLFSJHVcrtMpwuOdK9Sn1G4NU4ejnU/d+
 yNN31IGCMel5JHKsjF7yD2oPP/Gy7Ia/jIeAzMTDNIH9uJ+y45UjcEcTdqmikU1eUNJO
 KeZVbUEaFq5A//rX6GGufths1juM58fU5yzw7Nwco9nZlPscJMD6debT/wkQKCfRFWW6
 kD+HMT4Gpyyr/pg/cyOGO0GzG+5WyEIXmMsehSixKPjcYjJkVY2+/40XEPHhll4DnYrH
 i7Cw==
X-Gm-Message-State: ACrzQf2LaJVKkcDhE/RFCgUfhVY3pfcehFWGotCvYMv3pksyb39KfHQH
 yDKURYB/He6YF/DXVzeT/Ko=
X-Google-Smtp-Source: AMsMyM70xuu3nvb/NPpqnwlUgZ73+oDq5wqZoSPhRvIqiUADt1uvpAqFCry/woWJIEE/pHC2HdgdSA==
X-Received: by 2002:a05:600c:27d1:b0:3b4:5e9c:23ed with SMTP id
 l17-20020a05600c27d100b003b45e9c23edmr8671591wmb.180.1664022126173; 
 Sat, 24 Sep 2022 05:22:06 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4e43000000b00228dc1c7063sm9522329wrt.85.2022.09.24.05.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 05:22:04 -0700 (PDT)
Message-ID: <f6f9f5b3-36a0-0ec9-3753-ae5182a53401@amsat.org>
Date: Sat, 24 Sep 2022 14:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v11 06/15] target/hexagon: expose next PC in DisasContext
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, babush@rev.ng, nizzo@rev.ng, tsimpson@quicinc.com,
 bcain@quicinc.com, mlambert@quicinc.com, richard.henderson@linaro.org,
 alex.bennee@linaro.org
References: <20220804115548.13024-1-anjo@rev.ng>
 <20220804115548.13024-7-anjo@rev.ng>
In-Reply-To: <20220804115548.13024-7-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.118,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/8/22 13:55, Anton Johansson via wrote:
> From: Paolo Montesel <babush@rev.ng>

Missing the rationale. "The idef-parser will use it with IMM_NPC".

But I feel I'm missing something, what is the diff between IMM_PC/IMM_NPC?

> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/translate.c | 3 ++-
>   target/hexagon/translate.h | 1 +
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
> index d4fc92f7e9..e3e250fd4f 100644
> --- a/target/hexagon/translate.c
> +++ b/target/hexagon/translate.c
> @@ -741,11 +741,12 @@ static void decode_and_translate_packet(CPUHexagonState *env, DisasContext *ctx)
>       if (decode_packet(nwords, words, &pkt, false) > 0) {
>           HEX_DEBUG_PRINT_PKT(&pkt);
>           gen_start_packet(ctx, &pkt);
> +        ctx->npc = ctx->base.pc_next + pkt.encod_pkt_size_in_bytes;
>           for (i = 0; i < pkt.num_insns; i++) {
>               gen_insn(env, ctx, &pkt.insn[i], &pkt);
>           }
>           gen_commit_packet(env, ctx, &pkt);
> -        ctx->base.pc_next += pkt.encod_pkt_size_in_bytes;
> +        ctx->base.pc_next = ctx->npc;
>       } else {
>           gen_exception_end_tb(ctx, HEX_EXCP_INVALID_PACKET);
>       }
> diff --git a/target/hexagon/translate.h b/target/hexagon/translate.h
> index a245172827..494471548e 100644
> --- a/target/hexagon/translate.h
> +++ b/target/hexagon/translate.h
> @@ -53,6 +53,7 @@ typedef struct DisasContext {
>       bool qreg_is_predicated[NUM_QREGS];
>       int qreg_log_idx;
>       bool pre_commit;
> +    uint32_t npc;

And why not use target_ulong?

>   } DisasContext;
>   
>   static inline void ctx_log_reg_write(DisasContext *ctx, int rnum)


