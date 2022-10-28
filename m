Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F1611AFE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:40:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVCm-00010b-Ew; Fri, 28 Oct 2022 15:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVCk-000106-7y
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:39:46 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVCi-0006Qn-Nd
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:39:46 -0400
Received: by mail-pj1-x1034.google.com with SMTP id l6so5544389pjj.0
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AgdF5glLeDqAa+j/aW34oueDg9BwHSdoQjaIrJbNRak=;
 b=LkWMtZW/6jck8RhFlpHJn0avMeDgkwLDU1y6L0xd3bv0w75i9k+ZAizB08p29RkVUR
 OgZEd6/vvt4ZNtEDa2Km4gj/iuGTzAQRU4DE05iHqsPaaYKm3oDphLepk03+R0rRB1Vn
 gUanETgbh+ZzSr3V7KcXKK41r1UqI9iL4/P0tr5yX9GK54yvcDPChzRqaTPOLQQ/Zj4x
 Q3RSvXkYtKDukmldH7d8Rwf+L7JdjDJ9X0F3peqkttZUi5iFnGV3Lre8qkpKIPaGX0fF
 7pZPsVgmQfwFcsRhv4hGwhQEycj5Xx8yP3QhGRAPixSFaxjsFA+QJQzL1e9ZAuZTDLNF
 5pGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AgdF5glLeDqAa+j/aW34oueDg9BwHSdoQjaIrJbNRak=;
 b=vWaF7gfZ73sOBRtJ0lndK0N7qogWZ9ODoKgCD2P6mJfOqA4K1WN4vGlngTWHXAYTPt
 q6hwtCMStEPfy7ZkfKmToIT5VWAYE7hfJg15jmpMQRwOnvawz6y6wDfTxHH4xCLuFDvy
 PiS+Br5wVe3oGtSAKGKgGIlm2mmEHBraIroc/6KgKzUdNds4si5N65Y8MML5DDZDXnNh
 7u3XupWdRstzY0LcE7Z+8WarJda8jnfd76e2lZp8tGsN5M+2B7lHgkawvzBqiQKa3p1n
 cwygo3OawvYWrmrR5K1dEo5rL3KdHDPDaJdb/xX6ZxZH7dWKSN927j4zXxK0yEcJhUBP
 uyWQ==
X-Gm-Message-State: ACrzQf2VVqHBsAN0NwPocsIKHYZq1gZ8yDJJPBC5O01fcx5vnNMQS6Eg
 QP94KIyFexDDFQ270J8tKXlosA==
X-Google-Smtp-Source: AMsMyM5eJrvNpN6Fk1z9XfC5R29d1FOiLQDEnez0uifsipgjcKWcYf601UjLdYYh/zoaQpTpK0ZxYw==
X-Received: by 2002:a17:902:bf46:b0:179:eba5:90ba with SMTP id
 u6-20020a170902bf4600b00179eba590bamr634227pls.16.1666985982956; 
 Fri, 28 Oct 2022 12:39:42 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 y76-20020a62ce4f000000b0056bad6ff1b8sm3150511pfg.101.2022.10.28.12.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:39:42 -0700 (PDT)
Message-ID: <d813bda6-d84c-f97a-fb0c-753975e63a75@linaro.org>
Date: Sat, 29 Oct 2022 06:39:37 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/7] target/arm: Implement HCR_EL2.TTLBIS traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 10/29/22 00:39, Peter Maydell wrote:
> For FEAT_EVT, the HCR_EL2.TTLBIS bit allows trapping on EL1 use of
> TLB maintenance instructions that operate on the inner shareable
> domain:
> 
> AArch64:
>   TLBI VMALLE1IS, TLBI VAE1IS, TLBI ASIDE1IS, TLBI VAAE1IS,
>   TLBI VALE1IS, TLBI VAALE1IS, TLBI RVAE1IS, TLBI RVAAE1IS,
>   TLBI RVALE1IS, and TLBI RVAALE1IS.
> 
> AArch32:
>   TLBIALLIS, TLBIMVAIS, TLBIASIDIS, TLBIMVAAIS, TLBIMVALIS,
>   and TLBIMVAALIS.
> 
> Add the trapping support.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 43 +++++++++++++++++++++++++++----------------
>   1 file changed, 27 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

