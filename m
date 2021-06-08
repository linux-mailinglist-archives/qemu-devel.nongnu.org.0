Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E70439EC72
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 04:57:43 +0200 (CEST)
Received: from localhost ([::1]:60334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqRvx-0005vo-QI
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 22:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqRvE-00055J-PZ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 22:56:56 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqRvD-0003g3-9r
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 22:56:56 -0400
Received: by mail-pf1-x42f.google.com with SMTP id q25so14602441pfh.7
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 19:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zV4bvGiie0e+ZKYKkpeObS7+Xv0XEf3uoVCvVWeXObo=;
 b=J9NJ0V7yie7j3ThNHYkXWje2dKPCHOIUL4WvxhCwFRKuNXf9yFTc9rVYNOFTvueqZF
 uZKMMrxF4oJYev/MyF7Iqh1AYCTLnHRZVxXrK8QhmaaF4wRfYGhicFIH6lVowsNaHcgU
 ojUWFbfp7kodzNDPC+vNB6LSwALSPtU/TnzqtwA24w0DFXyF4O+XF+jJsGHhbzi8NqOH
 bWP3e/bW9eo8qyM/qqx1wGmlFzsk3nyI6vTMCvtIaA1+HnxgQvLNm2c4XoWLvW2zBAO5
 kdSGBel2eY8O3FC/uoVfDYwzghvZFPSphUKprKUZyTwKZL2ATPLpbZ/3yQJTiC1d5u2R
 T9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zV4bvGiie0e+ZKYKkpeObS7+Xv0XEf3uoVCvVWeXObo=;
 b=shkSp3IjNeWVrFf0rUlAwzEEvrJEPDOYrV1jsQA9Ogmd0ywLg6fZAmoevIxjIyXrD9
 pU32pOee08pg7vb8juxBlAfITI3I4M4Tff0CxH6GoNMAQfnmSF0kAP7OSuhHxERqXrIv
 3C33XHWVFNhxEXYcsQ7DIL+4hgAa2E6P/SYj48ESVA4QbqtqtNx8oNL0bzKEYJjcI7EB
 kZ+ZPy4l7wRFgh0q5WHJcDtQ2DH+6+4mzQBwK5KACdwElZ38vxnClOxydR+cSpzJR8Rf
 l1J1eT70FE8/DetRtBkEWAiAMQH1/Z8CoIcaUJw4ZVFJ6t6G6Pxq7sVplVP7iNFKi8eQ
 27mA==
X-Gm-Message-State: AOAM53379cql1vvolQXYCXjiCCaWjPyvwsrZshJoQzQJLSXTYIH4fzzT
 vn/GtH3PPCL9Awn9WwHUNalTeBFaTpqqhQ==
X-Google-Smtp-Source: ABdhPJyYWybiyEmHqfpUBKbMRdE6rH4SqEQ3/2KCMF9vFLMchty7v5Otnn+/Y8TM9A2Zq51TBcfgQw==
X-Received: by 2002:aa7:8509:0:b029:2e5:8cfe:bc17 with SMTP id
 v9-20020aa785090000b02902e58cfebc17mr20059054pfn.2.1623121013740; 
 Mon, 07 Jun 2021 19:56:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j5sm7669641pgl.70.2021.06.07.19.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 19:56:53 -0700 (PDT)
Subject: Re: [PATCH 08/55] target/arm: Implement MVE DLSTP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d099bb6c-661c-87dd-082f-8072ff2537a8@linaro.org>
Date: Mon, 7 Jun 2021 19:56:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +    {
> +      # This is DLSTP
> +      DLS        1111 0 0000 0 size:2 rn:4 1110 0000 0000 0001
> +      LCTP       1111 0 0000 000     1111 1110 0000 0000 0001
> +    }

Same comment with LCTP being the more specific encoding.
Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

