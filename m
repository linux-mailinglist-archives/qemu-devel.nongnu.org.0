Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052446FDB0A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:51:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgTB-0006ss-7u; Wed, 10 May 2023 05:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgT8-0006sd-Ui
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:50:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgT7-0000UX-9M
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:50:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9c9so30017395e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683712244; x=1686304244;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hMVRJDMtYaEl2MD59VMs0MhbjDJb1cqEjaJMQeATmnU=;
 b=zAjIGDrAM6cioEntFsaqD7YlAokaBZ8AFnJw9AxLRueaJqOmqJvUJgagRxpucPxo6M
 uCEDfy/MPROqoNJPMW4b4xviFOtJuG8D5MNfaw/MLKCNZKYolgZkzUzIXna8s4Pl+mpH
 KP8U+9Ulau82VXD0JuNsTCXPYQC8ZosU0raX+pOvn2qeigKGt3xzuAbfj/QBdvEdCdL9
 I9J5Xr6ql+Hnua2BM1Szu6P3FUqlKHux9N+odPtrZMqUjPQRwVq3ZsB4kTxgwtKnTRBA
 20E/TMrpCyRMnA5pDbI2bXgpBppATgovFUMlBIgemLZZfc5VuECJYrDiRKP0nrQftPI6
 OGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683712244; x=1686304244;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hMVRJDMtYaEl2MD59VMs0MhbjDJb1cqEjaJMQeATmnU=;
 b=QDT3PNWsqzjm23uGaMnorNO4ldhNAl4VlwbHd5v3ly8Mp8lWFl3tuCxd7VkYsd0MWk
 tvuJuon1iNmmHC8qmOS6H46B6qsWBXuB3ER8tJd8hYjt27EmIlunih7kSPAtdYdoJhqH
 1oXP5v4mWR+WZcAgqNv6LhqOMaNQeyTZYaCJuHm9E6Tt7Mo+ywvaatvF9zvwraisTwbc
 QGy8hQTAJlLv2adPE98S+Re8+OdaxR3Ql80et1yNjsylBeYpHT9Zopg1b1vpnkRuYtQR
 JYM1nSzD6pxj3LkBVGOVqClX8FyJlxkrrbd1waHDF+SQniGu41aY/1hx/kc8h+0CD5lh
 zJuA==
X-Gm-Message-State: AC+VfDwXcu2v1Nd7dgzJ6bJfHVnpspnQd7/xPQs55KNVl4J1RKdOCHqj
 PjTr6WuSa7mhDEacZAm507DzVw==
X-Google-Smtp-Source: ACHHUZ7JjeoPOW+n/mLhPA2D3XrxrsAbwGNAGwJT3jxsbJ/TlvkGvB9lYCMukwBM9xm7QpANiLOMFg==
X-Received: by 2002:a1c:7308:0:b0:3ef:6819:b2ad with SMTP id
 d8-20020a1c7308000000b003ef6819b2admr11802340wmb.37.1683712243757; 
 Wed, 10 May 2023 02:50:43 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a1c4b05000000b003f429d59e37sm5133951wma.34.2023.05.10.02.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 02:50:43 -0700 (PDT)
Message-ID: <2611316a-3ca6-e097-984e-377b0f6659e5@linaro.org>
Date: Wed, 10 May 2023 10:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 06/12] accel/tcg/cpu-exec.c: Widen pc to vaddr
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230505141403.25735-1-anjo@rev.ng>
 <20230505141403.25735-7-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505141403.25735-7-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/5/23 15:13, Anton Johansson wrote:
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   accel/tcg/cpu-exec.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

