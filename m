Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D3438C05
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 23:12:06 +0200 (CEST)
Received: from localhost ([::1]:56060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mekmi-0008FZ-Cx
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 17:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekkS-0006ew-Lr
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:09:44 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekkP-000636-U0
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:09:44 -0400
Received: by mail-pg1-x536.google.com with SMTP id f5so8898942pgc.12
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 14:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xjHMVci3HnlF+tEaG/JyZDZ/29aTZ1eFnP7retehAa8=;
 b=oZGRpTInlJswT7chWdz3YbBBTwkEH8/ZBnF4bq+KYMTADTNGhZfF6TaEwtnK5vx3KD
 kqbodP7J3J0IogQv7tnSrasFIr7g/46oJWLzIGzqq1w1st3xz2P6Hoy0/+iijdT8M8vm
 Ozyf5QaHNUC5bSoSJ3eNyf/PukBbKeSpsc+8bI7pXudMPKB9bjRIyIoEVfS+8f/laXnj
 WGTLddKoDt9qqT/2CUV5TZcyIAZXBZWdDOGqzek7s7NIPVSFoas3JVGSTb2bkoifbq9/
 1p6esv7KT8TWXBT9/1laxGzbehEqXq34jPUZwBzZ+1OvKqOCR+qZe7tLiusdAuKAsTQK
 RLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xjHMVci3HnlF+tEaG/JyZDZ/29aTZ1eFnP7retehAa8=;
 b=ZWsReYtaBJwpxm8evmiJmB7mbx4Sb0Nw/VN4PnWeM1XN24El9vRawz78MkwUQ5UZBl
 VDp/j1jQX3uJAtxExaL3q4kCzS04CsJ1Wd67Bwf/iLk/TnQ71ZpUsWeFv3yhGVJCDrhQ
 4IxXDSyR5yGdAJRsJj4mbD0LDYy4WA3ilEbISy1TQZcpXG8DQkBkX095VMitU3EbBBnm
 J2K2Axpr46E9L6RhZtzfJrOOuSV7gI/Q7u1lE2EpopGGb90GnuR7EUgBUqAm7dpWcKuu
 I2lmAH1FGOMKUTCT0o2e+DOI/Jua2DEwyAGvymf3FMdMkU22aajjqwV0NJ0VwCRz6RTU
 nsvA==
X-Gm-Message-State: AOAM533AMuVtQSycYKWjclAV2Xe3g33p70m4GDovl/RpxSJ1um4aVNAd
 RXKzMoXWaqc5SIjys6ezOJonkw==
X-Google-Smtp-Source: ABdhPJxqRAoSl4Dkg8kNMp5sjjThMHJGHtjp4Z4ulfE07sOrXWnX+WwKgcpchMeklRWLkkJy+XfViQ==
X-Received: by 2002:aa7:8b56:0:b0:44b:e510:a208 with SMTP id
 i22-20020aa78b56000000b0044be510a208mr14332066pfd.56.1635109780007; 
 Sun, 24 Oct 2021 14:09:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id pj12sm15680387pjb.19.2021.10.24.14.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:09:39 -0700 (PDT)
Subject: Re: [PATCH 29/33] target/mips: Convert MSA MOVE.V opcode to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-30-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f6ebb61f-b52c-2207-bbdd-f522d904dc32@linaro.org>
Date: Sun, 24 Oct 2021 14:09:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-30-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> +    tsr = tcg_const_i32(a->ws);
> +    tdt = tcg_const_i32(a->wd);

tcg_constant_i32.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

