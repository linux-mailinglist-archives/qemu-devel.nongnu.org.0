Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421DA38C8CF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:57:27 +0200 (CEST)
Received: from localhost ([::1]:51366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5eY-00070U-CJ
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lk5dY-0006IT-RQ
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:56:24 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:34394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lk5dX-0000IU-Bk
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:56:24 -0400
Received: by mail-oi1-x22a.google.com with SMTP id u11so19710813oiv.1
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Q6O9wz6KtKi/A6OFb5JvN6ykOpZwwwMk6banvGYglU8=;
 b=Wq54NzGQSXTN5QnyBNvKdoi6q/wPlu/5Xc5JqNBLAMeEP/PDH+NA2tWbzQe3dMTiWj
 Uj/aKMG90zsN8jjWIVbZ1XulyltSljXUHTEjQnstdFV2LWV2hGOwGCGK7xOyJnU+lbhu
 TUSkfbYIZRFoSGeotpmuOfXFO3GpK7epOcDtzKto43S5uHqWkDKOlbEmAh8bZ5oIfqes
 wXCn6v8E/EdsdYHUwaaoKyX0bzc6e8DX3v68FDUio2+FU9YSPT8/MKRobtNPTj76PvEE
 CiY9Sr/ZLvytbzjrMBd3yoyVpC0Hldgq8SGzMiGnVkpl7N05vadTpY84zWWhHK/sgMoi
 oUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q6O9wz6KtKi/A6OFb5JvN6ykOpZwwwMk6banvGYglU8=;
 b=nXeUASq7lWA/Q/RsGMIGC33CLnl5AK7pEayl2TZ+pE8jHTXfq78Sqw9EJLwWmloVzS
 WUjAXLnGzNHf8+q5Rz2CaF2aHbu+eHmDpcyd7i5S/r0L9KxVWw/c6yATDriG7Tkqpid2
 fqFaul3uCHzww2BJYOSreALZLJLQtkOuXWvF4K2NCCHl2STH/jAfBlryyStcwvjyrDo3
 gVZno8PCxlvGSGAl4OywW4F/NObsbBb9n6JFSJhoCqXj+ad8mGbgYUNEtW6lY99CExHB
 21Un552MZ146AckN0TO1N8JIj5106aEv+Cgh2TAiTk8lQLeBrFKL3mHBr4R44NYqhKqo
 L4IQ==
X-Gm-Message-State: AOAM531ULTnKi5yayzIa7zU7DXTCxj4WPhOaQQN1L5TZpsfO/eDcub6I
 cW5ez4EHqd44d/M3QiHpbaps3A==
X-Google-Smtp-Source: ABdhPJwv348203ELWRAWPTX2M9G8PQ8zIkzCegg0PYftAXbikq5T4IZshXkB3uGKRbybiMisO9RCmg==
X-Received: by 2002:a54:4113:: with SMTP id l19mr2196498oic.38.1621605382020; 
 Fri, 21 May 2021 06:56:22 -0700 (PDT)
Received: from [172.16.23.44] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id y34sm1303442ota.16.2021.05.21.06.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 06:56:21 -0700 (PDT)
Subject: Re: [PATCH 4/4] target/m68k: implement m68k "any instruction" trace
 mode
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
 <20210519142917.16693-5-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf9e840a-385e-fa7c-b0b8-14998940a616@linaro.org>
Date: Fri, 21 May 2021 08:56:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519142917.16693-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 9:29 AM, Mark Cave-Ayland wrote:
> The m68k trace mode is controlled by the top 2 bits in the SR register. Implement
> the m68k "any instruction" trace mode where bit T1=1 and bit T0=0 in which the CPU
> generates an EXCP_TRACE exception (vector 9 or offset 0x24) after executing each
> instruction.
> 
> This functionality is used by the NetBSD kernel debugger to allow single-stepping
> on m68k architectures.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/cpu.h       |  8 ++++++++
>   target/m68k/translate.c | 27 ++++++++++++++++++++-------
>   2 files changed, 28 insertions(+), 7 deletions(-)

It wouldn't be difficult to handle 'trace on change of flow' as well, if you 
wanted.  But this is certainly good.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

