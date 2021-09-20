Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368D741191D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:12:49 +0200 (CEST)
Received: from localhost ([::1]:58784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSLuR-0003XE-QK
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSLsg-0002l2-Gm
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:10:58 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSLsc-0002ZJ-AL
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:10:57 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 il14-20020a17090b164e00b0019c7a7c362dso247132pjb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LJMSdOgALX6O+WD6Lsbbv7MdH27HRgsIXQmivs5izfU=;
 b=UY+H+welFWPloY3rUQDSpECZmBg03QBMSpMvU25h/ue656yyoSVW1I77ZmA7jL/N7+
 boUx5JmwczVZrVUOZuVvhHC9Giiqz6oQ5gi4o+2bgsKBVoBE43ErW8Ij2PSnrWa9XvJq
 O19xvReMpcIJTnLPly4Sg/U9qjW74G1X+HRsvl1ofk6h4yHO94oePKuM5m3vXmHa2U7L
 +B1EeXO9zvpxgU2tLzc7/Qc59E1JCGpmsepMQ3j7lvVrdkpk5YyAeF5mZzEQicbfBS54
 1SXu8R5DivA3PvIvrAUdokTBsmxt1WGLUB/olbqGLDYYwPLwOLNQXwTskGCA23MR9c/T
 DBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LJMSdOgALX6O+WD6Lsbbv7MdH27HRgsIXQmivs5izfU=;
 b=3trU9/OPHWtfARBmCA8U+DcYM7EkwjgcwWd1Tupu5d4miPzv+UD7Vx2AWE2VsK9lhv
 VzSX7shvBG9LqryQ27wXEFlAuMHKdoX0KEY1BN/V1CYR7N+HykSds1V3jujT9mwiAtCT
 1AR6pdU0VLqZsy19nt4PvN6Xk49Jh37mEAtb+BpcRXskj/LzOTmo2sHW2DOUeKKIdLax
 D86cQNl9lefsRtjtRiTlfeQmaEbHhliZUJ56Yng2hvoe02yNwyOOcya4qkL+dos20j9c
 GqqyIKFa5glotGOnR58obXFZbDqjHdTfa+TxdG9UW+LmnDHdyDCp6wFIXCFQwrCi1SNv
 kQjw==
X-Gm-Message-State: AOAM5333LzvhNnWSP4E40Nu7Kx7IrHp+DGrK9glUWgt/HJPlLoJq7tTn
 xFmjIEBDh3Nvkq0jxEtdd+Mfklsx9FrquA==
X-Google-Smtp-Source: ABdhPJxsypIDGwrEeQwmBVmjdJmePXyg0ObZfZuye2ZGOwhmzqd93folrMgXRItZ5ELql5kfCTkgMg==
X-Received: by 2002:a17:90b:3904:: with SMTP id
 ob4mr27314562pjb.148.1632154251354; 
 Mon, 20 Sep 2021 09:10:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 126sm17542415pgi.86.2021.09.20.09.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 09:10:50 -0700 (PDT)
Subject: Re: [PATCH 15/30] tcg/loongarch: Implement clz/ctz ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-16-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <82af9bf5-d809-9201-d142-c94688137239@linaro.org>
Date: Mon, 20 Sep 2021 09:10:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-16-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> +static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
> +                           TCGReg a0, TCGReg a1, TCGReg a2)
> +{
> +    /* all clz/ctz insns belong to DJ-format */
> +    tcg_out32(s, encode_dj_insn(opc, TCG_REG_TMP0, a1));
> +    /* a0 = a1 ? REG_TMP0 : a2 */
> +    tcg_out_opc_maskeqz(s, TCG_REG_TMP0, TCG_REG_TMP0, a1);
> +    tcg_out_opc_masknez(s, a0, a2, a1);
> +    tcg_out_opc_or(s, a0, TCG_REG_TMP0, a0);
> +}

 From Song Gao's translation, I believe that ctz(0) == 32 or 64, depending on the 
operation width.  This is in fact the most common result, so it's worth specializing.  See 
tcg/i386/tcg-target.c.inc, tcg_out_clz, have_lzcnt.

But what's here looks ok.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

