Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB62D3788
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 01:23:48 +0100 (CET)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmnGl-0002Yf-M5
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 19:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmnFc-00027p-Oc
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:22:36 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:44390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmnFa-0008KB-Qj
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:22:36 -0500
Received: by mail-ot1-x331.google.com with SMTP id f16so525162otl.11
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 16:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GZstnicpGk6mhuIr/7+xsLD+2neRhK0vBMqBShRjbt0=;
 b=fw0puWst5SKqLr0nyfeuI4pyjsdVnSCEFGekPSVVcxeHCtrF8ChccUptd4YjTP3Nwy
 vi9ExPbtIfMe6TLB2aPC0mtw2dd0Mfr9oleQaRg8yB0LXY19oUYEkO5/yek4aYUxh7Ey
 f9HyoUwkA28zTnTI15t0+bTRZ5t5ecq3HRqH1iRB9aU+O4ZZadJtLzphyqzhvDJEqi3O
 g1fJTdl0JncvfaD4unf6hFOHmax190MHVb9AH7zSvTtxslBfO0SZ7o++CRRtI2ZHJJVn
 5JZS6c1BsXFes5JG2Qwwf/OxIdPXmDWGQ7UrlLNAX/YT8N40v3ykFmgDFUzaizpz6Gwj
 npvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GZstnicpGk6mhuIr/7+xsLD+2neRhK0vBMqBShRjbt0=;
 b=l0xDS254DB4iLHAIpYBE3E2x8qd68qjgDXcMSjQmcYcd6f0K6cZhC5gqAbqVoILXo3
 SQ39DM3TpmNVyqb4qsfESeTg7zxUFv/pdO4AsVDTas0WUnaXghFfLXOwLTPAHjNQvWEa
 W8zHjhNavnmEi0YtwC1WcHjCNTG1OKWR5rEDk/3v7F71NSV0NRdD6Js2QaKF6iyGMGYG
 B6mLASwu8CTFkbibfAXGUjhpVs4qzerG0B1ChRaVzMMS4ZKWpYd9c4N0M+gUrNXsTAC6
 +TnRaHb3tWZqEXQZjkhfLFefRPEwhdC1j4VhyS6N4Iwep+JoJkTNpbarnGuo1K0wpUwJ
 BPeQ==
X-Gm-Message-State: AOAM5308VKsyTkXizwuB1bXMy/Cxj8kDDXWuL29KYERfThPl2PI/TFRz
 CfR5tEoU50EX4kBHe0h8zz3hCg==
X-Google-Smtp-Source: ABdhPJwi+vOUh6jRcVGZnVvaUJe5K87qXWlNL2xnps57u4zch3WL0AwbNCtCHi0nUYEfqV6Lp5ZxHg==
X-Received: by 2002:a05:6830:10d2:: with SMTP id
 z18mr413640oto.90.1607473353513; 
 Tue, 08 Dec 2020 16:22:33 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j9sm98352oij.44.2020.12.08.16.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 16:22:32 -0800 (PST)
Subject: Re: [PATCH 03/13] target/mips: Introduce decodetree helpers for MSA
 LSA/DLSA opcodes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <648e220b-fe9a-3b6e-65fa-ce1ea150170e@linaro.org>
Date: Tue, 8 Dec 2020 18:22:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 2:36 PM, Philippe Mathieu-Daudé wrote:
>      /* ISA Extensions */
> +#if defined(TARGET_MIPS64)
> +    if (ase_msa_available(env) && decode_msa64(ctx, ctx->opcode)) {
> +        return;
> +    }
> +#endif /* TARGET_MIPS64 */
>      if (ase_msa_available(env) && decode_msa32(ctx, ctx->opcode)) {
>          return;
>      }

Can we reduce the number of ifdefs involved?  Perhaps to zero?

    if (ase_msa) {
       if (TARGET_LONG_BITS == 64 && decode_msa64()) {
           return;
       }
       if (decode_msa32()) {
           return;
       }
    }

I realize this means extra decodetree invocations for mips32, but... does that
really matter?

I suppose some of the tcg expansions could not work for TCGv = TCGv_i32, which
wouldn't help the cause...


r~

