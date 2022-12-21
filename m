Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866CA652AB1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:01:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7nUF-0000Yj-Ni; Tue, 20 Dec 2022 20:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nTy-0000Ws-Eh
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:01:25 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nTw-0003Bw-T5
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:01:18 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso533826pjp.4
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 17:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5uW3tnCiJw3pKNnYKXDQcQQmEbifJEXNiStUaj8SpuA=;
 b=mCuzBRTEUi9TpjanlmmbBbyxl/vimfhn0H15FXJtGw1fEWOzwCCCsQpdvI8Lk2kU+k
 ID01Om1KbKI59YrRSzkD1QfnJdtxKRHMjb4vLg4/gCc8870ThmZEzjFun6QXH4S9wLKr
 UoWRaUGqL+Gi/Sc6Kh+t09v+ZHtINBiMiZ7ltijCFXTNmMRmsGNzdClxoNWYqaYBDXiS
 JzAnnJHzST0umDNJnIVHAYQqejKal90rXRYk7HX7EqlHi7MA1sO+Rjnb1Iq8IcLbupZW
 MuyF03CtVR/eL2aQP8ILs0PM6v/4qI2u1Tea/VcAXwJLSlU67FQGEn7XQe6Jozz1xSGD
 FIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5uW3tnCiJw3pKNnYKXDQcQQmEbifJEXNiStUaj8SpuA=;
 b=HftqSLnRJ+akiyRW5tw7HKEIqZ00LR/Lr87tx/mWbdOFk1tj0YvX5HnOPexeSQKzXH
 6nvTINFaNpbT3Ybxa0eSRT8C3gaFGcicmZelz/FS2mK4nG3N3wFEtKnOl6VOTw5S1V/s
 85ijGtS7eZrnL3TgrOZ1LZFhsKSW2C4jleb7GBf6AThVryHSb7rsfrdLrYYLBHodGzq8
 wC90iyxssm4o0WKQE0534RmXasTdAUCChw5CNfVGcNMvAOCjRCaxDDCXvyawKgaWIk8Z
 ngjmgaFTP62Bb4BrawM5tjbQ+1+vLoRaSM68hnqAuUbr++cwRpDyxkN7223g85NWnJKq
 U6CQ==
X-Gm-Message-State: AFqh2krR23aZVyNbgwuOTuQ/jP40AWDELSHQfNAD3PWHs5GCpQBYyNif
 aYxRtJGns3RxIo7g0T+xRAzfQTWsO0l+bqTL
X-Google-Smtp-Source: AMrXdXsm6GFIirtvi5BBdkeEsMFPUS1Zpr7869vduFyPn0s1gvMg7p7IqGG4OJ8Q90Vpaus4Lcx1kg==
X-Received: by 2002:a17:90a:46c7:b0:223:a07e:1f9d with SMTP id
 x7-20020a17090a46c700b00223a07e1f9dmr122010pjg.21.1671584475446; 
 Tue, 20 Dec 2022 17:01:15 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 ie20-20020a17090b401400b00213c7cf21c0sm165137pjb.5.2022.12.20.17.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 17:01:14 -0800 (PST)
Message-ID: <71580657-0598-fef4-3b8f-fc0db0c06c0f@linaro.org>
Date: Tue, 20 Dec 2022 17:01:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] hw/arm/nseries: Constify various read-only arrays
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20221220142520.24094-1-philmd@linaro.org>
 <20221220142520.24094-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220142520.24094-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 12/20/22 06:25, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/nseries.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

