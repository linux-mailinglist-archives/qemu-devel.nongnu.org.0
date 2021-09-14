Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE88940B570
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:55:42 +0200 (CEST)
Received: from localhost ([::1]:53726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQBif-0002Zv-EZ
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQBhD-0001tl-8a
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:54:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mQBgw-0006ou-Qg
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631638432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bm7/A8cUxdjTST/LH53GLrtY5HUuUUCwIwmxNFBLHj4=;
 b=ZEzYQ3OtShoCF2YvouJY7RdDoPMOXZhhDw8pH7PeCYlZug79dl+YfHkFq7gqvWy2XJR/BJ
 ragZLxXD52JbxXUCFMwXe7pF8kWoYiP8PrqBGmrIzzDxnLeSe+jSQWBB7cy63sSs0MqDXQ
 jDfsUSt94xTizHc3xuXexSyd+ADoNXU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-9pZ1SaF5MGS96Ht5z9g9VA-1; Tue, 14 Sep 2021 12:53:51 -0400
X-MC-Unique: 9pZ1SaF5MGS96Ht5z9g9VA-1
Received: by mail-wm1-f70.google.com with SMTP id
 g13-20020a1c200d000000b00308ecd761e8so19804wmg.2
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 09:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Bm7/A8cUxdjTST/LH53GLrtY5HUuUUCwIwmxNFBLHj4=;
 b=IN/3K/ho6/G3TqhUy6LA9WKaljQFm69slifLsruV2+nKYS1GhknADtPXQdeva0ojaX
 pVCPTRPgMHtiKYgZ09Xu7bBk9xziMGG8h/51B3kAs3gYm0xrLFuufhy+zTTblwvm0Esc
 PFkZtMJoxyo59X1B3SMHUG3sCmV9ZSzjZnKaGpYSFSiKtSMWmtmaiQqHCP8vJF3kmbiP
 tgZUOEw4Jv5OCYF3nwLEUEuKqnpvV6FDMz99bE1VKcV5AqwuDiGOsJTLUWLfH9g66yUL
 8EYLb8BkcbCG8I/Y6zvt+kP/roe0WwbU2DIu+77JYVDrs5faYAEbSgPcyB/sxnig/9Wa
 HWoA==
X-Gm-Message-State: AOAM532jgrBNOCx48aRmSWUAN92Sg81gR3BCi8mT/WfiWEeUr/9Gl5Lz
 RlrzGTSp1q/ob9wbcMGFL2ciJSowb00/AFlyrECrl/zQ7uI8ENyUGflSzii4Q9chw3L+NehcNmK
 qda75dTk3jriyZoqnOYZfxeTWf5NQ12P7ojhaNI9dyNlJ8MUvTD7V7bL4b4kiT4E=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr110243wrr.275.1631638430826; 
 Tue, 14 Sep 2021 09:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3d2mnSzKV/ienaFpmGO5dj2mCUdDSGR6xYIVVkp8T+yhX4E1+timey2IoYjIYt3xPPX9Xeg==
X-Received: by 2002:adf:fd12:: with SMTP id e18mr110226wrr.275.1631638430611; 
 Tue, 14 Sep 2021 09:53:50 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6041.dip0.t-ipconnect.de. [91.12.96.65])
 by smtp.gmail.com with ESMTPSA id
 j7sm13509212wrr.27.2021.09.14.09.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 09:53:50 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-7-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 06/16] tcg/s390x: Implement tcg_out_mov for vector types
Message-ID: <045600e5-a3bf-18f3-b8a8-9e593c97a3ed@redhat.com>
Date: Tue, 14 Sep 2021 18:53:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626050307.2408505-7-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 26.06.21 07:02, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 72 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 68 insertions(+), 4 deletions(-)
> 
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index b6ea129e14..c4e12a57f3 100644
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -265,6 +265,11 @@ typedef enum S390Opcode {
>       RX_STC      = 0x42,
>       RX_STH      = 0x40,
>   
> +    VRRa_VLR    = 0xe756,
> +
> +    VRSb_VLVG   = 0xe722,
> +    VRSc_VLGV   = 0xe721,
> +
>       VRX_VL      = 0xe706,
>       VRX_VLLEZ   = 0xe704,
>       VRX_VST     = 0xe70e,
> @@ -548,6 +553,39 @@ static int RXB(TCGReg v1, TCGReg v2, TCGReg v3, TCGReg v4)
>            | ((v4 & 0x10) << (4 + 0));
>   }
>   
> +static void tcg_out_insn_VRRa(TCGContext *s, S390Opcode op,
> +                              TCGReg v1, TCGReg v2, int m3)
> +{
> +    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
> +    tcg_debug_assert(v2 >= TCG_REG_V0 && v2 <= TCG_REG_V31);
> +    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | (v2 & 15));
> +    tcg_out32(s, (op & 0x00ff) | RXB(v1, v2, 0, 0) | (m3 << 12));
> +}
> +
> +static void tcg_out_insn_VRSb(TCGContext *s, S390Opcode op, TCGReg v1,
> +                              intptr_t d2, TCGReg b2, TCGReg r3, int m4)
> +{
> +    tcg_debug_assert(v1 >= TCG_REG_V0 && v1 <= TCG_REG_V31);
> +    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
> +    tcg_debug_assert(b2 <= TCG_REG_R15);
> +    tcg_debug_assert(r3 <= TCG_REG_R15);
> +    tcg_out16(s, (op & 0xff00) | ((v1 & 15) << 4) | r3);
> +    tcg_out16(s, b2 << 12 | d2);
> +    tcg_out16(s, (op & 0x00ff) | RXB(v1, 0, 0, 0) | (m4 << 12));
> +}
> +
> +static void tcg_out_insn_VRSc(TCGContext *s, S390Opcode op, TCGReg r1,
> +                              intptr_t d2, TCGReg b2, TCGReg v3, int m4)
> +{
> +    tcg_debug_assert(r1 <= TCG_REG_R15);
> +    tcg_debug_assert(d2 >= 0 && d2 <= 0xfff);
> +    tcg_debug_assert(b2 <= TCG_REG_R15);
> +    tcg_debug_assert(v3 >= TCG_REG_V0 && v3 <= TCG_REG_V31);
> +    tcg_out16(s, (op & 0xff00) | (r1 << 4) | (v3 & 15));
> +    tcg_out16(s, b2 << 12 | d2);
> +    tcg_out16(s, (op & 0x00ff) | RXB(0, 0, v3, 0) | (m4 << 12));
> +}
> +
>   static void tcg_out_insn_VRX(TCGContext *s, S390Opcode op, TCGReg v1,
>                                TCGReg b2, TCGReg x2, intptr_t d2, int m3)
>   {
> @@ -581,12 +619,38 @@ static void tcg_out_sh32(TCGContext* s, S390Opcode op, TCGReg dest,
>   
>   static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
>   {
> -    if (src != dst) {
> -        if (type == TCG_TYPE_I32) {
> +    if (src == dst) {
> +        return true;
> +    }
> +    switch (type) {
> +    case TCG_TYPE_I32:
> +        if (likely(dst < 16 && src < 16)) {
>               tcg_out_insn(s, RR, LR, dst, src);
> -        } else {
> -            tcg_out_insn(s, RRE, LGR, dst, src);
> +            break;
>           }
> +        /* fallthru */
> +

Does that fall-through work as expected? I would have thought we would 
want to pass "2" as m4 for VLGV and VLVG below?

Apart from that LGTM.


-- 
Thanks,

David / dhildenb


