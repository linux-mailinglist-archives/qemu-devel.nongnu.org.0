Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01659662ACE
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 17:06:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEued-0007ss-Dy; Mon, 09 Jan 2023 11:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEudy-0007gO-9N
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:05:21 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEudv-0007aa-FW
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:05:00 -0500
Received: by mail-pj1-x1034.google.com with SMTP id dw9so7786770pjb.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 08:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K8GhjQFjPnNzSCtaTubPnA/pMiRXT2J3GTIJ4LQAXIY=;
 b=GNMshD/U/RuLJMjgNGn5yl1hNABy194MBvDAUm1fuOq/zyCiAjNGCn+ps/N9npkr9A
 GmOP2IeQAdXJZaKqfXTkbGJ7Tdws/yaWdLSveCF3twQiJdZipu2CwyiSC+icnyOd80Ma
 ua/tjOw+5hr0YlHIldHf65P3a6G9S5C8gEW5GRC42pKYqMM/1LYQJeTyKTXSMXCyTlBp
 GV4edIl1eZvdncJhYKWg5Zs7nbZoqHgcHYz6HeouFkR79RHCcBEM3J+FWvMBadaaWkrZ
 RMpku5oOIOb9eHDomA49sZ6jjVqvwRlO7UnEyu/b+LaJa47nWc0U6qoR0UX+DfosOH/8
 5dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K8GhjQFjPnNzSCtaTubPnA/pMiRXT2J3GTIJ4LQAXIY=;
 b=G3EyvHL+EJJDu+x3dAs4SanDaPR3AgGgdXR1Y6GWhu8tXa94eJaiSCVu92bM04amDn
 pZYNo87QoMt6vZDmLr3x9RjjvRVhYF0VtDkPZWiLR9NShVrb64GslRdPWXu9voBT4KRX
 441a1rSFZM3hzr7IEkwLbh8pB1eQwIZ02/f50hqGeEDPcDJ4HG+FMBqW3inJB6RMkxuj
 kPK2qWH4hzW3M3XdBRHS2q87HlP4cTwIUHoFH+qcSMmn2FH3BofXLVRjjl3QyXZentJD
 eJFpOO7kaBnCKM9dMeiDov1rFRD9EpZLxWWhvN8cZ0Hdhp52jKz4TO3K6IEsQA/QEQxO
 vglA==
X-Gm-Message-State: AFqh2krZFrsoBjOWlnbYpPggG+Wyf5Tj1qJ3b8PJLz6l5YjR5JThIoHv
 xftqtNl82yl3zpDpbYoKh4x7+A==
X-Google-Smtp-Source: AMrXdXumH/sfgvFJfuKDgIhH+Yl8P3TJcDBbeYA9JKf/5iHGrdGi7iR5Cq3OEUdRpaiY9Z2ydCOaOw==
X-Received: by 2002:a17:90b:428e:b0:226:d023:26e3 with SMTP id
 ik14-20020a17090b428e00b00226d02326e3mr14692250pjb.16.1673280297890; 
 Mon, 09 Jan 2023 08:04:57 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a632048000000b0045ff216a0casm5302751pgm.3.2023.01.09.08.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:04:57 -0800 (PST)
Message-ID: <a446d67b-ebf1-a95f-0c09-221fede05e80@linaro.org>
Date: Mon, 9 Jan 2023 08:04:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109084121.72138-1-philmd@linaro.org>
 <20230109084121.72138-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109084121.72138-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/9/23 00:41, Philippe Mathieu-Daudé wrote:
> Define TYPE_GPIO_I2C in the public "hw/i2c/bitbang_i2c.h"
> header and use it in hw/arm/musicpal.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/musicpal.c            | 3 ++-
>   hw/i2c/bitbang_i2c.c         | 1 -
>   include/hw/i2c/bitbang_i2c.h | 2 ++
>   3 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

