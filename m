Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24AB3C270A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:45:18 +0200 (CEST)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sgo-00067Q-1v
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sfY-0004hD-CW
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:44:00 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sfW-0005Wh-R8
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:44:00 -0400
Received: by mail-pl1-x629.google.com with SMTP id z2so2307100plg.8
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 08:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LuhcCMpt2x77Hes0d/MHS8FkZqV2ika15hSqmzaeWBs=;
 b=rkXpJB6yqSnsTyNEIv0TvL6EvJLDmNdE5CnrqRaBURNcd3V1jCg9rPI+NYZAB5ezIW
 IH0JAOigJcptebvUUF+5TdelngVZ9sSOhnDYvYj+KMbulu+kfYlmhJZrDX1w/AWUP0vF
 iXXuyssYZG/m0qQGQP8+5pkNPqmrw5/JkcKC+flKtIiBAqetT43UBUKohPmEf9qrnjh7
 rUiiUuU/v0MbhO5jQnxXLBtpdQkwCxDydb7bq3vGj2a8r0CaBOoVApBGp9OiJPlMWlBo
 DQcu5+BDlMfnQaEtQh4kMek4WhM56fycEnZECmbFo7IKV3CAz6+/fRUsrgbPDgG8aZ7y
 bEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LuhcCMpt2x77Hes0d/MHS8FkZqV2ika15hSqmzaeWBs=;
 b=mSL/9Ce9BTPXjyYtu7Gi1whcmBl6ab51/VaPid75UcQ2PiCApSz7Z9nzb37UdTPcjU
 2nsQCNjClnL/wFJemb4R/GuMV/GkTiNa9jqv/cTU/Zv1IJ/uE7KP5egXqhrXXEI6+5Gs
 psnrlrKr/czWPpzr6XM+kNlE7HBh3nP/I8VP+fTD9V8+WBy7xujU+gpqTAlBgSN5e4FF
 yQ475T/b5fDWgDiOLUxUJZcsEnnHXevCc1CeaAPw/kFXE75PuppKEvji2y8ajRg3JBNK
 HZx1M3AGN35pDxQTngpcPap+CVF8cfgqLyRXFBfo0dmg/mL2m70hT65l3kCh6yjG42Gh
 3WtA==
X-Gm-Message-State: AOAM531MkFjgRdxa3QZOZpVttFL+QRijzKub6KbHNS6kZtY+WKiboLht
 yYKRxpJXgokv5sLCZhqjA8njlQ==
X-Google-Smtp-Source: ABdhPJxw22buaPBCyhdxaDjgs/yvNhNSFskQZTBwtaI4hJD4Xu4Q8Z67ZfXCGZaKvDvP2N+NLJ7bqQ==
X-Received: by 2002:a17:902:b58f:b029:12a:d11d:51d0 with SMTP id
 a15-20020a170902b58fb029012ad11d51d0mr5616207pls.42.1625845437283; 
 Fri, 09 Jul 2021 08:43:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c141sm7011898pfc.13.2021.07.09.08.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:43:56 -0700 (PDT)
Subject: Re: [PATCH v1 5/5] hw/intc: ibex_timer: Convert the timer to use
 RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <85c77d5c22719a8a93561f5fbe4d0bc0d63b6266.1625801410.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd6cc6eb-ff90-d7f3-9f0f-e35f9691554d@linaro.org>
Date: Fri, 9 Jul 2021 08:43:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <85c77d5c22719a8a93561f5fbe4d0bc0d63b6266.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 8:31 PM, Alistair Francis wrote:
> @@ -48,5 +48,7 @@ struct IbexTimerState {
>       uint32_t timebase_freq;
>   
>       qemu_irq irq;
> +
> +    qemu_irq m_timer_irqs;

The plural here is a bit misleading.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

