Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186F65A1DEF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 03:06:47 +0200 (CEST)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRNo5-00040z-JZ
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 21:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRNj1-0000nF-3H
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 21:01:46 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRNiy-0002Yr-VZ
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 21:01:30 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r69so53515pgr.2
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 18:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=+L51IHu9mT7+2mWwxY5He3zUHx9YollQ+fftYAF+l5s=;
 b=CqElOC/zuj/SmZw0K1owXACJCLc+yHyH0l15wcsFg9SnAwTIspPcXJznD+eVancb2i
 ILQe3CeQ1cmD9YXykF4+ddBdI+Enx7IsjU7L4wGqLjrBvZIQhZNis+aZAIclLEoQwsSp
 HqDqAtW7z1CJ+ziol7ITiBEdoJxN350YofRWj7ijMeD22cM2sW7CiY4L++VVQdPO1eC7
 br0HnR5T6VzeK2zYmeOrjcaL+g2PcLbEPEpOynIHKkja0x2/bxf76kC7cu7md7D9DoLj
 nyqzFsvnWcq6IdrmuvhNYBBo+UPefl6XXXU8jgPuPcLT15G0KdQiIwq3hcpjpbSWcGlZ
 3/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+L51IHu9mT7+2mWwxY5He3zUHx9YollQ+fftYAF+l5s=;
 b=nSq0PPqA4Br3esY9LksFrO323vkTiZagBvz8VvdKi+n5imCKRJwXAIOKQRa8/iDw6T
 dEjGEitRzyjYyHslR2GOcoJFgSATxdHoVH8XmCB6h/QKSLA8ubLgf45w4XA+mLgIki0F
 m89NoIiRKHTKH4bQYvYEzrC8jT89kR+uR2DnXljcSSwLoGCWuQDwA2Kvy1KYOeKSVrlp
 BQqPg8WRZxsZQUSHBLpavIz7u+o8848E5kYJXimBg4FIILa2sTyqeW0RUHNBeImS6ttz
 fFUIpoOQXejXHPiY1I/R2dAXxklxFno6HOziG6RKoFk6ULbtsVu9EEAV7SRrGdXrNLVt
 6uuA==
X-Gm-Message-State: ACgBeo3qD+Ry2ZmcWQ4U1BUkZpLxhfc2a2uubcTcETcngme+4rChLCf1
 LWnt+MvGFQTLSYUDjv9oXIuLow==
X-Google-Smtp-Source: AA6agR5cRAo7PNC4RfdcDnsMQn12qdtHUG9fPCnOqRLfn96AIRF4jMUUG7kvrGJcQ5+vYF/fstwA/w==
X-Received: by 2002:a63:2cc2:0:b0:41c:681d:60d2 with SMTP id
 s185-20020a632cc2000000b0041c681d60d2mr1283195pgs.502.1661475687343; 
 Thu, 25 Aug 2022 18:01:27 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a170902d49000b0016ee26224a4sm159565plg.305.2022.08.25.18.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 18:01:25 -0700 (PDT)
Message-ID: <4c20bbd1-724f-a73b-c67f-a1c90b267e6f@linaro.org>
Date: Thu, 25 Aug 2022 18:01:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 13/18] i386: Dot product AVX helper prep
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-14-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-14-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 8/25/22 15:14, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> Make the dpps and dppd helpers AVX-ready
> 
> I can't see any obvious reason why dppd shouldn't work on 256 bit ymm
> registers, but both AMD and Intel agree that it's xmm only.
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-17-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 80 ++++++++++++++++++++++++-------------------
>   1 file changed, 45 insertions(+), 35 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

