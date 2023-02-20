Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDBD69D3EE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:13:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBaD-0008Rj-7H; Mon, 20 Feb 2023 14:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBZv-0008EI-QU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:12:02 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBZu-0002FO-9l
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:11:59 -0500
Received: by mail-pl1-x62f.google.com with SMTP id e5so3634617plg.8
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=28e9UqpwAorY8/HU3rzqn1nJRB4qX3ql5Zl2/NMUbyo=;
 b=fjP5GVuu6xeDs+9v1r2jidUFpdTahMY82DTLxERgVzn+JMzL6lAcS7MUaFoBxb+dXQ
 F50NtMyXshWTypjhq2NbKUu+5cytFBnJNsn+suHAnonBb5t89zVk3VfqJvuIFVIxSTI9
 VJ/9rhYa/bSP2y/qZrddXTCN9zGQxlO5uySGfewdkQ79IQ+r4rJbbQRrT10Ii2heAVq+
 k1RjvYI2Uyo7yksSvJTGADs5LfPweDfxuMXcSRnACcdIucfrPZ72hfy/moptAvlnAMBS
 cQsZbsHMdYru+E66qj+/hdcOVvuDEObKOrH0PB6NYSamWG7biNr0vE9i0YWJHwue1MnF
 xvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=28e9UqpwAorY8/HU3rzqn1nJRB4qX3ql5Zl2/NMUbyo=;
 b=jIzHtx1tsxZUuyEU8WqWYjOjDGSZE88lnOkJ4PFQIzVRGG5CNWXu6UCO+81gTnWyBG
 WPc1oXb4eEtBvf2RK2nSYq+iJ9kdKo6V4Ht9ODXLpzfbFctoBsbhnZ1iKfHbW0HkSjQT
 11aTHZ0ZMRFevjn/KA0LvAOkKUWeO7Kdfw5BBa8o8sZNhNfOT5yXnbAvg7dHytVPdMs8
 FCSYXYk5bAuwMs7sxpj9ogZU213sA/OlvTwTAWk28C6au+IOrDIbK3/fkR3KC2HP6dWh
 QrjKGIGL8VWsFPLRZsSd/YX53Znz4ARnKIJ70VntU4shGTqh3JAJ5ZKx5nhm0nkExpYP
 GQSQ==
X-Gm-Message-State: AO0yUKWThl3OHg+0SFLG3lDEAWrpViZFZhxFKYLiVYeW+kgEQzZVUkMb
 f7o0j/OORyxEhCVwh588x0WPj5HvKGWDtl1oCt8=
X-Google-Smtp-Source: AK7set+Io26JJ8SESWqYgo+jc+vDutEVHN0EYca4GWMIAjVkcWS/EPNInJGK76Pxte+zHcx3IMNEKg==
X-Received: by 2002:a17:903:284f:b0:19c:33fe:e140 with SMTP id
 kq15-20020a170903284f00b0019c33fee140mr3572670plb.42.1676920316814; 
 Mon, 20 Feb 2023 11:11:56 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0019a6e8ceb49sm2563874plp.259.2023.02.20.11.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 11:11:56 -0800 (PST)
Message-ID: <993faa88-52cd-279d-8ca3-ccb834a5d41a@linaro.org>
Date: Mon, 20 Feb 2023 09:11:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/9] hw/usb/hcd-uhci: Replace container_of() by
 UHCI_GET_CLASS() QOM macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230220150515.32549-1-philmd@linaro.org>
 <20230220150515.32549-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220150515.32549-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/20/23 05:05, Philippe Mathieu-Daudé wrote:
> By using the QOM UHCI_GET_CLASS() cast macro we don't to
> use the intermediate PCIDeviceClass variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/usb/hcd-uhci.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

