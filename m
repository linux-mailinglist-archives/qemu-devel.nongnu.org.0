Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6603442149
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:03:47 +0100 (CET)
Received: from localhost ([::1]:46746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdX0-0006V7-S0
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbUD-0001nJ-E4
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:52:45 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbUB-0000AD-MQ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:52:44 -0400
Received: by mail-qk1-x72f.google.com with SMTP id bm28so2192429qkb.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LPEPNe2fFjUdHrftmYjythK5sG2aqtivw5hjIXIY2zg=;
 b=BiiN1mS4EVdOm8e1Kf4hms1C8amerZJU3ct1gKDhwpDm1bURcww8pOZbXtfA1T9f4Z
 PxUsjGiqoLEnOv9zlrDQrgByERRb4M72kMkNilpW6LZKdH9o3Eq0uVxC9vwMVNaiJ6wF
 gM8yTTvOP5ndcANK4Gjs4ZIlNCiSHLc1JqPx30OdBUwXRjOdIL+MLQVUQn6YgWiHb+ME
 t7lZVaD1hzSZkKE+VzEcdOdepvXlXIBhpe4NnAFNUqeV0yiEddg7P4XaT9II6dLsmHJV
 WeHdyhAGc3g/O6ulf2ZpNqPs+6h0RaT1KCMzThK9IQx1VUsKtF/CKfcx8GGJpAGFB0KA
 xWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LPEPNe2fFjUdHrftmYjythK5sG2aqtivw5hjIXIY2zg=;
 b=ZfVx93nAeWK/WqqpNJAPLilfYglWS2PEF8gfEmFjv/ukyugtVwvVYfsVej4RAyKJLf
 KHyG/gRVOI6Q3J2NlEfKfGHy8rsTjFrgw6GhKBn739gpHUlXx3SjspFuep08YvZ+ShiH
 RX5sMGhANjk/FyDG+2BeVFa/uF72i8urkG5RDzBGp3nlUxICuB2b0VRTdK1whmDvkv0x
 yeI9RhO5/dCGpIexkGYgbrkETsUXLdrBkw+gBYRJebAZXuRxsKvrsKYmZZufwOnOxFJ9
 BtWEgtAOsjaL5iAjN0kn6P1qQQXO0VFVeaozLdhODC+YYcpkAm3MG5wyy1069QHDCzoY
 mpmA==
X-Gm-Message-State: AOAM530XNnLRcvNa8+hDGHvp+xtU2QtV+l+Zj8DPIRCTTk6OWD35u6FK
 LradBaNGp7J4+hex0fu5MJCE2yikD5LL5g==
X-Google-Smtp-Source: ABdhPJzAdve4X3wIaJBDo3OBuVLvOMKF+I9vjQYgQQP6aQQBWsZYBJnXSN+zqxUcU5F/yI3seS/0Iw==
X-Received: by 2002:a05:620a:408c:: with SMTP id
 f12mr24633427qko.471.1635789162672; 
 Mon, 01 Nov 2021 10:52:42 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id a11sm5491888qtx.9.2021.11.01.10.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:52:42 -0700 (PDT)
Subject: Re: [PATCH] ppc/pegasos2: Suppress warning when qtest enabled
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211101151023.F0D02748F5A@zero.eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce8485ca-b6aa-558b-708c-164d025d25f2@linaro.org>
Date: Mon, 1 Nov 2021 13:52:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101151023.F0D02748F5A@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 11:08 AM, BALATON Zoltan wrote:
> Suggested-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/ppc/pegasos2.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

