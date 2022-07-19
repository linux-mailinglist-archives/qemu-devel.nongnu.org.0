Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA9C5794D8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:06:09 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiF5-0007UP-7X
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDiCQ-00047O-Rc
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:03:22 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:43984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDiCO-0003iM-MT
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:03:22 -0400
Received: by mail-qk1-x72d.google.com with SMTP id o21so10586417qkm.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=miSqhEpo9W7HwP9OrIvVSxLGcyLLCsDKyRZYuP4RxXM=;
 b=hptFAISc3C8hVgvD+wjBMxSHpv3rhtGuXuTrTjmx9xCZh2jtJYrzPvf3o4BkaoV3Gw
 Fq4lC4A3K20HDMb6TM6Po2Xi2iZSeCo5D/pazIh/chnkxo+xAFKjvkKnZsT9IGNpTsga
 yUaI0fo0JSvPkZu+Qz6iE1APa8XGO7KU2I1lP55PCjxwLIae5R16Bo/dho/PDMyKzSZM
 AJt4VM/DHDqIXkuWHlZIi/ARvFD83CaEj7r1lgc6s1JwgcGgWuD7ug3Wju4KQmO/5r/o
 y6WLn+SLrTyFGkTfNfK2olG4FWsQ/Yb2r2pwxt1JT1wHfXK10iPesSfI9imduf8ciiO/
 Fcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=miSqhEpo9W7HwP9OrIvVSxLGcyLLCsDKyRZYuP4RxXM=;
 b=M/C8bwhKEqkJjzhq2RxNrP+BUmsJZPWdaqsRvVK67vNEAxGA/AsGB8EG/v9lPeu6/C
 v0TTugo8Bkq6/AQd9TucY9NGXjwpYyOA5bIw9DDiwhQhw5oUi94kkltXvtuIgPvLqYBu
 bIC91aHV5u5+vWYYNDFAcq3sHJNa5Xxt9+xub10hYQemknbvY9mTuj1Ja8SSFt67ortH
 z5vbTptYkPNVKNY6U390hB9t1ko76s1dRqpSgjYNJ6OFsLlvyyXppK1ZcS3yGpOznaxL
 6jR1BVvk2zXYdtFFAEulfnDNzu+8M3CzCpXMse4kpCePHwglHV8BFST774mnI7I3ML8G
 t82Q==
X-Gm-Message-State: AJIora8AwJLdPNq1scrVTL5TelA8c9GDTLQQMqtmp4Yh2raEuK13jdqC
 3T1v18GN/+GAEBmYO7LbcuBSTQ==
X-Google-Smtp-Source: AGRyM1u3Kn0gy3UpSUK7FxbrkTtCzxjXVwNXN3ZhN52XQXeHQDclC7mElbMLCUj8/FYvg9GK7hpktA==
X-Received: by 2002:ae9:e704:0:b0:6b5:6bb9:48c3 with SMTP id
 m4-20020ae9e704000000b006b56bb948c3mr20433780qka.618.1658217798878; 
 Tue, 19 Jul 2022 01:03:18 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05620a288f00b006a5d2eb58b2sm14331537qkp.33.2022.07.19.01.03.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 01:03:18 -0700 (PDT)
Message-ID: <4788e836-b220-155b-c44b-3f4257536e6e@linaro.org>
Date: Tue, 19 Jul 2022 13:33:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/6] hw/loongarch: Add uefi bios loading support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220712083206.4187715-1-yangxiaojuan@loongson.cn>
 <20220712083206.4187715-3-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712083206.4187715-3-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/22 14:02, Xiaojuan Yang wrote:
> Add uefi bios loading support, now only uefi bios is porting to
> loongarch virt machine.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/loongson3.c    | 34 ++++++++++++++++++++++++++++++++++
>   include/hw/loongarch/virt.h |  4 ++++
>   2 files changed, 38 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

