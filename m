Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59099693551
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 00:50:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQzcD-000404-T9; Sat, 11 Feb 2023 18:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzcC-0003zn-BM
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:49:08 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzcA-0006ps-DO
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:49:08 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so9052348pjb.5
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 15:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y662xSXYvUMPaWAcLcTrCsWo+jXze99VnrPYhss5aRs=;
 b=bWLo/6hO2PYWCtkAOI7LZIjAcs88EwQ7yoZ+z325yXQWppDZX4qbwPG5TUPwQfbjA9
 ZMvRT0WhM6jzjFokAwX/jU9l9/x7r9P3NqIaTMkxMRUziQTN+KsluHbTp1kG2frgGrwj
 lo6Kp8OyFi92syrWM178ketkhin1luJdZklta2dYQK9Pjrgfb0CAw6hnqa8gI3RWkVWW
 L8z84TZdj3dThgOi54z1C9VnhqxD91ALLD0fj5+kDKSyBmmC6ARiNLtwNpWi0xXl+pJO
 3XeMSu1kv6N+HNGW2wqPUw43AQth3E9C5gWiRvjrGI530rfj2qBBPUb+GNGqvw2ApP9T
 4XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y662xSXYvUMPaWAcLcTrCsWo+jXze99VnrPYhss5aRs=;
 b=se/Nixse+FgKtom17Ggs4X9asnfHZCTh+hyBelBq25qziYuZYVwaZeVKFuqljHz62G
 RBfMQTtbMzLAGb7xbllmMi+B/rxBGaAJS6C38PXE6jqQcbH9og7+YxInLEUA5xPSo1kN
 X4pS081Iw7n8tdtovqQEwYwrrL5H/nbX4FXgC94809BMY/coB8giJWYrDFiDrblG2gzr
 8KtgMU5B+LMohQHNPjAJBmuarhhoJTz34ggJRyCikswhtB9V+d3tHIq8ZC/mtUNWMzoG
 TNt+VvteoRsjASXU7Hh5KW3APiVPlweUntHQmDld5YrNfERi+NH6oLTTI1ngm32F/QvD
 Jbsw==
X-Gm-Message-State: AO0yUKWTiCUwM3e1zv3335653DOKKxaf+8lF9NXhA/DoOe7RihI8pgCQ
 MUSAkTWxKEKL4meYxqo7Av7nVQ==
X-Google-Smtp-Source: AK7set9Khytevf22MBczQfh8/OpgPRW98/3rmFfsdcrYN3ackTuNZEMi1wXg9clkiXMxczntqYtfJg==
X-Received: by 2002:a17:90a:30d:b0:230:f7c1:10c1 with SMTP id
 13-20020a17090a030d00b00230f7c110c1mr18757638pje.41.1676159341625; 
 Sat, 11 Feb 2023 15:49:01 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 w63-20020a17090a6bc500b00230e41e98desm1206161pjj.32.2023.02.11.15.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 15:49:01 -0800 (PST)
Message-ID: <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
Date: Sat, 11 Feb 2023 13:48:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230210221951.1298668-1-smostafa@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210221951.1298668-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 12:19, Mostafa Saleh wrote:
> @@ -1512,6 +1553,10 @@ static const VMStateDescription vmstate_smmuv3 = {
>   
>           VMSTATE_END_OF_LIST(),
>       },
> +    .subsections = (const VMStateDescription * []) {
> +        &vmstate_gbpa,
> +        NULL
> +    }

Actually, I suspect that you need a pre_load hook that resets gbpa, which will then be 
overwritten if and only if the saved value != reset value.


r~

