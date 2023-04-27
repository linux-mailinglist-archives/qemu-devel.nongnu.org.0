Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA30E6F049D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:58:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przJO-0000Ch-PI; Thu, 27 Apr 2023 06:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przJN-0000CL-3t
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:57:17 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przJL-0005Du-Gy
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:57:16 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94eee951c70so1350288566b.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 03:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682593034; x=1685185034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fGv0RTNCqcNWdVfVWQB7sa+GsDbo0aFCl5Bxnhbpozc=;
 b=lt4n5gtPHs1xd3NLGXP5VkgES9ntg+xSw48INcf00AzhNauYiM+f0R5cyU5qHzQcRx
 vcRhqYntRVb05Y7QLEBa73vPUbu5SuI1+l3I1b0OigyvzkHcIHxl6kqWk2jO18alfS6o
 iar45w2lXa3lPhnqeXQTf73+1LDIQYZS308srCEWVKXgcZ1isuxqHYUJnr8Jg76qlw9b
 RWFtMcqzQyuLPiYHTEs77lmjbiI4L7eM3juDenp8IsyFbD8KBFybYYLC7BMVR/+QjkoK
 GZSsG4cJbSbQ6buRQ7rL744fSMC7rmKD9e6XEzU7S7rmZyqmzqkika9wqPifT5IQHWao
 E+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682593034; x=1685185034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fGv0RTNCqcNWdVfVWQB7sa+GsDbo0aFCl5Bxnhbpozc=;
 b=Nv4OIqmYo4d5RI7mpjUVzj/u7BoDaCQ2tGG9ubOJy56y2ynMjym7H0vWrj9XehpH8r
 SmtIbk75cq2ttjrl/AfqvtiG7fdMyZNgbrXzNS3IGosh8YHJy1nlteFlOXct3HTYw44o
 nXZ6rcXbRhWTSy1yb/0VV48VK9o7qBUw5hzf+ldjUw+ovvkHTXuZrdtw/15i6BjzBodV
 8acLLRiPcLOPWGVtOoQtB32ZuXVIl5aBxDtdi3NI9vutKWCvgHOufHlsq8dziBGti12B
 WelVdFmtPqdleMkz71O2r/Brl/bb2RWR4WtTesppXroPCqObSyVqb0tQ7ScIRhDEl0nN
 MyjQ==
X-Gm-Message-State: AC+VfDwAOBk6mBKhMyaTgscDyISQbBvozWU4B37xjHghgr8ih0CPptQs
 JOH81D8K37nJO2yvlBMODL/DpQ==
X-Google-Smtp-Source: ACHHUZ4PYDQysQwjK0c6iiDwm8hVetOIAujH6l8Dxdkk2BkHQ8pmkaQs6juZvNsH85ODchrKMNlSYw==
X-Received: by 2002:a17:906:9c82:b0:94f:6058:4983 with SMTP id
 fj2-20020a1709069c8200b0094f60584983mr1282464ejc.76.1682593033769; 
 Thu, 27 Apr 2023 03:57:13 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 jt20-20020a170906ca1400b008e54ac90de1sm9439892ejb.74.2023.04.27.03.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 03:57:13 -0700 (PDT)
Message-ID: <e329deb8-b7cc-a3ee-a7f8-826baabd48ca@linaro.org>
Date: Thu, 27 Apr 2023 11:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 16/21] Hexagon (target/hexagon) Make special new_value for
 USR
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
 <20230426004234.1319401-7-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004234.1319401-7-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/26/23 01:42, Taylor Simpson wrote:
> Precursor to moving new_value from the global state to DisasContext
> 
> USR will need to stay in the global state because some helpers will
> set it's value
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/cpu.h            |  1 +
>   target/hexagon/genptr.h         |  1 +
>   target/hexagon/macros.h         |  2 +-
>   target/hexagon/translate.h      |  1 +
>   target/hexagon/genptr.c         |  8 ++++++--
>   target/hexagon/translate.c      | 22 +++++++++++++++-------
>   target/hexagon/README           |  2 +-
>   target/hexagon/gen_tcg_funcs.py |  2 +-
>   8 files changed, 27 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

