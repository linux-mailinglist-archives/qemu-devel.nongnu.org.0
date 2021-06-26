Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E513B4DCF
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 11:32:30 +0200 (CEST)
Received: from localhost ([::1]:41348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx4ft-0007pt-BP
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 05:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lx4eK-0006h9-M3
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 05:30:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lx4eJ-0003x0-1I
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 05:30:52 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso9972080wmh.4
 for <qemu-devel@nongnu.org>; Sat, 26 Jun 2021 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T17dXDR38Sf81IJ3AujRjg5n6wwF1jKKFp9ZvhYcNKU=;
 b=ahmdWvU98WtnGsNMRrioPchs4/jUL3OYF19PEooaaSAHPa9FQgx2SLtmTOGJ3Iqz0U
 O4F+ZWhKrcBItknB6qMyur37CyaooYhBDY3llsrFFfsOjOUGPOnwjM40eL770VIKUREY
 ZUuxnlXMv2VVti8VeDVTSE6ZuPUo8YmNhjslJZul5K5V6Skv4vCW9veqWa8l+ua06ZbE
 B6bhSpRNN5zyce9lY/OQtxE+Hi3QBoND3+M58gEphzxPP9M91leYGQBF441dju2A/Qmj
 qUVvZamtWs+pHexHzvE31upepnX8Z9p9T6+tMrPabHmS8OGvCHuIkBi7yNi+lQMa7tMq
 OO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T17dXDR38Sf81IJ3AujRjg5n6wwF1jKKFp9ZvhYcNKU=;
 b=pRn71i4+JWbvSOMS5y9aqXJWPtbrWM2cgFZBQ9cPA9RMJEotB7WeW8Q4mmjbGFBFGz
 iqSYqHwYyy0u8FDBUuWKH/oTxwmkC0X46Rz4gwlKy9w0XbBnwOfdt8Te/QWXmu/OETXg
 2YXsW8AdbNEyM01Ek8CsKNBzIEnUAjH13q3XU5Tk+jPJVkCtR5G/0hqSINXALX40BPtC
 uh9t3mvHDgOF1vv2Wm4ULd6GGZU8vpbOxWWOpOuwO2kJfX4iIUWOVI2/rWeWdN+Now7n
 VGS3WqvPvoR+ctoSz7TIMQy980/GEjB830jqboFUMMfj5ZFNeCFFjUDx0UW8Ozsav4OT
 ozjQ==
X-Gm-Message-State: AOAM532JdNoxqkmYKeh/qdY0A/3UJaAaNVG9VKcHxAHX2Z4ztwLdp3Ei
 s/2fclrQJkRgvUk5VO0CB5/YfxxlQp+skg==
X-Google-Smtp-Source: ABdhPJz90FbrjJWBSPpYjL+Yew0R0GW0tvwImBXxC4q6J1LLNeBnCRxeO7Ov39Y1g7BMT+pJPYG2Aw==
X-Received: by 2002:a05:600c:4f56:: with SMTP id
 m22mr7614284wmq.16.1624699849152; 
 Sat, 26 Jun 2021 02:30:49 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n7sm12978667wmq.37.2021.06.26.02.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 02:30:48 -0700 (PDT)
Subject: Re: [PATCH v3 14/29] tcg/mips: Support bswap flags in tcg_out_bswap16
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
 <20210626063631.2411938-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <34eca24b-ff0b-4457-0697-27e51ae56e72@amsat.org>
Date: Sat, 26 Jun 2021 11:30:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626063631.2411938-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 6/26/21 8:36 AM, Richard Henderson wrote:
> Merge tcg_out_bswap16 and tcg_out_bswap16s.  Use the flags
> in the internal uses for loads and stores.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target.c.inc | 63 +++++++++++++++++++--------------------
>  1 file changed, 30 insertions(+), 33 deletions(-)

> -static inline void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg)
> +static void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
>  {
> +    /* ret and arg can't be register tmp0 */
> +    tcg_debug_assert(ret != TCG_TMP0);
> +    tcg_debug_assert(arg != TCG_TMP0);
> +
> +    /* With arg = abcd: */
>      if (use_mips32r2_instructions) {
> -        tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);
> -    } else {
> -        /* ret and arg can't be register at */
> -        if (ret == TCG_TMP0 || arg == TCG_TMP0) {
> -            tcg_abort();
> +        tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);                 /* badc */
> +        if (flags & TCG_BSWAP_OS) {
> +            tcg_out_opc_reg(s, OPC_SEH, ret, 0, ret);              /* ssdc */
> +        } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
> +            tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xffff);        /* 00dc */
>          }
> -
> -        tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);
> -        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 8);
> -        tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xff00);
> -        tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0);
> +        return;
>      }
> -}
>  
> -static inline void tcg_out_bswap16s(TCGContext *s, TCGReg ret, TCGReg arg)
> -{
> -    if (use_mips32r2_instructions) {
> -        tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);
> -        tcg_out_opc_reg(s, OPC_SEH, ret, 0, ret);
> +    tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);                  /* 0abc */
> +    if (!(flags & TCG_BSWAP_IZ)) {
> +        tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP0, TCG_TMP0, 0x00ff);  /* 000c */
> +    }
> +    if (flags & TCG_BSWAP_OS) {
> +        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 24);                  /* d000 */
> +        tcg_out_opc_sa(s, OPC_SRA, ret, ret, 16);                  /* ssd0 */
>      } else {
> -        /* ret and arg can't be register at */
> -        if (ret == TCG_TMP0 || arg == TCG_TMP0) {
> -            tcg_abort();
> +        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 8);                   /* bcd0 */
> +        if (flags & TCG_BSWAP_OZ) {
> +            tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xff00);        /* 00d0 */
>          }
> -
> -        tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);
> -        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 24);
> -        tcg_out_opc_sa(s, OPC_SRA, ret, ret, 16);
> -        tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0);
>      }
> +    tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0);                /* ssdc */
>  }

Thanks for adding the comments!

