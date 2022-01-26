Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1202149D4AC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:46:14 +0100 (CET)
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCq7J-0005kA-SW
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:46:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCq4n-0004aU-EI
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:43:39 -0500
Received: from [2607:f8b0:4864:20::529] (port=45035
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCq4j-0001sM-Qk
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:43:35 -0500
Received: by mail-pg1-x529.google.com with SMTP id h23so501880pgk.11
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vwDLb8jehZQ7HwnM0cVXw2UyoHV9fhXzogvK3IU0914=;
 b=jnXbDl7Ec8PBjmY1goNQcL1hNOtrg/cZrOdLtv0UJT0JmRUA7NXRRAaDEd//WbWm47
 tZFYW8w/hi8sDtc0vnDwrxOf97h1XSDQHf5eWGm30Vo1jMHpu4GfQ3mNKiXj/HHgpT7x
 1AUMETVxQu4lpV/CjJ6m7ejbKso9asEmWo+IfFTZHUKiHjNyJmTIRavVlXywEmJCM2kw
 hoJ4P63orTG3u1n4q7MWjFx7Ldtg2Ymt6xoheUF949ZcQxxbDoOlmHoepsEMK54OOEV7
 AjApV+g8dHIqD9qx6pCgId2dEnN2xWCWGyZnO8txnoCeCGoMiPiUVWLSQBCGisBcNobe
 zLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vwDLb8jehZQ7HwnM0cVXw2UyoHV9fhXzogvK3IU0914=;
 b=TAs4/SoGuKdG9NTwhbABKmT492zq25yQu41Q93oscE5D7dlBsxUyAHfOMR1DsE5VCf
 e2l3zxV6nMuASiFRstJH0h3H48BfZHh70WkWivh5QqzuzlrPlIqeyR+A1s6BXH2QO9BO
 /vD8RIKFUcgFE7nAlF1ktFd5a0k6iC2xQeBbgM/0pD4X7vAaHBMj1ab9bLkzjgt18xpG
 2GwPHqmIlllk6eHlE+Wq5+s/9S6gmY9X78DkWNi7ZbUHH5Y6kvTxN0iSeKbZvWdyUh4a
 U4M7ig8zvfK4Z6kuXdiLooXmrD1igUNpHbtdp2UOuOXggxWQI0bD2VeZFV0C7x3n2P6s
 eCEA==
X-Gm-Message-State: AOAM530ZW37EAepupb2dvz6kH5/qCVb2Os+kpA8SzDBA69Zr/nxr+Lyb
 Fx18QNuPSWYdLAl7W1+ojq85WA==
X-Google-Smtp-Source: ABdhPJzd2r3Este9Zd860cVDOxJVtHYFXEVN9y5pAyk1MQVx+RgVlaAFq8BXZ0Is+WcXugvxBe7W5Q==
X-Received: by 2002:a05:6a00:a0b:: with SMTP id
 p11mr474147pfh.66.1643233411722; 
 Wed, 26 Jan 2022 13:43:31 -0800 (PST)
Received: from ?IPv6:2001:8003:1d71:4f01:4dac:f487:9ea0:53e8?
 ([2001:8003:1d71:4f01:4dac:f487:9ea0:53e8])
 by smtp.gmail.com with ESMTPSA id q16sm2973873pfu.194.2022.01.26.13.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 13:43:31 -0800 (PST)
Subject: Re: [PATCH 2/2] qemu-timer: Skip empty timer lists before locking in
 qemu_clock_deadline_ns_all
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
References: <20220114004358.299534-1-idan.horowitz@gmail.com>
 <20220114004358.299534-2-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <79582bec-0591-8114-2479-7d5d79321698@linaro.org>
Date: Thu, 27 Jan 2022 08:43:26 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220114004358.299534-2-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/22 11:43 AM, Idan Horowitz wrote:
> This decreases qemu_clock_deadline_ns_all's share from 23.2% to 13% in a
> profile of icount-enabled aarch64-softmmu.
> 
> Signed-off-by: Idan Horowitz<idan.horowitz@gmail.com>
> ---
>   util/qemu-timer.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

