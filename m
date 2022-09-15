Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE45B96D8
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 11:01:52 +0200 (CEST)
Received: from localhost ([::1]:38910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYkko-0002nR-Og
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 05:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYk8Z-00022C-9G
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:22:19 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:37711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYk8X-0008Ch-MU
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:22:18 -0400
Received: by mail-io1-xd33.google.com with SMTP id h194so12493159iof.4
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=5u/p4w0KQJn/0ejg/ikhwobR9/pjHwVl5WGUkSHltik=;
 b=WxGPxoiNhvCBLWXnV9v63UVFDbTbYiF2M6KPL+GSizZhyMJX5zgUmkNw9HQyi2ujlh
 4iqRspw/O1kMWsRLI2wSjiIbr/BW0EN/D1eRSOtcL+EQv4Fh1mmKEs0/MfBu8h16Mm/H
 CfP+fREDOPMBVvN0PWW5BrWgTIseePOLP4YoTF/mZthE13RwvwewXmNyo55exIrYj/JN
 B6/vBoCuXmq3FhuYQYVvyLcm9so3R5spUHqVGX3G/NJ3sPOHbFpuL4wScyC+KFBelLdr
 VlD33zBRNjEWXFycvjona/WACvASoICsKcaklHKxc8bWilqLA7nzcg5SEroMg2Xg7/1Z
 BB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5u/p4w0KQJn/0ejg/ikhwobR9/pjHwVl5WGUkSHltik=;
 b=1WXNw67ShWu9jzCJ16ezSZRqp28PI6DvuiYG/8cZPqppE8OwP5wAgWIMhE6BpVp0A0
 fhKpTeAtcpooJflMwYj219+/Qcck1MsQFHa4iOvSRwljyMKh5etdrZ9qZV2kovkB4LQ9
 bRj50bXzXfsiVhY/Qx+yixD4zZDSVx/Iz7Cbe6SpfFpq6VbWo4IgnfkiqSEs1SY5b/p+
 Y3MxOeY9ZSoC2e76c+hQUYFGUBSurlMJ0QZbmGvEAGVp2wxd0jXvilGs3ppNbhrSjohY
 dL9OLv70TiH39CYOi7fMU4Tz/SRqyjvi3/UXS006OdyvUrojFaCw/DiwfTgiqFLhg4HD
 2ZlA==
X-Gm-Message-State: ACgBeo2hJtn6d+Pq7Z+blFHAp9IIlijO8aARAmSu3zoHR840cgu7L8bM
 lUEYYf7u8IHJ8t+fHe0mzwQdwg==
X-Google-Smtp-Source: AA6agR5j5f+10uXdxUqPwj6wE3OHJ8Cc2/a1zOnpDuKi4Ong1ZUFuEk0qkhAC1qdzSLaZnd8vqXC+Q==
X-Received: by 2002:a05:6638:1614:b0:358:3eb4:eea3 with SMTP id
 x20-20020a056638161400b003583eb4eea3mr17957765jas.304.1663230136467; 
 Thu, 15 Sep 2022 01:22:16 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 k27-20020a02c77b000000b0035a0d844e43sm797028jao.159.2022.09.15.01.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:22:16 -0700 (PDT)
Message-ID: <ebfd3811-4b1e-5acf-de9a-e04c267fa7d5@linaro.org>
Date: Thu, 15 Sep 2022 09:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/30] tests/avocado: add explicit timeout for ppc64le
 TCG tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd33.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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

On 9/14/22 16:59, Alex Bennée wrote:
> We don't want to rely on the soon to be reduced default time. These
> tests are still slow for something we want to run in CI though.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux.py | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

