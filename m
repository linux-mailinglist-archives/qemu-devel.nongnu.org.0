Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D6551C6B0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:04:53 +0200 (CEST)
Received: from localhost ([::1]:35590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfqP-0007wV-2p
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfX9-0000MA-Iq
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:45:01 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:35463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfX8-0008GJ-25
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:44:59 -0400
Received: by mail-oi1-x235.google.com with SMTP id m25so5083639oih.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=hXGI80pRzjNX210LK3ZeTDAfk0u793dNvTDTgZHQc44=;
 b=AivKlL2r3tKLV0AXKHzAH3Byiwibq9aAtxdtWOwpP48KDTVYLkPP2yZ8dxzeP4cuDb
 SuyLhVdMi/nzds09EyRlm3MYaEM36CDzYBgtrH/VMAfadB6uUz8IZiYQ5GhzlVXy/HXA
 vrLGwfl8UPXoi6ydicSCQrvir/EONzWlc7N8/mEkoNJ17qOZ8l9GAl2MCkOl1V5xdqrF
 kd8B5nJCxWHczBBQVCbyr1DJkI/svq9LwH6lc1e1UBMOGHXpK0eke7OH4DgL5069rHzk
 p6Eveiw13c1OrLQVgeqbbd7VPNM6rX+qreNk5unDzM4psc1aCJHSDYMFjVo03YYLiBFy
 qtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hXGI80pRzjNX210LK3ZeTDAfk0u793dNvTDTgZHQc44=;
 b=IHskuySDw+jt6Bd0cXog8mRAKXm7HVta4X6zavttfNWV032ANYEVJpP3XWF679Ov9e
 hcKoEbtzJdZlH5hLritgfwa5XSgcqnroV8PZ1mRsY/9x8rEw4TgXHpB3lfWjZK5/6ZJc
 +jSmpCtJel4a3rf6RsPe4L5P9DJtjAsJ487Tt5zgQjGMsrcHeQ24nOFPFtJ//qDu95yV
 WxUmOj5h3AcLAjpM1tHwEuzt1xJC0XCMwqc7NxjQ8CHN83KJm5FwxnvJ/UJL+QrY3Xte
 2UAx9DfqWOYlv9erM5Cr9HJAvqqB0n1yjuJIW73hk4/86R7Fua9hVNsfabfRGsB2z5ty
 I3BA==
X-Gm-Message-State: AOAM5308IFEB1ZcnsPlhO3X1U9QsZXp9nLYKn0xg3fnif4iLPBuQskmy
 7BV8/1F2PcQeeXgZg1XsxsouEw==
X-Google-Smtp-Source: ABdhPJy65sRLTKTuai0yDl7EsdkjD+cZZwflWtAji4Bdt/AArXw/HULJVlOCjX+ykuE6Ig1tQctcHw==
X-Received: by 2002:a05:6808:aa6:b0:326:e32:cac1 with SMTP id
 r6-20020a0568080aa600b003260e32cac1mr3046235oij.262.1651772691601; 
 Thu, 05 May 2022 10:44:51 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a9d6511000000b0060603221266sm815669otl.54.2022.05.05.10.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:44:50 -0700 (PDT)
Message-ID: <fa49dae9-0ba6-6d9a-45ee-506b8d6ad384@linaro.org>
Date: Thu, 5 May 2022 12:44:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 14/50] machine.c: map DINO device during board
 configuration
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-15-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-15-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c    | 3 ---
>   hw/hppa/machine.c | 3 +++
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

