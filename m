Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6E639A958
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:37:59 +0200 (CEST)
Received: from localhost ([::1]:60528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lorI6-0005jh-8S
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorHM-00052D-6I
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:37:12 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lorHK-00034o-JL
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:37:11 -0400
Received: by mail-pj1-x102e.google.com with SMTP id i22so4104283pju.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D8umjxCVBkSMCYmdWgCi0WZdZ4vJld3ztKtKRx7frxg=;
 b=hxnqSZJhQ2EFW8r6b83kNGvfhX8Tzb5EeYwpiZJHbW4MG0NUm0ufaTVh75vJheSrkb
 Vn18qqL1FDSuAfGR3Dvzx5KX5OmObAdA0ayPhnDH2Qi2XBlZhgfvFIAk3OYu1jtHOddu
 pzgWITrwqdOdSF0i91Rim8Uf0ceMzzVMWbhEP5UC3ax2Zfc1UQzJ6oBIExnHw3zeZM2W
 yy5v31Z0zF3HZXZqcIh8Yl4zMn2b5GineLqOYAqBQDIDZaUSpzjc4bBr6V97Y1FI7JnO
 6N0BTrvxBxwO1pLjsaJYiasTvFqQOgVUw3D79YxNCgWNulxcwTDz2qMi4CTkQoWb3vLS
 wz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D8umjxCVBkSMCYmdWgCi0WZdZ4vJld3ztKtKRx7frxg=;
 b=HtXX6UyYn9o/KLCkybU2F8G7rQyOOv5EFWL3h9Z7ewGrZYVlq7YSPYYLylR+qRZEDp
 o2nJBneOSHMdtXX4uwcw4pWFXqCmSSUnEMC0hU16hbGVeiWu5flwr8pMbkowbyiAdPHt
 zrXD7BNTJszWC+LddYzMQZJ8zUpDmJu2C+0q3Fwd0MjDX1A/nC7kHt5O1Y1lOT1ZBFG8
 hAlyUnk1+CrtxbtGGrlBScKX4RTHMxW0Cc4To7hhKMxYSzgBSe4LAyo29sRxKaN4KjXw
 NgWNnJsrwYDjUaT9ozCPv+cJdRs+YKklxEXAZTxMkbRytkQD2AeSeytCrJ23pQ7hiuM7
 B5NA==
X-Gm-Message-State: AOAM533TfiCMcBVOPUkYrL/xRuPyNhD59mqP459k5CQTDqoGvni+enNr
 e1BEO5YL/8RFjW4uc/r46cKtdA==
X-Google-Smtp-Source: ABdhPJxaefaOeQDSF3z0rcPSnJ0mVDDvWGy7mtb9RmORif+hphiYTGgAYrvqOiKG+7B0UyEnKPme6g==
X-Received: by 2002:a17:90a:31c7:: with SMTP id
 j7mr12503197pjf.214.1622741829039; 
 Thu, 03 Jun 2021 10:37:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z5sm2805070pfa.172.2021.06.03.10.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:37:08 -0700 (PDT)
Subject: Re: [PATCH v2 15/26] s390x/tcg: Implement 32/128 bit for VECTOR FP
 COMPARE *
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-16-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6d4bc413-8c32-336d-318b-1d34ead08a7e@linaro.org>
Date: Thu, 3 Jun 2021 10:37:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517142739.38597-16-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
> In addition to 32/128bit variants, we also have to support the
> "Signal-on-QNaN (SQ)" bit.
> 
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/helper.h           | 12 +++++++
>   target/s390x/translate_vx.c.inc | 57 ++++++++++++++++++++++++-----
>   target/s390x/vec_fpu_helper.c   | 64 +++++++++++++++++++++++++++++++--
>   3 files changed, 121 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

