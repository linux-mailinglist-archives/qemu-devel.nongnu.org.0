Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDC63DBFC3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:25:11 +0200 (CEST)
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z4A-00021t-1w
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z1o-00052M-Lh
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:22:44 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z1m-0003Ky-IJ
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:22:44 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so12912199pjn.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Et+DfHSBoGmzvGKxbwDrDqi/eKCCEycpeiPXIWsQsIs=;
 b=XEjEvYyDg7jxKpzy+szJkZQTjVSEXdILd7zJG85miWSBn7OOD8wGmYwxxX1ZnZ0c2I
 bse0P03+Lpcuhnzxt08QOTsezPsnot1Xko2QcTABMJ6TFOBg5dqD7ZObPV3iBMPAwdgj
 Mj5mNacOikr+yL92B7p6Z7ElURbrBGJy6FIiwXiIA10wg5aum1jvSNQQxv7vByov01I9
 5rU55mjVQIQCkjwjwy5cgjr4vY0RUwQN6o/DXyWN+YONFutHCGSjRkAYgbc2lxI0goXR
 mSkD/5GnQlfVmtC+0kc7l8n8Nm++9RKxYhrqcgtxu5kp0YfGu8I5StXa9qtGoLH+HVWz
 mP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Et+DfHSBoGmzvGKxbwDrDqi/eKCCEycpeiPXIWsQsIs=;
 b=A5lPmG+bwG7l8hOYovqsgGc8J++uv/2GPwMfCa3rKezEIO0hczmYwyPH0EIPqmHON3
 7NucA+mAnJY7sEUNDdn1LdaoA3W+WRjDasj82P8ta6Ook1vlIVYm81ZY56l5JggzUtKU
 Vo/TpOoun/2doui+G1eeTXGx5XoQHnEp9Qh1TYrMPHWqAY+lft+GCmc55aOK1WvZq8XP
 LpEl++FuN+J0cy2sjsoXeGqE//AhzOL+xQmdRZ4i5GVnuLKfo74EjqgN0V7bGcX6D6qa
 lpY+QxYM48kaHx4zpXnSYhSCjPeihxTgKFLhb9XMtmskgvtcdBaELsWZAMKtt86u04wn
 aa1g==
X-Gm-Message-State: AOAM531ZjyG1c/svrt0MZD7/+OPVgZ5GtDqsQf5uvOXWsmA4tBL2yh4X
 myj6trhugH9VK6jLiRh7YvgA4n9cgzT/rA==
X-Google-Smtp-Source: ABdhPJxXwJg0fDird9kxvLBdpaklL2an52rOmlrLPwAMrUJzKiMI50Iie5/tQGh9YntTjZ7SGjBkug==
X-Received: by 2002:a65:450c:: with SMTP id n12mr3729647pgq.316.1627676561183; 
 Fri, 30 Jul 2021 13:22:41 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id 11sm3342962pgh.52.2021.07.30.13.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:22:40 -0700 (PDT)
Subject: Re: [PATCH for-6.2 47/53] target/arm: Implement MVE fp scalar
 comparisons
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-48-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1fd213ad-ddd5-1d9a-f14d-5f76848447f5@linaro.org>
Date: Fri, 30 Jul 2021 10:22:38 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-48-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE fp scalar comparisons VCMP and VPT.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 18 +++++++++++
>   target/arm/mve.decode      | 61 +++++++++++++++++++++++++++++--------
>   target/arm/mve_helper.c    | 62 ++++++++++++++++++++++++++++++--------
>   target/arm/translate-mve.c | 14 +++++++++
>   4 files changed, 131 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

