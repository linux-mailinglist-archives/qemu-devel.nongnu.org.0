Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47C031C324
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 21:43:13 +0100 (CET)
Received: from localhost ([::1]:52776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBki8-0003dg-PJ
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 15:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkgt-0002rS-IA
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:41:55 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkgs-0005HY-3g
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:41:55 -0500
Received: by mail-pj1-x102d.google.com with SMTP id d2so4577541pjs.4
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8pxh6cRN7e4LhFERQRKGIM5BN4FX1RhF+YoexIiaJHc=;
 b=W1BKvAqA3UPoBFNSouOE9/iZ6dGKCesZbIDv+AxofWcnV0Fs/GO9AqEr2Ig2mjEqPU
 5b+3naIcah7Lx3Jfqoq6w5r5WcI6NckUGMDNsQX20kUPwlKnAtWsRRf06mQ3gdqosDgu
 bn8tUOFRs9caKM6GUf6ooNUwimbpEKAU3MoBZuVsU4sejVHEEKxFv8aAHD2IDvm7fGls
 skm8q45jALzq7KzldH7kbJSuZPO0jWhN0pYBJu/QIB76sRmnd7pZiZN3cIfLfg0TyLOh
 Mfx1ehmxFExw9DSW3NUKBcLlx7sRJfOIVRmVFqZ+tSvkL2hU9rjS3P3/EGemUWDcMjUs
 Y4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8pxh6cRN7e4LhFERQRKGIM5BN4FX1RhF+YoexIiaJHc=;
 b=J9WU74EPCHbs3U/un46r1iUsnWS4tRt11ILKR7iwZj/CDW3W081FZy2RIB0erAfsLX
 rCBYtVjE2ND/3TeT1U+JuVo9d3AQcjscFIAejeoTCg6ctnOevYKDhD6vjxnP6F/DxduM
 UTIF5jOIzzHlKXfWVJp+2RSbYXwHI1QM/b8rimlKjQao4pzB+van+inTLfSGErSuT/SS
 UE5d/xpdJLyQ1pceVYcFjAVbjZ6CnB3UyfU0RO21NArFm0WPiYRC4zhJWX0Ojplri58T
 vgFwBg51J4juDXxkR857q/vQFYyyg8TWr6Xwmc4ULyPtM36p00LFcy+pq4GJHWt08y8Z
 Y5yQ==
X-Gm-Message-State: AOAM530RHSMigxui/QWguN4Plwfui5aZEyJDbPXxlij9kDHZzVG55yAh
 UuO+r+9BcX0gfA/eVOQnxUOdPw==
X-Google-Smtp-Source: ABdhPJxH0d+XnEv926D0L/2j6cW53mDvcLu9pCgL00Hs7apNp5X9mRKKkxzQ+k3HeRf5gG1as1W2JQ==
X-Received: by 2002:a17:90b:4c8c:: with SMTP id
 my12mr594638pjb.35.1613421712702; 
 Mon, 15 Feb 2021 12:41:52 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id v126sm19486846pfv.163.2021.02.15.12.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 12:41:52 -0800 (PST)
Subject: Re: [RFC PATCH 22/42] target/mips/tx79: Introduce PINTEH (Parallel
 Interleave Even Halfword)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e4f520e7-1699-ad4b-c325-b0cd7df12618@linaro.org>
Date: Mon, 15 Feb 2021 12:41:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> +    /* Lower halve */
> +    gen_load_gpr(ax, a->rs);
> +    gen_load_gpr(bx, a->rt);
> +    if (a->rd != a->rt) {
> +        tcg_gen_mov_i64(cpu_gpr[a->rd], bx);
> +    }
> +    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], ax, 16, 16);
> +    tcg_gen_shri_i64(ax, ax, 32);
> +    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], ax, 48, 16);

  mask = tcg_constant_i64(0x0000ffff0000ffffull);
  tcg_gen_shli_i64(x, a, 8);
  tcg_gen_and_i64(x, x, mask);
  tcg_gen_and_i64(y, b, mask);
  tcg_gen_or_i64(d, x, y);

and then you can use trans_parallel_logic.


r~

