Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085FA457C10
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 08:18:41 +0100 (CET)
Received: from localhost ([::1]:52880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moKdz-0007UJ-L7
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 02:18:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moKcv-0006ep-FT
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 02:17:35 -0500
Received: from [2a00:1450:4864:20::331] (port=55007
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moKct-0005PR-Ox
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 02:17:33 -0500
Received: by mail-wm1-x331.google.com with SMTP id i12so10439611wmq.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 23:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eImycyLoCfpteuMt4Nmlvzk3po9QfzK4bIcAAZZvSwc=;
 b=ytNiSrpNR/+44N7qHoxRc8Af7oejJvQT55ihqjPcVY5PzknerSFrKB7/9+YLd35956
 7Z+eOVOF6fbKlZmoJsnGVpy4E5un2PF+Tk0EEdXwk2T8k7cAWSaJi2qYgxjnS6mof55v
 6BIdZfT98vpRqppWaGw++glbKxctEy2GT7GyBzgR9FE7YlVCJFMKJm7E+XcEdQFa7Eqa
 zFlZMvFQSa3xLjXeX3xuMVM9rYURhzx2JBwG/8dczH10GMj3Y+7EEjXDyddgZEZLfpYe
 WweUD7Pjon4bBODmH+mfeHSXgsm9qZTX/9w4sJCObjV9f7un1rbUEzVjEMeqFBy9lCk0
 Y3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eImycyLoCfpteuMt4Nmlvzk3po9QfzK4bIcAAZZvSwc=;
 b=y0fzdWXBik5RSDvdj22O5JMWMerX8KRUEoQM2TV6qTap+60JCBZo5O4Yd6/6FXQ+C9
 uQBJpFk8KVMOK20FBXUKCanlMvBc/wYAYIb3ZBBLi/4yX+LeljlfZi6+UNEWoHjxyL5s
 czgDUwbWi/bKEBNzzM/7f3s04PBngfzzsX0ffugAJkYQ/+35FxbvpH5BCQ9OsMup3Lfo
 +Dwezh8HeewI1HpOTTQuyqWo/lRPFBsnO6lkxh6qMCJPZZRa9Ib6ztSs6hcqJug7CxU9
 5eUfCD0YqO1v2TYS0LIPrYB6dYaHbwvPUV2N/S+rOrFrJfzKvxy38Y59wRS6vb+Ldsk+
 Hu1A==
X-Gm-Message-State: AOAM531VVdeImvDTTIxwcPSPn5j98FDblmhzGFuAalARD2j425lir/Ke
 7c67BET8dEz4TfQRFfT6K0Tv8Q==
X-Google-Smtp-Source: ABdhPJxiIf/EE1xiJXBnXrteoDz9oMhDvgFOpv0qAomJ1CbcOlZFpsY8oiwaEHgzOmuc6Kb4hp+sxg==
X-Received: by 2002:a7b:c8c8:: with SMTP id f8mr7710634wml.49.1637392649981;
 Fri, 19 Nov 2021 23:17:29 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id w7sm1881705wru.51.2021.11.19.23.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 23:17:29 -0800 (PST)
Subject: Re: [PATCH v11 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-5-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ccd9c56-9db6-7a40-d59c-22bf3fc2f6b0@linaro.org>
Date: Sat, 20 Nov 2021 08:17:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-5-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> +static bool gen_rrr(DisasContext *ctx, arg_rrr *a,
> +                    DisasExtend src1_ext, DisasExtend src2_ext,
> +                    DisasExtend dst_ext, void (*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
> +    TCGv src1 = gpr_src(ctx, a->rj, src1_ext);
> +    TCGv src2 = gpr_src(ctx, a->rk, src2_ext);
> +
> +    func(dest, src1, src2);
> +
> +    /* dst_ext is EXT_NONE and input is dest, We don't run gen_set_gpr. */
> +    if (dst_ext) {
> +        gen_set_gpr(a->rd, dest, dst_ext);
> +    }

Why the (incomplete) condition around gen_set_gpr?

I think it's a bug to not name EXT_NONE in the test (just because EXT_NONE == 0 now...), 
but I also think you should not have added the test at all.  We will not generate any code 
in the end within gen_set_gpr, but it allows the routines to be self-contained.  You 
shouldn't assume what gpr_dst returned.


r~

