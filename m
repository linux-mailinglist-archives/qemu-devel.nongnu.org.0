Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B60268E437
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:09:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPX4m-0001FW-Ba; Tue, 07 Feb 2023 18:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX4k-0001F3-5g
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:08:34 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPX4i-00065X-LM
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:08:33 -0500
Received: by mail-pf1-x431.google.com with SMTP id a5so8872045pfv.10
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nLEpLqel/bBFb+HqvXMBbFuJmLx9WrFm3ERqBeCNM8U=;
 b=z8hKYz0W9KD03MvJ0RHddJvzOkzAA284y34/uop1vf5zBnzMpuQhC++rDNv1kXm3N1
 tPRIOTr87UW9tgmufJD1Bmo+0VI2uzg3PK60CtnmJ1FUd3gAgyvTVVEm/53MFmDQ7DES
 voRmtn6g+ZkRFb7Oe2FWnSeRmTD6Lpq2+qN/qod+ko3emo12dpL61iPszbwOun7MepmX
 gkTiJuS6eDZry3XFLBJ1SaTfdyOgkuOrOXWQmZJsAzuJZnwYDmCfD5+CzqASSd2QE/z/
 01cnjRE52Hbr3aYAl72B2juyZpiKZPs/N6+MI1jtgx7HDBteP7bqzTkOl2rRXB+wJVys
 yrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nLEpLqel/bBFb+HqvXMBbFuJmLx9WrFm3ERqBeCNM8U=;
 b=YotEj5J/0gzXPeIHNLfrn4C0Yzrc3QpBTuU+aZ+sjhusOhwQ6IU84WMXWjxuTNu3Ai
 F6lmRzOlr2ctsoqwFncjZ8dE8sOc+qdBfKFuLx8M+dXCUDBONQkdFtV1uLR3iPoEIRyK
 V9cviKJPCbNhQZsfFD8sW7KBxwFp6csvk7Ub4/HIreU0jGcQD8WlqUwjDa38IrCNGZkW
 zw2FBQnxbu+WRvUpMJKL46pwJdW/Q4KMZO9gV0p/lGqylz2k7KgT0Wr7u0MoR/fqW+Xx
 9xIgRfagLN/uf5Jr4v13vEnC2lySglDCAJrewI5dZVVopfRyyxZbcjAVnRbv+jEPzWve
 y4SQ==
X-Gm-Message-State: AO0yUKUVhLS0TpY9wMFE7cJRLd04SnwWlcJEPALpqeRe7H/bH/Q3F7nd
 Hg/OHov0/vNL5D94Zxc0UJpudw==
X-Google-Smtp-Source: AK7set/al1y2EKQt60VFBjXTJZ4CGJGY1wv4DGWGdwNJ3yzoHzWoKmEmXVYCL2P7Lrp9zGQ2S/4VYg==
X-Received: by 2002:a62:79c4:0:b0:593:c648:f836 with SMTP id
 u187-20020a6279c4000000b00593c648f836mr4838231pfc.3.1675811311210; 
 Tue, 07 Feb 2023 15:08:31 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 v9-20020aa799c9000000b005828071bf7asm9787189pfi.22.2023.02.07.15.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 15:08:30 -0800 (PST)
Message-ID: <bd728ee1-9649-cbd3-2163-d39292ebb564@linaro.org>
Date: Tue, 7 Feb 2023 13:08:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 03/11] target/arm: Reduce
 arm_v7m_mmu_idx_[all/for_secstate_and_priv]() scope
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
 <20230206223502.25122-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206223502.25122-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/6/23 12:34, Philippe Mathieu-Daudé wrote:
> arm_v7m_mmu_idx_all() and arm_v7m_mmu_idx_for_secstate_and_priv()
> are only used for system emulation in m_helper.c.
> Move the definitions to avoid prototype forward declarations.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/internals.h | 14 --------
>   target/arm/m_helper.c  | 74 +++++++++++++++++++++---------------------
>   2 files changed, 37 insertions(+), 51 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

