Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF4E6EC1B1
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 21:02:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqexF-0000KM-Kb; Sun, 23 Apr 2023 15:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex8-0000DH-56
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:00:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex6-0004IV-L2
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:00:49 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so23527085e9.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 12:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276448; x=1684868448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uPT5IquUj9tb4+7LJOV+d1U0Pln7SxXlXrcpMKrPgHk=;
 b=UVtRUyQevj4Ridz78/lh47/44VmynhJ/hApAUTmtdKarVQ3vih5OcCEg8tmjsDvECz
 zsN0Lk/fwNV3m8mzICWo5GyBOyOLGrneiPUBxwejiM6A3yqw7vV6zordSsrUWFiBhtQ5
 OvA/a6wncQAR6YKCp0ZWZC0U6FMuR8QV//6NBhdaYbG9+vuylxkdi/MajR2phMaVeVtr
 DLzPRTLUnZrvTYCm66joUGr52wmGg4oo425fVS4tmjdMqR01WBMNACxMzSZv/0PWDFh7
 Z37iZqNHMLkx0b/aTF11iS28ATBIsozFxHfyWMbudgPl6lzddk78q4bEUHmSXaDjtKXz
 JZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276448; x=1684868448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uPT5IquUj9tb4+7LJOV+d1U0Pln7SxXlXrcpMKrPgHk=;
 b=E4qXh7h0ptjJKGNaJfesPRQnQAo9Mbs3vrYTvK/WVwneHG+a7tM98nablw/ArYgg+C
 uFj9MJ+oy2XmbJ6MSxjNaTcMSJefbhIhyJPIzWPZrpGj1JwepofjuhZtCMhfyhSvsdpR
 Uw5V37fiHcYCi8h2MVpvRE1ctrx6k4tJycil6Ot2IGDpKmaM9GC4YFA2jpV1MEHIOnUX
 9t9Jb+R/bGGRUgD5MRQVy+4P9K9xESedl96t4kz8y8uwceBlnWxJFIMc/yBLjT0osxRB
 Nfj1GvLfRpExw7tXavjkfWq4SMKBlopAdrPA5Kk8J179DwDiHZEQIKmbgWSGlSQs7a7j
 dKHA==
X-Gm-Message-State: AAQBX9e7PwadkHNFDyoDE5ioB6zI3wGfcdsPOSFpMxEMRYZnvOuw9lbE
 wML5E+ctnP1TpHbrIjdoy9NcVh6X2cDYUXJMGLfm4A==
X-Google-Smtp-Source: AKy350Yeq3c9B2r9pkbZeVMqTz7H4+rISROxT/CGtojf65uqoVqYHqUyvN/uciYGeBdjpsOAIyPy7w==
X-Received: by 2002:a5d:490a:0:b0:2fa:631a:9f23 with SMTP id
 x10-20020a5d490a000000b002fa631a9f23mr8365465wrq.2.1682276447863; 
 Sun, 23 Apr 2023 12:00:47 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 x24-20020a1c7c18000000b003f183127434sm10299253wmc.30.2023.04.23.12.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:47 -0700 (PDT)
Message-ID: <b99df8e5-6b3b-ca74-7733-433cd5643fd4@linaro.org>
Date: Sun, 23 Apr 2023 20:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 34/54] tcg: Widen helper_*_st[bw]_mmu val arguments
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 11/4/23 03:04, Richard Henderson wrote:
> While the old type was correct in the ideal sense,
> some ABIs require the argument to be zero-extended.
> Using uint32_t for all such values is a decent compromise.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-ldst.h | 10 +++++++---
>   accel/tcg/cputlb.c     |  6 +++---
>   2 files changed, 10 insertions(+), 6 deletions(-)


> -void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
> +/*
> + * Value extended to at least uint32_t, so that some abis do not require

s/abis/ABIs/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> + * zero-extension from uint8_t or uint16_t.
> + */

