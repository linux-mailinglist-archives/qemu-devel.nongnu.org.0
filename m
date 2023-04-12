Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934F06DF12F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 11:55:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXBb-0007ne-1L; Wed, 12 Apr 2023 05:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmXBY-0007mu-KO
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 05:54:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmXBW-00031l-Oe
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 05:54:40 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 j1-20020a05600c1c0100b003f04da00d07so1953049wms.1
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 02:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681293275; x=1683885275;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1G1Zvns+AoEWg+K5o96IGKLypZ/ZXe2efnsedJe8Id8=;
 b=l3Ed8eOWyXoybf5B/MBO81O42BTp6yPA6q04qD+4QuqMfPVh3xlJetkmg1hEgr4XEB
 jmCg4mYjp+6Q1FY8401J9oJJFJ1ZP0NaeIKDT4MNn3PwEj99uQRSfBSJFwZ6J6f1p+Nq
 rsotFAb4K3BtAqfe5770qFVEtHvFSpol/8l3ZML4IQutBVcpYQnDKhfjKoIQhxcNafTU
 J7bKOvsDbobNWCIwu54lUdtix6nuf5QpKkecdxYurW8mNDM4IIAtqKMRNX+qBh1Sh7YX
 H6hUvrTbUMsawxiOgXG4lF6XqJbt7Yey8wpuFqTD1BMZFvKrQdyCsERTeB0GJSBxyATu
 MsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681293275; x=1683885275;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1G1Zvns+AoEWg+K5o96IGKLypZ/ZXe2efnsedJe8Id8=;
 b=YaXNhv4vKyR8ru8g90r2NR5ldlaYsedyA6ckkMcyGDinqHegwFVMfJ7AZXf3YN91nj
 yla52iJUDiE0i6C+hudH69jwV4/1tQMt1UMns7X9irRv+mUtms1+R7asCl5mp/vqXJ+c
 uWnzarTyEkShxzMv3I5VX3G4x8jRTYl0sRwN/l9m03bAHln5Ivyz/8GMJaAsY1KgZh+3
 1FPMtx0GY15x6NkwgpjF0evtKtDUqlnmSJlw7TdnIviB5n41M9dVeJyRT/4qp998d/ip
 E68YtWQF2mjF3J3ZKExaxMGhL58RgsNpFFxkJjMU8qyx53sVZ9+KsiGmxmTSeL/FRH3g
 pXmg==
X-Gm-Message-State: AAQBX9e3sucWWcrptB1/4OlxmfCnYqpGbwfCiwBU3gMegPoInnZ850Ck
 FohxQCAcujKWLLatwKV5dURjTQ==
X-Google-Smtp-Source: AKy350Z3QypzWSWfNxN9aBD4TJ59ceke8eFn9At1aSnIiroTJcVuJLZwL6irfy6jInDs2JoUPQCTuw==
X-Received: by 2002:a7b:c8ce:0:b0:3f0:a08e:811b with SMTP id
 f14-20020a7bc8ce000000b003f0a08e811bmr97442wml.13.1681293275444; 
 Wed, 12 Apr 2023 02:54:35 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.216.226])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a05600c21cc00b003ed2433aa4asm1761876wmj.41.2023.04.12.02.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 02:54:34 -0700 (PDT)
Message-ID: <b05fa5da-436f-7a49-7da0-3d17a13408b1@linaro.org>
Date: Wed, 12 Apr 2023 11:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] hw/nvme: fix memory leak in nvme_dsm
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Busch
 <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
References: <20230411190448.64863-1-its@irrelevant.dk>
 <20230411190448.64863-3-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411190448.64863-3-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/4/23 21:04, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The iocb (and the allocated memory to hold LBA ranges) leaks if reading
> the LBA ranges fails.
> 
> Fix this by adding a free and an unref of the iocb.
> 
> Reported-by: Coverity (CID 1508281)
> Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/ctrl.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 8b7be1420912..ac24eeb5ed5a 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -2619,6 +2619,9 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
>           status = nvme_h2c(n, (uint8_t *)iocb->range, sizeof(NvmeDsmRange) * nr,
>                             req);
>           if (status) {
> +            g_free(iocb->range);
> +            qemu_aio_unref(iocb);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I note the qemu_aio_FOO() functions are not documented.

> +
>               return status;
>           }
>   


