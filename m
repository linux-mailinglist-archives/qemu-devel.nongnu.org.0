Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DEA53D0F3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:13:45 +0200 (CEST)
Received: from localhost ([::1]:37152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxBnt-0007GN-1y
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxBiZ-00033Y-M3
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:08:17 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:50758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxBiY-0001Le-4a
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:08:15 -0400
Received: by mail-pj1-x102f.google.com with SMTP id e24so7944156pjt.0
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xeFPXKCtH3cLduYKtlR2KYFSp5NNMdisw81tSV+v8Sw=;
 b=mrNHuLqqXTg3cJ7aVx86B1WIkVToCaw0d0nYB8Zw3pgG5zWI0FJKXiZUK19Oy4MDGr
 x3jJ7le+Fls6Y14u5XC4R2l1+ExUYs0tURnbUz++L2S38ysYGbcaVxUU9aP405u3UXbe
 CXt+OJ3sI4m240JlXqJS1tfoyDQg8rvHinzPLyuicdq989Wg9k2jfhhm3hZbFQ/QEMA7
 SFpRqPaVByFaRjAdpIH7xC7JLy1ViHcRFx0wL6lsgF96w9/BQq9n/G7jYaiCMbgeQ/tW
 ljnButD2gzunZQyUD6hd+W1k605N6ML+CMrKUIVXL9Ff4CrGa5+xmu8XkQbdL6cDY597
 7i4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xeFPXKCtH3cLduYKtlR2KYFSp5NNMdisw81tSV+v8Sw=;
 b=yXAw/D9ap1DRSVPe0zBtLpzjsTJXOlKdrRIfbFMgWbCH6fUd8J7zRWoboK3H2Iyet7
 yFdWO7cr0HKWFolhsWNE7Cr8QrVR1B8M3sie+vKfodKdTg4MxnfcD+6H1P6NvfwzNW8J
 15z5ijxQknSu+99lsHk1C9fHFH1VvOpM2/uQfDQr+P0EreltRa1zLXt8S3VW9elJm+po
 OFZvCWm4jPYpsrSwU6nYX6xwAZqgbFyf4vn3hkB2wYi88BuXu+LwPqm27JXnV5uqQkKE
 VlblsSkfwPyPRshcdMybiHUZgZCr5w5GBRn4vEXsGMUArgQKNFcdd1vpVOGHtSx2Kn4w
 Jbrg==
X-Gm-Message-State: AOAM533UR2hwsbkT0xJjmkUwSSRfBeT/n1byaQ1U+8QrwOyb7g4Sx8Qc
 BkjXP9ApnWqYZqzK6Ejs5MTo1w==
X-Google-Smtp-Source: ABdhPJwwsInYgGIEddoNbVLnfpDr1hCyj5/sD7ia1JE0c6b4k4g1u7B8I9sA1UjvWPawPoJk4y4feg==
X-Received: by 2002:a17:902:d64e:b0:163:5074:c130 with SMTP id
 y14-20020a170902d64e00b001635074c130mr11596668plh.125.1654279692756; 
 Fri, 03 Jun 2022 11:08:12 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 f132-20020a636a8a000000b003fd31d64e23sm1383965pgc.63.2022.06.03.11.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 11:08:12 -0700 (PDT)
Message-ID: <6c032d08-1da8-5729-7723-b6bfa95758b5@linaro.org>
Date: Fri, 3 Jun 2022 11:08:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RESEND v3 4/8] host-utils: Implemented unsigned 256-by-128
 division
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220525134954.85056-1-lucas.araujo@eldorado.org.br>
 <20220525134954.85056-5-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220525134954.85056-5-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 5/25/22 06:49, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Based on already existing QEMU implementation, created an unsigned 256
> bit by 128 bit division needed to implement the vector divide extended
> unsigned instruction from PowerISA3.1
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
> This patch had received Reviewed-by by Richard Henderson pending on the
> placemente of clz128 being moved to int128.h, but clz128 ended up being changed
> to accommodate to int128.h (i.e. the lack of clz64), so out of precaution I'd
> like to request a review of the clz128 implementation
> ---
>   include/qemu/host-utils.h |   2 +
>   include/qemu/int128.h     |  38 +++++++++++
>   util/host-utils.c         | 129 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 169 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

