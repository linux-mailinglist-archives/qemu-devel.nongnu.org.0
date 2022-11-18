Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3861A62EE50
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:29:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovvlj-0005x2-DA; Fri, 18 Nov 2022 02:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvko-0005o1-UD
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:25:43 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvkk-0005UG-Aj
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:25:38 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so6902267wmb.2
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VeZRG5QbdpKU8803PNWyUwshhMcv+QDhge1lLjb/D1g=;
 b=WOWeLtIKgFLICapXcHe+fIrez3t2PAMZQEdPqWS3TdgTlDzcZyL1qH3kwqE13DdoL7
 BHBh6wIRYgVj7l5r9Lrcqmtexx8VeXIPfIyzZvh9Sg8z4upjKdFTFVQchJ5C1/Vuh0PV
 DkofgQ4KLADb2hKkzioGtIUtkr/8RqVdTsLMA0Di72Kr3p5A9AS5lY+hqUNRJspgIyk1
 yjwQu5uQEfMoZI8u+PLXg9zW2UHJpOA8w2p4k9fCp5gHUcynrRDycYyuXxBWxwDwGpRT
 D0Nzaw4vH2cuQ3FzcmDG4b8a+opayDXbwkGzIVhEadUDjW+86WZAQYWG5L63zFSwNsQL
 eh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VeZRG5QbdpKU8803PNWyUwshhMcv+QDhge1lLjb/D1g=;
 b=bvv4SUrRlshxmlb63wZLakCuVziYOVghCIpKP8i2liKd8pqZdDgwevfYk6jNPJwHS0
 rgG/Lh3yoxoPcAiQ1n70UV+rVlnvAEQiObd04yX/9pXHtyIaoy14Cle3kIpym28i7JI2
 vWOoSeKfOqivreesi13dW0i0RBkLf/epDv3ZisNj0R5r4gvZczuR9ivYMKi5DjnDpQpy
 fdJEj+ontNOAB/rfzc2JfqCIOtkIsdBW+Ua5hcu68Lmb00Zt9WTymTSUX49iGHBue+3c
 efbQzsD1DfpxsL/3VsQAXjlf4tgAJNZikN8j4sf9O8wgK3VKqxlM/yytLBY9tBmXoFGX
 dyGg==
X-Gm-Message-State: ANoB5pmUOhjOjQ8y46qLYTEo8KW0DIRLl+YSKMCy0PrHbIKkY7UmRXpT
 rhSS3noaSvGCWDsAdYEK6/4v2A==
X-Google-Smtp-Source: AA0mqf7CRAeFgd3ZjUsdHiYlQPW5fMA7lSwr2J/+GfNv8b2wwSH/xbT/pZjll6/kDlMFcZ0ccX436A==
X-Received: by 2002:a05:600c:21c6:b0:3c7:19a6:8146 with SMTP id
 x6-20020a05600c21c600b003c719a68146mr4058909wmj.158.1668756332876; 
 Thu, 17 Nov 2022 23:25:32 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 y8-20020adfee08000000b0024194bba380sm2803632wrn.22.2022.11.17.23.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:25:32 -0800 (PST)
Message-ID: <e0351cee-d421-f6a1-3847-5050b647fcb0@linaro.org>
Date: Fri, 18 Nov 2022 08:25:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-7.2 v3 2/3] rtl8139: keep Tx command mode 0 and 1
 separate
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Tobias Fiebig <tobias+git@fiebig.nl>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org
References: <20221117165554.1773409-1-stefanha@redhat.com>
 <20221117165554.1773409-3-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117165554.1773409-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 17/11/22 17:55, Stefan Hajnoczi wrote:
> There are two Tx Descriptor formats called mode 0 and mode 1. The mode
> is determined by the Large Send bit.
> 
> CP_TX_IPCS (bit 18) is defined in mode 1 but the code checks the bit
> unconditionally. In mode 0 bit 18 is part of the Large Send MSS value.
> 
> Explicitly check the Large Send bit to distinguish Tx command modes.
> This avoids bugs where modes are confused. Note that I didn't find any
> actual bugs aside from needlessly computing the IP checksum when the
> Large Send bit is enabled.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/net/rtl8139.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


