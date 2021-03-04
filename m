Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F315432D850
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 18:07:49 +0100 (CET)
Received: from localhost ([::1]:47594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHrS0-00078p-BG
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 12:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHrLd-0001rl-Se
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:01:15 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHrLX-00023M-By
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:01:12 -0500
Received: by mail-wr1-x432.google.com with SMTP id 7so28460959wrz.0
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 09:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=46vFnNEmoQxxqBauf+HLqDKGuDc36w/TWHahB8aR7Z0=;
 b=jTUqQVcH7cKZwEeZIkd4QqEoCEhYY6Cu89V1nq861ZHzo48Cs8swECgYytNUBJRiHB
 05sMMhHbX6w4dO6KwZVVnAamFgLo87wDpLVScQh6BaM+ZxoAMMwmVDisKVUTtoYYGcBq
 sDnHoAZmH/+5UDa616LxzNt1Ozsbq8218dGYjic3o0y0UeqEQiA1niLYT/atBQtBP+uB
 s+6wyhEcjqIngo9/auIXZqyMUliAwPweuJMSqKTR1arnJGbECsMVWmNxCmdn8+tNDQu6
 MWbnTy4nbYhc4YGn5dWCIU+cSlkJbk/SiRC7xfOHjbyP96rUrJIDxKpUO9U5Hc6QanKM
 8/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=46vFnNEmoQxxqBauf+HLqDKGuDc36w/TWHahB8aR7Z0=;
 b=ccLtDp7ROM++mclchBCG/cIKFUh9K6DRmm8STla97a35CW4ywk3tOUCDHd9zwE1gi1
 srfXfe+ff8706F8wD17NgXlT+oq0cprDx0pjgwKP/2X9ms0qvrz5uKkjT4+9FjoCXAKi
 OvNjtP70jzBUcnoeob5gMiwpuSL0W/6z85HSSSLiDG8TwaouCi/RRiANmRkuk6dbCALF
 b5pVXiEFnwxaiEvVDOADXY53cMnFmXfQeyxa4+LaU9jvxIo6aBdBgtkpwZGfdjNixBpy
 Hu5DgBGlAEpd5y+fwY5LdPwFI1iJvsGPSgXMxb5t2t482Ns2oeZQkAGbUu1fNcI3Z1NC
 jXCg==
X-Gm-Message-State: AOAM533tq2J94EEMs/57QVCSSNHuHH50Fx5Ly16vL6rumXKQuB14qzsb
 JtDEQ4OF8SROlUB00xyS+7U=
X-Google-Smtp-Source: ABdhPJwr39Jgt0+n9fs4bzWOafwrssmS0Vxr/I6qvefS1STZyblOnMX8quFiGTlmwOgEq0WmR3UlFA==
X-Received: by 2002:adf:f841:: with SMTP id d1mr5051462wrq.36.1614877259864;
 Thu, 04 Mar 2021 09:00:59 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r7sm37710408wre.25.2021.03.04.09.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:00:58 -0800 (PST)
Subject: Re: [PATCH] Hexagon (target/hexagon) Fix shift amount check in
 fASHIFTL/fLSHIFTR
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1614876995-30187-1-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8fdcb5db-7762-67bc-6c9b-fd206c31a04f@amsat.org>
Date: Thu, 4 Mar 2021 18:00:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1614876995-30187-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, peter.maydell@linaro.org, richard.henderson@linaro.org,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Taylor,

On 3/4/21 5:56 PM, Taylor Simpson wrote:
> Address Coverity warnings
> 

We usually include here the Coverity IDs, eventually the
warning reported, and refer to the culprit commit. See
for example commit 2132cfe52bd. This is also documented
at the end of this paragraph:

https://wiki.qemu.org/Contribute/SubmitAPatch#Write_a_meaningful_commit_message

So here:
Fixes: a646e99cb90 ("Hexagon (target/hexagon) macros")

> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/macros.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
> index 78c4efb..cfcb817 100644
> --- a/target/hexagon/macros.h
> +++ b/target/hexagon/macros.h
> @@ -459,7 +459,7 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
>                     : (fCAST##REGSTYPE##s(SRC) >> (SHAMT)))
>  #define fASHIFTR(SRC, SHAMT, REGSTYPE) (fCAST##REGSTYPE##s(SRC) >> (SHAMT))
>  #define fLSHIFTR(SRC, SHAMT, REGSTYPE) \
> -    (((SHAMT) >= 64) ? 0 : (fCAST##REGSTYPE##u(SRC) >> (SHAMT)))
> +    (((SHAMT) >= (sizeof(SRC) * 8)) ? 0 : (fCAST##REGSTYPE##u(SRC) >> (SHAMT)))
>  #define fROTL(SRC, SHAMT, REGSTYPE) \
>      (((SHAMT) == 0) ? (SRC) : ((fCAST##REGSTYPE##u(SRC) << (SHAMT)) | \
>                                ((fCAST##REGSTYPE##u(SRC) >> \
> @@ -469,7 +469,7 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
>                                ((fCAST##REGSTYPE##u(SRC) << \
>                                   ((sizeof(SRC) * 8) - (SHAMT))))))
>  #define fASHIFTL(SRC, SHAMT, REGSTYPE) \
> -    (((SHAMT) >= 64) ? 0 : (fCAST##REGSTYPE##s(SRC) << (SHAMT)))
> +    (((SHAMT) >= (sizeof(SRC) * 8)) ? 0 : (fCAST##REGSTYPE##s(SRC) << (SHAMT)))
>  
>  #ifdef QEMU_GENERATE
>  #define fLOAD(NUM, SIZE, SIGN, EA, DST) MEM_LOAD##SIZE##SIGN(DST, EA)
> 


