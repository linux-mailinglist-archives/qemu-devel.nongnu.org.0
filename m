Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E422C2F1C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:47:00 +0100 (CET)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khcP5-0004EW-A9
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khcJ6-00086i-9x
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:40:48 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:44263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khcJ4-0005j5-MY
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:40:48 -0500
Received: by mail-pl1-x643.google.com with SMTP id b23so3344608pls.11
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 09:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eGBomOpfAM36iTZTvQFC57etr+r2kWGXjJ+ZtEwahx0=;
 b=OFWlReIJGKNwJHs3i4SvPsAzYVanRNPGgk2kUUBPYegChIof7j9rqEloEHjOineMFO
 +dlEdsqK5X0sJjHU0nRHWlUxAP7fBnRO7qXzc9uKell1JQa8b97MgiZ7cxdBU66brHrE
 JiPpYhbm4F9kNU1Gz9tv5DVWzYEbMSTyN/wK5+h+Yd/qrNj4TePfWWG4rp/x8DGyFK8W
 LMovM1ihpt42NjgWzBdc/O0S7JkvNrdpr5mhB0NO18N0cUppo7b8OJuMIEjLZ/s6Bhxa
 LQu2ev6JDhSusBF6bXiOxDXjrcl/6nrSpruLruAEYF53NLIYH24sWDv6gr4aV4+Eq1bA
 j84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eGBomOpfAM36iTZTvQFC57etr+r2kWGXjJ+ZtEwahx0=;
 b=s57j9XiMm0izwy+xVvOy549BS64by84m7z2S8bblsPxJTSoANQ9+USZjILtpaUChrU
 Mj3CXBurgNLeqUZHLYyco9BfoElErbMdAYGDCUe8DcAkltnuTC2uJxakLUJ9En9JJl2Z
 ISnYdgG5azKzsk9LTriPStMCDjrQWWKifuROfXM/IhgJFVE35RgqB/EYX8JK9b1rTWzH
 B+B11K5HXDV0wPiwDSHh9268q9K0d8JXxKeOR7j1MiufsU4ouZAyCtkCRwhMjdGAG2fX
 BW5POvTcQqqwbOWwVbJO/3bM46RQGh9smoDRW4Z0J3K/eh+NkTS6iC5sjO2/WsdHjgI1
 q5Xw==
X-Gm-Message-State: AOAM530IWm02PRsz4CbRWhh7tqD+LgeiotFAIjutnoDnis1q0s+XPXYF
 c6rcjPE+In4zMT0AcZf3VAxYgA==
X-Google-Smtp-Source: ABdhPJzK3ckxVi2YTJaNKKIfv2GMh80AsXjaofM8Dn5yNWgTzRorwstVSZpuzuQLe63OepR28WswjQ==
X-Received: by 2002:a17:902:b582:b029:d6:6008:264d with SMTP id
 a2-20020a170902b582b02900d66008264dmr4670038pls.80.1606239645437; 
 Tue, 24 Nov 2020 09:40:45 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h18sm10958052pfk.17.2020.11.24.09.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 09:40:44 -0800 (PST)
Subject: Re: [PATCH] target/mips/translate: Simplify PCPYH using
 deposit/extract
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201124103808.499948-1-f4bug@amsat.org>
 <0a1587a0-708b-b537-3065-e9a7a845b326@linaro.org>
Message-ID: <0106c670-e2cd-0bed-f76f-5a5990f410a7@linaro.org>
Date: Tue, 24 Nov 2020 09:40:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0a1587a0-708b-b537-3065-e9a7a845b326@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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
 Mateja Marjanovic <mateja.marjanovic@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/20 9:28 AM, Richard Henderson wrote:
>> +        tcg_gen_extract_i64(t0, cpu_gpr[a->rt], 0, 16);
>> +        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t0, 0, 16);
>> +        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t0, 16, 16);
>> +        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t0, 32, 16);
>> +        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t0, 48, 16);
> 
> Actually, this would be better as
> 
>    tcg_gen_ext16u_i64(t0, cpu_gpr[rt]);
>    tcg_gen_muli_i64(cpu_gpr[a->rd], t0, dup_const(1, MO_16));

Hmm, while that's fine for 64-bit hosts (and ideal for x86_64), it's not ideal
for the 32-bit hosts we have left.

This can also be done with

  // replicate lower 16 bits, garbage in upper 32.
  tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rt],
                      cpu_gpr[a->rt], 16, 48);
  // replicate lower 32 bits
  tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd],
                      cpu_gpr[a->rd], 32, 32);


r~

