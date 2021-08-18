Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1AC3F0D40
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:22:59 +0200 (CEST)
Received: from localhost ([::1]:60552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGT1W-0007NJ-IH
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGSzw-0006UP-4x
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:21:20 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGSzu-0007tO-S2
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:21:19 -0400
Received: by mail-wm1-x329.google.com with SMTP id u1so2502244wmm.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NPGd0hFt5WBt+Z7OoG6N5cGgP/9GIBypR+vlhDM6sbk=;
 b=ozon/+XjEYtZ2ZLN/ubNxo0Jw5PnNTbw90GEV/dlFhwlAr2FnA+9xxDyXjFuQ2OdW+
 jJkVD1PdKR3bGUHZk1Nk0sc+07OK9FN48IyXOgtw7KOvlCbeh1GYeGKsEyPk6sny2Fy1
 hyONlRw6vdilO+nIoyT8i0K9LSab8J4Q69Ch0TI+wvgvHq392l8PKHR8xHSAK8nfvaum
 kmKkwWw9nroNfKxliLTxi6FqS0I7XLNxmEKUKOVzG3pJYM9XnaelgQfLOXHHM0Z92d4w
 ybj4xdfSqvDE4AthaMz43pgO8mKOAocVNgMQRJWs8KxSDLBrvKSoP8AoL/nX8voMWUN1
 LDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NPGd0hFt5WBt+Z7OoG6N5cGgP/9GIBypR+vlhDM6sbk=;
 b=ubTaoO90HzYbrDD80pR4+2vkzjYzlBVGanNNf9nJgWiCuz2xddEOhpopj3dbPByL/H
 snkLCyjWAq5HL6NFq/IHUsEqMN0sHnQeyDbEdtmPQFmIVbrDQAwXqjScnLKLmmZDDCQU
 oVQ69wYVP6kns5KNVJtsHkcrT0SSAhFlKTLpsZfGux9QUM5tSUXODbuCRLzZ0h6Q0C1q
 NxFWe0pBbhkDCHkITKDdsbSp+5F//KyR0PQTW6OkNAWHhCycxf3aBWvt/5UxQr/elB/J
 jUKae/h/oD1osbCCqtmQBYidPbjn1h/JLbgBrqBHa9tZWBsixn70YiO6qJ62B768w+Gi
 1PCQ==
X-Gm-Message-State: AOAM530aq3GRoiLZ1JdnRJYzRILOSsA1LFCsElDsj8O4QXxzgsGxGUQC
 dyW91gVQd5rkyhtZb5JJojnfLqLxuk8=
X-Google-Smtp-Source: ABdhPJxCnEP60l+HLlRq5SDRUDSeHLEgBRWtoeyrmL/9BZy5K+EAK8/0tyhpsapc4fO/Ca/PlnGadQ==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr10221405wmi.57.1629321677273; 
 Wed, 18 Aug 2021 14:21:17 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 19sm965860wmj.23.2021.08.18.14.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:21:16 -0700 (PDT)
Subject: Re: [PATCH v3 52/66] target/alpha: Reorg fp memory operations
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-53-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2dde19d7-5aa6-446f-f463-d0dc7ac30faf@amsat.org>
Date: Wed, 18 Aug 2021 23:21:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818191920.390759-53-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 9:19 PM, Richard Henderson wrote:
> Pass in the context to each mini-helper, instead of an
> incorrectly named "flags".  Separate gen_load_fp and
> gen_store_fp, away from the integer helpers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/translate.c | 83 +++++++++++++++++++++++++++-------------
>  1 file changed, 57 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

