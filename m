Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F0F655B38
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 22:16:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9BsC-0001ex-3Y; Sat, 24 Dec 2022 16:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9BsA-0001eT-5K
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 16:16:02 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9Bs7-0005nL-UW
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 16:16:01 -0500
Received: by mail-pl1-x62c.google.com with SMTP id n4so7871892plp.1
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 13:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pN5MTVhblXwgVwrqqGfvD5+gKB5CkMeJWRamc+DQC4w=;
 b=rmSM4t1nuyB9LSNOYnlih8fQpIjVg9r9F4tyn+YJW0lIaNWEYq58WWqxGuqHXchB0D
 FQGjbyTFdREsFPZAc4EtE7IYbXSLtYZK8tMOuOCEEzN04Bje6pzFHjR+4Z7XMZS1GTeY
 heF5auJmM/bdybWuV2NtqAcMUHvbOGXY6ou7BsEQsCu5Wr1Lk4Ieedo+SB4IZpb4OPgB
 mCVZPM/W7qTAbFwJJYLOu9lQdPRuGZbTtZjXlvWLxOxku+1YD+UD/aSRglhAgA1wx0VP
 dFllRJTm8MayQmHwlsNSqnYyDZ/f950RW+6YWD6i5lcZve0cJfPdHAuSz0KsbCJIsD2x
 m4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pN5MTVhblXwgVwrqqGfvD5+gKB5CkMeJWRamc+DQC4w=;
 b=tAVEEbZ5yWZtdwU3fnnceexOodHVs4It5QdZjYkAT4yupm7frpQzAVtWPta/g5VDiH
 j6Ap8RUwFeml6ewtr62hDRqmysIKcNvUMG8ZT0CVu+qGqwg0IFRtUCYcHWQHy2N1vf/O
 iMuGkThIbTZc5C+bZ3fgGJnkDFVGGbYikOREUvZdQ2pDlwMCazJy/bgpExWzy05pqbQ6
 bTWqtNW12QaJXPgQXYUv+OxIuKntZuNmtvtwnj0AvsWbOvQVKol+B8pzlrkpG4kf0LJe
 SvVww3C7QsSYyMp/Eabs53/XojTy+bLgiEf5gu9ScTcybXAA1vYqnZCwixgbVp9N4PXZ
 k4yQ==
X-Gm-Message-State: AFqh2kq2qfB+3J8Bvy8AkimnitSOZasmM9fhwqqbj9oot5n18LGyiDnz
 aW9EG+lnKSH+Iz0nPTSoI3Lhjuhe2JBh9yBD
X-Google-Smtp-Source: AMrXdXt72gdZqItGNuFWT1A9albs5/AJ1+ebTPJygfp0oVPSj/6ZtiyQK6j2FaEwYVgsjGG6CBiy8Q==
X-Received: by 2002:a05:6a21:3d0d:b0:b2:6191:fdef with SMTP id
 bi13-20020a056a213d0d00b000b26191fdefmr19173461pzc.43.1671916558440; 
 Sat, 24 Dec 2022 13:15:58 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a170902710300b00186b758c9fasm4508287pll.33.2022.12.24.13.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 13:15:57 -0800 (PST)
Message-ID: <be5461ab-384b-586a-0b7c-7ace812ecae3@linaro.org>
Date: Sat, 24 Dec 2022 13:15:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 42/43] target/loongarch: Implement vld vst
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-43-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-43-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/24/22 00:16, Song Gao wrote:
> This patch includes:
> - VLD[X], VST[X];
> - VLDREPL.{B/H/W/D};
> - VSTELM.{B/H/W/D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  34 +++
>   target/loongarch/helper.h                   |  12 +
>   target/loongarch/insn_trans/trans_lsx.c.inc |  75 ++++++
>   target/loongarch/insns.decode               |  36 +++
>   target/loongarch/lsx_helper.c               | 266 ++++++++++++++++++++
>   target/loongarch/translate.c                |  10 +
>   6 files changed, 433 insertions(+)

This whole thing will be much simplified with TCGv_i128 load/store.
That patch set is still in flight, but should land soon...


r~

