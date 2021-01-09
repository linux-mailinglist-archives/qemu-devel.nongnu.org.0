Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405832F0475
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 00:47:46 +0100 (CET)
Received: from localhost ([::1]:51382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyNxR-0001B8-2k
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 18:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNvT-00008h-0m; Sat, 09 Jan 2021 18:45:43 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNvR-0007iM-I0; Sat, 09 Jan 2021 18:45:42 -0500
Received: by mail-wm1-x332.google.com with SMTP id e25so11579610wme.0;
 Sat, 09 Jan 2021 15:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I0bhdjWcxmFuZogU0y/NYMm6U6toxyEVThjZP/+f6wE=;
 b=uyx+XXsgotMrzrXjSvdisVZIimxuj3sy+ZSK+FAlNLYg6KspMmRs3dMnzYjeq5Qu9a
 d7XPmYBkHuI9eGCbtbOiHb9j27RCMlyeWiQ5J06BdyXzO0m7jJxXIbG10jNU6i91whnf
 Bwty1hOY19k6hKCgybdX6IHQmRq8Mod8xZNjM4DKMyJnhF7w5wjQ6e7kRXCVrCH2CFO7
 TeVhALjikG6ECcmPlqis1ey4+/Tx644i7DWJm586ucQFrOCMtud2BCCTa3eQfGr4jne3
 6XhGQSRDYkXrckD7pQBo7o7JDjzkSCFw06wflq1WqpuX1hqTunuidvI+h6C5TcKfKC6d
 oaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I0bhdjWcxmFuZogU0y/NYMm6U6toxyEVThjZP/+f6wE=;
 b=FFDCOYyX9sxdk5oog4XUtN2Ji4lsgWeN98RWwa5p6yXBBiqtDx1Y3vNajNi2sjNiq4
 iCHg++/6+yfERyD35HF11zSOMMsjcnkXZipU0GhCZJ6YXHQyQEh6egyLBPzjGy/GNsBc
 nP2pgqXx4r5ziJDYYaY6bFf/Zs6jBsFatZQaGGhMEUasK7ibObh3yTt9NyYo0rv+QYNY
 iwu0HZjhckCYOHiS78gkjwLzHUQF5dQyqrl39JBu6N/g7fIjUnnopn9oP4PMxdlMLkfV
 5Syg/pNpGw3bCYRzaIDSv49s/tSFfvTlAkf/R4tfeTlD8iOcKMTuL6aZ3K7uyTEopPDN
 m2aQ==
X-Gm-Message-State: AOAM533Mlaq3TXYaYq33ccGIHHSrV63L0DdBq82dZbQT3N6mJOuxfacx
 R4S2zxToQCuJqy1kdzflHlE=
X-Google-Smtp-Source: ABdhPJyei8xrOUERkuWHAyjS7jvLnvWKdyQGgELW0zR7CiofjmfO+nMbM3Mde4UqK3y9WaH0Ph0QbA==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr8917025wmc.39.1610235939994;
 Sat, 09 Jan 2021 15:45:39 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id z6sm19028484wrw.58.2021.01.09.15.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 15:45:39 -0800 (PST)
Subject: Re: [PATCH v3 1/6] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
 <20210109123545.12001-2-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <95e18158-ea7b-8bf2-690b-41f1fb459863@amsat.org>
Date: Sun, 10 Jan 2021 00:45:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109123545.12001-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 1:35 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Avoid using a magic number (4) everywhere for the number of chip
> selects supported.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> 
> (no changes since v1)
> 
>  include/hw/ssi/imx_spi.h | 5 ++++-
>  hw/ssi/imx_spi.c         | 4 ++--
>  2 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

