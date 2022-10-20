Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1139B605576
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 04:24:58 +0200 (CEST)
Received: from localhost ([::1]:40192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olLEu-000273-GS
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 22:24:56 -0400
Received: from [::1] (port=58714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olLDd-0000UC-9p
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 22:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLC7-0007as-9x
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 22:22:03 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLC5-00057N-O6
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 22:22:03 -0400
Received: by mail-pl1-x632.google.com with SMTP id u6so1486866plq.12
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 19:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PxY35JJgwI9ca+HbJhyC2ozbmynk4Jbt7MH4SUwOfFA=;
 b=eLvHPl6on6pBQXb4qQgU+A6X8TzUoW6O0qfK3t3u3XBc44JTq+7mk3nX7VjKoKFtFS
 ykVrcBmBu0zZ/rs520RnyrGWA7VfjbX61s4+rOKgroxzgE0GSr4r49OQlI3p5u7qVOvn
 JTm/SwKM3CvwrhrAmJbb3a8crDiQ8UxORcWXwZMpP/kE6dIBO1U5bt65D0cTzF3cDzuy
 wc2Ptg4u86BJElWGJoplZtI6PxMXOJRu44d7Eocwni1NbkwQC4elQtVfmI0gD+bu4Pyt
 ujvw56o6nzqrCrZTljWBzKxiG4WBBBYmJuB+WlWWKDf1klZj7W5FdrxThF71W36XH1KW
 tlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PxY35JJgwI9ca+HbJhyC2ozbmynk4Jbt7MH4SUwOfFA=;
 b=BJRG+lbDWDnz/CsL6GefIO7EOVih7Zn6zCKlFAZZpBTZg+Ugd8DwiRcIMhAQ4cYDtw
 IWWdnjP54WojtBvY9j7q3yoOrNkoU5ayUAre6q0j8yqgLt1Pl9kNBHflC5gRKBbhF9P3
 eEKueQ65CyckVfQwKFqr3rM3gjTOVpRciAqfsVR0o9ggf/2kXtMvmKiqT4lsigrISHct
 c3ZeFyHbBH8xRkjX2vnSHsMuLmBZAwLgt9whlirY2eu0NBos/3GlKO/ntmag69GvrLA7
 xSKgOvwgVT6mEJKNfFz+FExTNS5mX+Rhmxtqa8NtKAqgboFvVL9Z+nLDBdi9w2uFEX4i
 VO2w==
X-Gm-Message-State: ACrzQf1+Na1Cf4z6St9JY+oSpkJbcI2+cmmlFs+5Xo4Ho1J0O/XAnvKi
 VayrdtZ7viIp8LUl7ByMf0bATg==
X-Google-Smtp-Source: AMsMyM6ex3T18GMMXV8F3OY7aqJQZznX/zVH3w7GNCDq2UW+FCfdU+/hDhGsGEx0l3/w4KeVe76Lig==
X-Received: by 2002:a17:903:110f:b0:178:ae31:ab2 with SMTP id
 n15-20020a170903110f00b00178ae310ab2mr11670425plh.89.1666232520256; 
 Wed, 19 Oct 2022 19:22:00 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a170902d50200b00177324a7862sm668016plg.45.2022.10.19.19.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 19:21:59 -0700 (PDT)
Message-ID: <b13d52f8-44f8-62c0-cf27-148f9cd5ef01@linaro.org>
Date: Thu, 20 Oct 2022 10:25:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] MAINTAINERS: target/s390x/: add Ilya as reviewer
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221019125640.3014143-1-borntraeger@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221019125640.3014143-1-borntraeger@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/22 22:56, Christian Borntraeger wrote:
> Ilya has volunteered to review TCG patches for s390x.
> 
> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e3d5b7e09c46..ae5e8c8ecbb6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -305,6 +305,7 @@ F: target/rx/
>   S390 TCG CPUs
>   M: Richard Henderson <richard.henderson@linaro.org>
>   M: David Hildenbrand <david@redhat.com>
> +R: Ilya Leoshkevich <iii@linux.ibm.com>
>   S: Maintained
>   F: target/s390x/
>   F: target/s390x/tcg

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

