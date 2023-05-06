Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E6D6F8FB3
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:12:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvC4S-0006HN-JS; Sat, 06 May 2023 03:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvC4Q-0006FA-9U
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:11:06 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvC4O-0002Ne-K6
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:11:06 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f315735514so119775675e9.1
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357063; x=1685949063;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dA4kQEjVxebBCK1LLt65cgJVj+53wSQUWTuWva6Esu4=;
 b=o2G/jyCETl3At9HGrOX1o0UIbooSpGSKyYi7r9OeKdBlstXdF27jb9gcn9weYAW/fW
 Js69cWTpv+Jg/rt4jINr8L7WGnGN81b4TgbC3d5krz2Uv4qAlToVS0WMxlAL2i0IVavi
 72gRoCNPGCTmuhwC9obZ01I4pFn3ZF+r4/gzzhOyUCQ+zs12a0s1ICGEtltiy/2riVjZ
 f91Z6DSS7d34BMwKCqRy3oGg/6pX5kc3Hm/Q/83dgMzfZADQowRDFRnXA0tVUTu42sF9
 V9wrqd9auEGHiB3hl6WanklAFALnuEb51wKcsYMdqPlrF6pdbDXJLdQq2xl2ipJIZqku
 w8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357063; x=1685949063;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dA4kQEjVxebBCK1LLt65cgJVj+53wSQUWTuWva6Esu4=;
 b=QPUlSiBLHJbc8PMLVxOCZKzQQFsopPHB1y5fK8hBAIZhbuZS9gzux4rH7zBHAl0m6Y
 H6yPaEe5rSbYQxNTqWl4cmIDqjXwSe+1Iace94sTY5r7Ep/LQJBraNaRBw2YCN4lBLSZ
 RN8xgWvMS8Hrz5740d8J6het5Bc1QDdNaDH7+i/fgYP1taMUox8/Gi9DWfv0AIkg2Zw8
 t6VswxHj2lOIbyHyLLc3d3gk1AqvXJzKus8BJ1feTjJPkYBRAvgaNNvGPY4n6iErOwfC
 1PJwTEIHI9QSXVicP3Bj1YnZT0CUKFLndwMsI2PMC1VHBR/iZUXRXLoCJg+7tkz9drHb
 2K7w==
X-Gm-Message-State: AC+VfDwaAqwpOGdk0wThStgKLv3/9ekXMP0VyP1OappiqTNd+IRk7SmV
 OIKeT+0KCwPA3gvF+ta6MivgKT0Qx1HyZ/+yOL4PIg==
X-Google-Smtp-Source: ACHHUZ4QXWYilAlbGaL1fvRlJQ8/HmgXjtnCvrqZd9Rb7gLS0lPpAIemsUJc+0Wvf0xa7R7eeA1yWQ==
X-Received: by 2002:adf:f785:0:b0:2f2:79aa:c8b9 with SMTP id
 q5-20020adff785000000b002f279aac8b9mr2582642wrp.35.1683357063271; 
 Sat, 06 May 2023 00:11:03 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a5d4206000000b0030630de6fbdsm4440181wrq.13.2023.05.06.00.11.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 May 2023 00:11:02 -0700 (PDT)
Message-ID: <9a8ab6f1-f5aa-4511-84b5-ad95ae0a4835@linaro.org>
Date: Sat, 6 May 2023 08:11:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/42] tcg patch queue
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20230505212447.374546-1-richard.henderson@linaro.org>
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/5/23 22:24, Richard Henderson wrote:
> The following changes since commit a9fe9e191b4305b88c356a1ed9ac3baf89eb18aa:
> 
>    Merge tag 'pull-riscv-to-apply-20230505-1' ofhttps://github.com/alistair23/qemu  into staging (2023-05-05 09:25:13 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git  tags/pull-tcg-20230505
> 
> for you to fetch changes up to 35a0bd63b458f30389b6bc6b7471c1665fe7b9d8:
> 
>    tcg: Widen helper_*_st[bw]_mmu val arguments (2023-05-05 17:21:03 +0100)
> 
> ----------------------------------------------------------------
> softfloat: Fix the incorrect computation in float32_exp2
> tcg: Remove compatability helpers for qemu ld/st
> target/alpha: Remove TARGET_ALIGNED_ONLY
> target/hppa: Remove TARGET_ALIGNED_ONLY
> target/sparc: Remove TARGET_ALIGNED_ONLY
> tcg: Cleanups preparing to unify calls to qemu_ld/st helpers

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


