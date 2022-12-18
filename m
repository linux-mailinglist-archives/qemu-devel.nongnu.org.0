Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988CA650434
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:33:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xWM-0003G0-1c; Sun, 18 Dec 2022 12:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6xWG-0003Ed-SX
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:32:12 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6xWF-0005cU-6L
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:32:12 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so6879347pjo.3
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5dbOFALbKo0xP4wY8N0UKN7eOPDifuVsu1Y0vfB0LLE=;
 b=ToEJAVEfbl7EF2v7aHAIkcLs94MNFnsXAWy+sEJd3IllPIFhWqCOU2DafYo32vRLir
 cnZMNwf8j7DAwfH3w5LZ7eafXH228OVgYHai3uI/O47pWf7mRIviDX8xhcf8LxQXmu7C
 bO3HG3KKqdf2of/1iMZ8IhVrnfrbK0tMRBwocvHnwW05B5yYUlpxGklreCgTMpMgXEYh
 N35YZJSQ2kErHivX2VmRqwsHpFu7UJ1Hm20bY6gEJNuwWbQj/wxXG5fBzY04Edc63RsM
 11lRrhKtHsZjz3OaA8abZ42kIqGa8aX8QUQmGD0uDDp8GUCmoe6YbK5jteTnVwq3+jhx
 5iMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5dbOFALbKo0xP4wY8N0UKN7eOPDifuVsu1Y0vfB0LLE=;
 b=KZV42hLk0pWCqTLypiO6xPuYOvkgfG9NnJ8RupHlcLp7TwV/5C755CGPN+YhK5vYOc
 YqQXIZ0in/bRwldxT9rtJQVgGbO8B47GGtuglvByCHdWIEDMRPGFAbxIThRz0bcUjio3
 tLGMZgzJbyO7NvEPDaHqh7TjIzz35zyC4j3EJXfH0f5quBixhZkYC9DcktMT0Zd/EXPf
 YppM0jx9iqtaIPZXV7ImmPUC2/KJuEVqiqdQqwHUXByGdVTLNXEHIPD7GfzgPbR5oB6d
 VqlnOcxNBv4z08oR1vHk9rlH1SWmNynwUtAn0Z6vLgyOTax8UfxI93GrySQ2uzdt5UHc
 SQOA==
X-Gm-Message-State: AFqh2kqW1cDBIIbUaSTDaORMf84L4MJyLdZkwVWs6OH4Cwd2XTzRrnYk
 ApGff+rE8NkdrAZWB22egSxM5mreLhOtDGFB
X-Google-Smtp-Source: AMrXdXtkA4sHlEKoOzUdwfIOd0/x6Z+DJxgOIZQJyHTLursatLtoP29cHQFIPwfmX9vOOvd8pVUeGg==
X-Received: by 2002:a17:902:8207:b0:189:e3d0:2682 with SMTP id
 x7-20020a170902820700b00189e3d02682mr6644623pln.30.1671384725710; 
 Sun, 18 Dec 2022 09:32:05 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3808:f064:41b8:eb9e?
 ([2602:47:d48c:8101:3808:f064:41b8:eb9e])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00186bc66d2cbsm5323686plk.73.2022.12.18.09.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 09:32:05 -0800 (PST)
Message-ID: <3c67c601-3a7b-cf4b-0676-a2e13eabe2cb@linaro.org>
Date: Sun, 18 Dec 2022 09:32:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] accel/tcg/plugin: Fix op_rw
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20221121203906.64404-1-richard.henderson@linaro.org>
In-Reply-To: <20221121203906.64404-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Ping.

r~

On 11/21/22 12:39, Richard Henderson wrote:
> The value of op->args[2] is enum qemu_plugin_mem_rw, which
> is already 1-based.  Adding 1 produces incorrect results
> for QEMU_PLUGIN_MEM_W and QEMU_PLUGIN_MEM_RW.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/plugin-gen.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> index c7d6514840..cd9cee1f5d 100644
> --- a/accel/tcg/plugin-gen.c
> +++ b/accel/tcg/plugin-gen.c
> @@ -495,10 +495,7 @@ static bool op_ok(const TCGOp *op, const struct qemu_plugin_dyn_cb *cb)
>   
>   static bool op_rw(const TCGOp *op, const struct qemu_plugin_dyn_cb *cb)
>   {
> -    int w;
> -
> -    w = op->args[2];
> -    return !!(cb->rw & (w + 1));
> +    return cb->rw & op->args[2];
>   }
>   
>   static void inject_cb_type(const GArray *cbs, TCGOp *begin_op,


