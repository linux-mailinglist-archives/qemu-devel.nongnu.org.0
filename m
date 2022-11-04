Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5674261A400
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 23:20:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or52Q-0003Dq-Gv; Fri, 04 Nov 2022 18:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or4rX-0004hE-Gy
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:08:31 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or4rV-0006cO-K0
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:08:30 -0400
Received: by mail-oi1-x231.google.com with SMTP id b124so6568667oia.4
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 15:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=meWGddgcbOMaLuRwCWTOH+hphL0kFdbNFrr8O0m3evc=;
 b=GbTtXAf36DGTnnMRHGXYN3KHf5DVEP0AmmnwtS4ilmXFk3XYa1rV8iz6s1PE3OQfWU
 DeIn2xXrqo5ngEsDUzfulEfoEdu9xvXzbIh2HbwpJpDIY/+WpIiiYvcCG9v1hZXfTcJw
 bIIkQfpskmMe4i8mIdxb0vMVQA+Q3B6yJqddNZaeBBPDl+phbf8zKOCbfROeQUp+0O7z
 aXyMsLbWs0z+BzgcTbL88QlHbZUakzMtoLqg7WKFaeGluxgUt9oT6yk7uXM2VLxpYpr3
 wyx6/VoiGotPrJiDO4r+RQtg8NpQ6oMmT8jl7/ClUUt5NBPyQ+IDPMlP8yBsV+lB+fcY
 fUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=meWGddgcbOMaLuRwCWTOH+hphL0kFdbNFrr8O0m3evc=;
 b=bf6JnUYk2k4rNII4aeuApnbWEbZxaTm8dZVPAw4Rh+AcG9nE8deAfyMiqptnLeh7os
 lIEI2dKMq7/gdkAlfIkRP54m3tjyRonGVPjDievmu9JYUDNkiyZhMLZBXh9x9+gWj8n4
 BdtNl6ZWv4I+FHAp8siC877vYJvcEO1EC0MWaai3jQleZ2iy0zScVoqMuW7ultLIDh2W
 Xr+2SO7MoEWHkMW1Eo6YQuqdSdmBprXs70qfFoSg54thS77awsWRwrhSRkV5OQVEVQSJ
 pv56zrP5He4exQszoKyNEkATA1vDBiYf1lt0iBPkmqGxAWw1IFl6UvpOCC9S1CztaBpO
 M0hg==
X-Gm-Message-State: ACrzQf3bC8RqP48Xxyq4xMgGbnqjJlY9WHebLmwhWvCU/zviJe9kOaqu
 dzgw0Cgo+k6JNs5JQ0KU+WPF7xVIgYJbtbxi
X-Google-Smtp-Source: AMsMyM4o9GgPTeAmTyTSBk3n6YihNdSi6V95uu3x50W4aWCCm5BDYynkyTSsrpwLBT9VnSWLYYQBCg==
X-Received: by 2002:aca:b603:0:b0:359:c5a9:b9ac with SMTP id
 g3-20020acab603000000b00359c5a9b9acmr286052oif.33.1667599708044; 
 Fri, 04 Nov 2022 15:08:28 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 k131-20020aca3d89000000b003549db40f38sm92187oia.46.2022.11.04.15.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 15:08:26 -0700 (PDT)
Message-ID: <5be81b92-83c1-29d5-8af2-1c6fe49a7520@linaro.org>
Date: Sat, 5 Nov 2022 09:08:17 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 1/2] target/loongarch: Adjust the layout of hardware
 flags bit fields
Content-Language: en-US
To: Rui Wang <wangrui@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 qemu-devel@nongnu.org, hev <qemu@hev.cc>
References: <20221104040517.222059-1-wangrui@loongson.cn>
 <20221104040517.222059-2-wangrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104040517.222059-2-wangrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 15:05, Rui Wang wrote:
>   static bool check_plv(DisasContext *ctx)
>   {
> -    if (ctx->base.tb->flags == MMU_USER_IDX) {
> +    if (ctx->mem_idx == MMU_USER_IDX) {

Not quite.  This needs to check HW_FLAGS_PLV_MASK, not the mem_idx.  That was the intent 
of keeping them separate in HW_FLAGS.


r~

