Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BE539E17A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:08:18 +0200 (CEST)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHnV-0002gj-Bu
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqHl0-0000Hi-70
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:05:42 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqHky-0002Ct-GG
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:05:41 -0400
Received: by mail-pl1-x62f.google.com with SMTP id e1so8936585pld.13
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2+BFUj0K1lmuhedrLyvXZC4X1M6e648XSonZM2jKLcw=;
 b=I0E1AGFkwm5N6MAdIJDhklpty3jUSosRL5u2x4FYDhL3ZUt2XVkYn7mHmXwWFViAVn
 L4BoCFwbXCysbSq983cCcYGQnUAWfUbUD/+ypaQUEIhQffc41ZINIWnGwQv+0ujUoq9F
 JG6NvhR7pyXhEnzfqrIBgRFQ/+MMG7gvU6rjpNZZ96awmswQTALaL7vK+fir4mxclm/K
 Rt5R7tnfYoiHVUdTHdxuT+RH0Y8SSLpu4M+kLsyC8SuGlr173Igw8mOifmK6Rj85Tu31
 PAQ5nGWtiTTgh52ZLgBTM7cyrqLZqEAbr48sVabwM0fyKsEuYQ5+FDtp5mHpcJ5EKOcp
 CuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2+BFUj0K1lmuhedrLyvXZC4X1M6e648XSonZM2jKLcw=;
 b=Wu+ss3UNQXh6V6fNcVth7NseGJIIl0i3IX3IXwzYU9DZoyrORuoj9xS0M8O5PDVe7M
 x3mqiBi21mJwSbGzTUKq9iBVsLmvOq3JAKC/cnoebJJudMXk53LsO1Xvu0HEDNLXn3JB
 yEtYEHr6jn/9EVgWhpoVoNOvrLZXacwafBTDcra/Xh6svXgk6q/D8HwKajsbnvo4wyxw
 7h+7dPVoHAsH4k2sOq0s1NVtKrKdnRr7+wgvDywyZnh63I1GY16DwwejsX4HVd1P7RnJ
 XrwLojX4uLG20a624yJt28b+yEFxixm9sDXeCH1JNScXCYO4r0nciskogs79giTRWxuQ
 z0lQ==
X-Gm-Message-State: AOAM530+CSCwiwAl4xLQO4ZrVWTK+wj2KGNRahAvoA50XUlXvbh/abQb
 hZFlVDY0DF/5G1OwckoOdkKvBA==
X-Google-Smtp-Source: ABdhPJwvi0GmsRohEYBtv+a7bJc4A0vmKOXQVIveAils3NpT+58QBW4t2HRN5rlw6dBi6HgzHs1WdA==
X-Received: by 2002:a17:902:e843:b029:109:4dbc:d4ed with SMTP id
 t3-20020a170902e843b02901094dbcd4edmr18802873plg.74.1623081938777; 
 Mon, 07 Jun 2021 09:05:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f13sm8599773pfa.207.2021.06.07.09.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 09:05:38 -0700 (PDT)
Subject: Re: [PATCH v3 01/26] s390x/tcg: Fix FP CONVERT TO (LOGICAL) FIXED NaN
 handling
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210607110338.31058-1-david@redhat.com>
 <20210607110338.31058-2-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bb67f143-3aac-2660-7458-c811fdd0e790@linaro.org>
Date: Mon, 7 Jun 2021 09:05:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607110338.31058-2-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 4:03 AM, David Hildenbrand wrote:
> In case we encounter a NaN, we have to return the smallest possible
> number, corresponding to either 0 or the maximum negative number. This
> seems to differ from IEEE handling as implemented in softfloat, whereby
> we return the biggest possible number.
> 
> While at it, use float32_to_uint64() in the CLGEB handler.
> 
> Signed-off-by: David Hildenbrand<david@redhat.com>
> ---
>   target/s390x/fpu_helper.c     | 41 +++++++++++++++++++++++++++++++----
>   target/s390x/vec_fpu_helper.c |  8 +++++--
>   2 files changed, 43 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

