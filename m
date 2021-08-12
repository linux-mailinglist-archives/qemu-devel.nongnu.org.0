Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB013EAA41
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 20:31:09 +0200 (CEST)
Received: from localhost ([::1]:46468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEFTv-0002Dh-Sq
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 14:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mEFS4-0001Ro-IV
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 14:29:12 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mEFS2-0000Gl-UU
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 14:29:12 -0400
Received: by mail-pl1-x634.google.com with SMTP id e15so8372174plh.8
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oK8IxpD416F/uJzoJcvHSMKpr045V3Ro2Zvj4imq4iA=;
 b=mzmaaG65z+asGLj2Tb8COkfpIYZWSwaq6/vL/LvHBKx2r8ptlWwp6sVpAJ+WV4+TDC
 v/3xD4iJeipmR/BccUUBGe6wwA2imAh2Vibvt5OTfMaGV7mJVdpgZIiC69Q/bk0bAkpk
 pqrN6XzBhWnAPKuQx7vQZI+YOU/+mZ3sltORbV78MKslsXpKGx5jAx+tXFIxdNpCiBzl
 gIBggMOjVhEmsLPZGesFG/w7UQBKxt2Oig1Z4Y1CoLeRewnAALpmkXrjRP87TB4iVuMs
 Dl2Nf85U6tykuna+786fJH/W5UQWDm+nU0E0fPI2cdB+tPQDGWgtas4OjQ4TD2/rlReB
 /dRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oK8IxpD416F/uJzoJcvHSMKpr045V3Ro2Zvj4imq4iA=;
 b=RL6bpCwhRxFTBLMYeLecNpv5o0NqqatwlpDp5nJIsYGKjdA1MqVJyhc+C6FNZm7MVW
 XgqgF6P46tOjfq3IiixY7+yQXc61OEZ/DSTB0ypW/DnSCAATrLiriJo1wPT8wz+IHzti
 +cLZMeUfPpQZfvExcFFmORD8L++OeCys8ERRmKq7FLb5jJ4n2cpm7IRySuB8s+61fKpq
 qFN61AXzu3DMlIQboUG7u00PFkuQoV5rrQX6OPOnEJ2Z5dfhkypg90xOqt1B5DcTvhiD
 hkwwN/FDaUL1qk+rs29b5O/3fI8npZal31wg1CJBw/eK/xTuwQkZ3vzPkXChyZfdLyA7
 C1jg==
X-Gm-Message-State: AOAM5335IWIsdYdB0epfKumarbMl6ORKtdKjJbSZqsCK1N9Cj8Yy6TbQ
 4Mc8H1ojAM8u3uJy9pAPwfI5vg==
X-Google-Smtp-Source: ABdhPJxFl2wT/N4GQZwk6w7aHq+9FG2oDcDJP8D1ZKO51Mvv5qaCJLtOodhyUgL3gs1Vwhcs7+wijA==
X-Received: by 2002:a63:33c9:: with SMTP id z192mr4977228pgz.42.1628792948475; 
 Thu, 12 Aug 2021 11:29:08 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id n11sm3527213pjf.17.2021.08.12.11.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 11:29:08 -0700 (PDT)
Subject: Re: [PATCH for-6.1] tcg/i386: Split P_VEXW from P_REXW
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210810232530.1033519-1-richard.henderson@linaro.org>
Message-ID: <255eb0b2-26fb-7172-f603-946297ad6fe7@linaro.org>
Date: Thu, 12 Aug 2021 08:29:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810232530.1033519-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

PIng for review, or this slips to 6.2.

On 8/10/21 1:25 PM, Richard Henderson wrote:
> We need to be able to represent VEX.W on a 32-bit host, where REX.W
> will always be zero.  Fixes the encoding for VPSLLVQ and VPSRLVQ.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/385
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 98d924b91a..997510109d 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -241,8 +241,9 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
>   #define P_EXT		0x100		/* 0x0f opcode prefix */
>   #define P_EXT38         0x200           /* 0x0f 0x38 opcode prefix */
>   #define P_DATA16        0x400           /* 0x66 opcode prefix */
> +#define P_VEXW          0x1000          /* Set VEX.W = 1 */
>   #if TCG_TARGET_REG_BITS == 64
> -# define P_REXW         0x1000          /* Set REX.W = 1 */
> +# define P_REXW         P_VEXW          /* Set REX.W = 1; match VEXW */
>   # define P_REXB_R       0x2000          /* REG field as byte register */
>   # define P_REXB_RM      0x4000          /* R/M field as byte register */
>   # define P_GS           0x8000          /* gs segment override */
> @@ -410,13 +411,13 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
>   #define OPC_VPBROADCASTW (0x79 | P_EXT38 | P_DATA16)
>   #define OPC_VPBROADCASTD (0x58 | P_EXT38 | P_DATA16)
>   #define OPC_VPBROADCASTQ (0x59 | P_EXT38 | P_DATA16)
> -#define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_REXW)
> +#define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_VEXW)
>   #define OPC_VPERM2I128  (0x46 | P_EXT3A | P_DATA16 | P_VEXL)
>   #define OPC_VPSLLVD     (0x47 | P_EXT38 | P_DATA16)
> -#define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_REXW)
> +#define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_VEXW)
>   #define OPC_VPSRAVD     (0x46 | P_EXT38 | P_DATA16)
>   #define OPC_VPSRLVD     (0x45 | P_EXT38 | P_DATA16)
> -#define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_REXW)
> +#define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_VEXW)
>   #define OPC_VZEROUPPER  (0x77 | P_EXT)
>   #define OPC_XCHG_ax_r32	(0x90)
>   
> @@ -576,7 +577,7 @@ static void tcg_out_vex_opc(TCGContext *s, int opc, int r, int v,
>   
>       /* Use the two byte form if possible, which cannot encode
>          VEX.W, VEX.B, VEX.X, or an m-mmmm field other than P_EXT.  */
> -    if ((opc & (P_EXT | P_EXT38 | P_EXT3A | P_REXW)) == P_EXT
> +    if ((opc & (P_EXT | P_EXT38 | P_EXT3A | P_VEXW)) == P_EXT
>           && ((rm | index) & 8) == 0) {
>           /* Two byte VEX prefix.  */
>           tcg_out8(s, 0xc5);
> @@ -601,7 +602,7 @@ static void tcg_out_vex_opc(TCGContext *s, int opc, int r, int v,
>           tmp |= (rm & 8 ? 0 : 0x20);            /* VEX.B */
>           tcg_out8(s, tmp);
>   
> -        tmp = (opc & P_REXW ? 0x80 : 0);       /* VEX.W */
> +        tmp = (opc & P_VEXW ? 0x80 : 0);       /* VEX.W */
>       }
>   
>       tmp |= (opc & P_VEXL ? 0x04 : 0);      /* VEX.L */
> 


