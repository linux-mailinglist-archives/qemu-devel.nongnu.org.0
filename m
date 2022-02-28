Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087C04C78D9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:48:01 +0100 (CET)
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlzz-0006NY-Ty
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:47:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlxC-0005SX-RF
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:45:07 -0500
Received: from [2607:f8b0:4864:20::102e] (port=44757
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlxB-0000Mo-8P
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:45:06 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so119186pjb.3
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 11:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+GA4No0XOXw9w353L+6w+wgYIL0pdxG3moV0R/xStT8=;
 b=xjSdtnKZfsJQgFZ117LGXnXJwLK204rF7t0iICzYnf2Yc0qyx/+bRpqHSzlfI3xjhH
 8vRXyoA2oGdmBgx08lUn/xug+KR0Q9KtX8LN3m1tqVnNcUUuZKFjekePMRbx2PIl+2RA
 FYL7LmrihgkkzdwVS6hHuUTMZBGfS78R5N6S6CLzxD9EAJwlCimMX5OrKkud6ufMH8dS
 dt/aI+Qw7hyIYZwoZx4mmMgN6yxQgbX9xrbOhde1ZDrMYKsLHKuQUSF4HolSsLrLRDpP
 lNgir95tyl7CHe0db7wMaTzT+ANzOHo2+20AFnxAvGGTa4kuHK1Ty/zDpDhoUKNH9bgq
 irrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+GA4No0XOXw9w353L+6w+wgYIL0pdxG3moV0R/xStT8=;
 b=S1xXGpQwsw8bzEdFzsm74MpyU3HvcoQkb4QQIaoeeITI25DtNpmsGpKWrgTZ7d0+fQ
 EVWo+88js2fmoM8HX9knW6t0r0/2m7ljJeiyKDFVT6uPAWffLHg7U5cmwWNsNs0w5Hng
 BnAKCyeMcW6HuowwXuvgnRdI0+hN9fWjCNOXCG7Z+n+P1jOsh1YA5cSyWLcTjRUpvxBG
 RONPWiSJ4qsfPxPu8FlTeugpuSoXzhgQO2fGY5wmDSsAtijfSdwph3IR2OgivZn1OUfE
 1BT98Y2Iz1nFoxaB+ouU1TXKiIWPFcp5HZpIWYuQEMSZP5RsPd2M6c5KXtt42UodhZbG
 XwSw==
X-Gm-Message-State: AOAM532uL/mQj+P4xFMvrKt9NJMrHXl2IjIbR72CwNAq+eUInm0RHsjK
 2pdHeB58kyPyu2LFAcBb7b+NSA==
X-Google-Smtp-Source: ABdhPJyxBWD1eYBZr1tTyJeyQQ6z/3+9RNxeN4ymlzdex43/mzikqOqHNSw33gF1H739qmrkmtZFDA==
X-Received: by 2002:a17:90b:fd8:b0:1bd:1308:1288 with SMTP id
 gd24-20020a17090b0fd800b001bd13081288mr13513747pjb.201.1646077503775; 
 Mon, 28 Feb 2022 11:45:03 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a62e311000000b004def1931fbcsm6981401pfh.63.2022.02.28.11.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 11:45:03 -0800 (PST)
Message-ID: <0414036d-87cd-1b05-6fb7-f0f5ab722873@linaro.org>
Date: Mon, 28 Feb 2022 09:44:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 11/14] target/riscv: rvk: add support for zksed/zksh
 extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-12-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228144810.7284-12-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/22 04:48, Weiwei Li wrote:
> +static bool trans_sm4ed(DisasContext *ctx, arg_sm4ed *a)
> +{
> +    REQUIRE_ZKSED(ctx);
> +    return gen_aes32_sm4(ctx, a , gen_helper_sm4ed);
> +}
> +
> +static bool trans_sm4ks(DisasContext *ctx, arg_sm4ks *a)
> +{
> +    REQUIRE_ZKSED(ctx);
> +    return gen_aes32_sm4(ctx, a , gen_helper_sm4ks);

Extra space before comma.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

