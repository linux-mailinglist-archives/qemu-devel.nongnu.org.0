Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FC33D1998
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 00:13:12 +0200 (CEST)
Received: from localhost ([::1]:40312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6KSl-0007rs-69
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 18:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KRw-0006zj-1i
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:12:20 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KRu-0003kL-Hc
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:12:19 -0400
Received: by mail-pj1-x1034.google.com with SMTP id j1so1630137pjj.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 15:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LayUQ69BDiXkve1Mxxnq9uRKfFJmYdg43KSNCqITGw8=;
 b=EuRy8kRj2h1w+/yYYMv4OW+A/oga89gPMiObhdsgw1TKnJKNmtpfQZ93QQDA9BdfXp
 Jg9Je+rtyZjeXP5jZai0PKT+dnjobeHAjbXkmebLkHihrg1VKgaws9Fir5lJ6esec43K
 XuwBxr0LWFW1jfM9Sn+UXn4KeWUdmH0Ed94hLDJ4w4zP4BHptacR58l1Wy9ZzorRvONm
 48IR/NSjm8HX3NLy8UicULF/ZuwA/rIEubhrv2NU6W1Y9GcXc1HVLYIsVlpzSanEl+2l
 wV6XSMDDRF8dtnfu/h5i0rRqRXMI1fU8/I1oORP+HlgNpBa1R5pJ+aVV2KTagC3gn9iK
 +dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LayUQ69BDiXkve1Mxxnq9uRKfFJmYdg43KSNCqITGw8=;
 b=ekS3vonFVVJobihiHX+9JJYu89rqtRkXPB6gqUYEMX3cCKxD959GqyPgH5PB5aI5RI
 58ZiZ7XTMHbgmQ675PwnGWRvlhDbdGlRXt+RJbrJZqOjAPNgX8uxWIaf5s7Z9svAdxiq
 uXihiR6mynlHzUt27YHPdp6x0oYgS9NSlFDNAFrFuHoDXmp0OgP+YdvX58cXL0tdlVVE
 mk2C1FzqfrJzwqSQn8RvMawV3cedu3IWTb9qIltHIc/g/Nm8IbqVuMFuC/3vKBlo+8LT
 WW388PkgBMwgz1WYrJdqkvkyEMAdS0Bnpei6xhrNQbJeXvpaUxKBaJaLqGcFUqjceFb6
 04ew==
X-Gm-Message-State: AOAM533KVMfPsAqIXT+k3ycCDxq+6GiMrCbQkE9EemoGsbL/GUjaY9TE
 Kq51WbYP2aThfhbRuLWyId9v8JN8HYFdJQ==
X-Google-Smtp-Source: ABdhPJxld5fcPlwD8phmK3m5P/YMlXX+0D5EtG/lYLJ/9AllV+N/xBecG9XFCoefxjNIhxhhfyakTQ==
X-Received: by 2002:a17:90a:4884:: with SMTP id
 b4mr5816682pjh.173.1626905536976; 
 Wed, 21 Jul 2021 15:12:16 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id 33sm18329724pgs.59.2021.07.21.15.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:12:16 -0700 (PDT)
Subject: Re: [PATCH for-6.2 28/34] target/arm: Implement MVE VMAXA, VMINA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c51ba56-df0d-f9d2-34c0-47e40e386299@linaro.org>
Date: Wed, 21 Jul 2021 12:12:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE VMAXA and VMINA insns, which take the absolute
> value of the signed elements in the input vector and then accumulate
> the unsigned max or min into the destination vector.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  4 ++++
>   target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 40 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

