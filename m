Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5C15B96F4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 11:05:11 +0200 (CEST)
Received: from localhost ([::1]:58878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYko1-0003uN-Ub
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 05:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkBC-0000W3-0v
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:25:02 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:36574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkBA-0008Vf-Br
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:25:01 -0400
Received: by mail-io1-xd2b.google.com with SMTP id c4so14340440iof.3
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=nbe1mRDXTyb91Z9WMBPYEo9+2BRHrH7iB8qIyaql75w=;
 b=AhFYzCjoACrZuykh3ilJoKWOdGus7bASt0sofaQ2HjNjQE/cFjaVPjuNXYHU+XQmzZ
 +j4LISUSRUCnBayms7rcltZU6qyThyFu0QDCbUYH07+ohEVD4SoAFF78Aj4RZGMLwxgb
 LxRSg5Sb3QGgVA8OtK/WoSi8ey4I9wfI7YCeKcj4KXY2ltpoAIpSzqIOIPZyOFKZ7guw
 eMDr+vkSeNfBLM6h6CuY6sjgBlGnWc9iNxucj5YhK+lMDaQUH9mzC4z0ISP40YJdcZtG
 V/SKb4Ab0oHzQVI7HU3rOqafmAdKTR+c/k6tLOLTwp8iXHEWYzCJMsyjKrh5CDEORDS7
 3AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=nbe1mRDXTyb91Z9WMBPYEo9+2BRHrH7iB8qIyaql75w=;
 b=2SUh8DKpnZ3lek7e7P3hVjypWCaQJdjCvza4HsE7eUIt19EKMnfdYFio5hP/nHqLxc
 jWRG80pu+8d+ty+F8zmdWdfwVphnhzcDs+Vd8OpybzsudmlV6av2wC7X+O5GOQJ2cF2x
 LmHpJqbbVE/ive3bc2n3B7eRw/JlrP3410BX7ywBL1au2cdOLGN6sgzro852vzjlDkwR
 qh3DWm8HEqwEO6wmYKR621mTewLzbe7LxxVZVIQrgHM3f+U2X15g1g7ZzYZ7AacO91vv
 48Ybjy3we8sd8vI1Q2Axi+1GCm+Auq0yXqppRF1TXu0cvnQaxGSCs6Ry+Aa80QZ0EXxv
 ReIg==
X-Gm-Message-State: ACgBeo14aoshR53j6bBTHkcxQSeuEt7uHBDE6eZWCtg1eM4Bhgxfcpuc
 bB2oddqE+1wVHOlXsaNVvLPOwQ==
X-Google-Smtp-Source: AA6agR5zi0s/dc1aJfG+C5RyB+UgXGzJQuTWqOOFco1D6mMT4ZCwOXPkBbIiBtDxkL8ADnxXBy8w4Q==
X-Received: by 2002:a05:6638:12c4:b0:35a:4c21:f675 with SMTP id
 v4-20020a05663812c400b0035a4c21f675mr7471527jas.143.1663230299235; 
 Thu, 15 Sep 2022 01:24:59 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 c66-20020a029648000000b0034cd02c75dcsm830888jai.65.2022.09.15.01.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:24:58 -0700 (PDT)
Message-ID: <4bb96a86-b654-5ea2-25e2-6dc9237e41de@linaro.org>
Date: Thu, 15 Sep 2022 09:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 07/30] tests/avocado: reduce the default timeout to 120s
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2b.google.com
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
> We should be aiming to keep our tests under 2 minutes so lets reduce
> the default timeout to that. Tests that we know take longer should
> explicitly set a longer timeout.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220826172128.353798-3-alex.bennee@linaro.org>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

