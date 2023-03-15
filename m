Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E506BB61E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 15:34:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSC9-0002tr-Kc; Wed, 15 Mar 2023 10:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcSC7-0002sY-OF
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 10:33:35 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcSC6-00075z-6u
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 10:33:35 -0400
Received: by mail-pf1-x436.google.com with SMTP id ay18so11845811pfb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678890813;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p6Bf7FVvEjSpraVBI8ISa9Urq/33NOheMciMHa8FVkE=;
 b=VcLbm0SuY7PlxkSqUa9ENqmK6Bxbes3xz8q/sRHtjcCb+9bvUpTNZxW0Qk5VAHKKLN
 pSowxHqGVboeWw3L0eZeiu4xLplggMpnBjuqyppDwssc3E4Ay1FVOFqW/6SsTWww/zI2
 zjh/E5FpfF/tPvdnIzDGogsyj+AyMp56DEFNWCEHpd3MLWXLwQRm7aUEh+yfh7fZB/RF
 /5eF7/h36JC//cnSnmTMu3QkyKJPxTcsgzrQDxqGaj5rl7Fm4y71erH0PcVinHh6qjaq
 fgDyXWlmmNEzqqD37NHkRa5BSeb7ejFJxQsxCq3DcqHQAxvkGMoHQunvifOvdfTep89g
 vgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678890813;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p6Bf7FVvEjSpraVBI8ISa9Urq/33NOheMciMHa8FVkE=;
 b=AwGu7GqUSgD3MhHs1mMcvRiusCTl9ur3nd1FOT1cMZC5ivh8s6/vkKfydjotd/CDC6
 yU02wC4YeHz5d0hCVqySIZ8GYkQpzmDe/ncai4Y+qDhNwt1DHdr8FA3Miu/1W5vIByR0
 9XDwbCfXLvJlL3SDgg7DIedbzbJBlJNSphhd9ANbR6HsuERcnaZ5g2ss3C7Okvb6DyvD
 jFMcqEXojFQ+yExYHf47kQ8xdKvF4vw84btmxUDKD89gn6FzFA1ussZW6poyH6Y91IgG
 BvEoTOxkJ1IpLHiESDihOoBtBUu9EibXilDD7r5iJ1rZQXQiY08PSYdyLl7DM1/337n/
 dfvQ==
X-Gm-Message-State: AO0yUKVgk8qMo/ioWQ6yR1K6bZGIuGJDPe4amuCrcwtBRLLjeTWPyo+P
 geqlRs494uSkyeIoErOVgRMMMA==
X-Google-Smtp-Source: AK7set+oK2DyS/+xUQvT9AVWz2ysf77whxcaulN8AdrdCcnly1K21MYc937F9H38ZIfewQp9HwWm+w==
X-Received: by 2002:a62:1849:0:b0:625:a34a:89e8 with SMTP id
 70-20020a621849000000b00625a34a89e8mr1991190pfy.2.1678890812754; 
 Wed, 15 Mar 2023 07:33:32 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 g21-20020aa78755000000b0059442ec49a2sm2440941pfo.146.2023.03.15.07.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 07:33:32 -0700 (PDT)
Message-ID: <37b1c5eb-7a23-dc61-5e36-b95a544d3d87@linaro.org>
Date: Wed, 15 Mar 2023 07:33:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] tests/tcg/s390x: Add ex-relative-long.c
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20230315001117.337128-1-iii@linux.ibm.com>
 <20230315001117.337128-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230315001117.337128-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/14/23 17:11, Ilya Leoshkevich wrote:
> Test EXECUTE and EXECUTE RELATIVE LONG with relative long instructions
> as targets.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.target    |   1 +
>   tests/tcg/s390x/ex-relative-long.c | 159 +++++++++++++++++++++++++++++
>   2 files changed, 160 insertions(+)
>   create mode 100644 tests/tcg/s390x/ex-relative-long.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

