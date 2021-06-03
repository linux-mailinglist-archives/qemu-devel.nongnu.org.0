Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705A39A81B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:20:13 +0200 (CEST)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lor0u-0005MB-Ae
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loqza-0003dV-7b
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:18:50 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loqzY-0000s0-KQ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:18:49 -0400
Received: by mail-pg1-x535.google.com with SMTP id j12so5649201pgh.7
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dJuR9ZJ9eVjO7s7tOp3TBktamTn6+E8jhUD8ElgrVQ0=;
 b=WYQqpkXgym7Vasg8krjm3e0aJRWPqN7mA9KmsmCD2UQu+S4ybgG1jU582ZJ2g9Q4Q5
 SAw7Qr5B1BkTFDAKPZaLjfjOIuM+qBLlrmxvzyYflBb6eGAKbinaM/IvnkrI5GGcul18
 tb29pFpSPxGi0ifraWQLb3Q1RpDp0swQfpSqqe7jJlO+FtvGlHa3Z7k90Aqr3akTlFrN
 gSQr5g3ZMhEc4XfYfcw56K3GAE1GQ6VguvY3yxD6zvHd/dXQiZoT5mH9bbTC/ukHCci4
 hr2qb6XH0fB+KSQ2hJZ7r7MVQXr2Lj0Vi+SN+UmvQNtLHieFT79aYwh90FmXET/6FuoM
 78Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dJuR9ZJ9eVjO7s7tOp3TBktamTn6+E8jhUD8ElgrVQ0=;
 b=YjXByazCtLv1IC+TASxH+Si9QKnTSs/J05vPGUY2ggLHJD90qXORvXKboTeh16r9EX
 CJv4BMHd4Ec7ltn8CbMH7pxHtuQODWR68YY90lmPRGVXmaUxOG3d14SFoow8+xAQsAi0
 MbD4T+eGymVMnQlNqAiXAZEw9AJWd7x1sjq9BmqHixVtrel2m0XvefVu0l5Ma++cOA8w
 zso434SzRn4Z78Xax0XQnkgBpHwirta0ARk6/im4Zeo0teluAxMameB7+/jWEfIth5NJ
 99Vj5D79OMi7fd4pP5dGQdS/DAFzvdP0gWNZs2DHOb7TBY0ts8vQL7TwZC0+Vxy7PPUX
 yV0Q==
X-Gm-Message-State: AOAM531jT7RlyxPGCXKehBCyndCOmxwVkpiXyJRYOGX9aIeaZj1k12XI
 HoyskSKZCjcuMfNdgFFYktwj0Q==
X-Google-Smtp-Source: ABdhPJx+uTEWdu6/Pf4x5oNK/ljuZmGKeDGAqXRrxE3NQiQ6TqXg/NAK/t8ZmwAITvqbkznfplO89w==
X-Received: by 2002:a62:79cb:0:b029:2e9:9951:eac8 with SMTP id
 u194-20020a6279cb0000b02902e99951eac8mr153908pfc.59.1622740727248; 
 Thu, 03 Jun 2021 10:18:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x3sm3391102pgx.8.2021.06.03.10.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:18:46 -0700 (PDT)
Subject: Re: [PATCH v2 05/26] s390x/tcg: Simplify vfc64() handling
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-6-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <decec798-088c-e481-f609-8e575aa65e6e@linaro.org>
Date: Thu, 3 Jun 2021 10:18:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-6-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:27 AM, David Hildenbrand wrote:
> Pass the m5 field via simd_data() and don't provide specialized handlers
> for single-element variants.
> 
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/helper.h           |  6 ---
>   target/s390x/translate_vx.c.inc | 45 +++++-----------
>   target/s390x/vec_fpu_helper.c   | 94 +++++++++------------------------
>   3 files changed, 38 insertions(+), 107 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

