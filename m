Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE00525EC6F
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Sep 2020 06:09:23 +0200 (CEST)
Received: from localhost ([::1]:53438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kElzW-0001Cw-Np
	for lists+qemu-devel@lfdr.de; Sun, 06 Sep 2020 00:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElyb-0000CZ-9Y
 for qemu-devel@nongnu.org; Sun, 06 Sep 2020 00:08:26 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:53735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElyZ-0005vc-Rg
 for qemu-devel@nongnu.org; Sun, 06 Sep 2020 00:08:25 -0400
Received: by mail-pj1-x1042.google.com with SMTP id t7so1884658pjd.3
 for <qemu-devel@nongnu.org>; Sat, 05 Sep 2020 21:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PCSxRIYL5MvsEumYLS+k8NBn0TzZSDj9/oWkGoo/eyo=;
 b=Hy7POcuUHVucIUGVOA/UYpD+KzWvMF6XYR/InYDNc4MTXGJxCgsqG2FhwWYeUbP2JG
 KBsfI0iZBi5qXbhvUrjzDhcOCSuZW31aSkAuyfVR8u7fm6+1dXsdnjq3odjdQ9nMxrPL
 QcuZlty7Ag4PqmrmJDV36gmoj2eyO6T0Ao4L7Y5j4ebexpk74WapCFn4GtBEKR861Cbq
 i86PP+oHuFsuchP8iRF5Nt0EHY98Srf67EbS0PnSLIXITJ7uz/FsG3JgWRRPSuB2dM70
 PE12pXGxyzTRofmBBLy95/80QWD4EAkpfE4EM2GgiIYXjVnGdu/fKQc5V5M1Ktsoi6Fc
 A5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PCSxRIYL5MvsEumYLS+k8NBn0TzZSDj9/oWkGoo/eyo=;
 b=MitN6PpsOcXEftuoMd/MwqcYXCCwVt8BfrYMDR40qlDyyXk/drLo28TrH4/6Sb6AuI
 o9psQtderaOSLZhh8EGdXxgMy4y1p4QU3Ri30sfRMiCPnwPrwH7V8smHus8aKOxmiK8K
 6KKYcqDPeqUJxRjMGxn5iQtlgHBqr7nrf6CdarnmPjX7qb54y2J//eWHmn//KdhJ3q+T
 at//8VkD4wLIQHJwCu/dxHeWB+dVlRONe6sq7g5CarpxBmCZL2OBUxEr5hfobMxsxH1W
 vgZ9Ifwm4tXaa06ZNafJDweS0MY/lPlKI2pZ+l5NT/8fRikWHR2Chl2Mmdpfcs1Kgu9H
 oFtw==
X-Gm-Message-State: AOAM532Z7rh3EeyqjZwUwb4dy7y70VaOhC1tADUbXhXJJI+Di/6cChp8
 vLQ9KMlxKvuhE/yf7g211DxI4Q==
X-Google-Smtp-Source: ABdhPJxVf8pqt3sbtFj2XDMDvkRlu0NQzsDEY9p97AbGfY0pB3tFQJwtkjX4wbbEqd91mCtVJs/n5w==
X-Received: by 2002:a17:90a:4314:: with SMTP id
 q20mr15193597pjg.49.1599365302655; 
 Sat, 05 Sep 2020 21:08:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id r123sm11180142pfc.187.2020.09.05.21.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 21:08:22 -0700 (PDT)
Subject: Re: [PATCH 3/3] pci: Let pci_dma_write() propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200904162620.657726-1-philmd@redhat.com>
 <20200904162620.657726-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6fe308a4-80b4-8de0-32fc-6d5f487403ca@linaro.org>
Date: Sat, 5 Sep 2020 21:08:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904162620.657726-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/20 9:26 AM, Philippe Mathieu-Daudé wrote:
> pci_dma_rw() returns a MemTxResult type.
> Do not discard it, return it to the caller.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/pci/pci.h | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


