Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F22F417205
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:38:44 +0200 (CEST)
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkTT-0006yU-Bw
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsU-0006zd-J6
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:30 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:45821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsR-0003GD-1I
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:30 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id w9so6035872qvs.12
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WV9y0/nAh68qLeWMoC9KUGjStaszo/E8bzwV7xUkhOU=;
 b=NH9KxExuELAiK7MHzuKNrF83dYTR+NYvZQ8kdKLDX6DpkGZkou2EfLgbvSCit0dHx4
 iq8DJOdbZ9AMkhn3d0r1aopwgE3sIbhg7kHdB1+u4aB2sjSC/7AIXYF8DV+K066ONeHk
 EDZxs5jEztsxX+73FyjvRLlIyMa1oO8PuRWHnDPbmWqxxYVzrU52W7kmTBHh3xZV3cXu
 STFnsXcLnwyTxYQikfbbaOTchbWgDGWt1Yqn3cEaI1aveM2qULalxoAQOLRbjG6HLmPD
 /xE3NxtWRV09U3mOPK4DKwFv/t7fM/vkCDscsP4jGEKFpHT4v1/0L2wQfOrsda+0MpXx
 n8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WV9y0/nAh68qLeWMoC9KUGjStaszo/E8bzwV7xUkhOU=;
 b=tzD/DrqDCXAx5w6KN4W0EdMfRRDEdRuObNWTm3EQyODFPiV3hoYABweEASb6fvxto2
 aJeOAve1K3ZR/NhpByATuN/vM3waF+JYGeaNqEOhQUI1bjjEXBUVMTuAf5SsRb+uWrmV
 PAIqLu1pEZwvxxGPlU7NIUSe7pF7LwaHjj/Z2VCJrQYTrhh/NEiAnXL2i4R63zm2EWeI
 a/g2tyFkxmE06Xjz5ZTb1MBB7SQDUz19u5KnSirtj3oscczsjPZ1HqCcXG2orApAncs9
 CURvRK7D1z2W9Qo7UzQW9XE1jy7oVPCjL1zu5ANPFqGCqJNKG2CnUPsD/e9/iYXkgdkl
 N+Gw==
X-Gm-Message-State: AOAM533+6qNJwT1YLUrtvdtpwZD2NbBybdHQQ/ay49R/mGGazBkhwWLb
 I2OVxIfJf/PrRtBuSSkn836stQ==
X-Google-Smtp-Source: ABdhPJw+QrfSA/ar9Ziw32Y4lCN5vOaYOXJuVQvA5vZRoO27gJ9g5FFrmBoL8O9+6ufYnn4FxXcw+g==
X-Received: by 2002:ad4:4a93:: with SMTP id h19mr9627046qvx.41.1632484822516; 
 Fri, 24 Sep 2021 05:00:22 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r10sm6286305qkk.95.2021.09.24.05.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:22 -0700 (PDT)
Subject: Re: [PATCH 08/14] bsd-user/target_os_elf: If ELF_HWCAP2 is defined,
 publish it
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fe80465f-9736-ff8a-2975-b5ab216508ed@linaro.org>
Date: Thu, 23 Sep 2021 11:01:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-9-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> Some architecutres publish AT_HWCAP2 as well as AT_HWCAP. Those
> architectures will define this in their target_arch_elf.h files.  If it
> is defined, then publish it.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_elf.h | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

