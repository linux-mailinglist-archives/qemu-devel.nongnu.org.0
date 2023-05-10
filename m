Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584096FE114
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:04:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlLk-0004Pb-KR; Wed, 10 May 2023 11:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwlLY-0004IH-KY
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:03:20 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwlLL-0000ST-AB
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:03:09 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f42769a0c1so33702145e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683730980; x=1686322980;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UygSHBm4w+AhugPLER3oxb+Ecd67ssY6Q5LG0RKq9/U=;
 b=QVLKA1fAcAD0W2V69/weyYBYDbda2dvAyzvQwGEkFC0IIvecrHGIRuM2diWHVQAYJW
 Em7hvzn9gdN4MEU6pnS1I4Es3jgXD8dgk6SgIPt/LrxCECjkWA6p+Z+7FNMTFyJrKLXq
 E7g/PC/CR5++7VFIenCH8WaxJ/DAlJIMBGo/M7XazwQbvAGxaRSXJO3tNzTHgwhj0i8K
 nqoONwRVMuXI1jaMX6F/Lq6Vgsr4fXe4/8VeehkrVI8t3K0yxt768RcJOwZ6SHpvJa7I
 tVY67QHx+Ck/sp+W+FgyVHMqqySxENKJeOk3LpojVnVcr/w/2Lqp8DQ2GXdm0bVm2K92
 ig/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683730980; x=1686322980;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UygSHBm4w+AhugPLER3oxb+Ecd67ssY6Q5LG0RKq9/U=;
 b=Wl+iD/bXTfzHD5mLc6F1T5OVqplcDjBHal4RoVLzvxFWdjOvxOGzsevxy5hKuEXOgV
 qbQSzxn+ymkp0QQJx/vrX43oXhw8Fb8Pa0Q1WxUwGF67PWTaD54Lvi3Zf01waPYt8dX5
 ojW4cpjg00E4rDXmtBZ0wtLhmfmiN9kH/AwuPNclwkI4JBhyaHgiYFPe1IECXqFS5y9h
 pIj14JR50ZvYCChrmmfq0mWwgoEDlzsW5GFuQXMirvcezJrYyfZG1K38vOyWwuCwSeos
 G9TAOm+7HOdRq8EvFAsDC9NaEz+bIJAkhNPeLKiA3ZsburudZ8JnMHi7489e/ekTL8XO
 x5Og==
X-Gm-Message-State: AC+VfDzYMi2KT/YztInwcMG5OQRmmMzy7RkGAxqbt45+FZCyltE/QQxt
 Q3G0V6eAc8cEJyYA37wDFBPiNkfkr+jxSbBfN9HhCw==
X-Google-Smtp-Source: ACHHUZ7A+2Kx58zqsoL1uUVkRKeGwa8QjSk6hogfkQXHbRhqF2ZvQVBazNABYw8bigsDs7o0Cm9bng==
X-Received: by 2002:a7b:c345:0:b0:3f1:82ba:b03f with SMTP id
 l5-20020a7bc345000000b003f182bab03fmr12508627wmj.18.1683730979954; 
 Wed, 10 May 2023 08:02:59 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003e91b9a92c9sm23009810wmc.24.2023.05.10.08.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 08:02:59 -0700 (PDT)
Message-ID: <04101221-2a71-3ff8-2249-d5f1be2cc3fe@linaro.org>
Date: Wed, 10 May 2023 16:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC 1/3] ARM: Use normal types
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20230510143925.4094-1-quintela@redhat.com>
 <20230510143925.4094-2-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230510143925.4094-2-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
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

On 5/10/23 15:39, Juan Quintela wrote:
> Someone has a good reason why this is not a good idea?
> 
> Signed-off-by: Juan Quintela<quintela@redhat.com>
> ---
>   bsd-user/arm/target_arch_reg.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

