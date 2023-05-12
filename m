Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC50700DC2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 19:19:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxWPd-0007bV-Ir; Fri, 12 May 2023 13:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxWPb-0007ZZ-Nh
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:18:35 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxWPV-0005SA-Hu
 for qemu-devel@nongnu.org; Fri, 12 May 2023 13:18:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3063433fa66so6708663f8f.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683911908; x=1686503908;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V5xBRxPHKW+2lunBgIqBggurjCyZEOlIZ0a+n07+h4o=;
 b=vIeXCfJJm31OT7qrq1kgfqj+RccQ+dXEl+Q5MD2yh+uSv7Z0C+5EoL381aiPYpjyxB
 2ebWX+/Q+02B8LyX3hWsVD2BvJkMBPoYrAdHzZH3PmDVjvZBGEvfSKVPOlmXws5SJkvF
 qHfETOhv52ZyFGMZMMrG16Ft3xGMr6qdZXHDAAjFYQMLaLpVumYkuv9oJsI0KX4ErMxj
 YTkoJVRIAs7SuC2TiLxxTnOLC7GnEhD8NI8Pb5fNefOMk6we/kFW1Ue6SdCCWCip+6PD
 Vh0CNsRWsKG1ynC+hRZr0Vh4DjQ4BvRgLPqHX3nRBpwZKrB8mooHkaZfdzELotRYUXbL
 HQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683911908; x=1686503908;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V5xBRxPHKW+2lunBgIqBggurjCyZEOlIZ0a+n07+h4o=;
 b=STRCdA3jh4GMOJ7aP8ykMQJ21y4oYFWJ64nbTnPYVc1aLbXHMdZzm9p2ttKw3jYIz3
 3W+5wF2C/bjUCAfRB7LcTC6gIvxXBYTL/fh7OdIOO88febGSrgf2iVIWehgucLiW08TO
 /f4Gn+0f65yyuYjbR58TdyNbscTBLHZIKB+7KtxlIFkDdXDLiQTIFLubkxXCn4etwjp9
 /nTrJ7Zu+hpybI4/jmaua9ugz2PeNzWoGq4d6Hqivn+PgxUr8dyJ0NZaFzwCSuzk+jUi
 sXMD7Wk+n7plKXW6X1CuQCI/DyxsAFoKoRKUaPabTwjKbK41zaV+R4f105WAxvmTrOQV
 glOg==
X-Gm-Message-State: AC+VfDxXIEBBFnRdbGpPZ0cRJZRLBQA0GDx3sM9SQnpyTFKoEptt2hlj
 WLca+xNrf+5n12Q0fOT60Wlk0g==
X-Google-Smtp-Source: ACHHUZ6l0ZyGd7RyqxSnM8GwSjNC33C57VzzKqE5ka70T1n2nUbK2yWPAi/UHOUXGHoDnXxgXmvo6Q==
X-Received: by 2002:adf:e341:0:b0:307:5097:ab60 with SMTP id
 n1-20020adfe341000000b003075097ab60mr16504951wrj.63.1683911907851; 
 Fri, 12 May 2023 10:18:27 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.153.246])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a5d4578000000b003063938bf7bsm24097409wrc.86.2023.05.12.10.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 10:18:27 -0700 (PDT)
Message-ID: <592fe193-0bb5-4559-f5ee-5aaf1f4ec941@linaro.org>
Date: Fri, 12 May 2023 19:18:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/3] hw/loongarch/virt: Modify ipi as percpu device
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230512100421.1867848-1-gaosong@loongson.cn>
 <20230512100421.1867848-2-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512100421.1867848-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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

On 12/5/23 12:04, Song Gao wrote:
> ipi is used to communicate between cpus, this patch modified
> loongarch ipi device as percpu deivce, so that there are

"device"

> 2 MemoryRegions with ipi device, rather than 2*cpus
> MemoryRegions, which may be large than QDEV_MAX_MMIO if
> more cpus are added on loongarch virt machine.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/loongarch_ipi.c         | 44 ++++++++++++---------------------
>   hw/loongarch/virt.c             | 12 ++++-----
>   include/hw/intc/loongarch_ipi.h | 10 +++-----
>   include/hw/loongarch/virt.h     |  1 -
>   4 files changed, 26 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


