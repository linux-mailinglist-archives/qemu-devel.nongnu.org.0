Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116D04D697E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 21:33:46 +0100 (CET)
Received: from localhost ([::1]:47166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSlxI-0003Lc-SZ
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 15:33:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlvy-0002bX-An
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 15:32:22 -0500
Received: from [2607:f8b0:4864:20::431] (port=42605
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlvw-0007n8-TW
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 15:32:21 -0500
Received: by mail-pf1-x431.google.com with SMTP id g19so8829499pfc.9
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 12:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=66RYfbw+Gq5jhhZG6la1GOFH71DrlSgrCYEYsc32cLw=;
 b=IfJBDg3cckKm9wE+kTS/fPyoqLDqs9r3oIUwPjMpUrg3OLJ+E2tcbq1hDLJuiDur/P
 0f/gVi61+V8pf1dUer3RCvHAS3Da9qlGoU3vjkm3IxwRpfZu7xTLO+sRA5U0hBmr7nw1
 bsFXgokMxuGQ3sn6C2YkSVxLYzOJLaS1ALQK5CEv51oN6VcN9wc5zIQvjvsY+pC7oqdw
 5vCzFNg8rDZiD0iIcvzJQ9lkyGrdH6DlNmp31JvewHuyxB4l5slKJBNGK3ZjrYVFUS7a
 0i9Mxy8M4FViWEWcW8OnZrETZbwW6f5OTYhB6CiSdhVLE/EUIsJUvGC/GdZ8HLaQPCbe
 n0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=66RYfbw+Gq5jhhZG6la1GOFH71DrlSgrCYEYsc32cLw=;
 b=o0G3KOvC+wSt9WxDMIonVigkHgfEvJxfC8WIqiQi12xzjRYwdzX5Pe0neesCOB4Lf5
 51CQfz51GAxuFzwZ8sP6NFXqT83NwEnx8BFair1AXPfEeAIu/e1GAf0PKP+VVnuJKvYZ
 esmdLwvJUgUukuzX0/cvPlvMwr/GV1DbpT7aYzoiL4xu1dI+Qru/bq+bkY1KOd0xol8S
 qdnFNEtRRUyW8i35T/Ofy57D3Oa1uXW2EkPwcSwqIyIkKXKcnyW24VADGi+97QFDDyIb
 yrZt0bbqpG8rG8tqK0vqq5IKyz7F1svH4XNGii4iw9T730zTB0pIAvJ6CzrED+lEbY4N
 vLeQ==
X-Gm-Message-State: AOAM530FoMm4jd9d4vRfz63zm5yrEp23PZ5V/OQaPsk6NyY2e9EW0ST6
 rKSN7RJ3N/ABvgNryenAPKzdCg==
X-Google-Smtp-Source: ABdhPJypSnZRb4W/aaGUvEMHJ96p0p5aBsMxny2NwcGLy7icqvtTXi+4ciTqZ6bKpQDW7ACZGMz58w==
X-Received: by 2002:a65:56cb:0:b0:378:82ed:d74 with SMTP id
 w11-20020a6556cb000000b0037882ed0d74mr9877918pgs.491.1647030739420; 
 Fri, 11 Mar 2022 12:32:19 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a17090a414c00b001bf6d88870csm10213262pjg.55.2022.03.11.12.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 12:32:18 -0800 (PST)
Message-ID: <46cd7fbe-c96e-71b5-a648-da0fce0d2f8d@linaro.org>
Date: Fri, 11 Mar 2022 12:32:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] tests/tcg/s390x: Test BRASL and BRCL with large
 negative offsets
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20220311184911.557245-1-iii@linux.ibm.com>
 <20220311184911.557245-4-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220311184911.557245-4-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/22 10:49, Ilya Leoshkevich wrote:
> +    size_t length = 0x100000006;
> +    unsigned char *buf;
> +    int i;
> +
> +    buf = mmap(NULL, length, PROT_READ | PROT_WRITE | PROT_EXEC,
> +               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +    assert(buf != MAP_FAILED);

I'm thinking exit success here, as such a large allocation may well fail depending on the 
host.


r~

