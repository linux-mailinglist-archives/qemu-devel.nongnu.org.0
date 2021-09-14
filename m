Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F81640AFF0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:56:58 +0200 (CEST)
Received: from localhost ([::1]:58464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8vh-0007FE-F6
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8kf-0001sy-SX
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:45:34 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQ8kS-0003Td-4K
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:45:32 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x7so12236386pfa.8
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uEUpubg2W2EX7Eit7z+o1gZPzmPAl12zsLs1dXtq2Zk=;
 b=iStXq3FeGAnr4vvgHNpZ3dxTHtxk/O7aO3Qd9m8O5nabDEuUA6Y+FdNW19urREZAUU
 sqagLFwWjvjY3sCEFf/dHQWzyekHrrrxEOUBN1AeYf8ELMoYTjMZUWDN2dPzU3c/uSm3
 8c1uLOIgPJms7nmIX7Oty6G2u7Ir9Cydvh+6F/aFk0Wm9o4dz77yyzWoCjPMyIBmzSeH
 su0ZHiKen2NPdHWL1LNVIeRna8zLYW3bzeGankb5Jdx+1nVY187ODYFr3Kt5RD6lEU0f
 lyW5uZw5CzhXtU1QGNpAL6hTPCcViD4T9WuDxUKKdagUBQinGj3+VQZgPiBQmjJ9ePtD
 XNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uEUpubg2W2EX7Eit7z+o1gZPzmPAl12zsLs1dXtq2Zk=;
 b=ToF6wlMqzhfnNtBrTtmcCP/eLXGhTYA56uzPl6uBsg6E55E1ZOTF2tM14unTUy+wmO
 4DrEWe+Nu/w0lFR8sY7rVQMiv54iHU362u4WZ1yV+zpnL+Qb/omcU3Db1SofpUUgBsts
 /7Nl9BXuAnuCBNWwUtujk/QzOkptmc0lf6OlhJT1j8LS7TRja1hmCTUg255O6HwmUUxe
 BY4dPNxi5k+DPWxB5x2+Iy3sK50F9/T2Wmw06ylROa2qKAyxrBvTKQO+g/F5wLf0iKpy
 f82zcuMXvG7Ds4eL7ZewE+gJKTxUAOTiTlDYHE/5tlbQgxilcBo4AFX2Y1yXm33e3qeG
 csBg==
X-Gm-Message-State: AOAM5337f3S8Zt4p2dy/PnfvUd+5Uhw3IrjJ4NAQ2uSXhI+EH5Ob4buR
 DPOa5CSV+pBtLUG/irHhJAKQkg==
X-Google-Smtp-Source: ABdhPJxJOMxfKHj0UjarbbpyN45g0ggDwxhM9CrTxGJ7Bx1nAjnEl6JQL0esThWuBn72UlotYTbMdg==
X-Received: by 2002:a63:a54f:: with SMTP id r15mr15630640pgu.11.1631627118591; 
 Tue, 14 Sep 2021 06:45:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j17sm11631921pga.39.2021.09.14.06.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 06:45:18 -0700 (PDT)
Subject: Re: [PATCH v5 06/21] target/loongarch: Add fixed point bit
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
 <1631624431-30658-7-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e806fda2-9a5a-f028-7941-b6db1990e7cb@linaro.org>
Date: Tue, 14 Sep 2021 06:45:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631624431-30658-7-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 6:00 AM, Song Gao wrote:
> +static bool trans_bstrpick_w(DisasContext *ctx, arg_bstrpick_w *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if ((a->lsbw > a->msbw) || (a->msbw > 31)) {

FWIW, the > 31 check is impossible, due to the 5-bit extract.

> +static bool trans_bstrpick_d(DisasContext *ctx, arg_bstrpick_d *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if ((a->lsbd > a->msbd) || (a->msbd > 63)) {

Similarly.

But anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

