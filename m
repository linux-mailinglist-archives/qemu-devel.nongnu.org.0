Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B966851A76B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 19:00:53 +0200 (CEST)
Received: from localhost ([::1]:43226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIMt-0004TG-N3
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 13:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIHY-00058X-H3
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:55:20 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:34803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIHW-0002tj-Va
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:55:20 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-ed9ac77cbbso1783976fac.1
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=dGPgaF9r/r9YrhDZu31EeEIg/QpIXKyecmDdFWUfUfk=;
 b=gEFS+BGX4wCd+xNKDj980WtcZBDxLr0vlsUpwIkLzx5SaWTuz+goMMedK6vcbKF3Wo
 14BA2hh5nhIb+lJG50vwJfty+iKgWwZCnLuPp5uAiWbPvZ/9txBjv9r7jHkg5pXSxM4Z
 QbA2v8ApA3lKJTMFNS4UDVwDw9a4IOw684FsnSQ+2YPJh8YsI2r1KVNmqg/g3hlxqmlV
 pondg4+m2pED1CO2gCm8Km5N2stzuAdshR1UpXAVOMkKFVBGIh6VB/6XHb55M4Akho0i
 D9RKuqnmqZdUqfWdqPdM9QOXxivZgdVcl+SxyTZE7MroMORGQZuVLSvGaiHTQ3sqCcdZ
 iPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dGPgaF9r/r9YrhDZu31EeEIg/QpIXKyecmDdFWUfUfk=;
 b=B8ZxXYbLwFlhl8bcWvfflsw35VFScXxDTCMj9EyyEw6yS2zRr9+8b2jJgI93W6RiV8
 JvN/U5rUJX0yTMabZth5eah75YlVzIRxOkuuqyJNmwjq7V7KzGMxddZZulzxBR6w709s
 KlWYfUWouoY6jjX8OsC9Q+BivpPKZ//pz5xRE7hDBKQWAkgLkv4kPQj/J9uwH4LK8DV6
 CkkcIR3HjUPEpsDh92Bcx75K4qSZBa9qnNbZhRCyhP0ZoqR30pCJ3Viu/SG5VAKaTBhu
 wX8cWBG4r1Tb0k/cPwNCn2n8Cg+YVNItlveB310LE3R7xmppmvTqhRI/ocO21mND70rs
 wQGQ==
X-Gm-Message-State: AOAM5307q/19FhWrRCYdoj8wC4mq+EnbUk0UWDxQafJoFDcWJc1G2Eqy
 hOZ9nzaQItbEnIIKgHD17nrt1oP5yZ5dew==
X-Google-Smtp-Source: ABdhPJxTn71KmcbRU7zgWPexDQyHVztcagC+6H4EuzBjXpUa4HU2M5vydjLojxb/rVZTguEdKKKY9g==
X-Received: by 2002:a05:6870:79e:b0:e1:f5bb:4627 with SMTP id
 en30-20020a056870079e00b000e1f5bb4627mr200969oab.74.1651683316652; 
 Wed, 04 May 2022 09:55:16 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a056808069000b00325cda1ff88sm4480099oig.7.2022.05.04.09.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:55:16 -0700 (PDT)
Message-ID: <be3976b6-6e18-e8cd-ae4f-39f0b1aadcaf@linaro.org>
Date: Wed, 4 May 2022 11:55:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 07/50] dino: move PCI bus master address space setup to
 dino_pcihost_realize()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-8-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/22 02:25, Mark Cave-Ayland wrote:
> Add a new dino_pcihost_unrealize() function to remove the address space when the
> device is unrealized.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c | 25 ++++++++++++++++++++-----
>   1 file changed, 20 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

