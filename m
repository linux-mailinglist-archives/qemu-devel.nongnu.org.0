Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9D05A928E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:59:27 +0200 (CEST)
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTg2o-0000Zy-Jw
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTfQM-0005tu-Hb
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:19:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTfQJ-0007n9-Ou
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:19:42 -0400
Received: by mail-wm1-x331.google.com with SMTP id d5so8582263wms.5
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 01:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=/uWVi2BcPv36zgDQCRhfRz3KOxEm/bfzoflZRDhKT18=;
 b=T8P8HSQMqvdNSEJtwpcP4LIZuuD21aJ+CftwrTJKHtOcLFgThYA5yYGGz/WY56Vl3H
 fID8Ld7tdnzH8lARl6vEu6J9kQ6O254k4+wMEI1JlwIIYJqaxHYXrA8uDPGjrFCWm3Jk
 vvbCr/4usijcQUHak8Cz6rgJuctJiNuClzwl8DTbahWhpCZdVOlq9MAq9cAmDKfyENNQ
 CqWZFesXBG455dtSDu9wL2zK/BBJ0bZX8c0yDAhqZsqJH87tSNtJDtceTNBbTWWkXDwY
 Rshduj8PyqHboGAgfVZFQ4VW5lRl0SjQgHg9vtvFWuS43DUhPGsZ4xANMYcKqJmmFART
 BBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=/uWVi2BcPv36zgDQCRhfRz3KOxEm/bfzoflZRDhKT18=;
 b=LQ8kZzpBAuoEJk4IS+aEsJhQ4/zy9U4zyMhxf+EhLQUjwz4gV4I1z2kGDjmktY+HFT
 KZd7AdWLgcxtd7ZH+61y4OOoEKTzvkXTGiKPVKg9ByTTQImy6i/25eMGJwyUBX4Ng7ap
 gMxQAJtjbBnUWAUVz1cNscEQ4oTXhKUP5Gdic2HQSAoFy4g8b1mlT8t7Hy0Kp80fNsa6
 32p5PZxKMlMnPvyJcoKlikubYeVh1Rj/JMS3/rjTlAocNWx9HZEHDXHmI6Vh+5PMoXUD
 sztDQHa2/FEcK6tsMFcvS3trwfdJTVSBjBcHSxzG/gCC72zRpWWk43ua38zLGiRfbM/x
 wqQQ==
X-Gm-Message-State: ACgBeo3uhd73CPqGOciW/A22TrgYA6v7ckeLJ6JJr4MnVRp3jHRLaz1q
 n2SCC6QTTKYGOXe0L8HAbl756g==
X-Google-Smtp-Source: AA6agR7tklkdsvJzCyZdWVJ3xYrh1n++Zaa3j0Lueohexs0Y1n5WXQp7UwrA9BI3ekZT68LhMDEU9Q==
X-Received: by 2002:a05:600c:a05:b0:3a6:71e6:47b8 with SMTP id
 z5-20020a05600c0a0500b003a671e647b8mr4321847wmp.29.1662020378134; 
 Thu, 01 Sep 2022 01:19:38 -0700 (PDT)
Received: from [192.168.45.227] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d48c6000000b002252884cc91sm13764327wrs.43.2022.09.01.01.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 01:19:37 -0700 (PDT)
Message-ID: <2ce0e97d-edf5-a7c5-6dd7-7ba9eb5dd9f4@linaro.org>
Date: Thu, 1 Sep 2022 09:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 23/23] i386: AVX+AES helpers prep
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220901074842.57424-1-pbonzini@redhat.com>
 <20220901074842.57424-24-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220901074842.57424-24-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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

On 9/1/22 08:48, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> Make the AES vector helpers AVX ready
> 
> No functional changes to existing helpers
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-22-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 41 ++++++++++++++++++++++-------------------
>   1 file changed, 22 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

