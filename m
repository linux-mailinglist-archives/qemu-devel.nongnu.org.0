Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6293CA197
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 17:42:17 +0200 (CEST)
Received: from localhost ([::1]:45848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m43V9-0001xo-LG
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 11:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m43TS-0000v7-TN
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:40:31 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m43TR-0002wm-Co
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:40:30 -0400
Received: by mail-pg1-x529.google.com with SMTP id w15so6830936pgk.13
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q5C25KLMvRyGxkpTvnvXZ5cOsoO/cQDMB8waaL6gLjI=;
 b=Gp+a/B+5Rv0H9vCRGBj2GeWxaGf9LgRlCz2Ff8/aa11MlGURoRRHxSCtmEDD5sILX3
 PW4IV0KRR3nMGqJAcenevXfURjd2ltIwgIjd3upNup3OpqYBdgY3SpZS3k7EF4fI9EKU
 8p/68HwprWiPuemNg2uyCYOJ0ZEXu0lS/fGTyhYftRoufoEO2zqWpflGKoTyv969dCcW
 YjA531pw2DfkDBGSGv7GTBolxynKhJKPufaC+8L2OgB7nSEMHMkyZWsXG4xNISMk5V+6
 /WEECumNKP4pYeLTvnnCCG2UcknNCLgX7eE2+G6LE3yS92cqZrrH1GF1Sf5W+W8p8Uhp
 lk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q5C25KLMvRyGxkpTvnvXZ5cOsoO/cQDMB8waaL6gLjI=;
 b=KZ6faFRvuXQJnNG+aM6bT48Wd6JZrxPZ3pmY0Ys8XLrSOEhMCLGsOJGExg6EFeQdiG
 mUNUQCvpGV6NaNyPWkj9xVxWINnlp0++I65ozBxS3NFYO1KZpzIaKStat47ZDX1lfBSc
 uGrP+nDv2MfQZfWlK+FD48HSnPmVexua22zeU3nCuSDn93D9YEm7XIeD2ubyE8gRE8jL
 sdQ2aiNOHnXodz4jEf4gg/9eFYAqr2NA0sfyU57ijMyVgfA9cSIcFCohu3RTGdqHCKU6
 KknmiWQTY5IFFsZt5ioKz5LAW3IZIQzRKk1V4pR5FqfnRkC2JbGsRQ7tjCPBlTRC1a8U
 fBCQ==
X-Gm-Message-State: AOAM531kQ+26ALQ8vVP5G33lAxATvYpclAW6QnzFd59+xpCTcQzpHgNG
 CU9LCK8k9Csv4C6TDjERdlsGtg==
X-Google-Smtp-Source: ABdhPJxm7MqxY/sTcMaHNUCKvO3L9ddtYjDLSK9fQVZQczrLcntuGq21wXrzFhNu23RIzjoQx27VPQ==
X-Received: by 2002:a63:eb4f:: with SMTP id b15mr5276972pgk.2.1626363626117;
 Thu, 15 Jul 2021 08:40:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c24sm6949715pfn.86.2021.07.15.08.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 08:40:25 -0700 (PDT)
Subject: Re: [PATCH for-6.1] configure: Fix endianess test with LTO
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210715083928.933806-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2515eedf-6357-4fe6-0a5a-3bb0d7b5034d@linaro.org>
Date: Thu, 15 Jul 2021 08:40:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715083928.933806-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/15/21 1:39 AM, Thomas Huth wrote:
> If a user is trying to compile QEMU with link-time optimization
> enabled by running the configure script like this:
> 
>   .../configure --extra-cflags="-flto"
> 
> then the endianess test is failing since the magic values do not
> show up in the intermediate object files there. If the host is
> a big endian machine (like s390x), the QEMU binary is then unusable
> since the corresponding variable "bigendian" is pre-initialized
> with "no".
> 
> To fix this issue, we should rather create a full binary and look
> for the magic strings there instead.
> And we really should not continue the build if the endianess check
> failed, to make it clear right from the start that something went
> wrong here, thus let's also add some "exit 1" statements here
> after emitting the error message.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   configure | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

