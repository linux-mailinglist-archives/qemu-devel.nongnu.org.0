Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9451C796
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:25:58 +0200 (CEST)
Received: from localhost ([::1]:44034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmgAn-0001bY-1l
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfaW-0004Cz-DF
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:48:28 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfaU-0000VK-Ks
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:48:28 -0400
Received: by mail-oi1-x230.google.com with SMTP id m25so5093349oih.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=PbYtmFOinR4F6D9M4IfCO8q1KICK0KngrfZWc+uPp3c=;
 b=P8JU/jiTr8SUpnn2g5dLaTtANc2tC1MoeLuT5Yx7cn7jp90/P+GZYL2EqfYZhgSluW
 HYkDgdLy6OuUPwfJyZ3015u3/NIRO5d6mJmaC/otjvcnVQaQGc3GygIYvkrcOpFGUFP4
 EJnqZ/H29lCnyOwZcOwt5WjAsVNFMSC/rDsv9lMfDYzFiaM9L4APt4aEiSHmqzOm/OWe
 AhLUhhLBnIp5v9Z+HmFVnCkxYY6VRzClpECphYS8KKVkpPiRCBXKpaydN/7CtiWU15mb
 gZiLdyHwslHyD/QBkv9+2aIRvgBeuE6z7NNPgtMFsGhAJ6V8OQFQyy0Ys5B37QVqDXSy
 xI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PbYtmFOinR4F6D9M4IfCO8q1KICK0KngrfZWc+uPp3c=;
 b=MfT8yw/QTdF3YtXAVee34MUj33eUYkWEETkHmCDHVu9rip6mkQ8E1VT9gGABLxEJC5
 pbpn7mhucERWjimUqVpZn9nC7y6Bd4As7rciFGDbtTQxtpYthz1dbY4bojojfnsDrJBo
 6gCVCpKKKJr13f7hSiZWKx9dtAUbuTC1i0tfMODcaJ1wW7euRs/n7cYYbeNTaiY7LFJR
 40lWrluutUMzW1N6GLU5ybqYchnDOkgbz8X+MiQ7W3g+G3pju3w/XtXpuHAIAxqjEQd4
 uQ4g2qiYA3iNRYH4TdqH0fMwzvp2xmduIUpt4TaLRrfUgRvpzUPdWi9tzQYFf1l6UEAK
 AfvQ==
X-Gm-Message-State: AOAM532IFOBx+sz8mHIWBieB81Kr2I/YsjMRAp+jvNWf73w+lV6CICKG
 cZgeLODupxyyn4l9aW7Ys8LdZQ==
X-Google-Smtp-Source: ABdhPJyD1QbUz1C1rmiblnxdJpRGVhIUN9Q5jS3Hlg6kCo/J9LgxuzMl6O2n/WL7+UF1yNomfB6lpg==
X-Received: by 2002:a05:6808:d4d:b0:326:1c25:fa with SMTP id
 w13-20020a0568080d4d00b003261c2500famr3198727oik.118.1651772905480; 
 Thu, 05 May 2022 10:48:25 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a4ad0c6000000b0035eb4e5a6d4sm988071oor.42.2022.05.05.10.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:48:24 -0700 (PDT)
Message-ID: <cea20bf3-cecd-de61-b194-5e5a1684ec95@linaro.org>
Date: Thu, 5 May 2022 12:48:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 17/50] dino: wire up serial IRQ using a qdev GPIO in
 machine.c
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-18-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-18-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> This makes it unnecessary to allocate a separate IRQ for the serial port.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c     | 8 +-------
>   hw/hppa/hppa_sys.h | 2 +-
>   hw/hppa/machine.c  | 7 ++++---
>   3 files changed, 6 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

