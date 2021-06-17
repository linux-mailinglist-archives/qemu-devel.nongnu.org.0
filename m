Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2BB3AB796
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:35:20 +0200 (CEST)
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltu34-0003g4-N6
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltu23-0002w9-Ur
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:34:15 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltu22-0006EJ-C9
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:34:15 -0400
Received: by mail-pl1-x633.google.com with SMTP id h1so3145872plt.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PcPqSZhaGn9l5yklhtNvCEmiadrAbClUJitElZVuGBY=;
 b=qA+1o1y5QEixvaH8zskbcMlubl0xI6CtbTUNyXcHtYMLVRsmJ/A3zhWb9dwbGVDKkV
 987Myzk5GvUCpUAdhZVXlO9V3iZnZDuF74923hVzEYEi7VBg82bYH8SSoRmk/gN1y+p3
 rlfwNxuroJM5nr9ZEAL2ePYi+o+jR6eQXGclHRJv5Ju/xSKa0vvYppfo+Up97aZESGKV
 LnFYcEkrsxipgBrr4CdWbrlkUbJtFbSDHWKwIhfyEkxdz/toW1O6ftD+Ox3zrbLXzPoq
 SOLjRDKjMElIWXveq368oYcZ+DjVuNu8KcftBTWjnwvpy8jxqPg8NOnMg7dxcVEjnkNw
 zYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PcPqSZhaGn9l5yklhtNvCEmiadrAbClUJitElZVuGBY=;
 b=Tno+iQDrcK7QaCKESeYf/LbKSn2UC2RRaYrCABZ2xLdoFIannTNP4Ww11OPme6RpHk
 ATNt+BfL7+LqKoBdlaF2sRxamk5Nd2tQYj9CdhiiZcPpKYlBlUZDae60XN64D/Fr+fDO
 qs/5RXM7U0ZDZev7xXZaeX/tsUxIZhNiDV/fhBubxQRDbOYumU3qhYz23cssXgvsRTg7
 RVFmU/8I4cpeYBMpXr2rj//eU5+NT5TmDAlG2qT9wxtCEtiVkXfCnACX2MTdcRUZFcwt
 C84fehicg2gwddUafINERm6igIVzsjWO4lIaQjV+0Cz064yMHHKJRHIVkR1MYeVhvWsc
 EGzA==
X-Gm-Message-State: AOAM532mnI1iG22T+MnF1MGUY0oPIM3cXFXgZOxyHGV3STIoK+UG97S1
 RYND2nLrgq7EKnHnlMK7XgHn8vupseaHfQ==
X-Google-Smtp-Source: ABdhPJyGRnUMuSX886iC9lmTjNsdpZhzYjou+k4LC9Sgr0OG4BVDTAHLrLwUa6tEvxeVaSiF+UMRTQ==
X-Received: by 2002:a17:90b:197:: with SMTP id
 t23mr6012389pjs.61.1623944051677; 
 Thu, 17 Jun 2021 08:34:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k8sm5545130pfg.185.2021.06.17.08.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 08:34:11 -0700 (PDT)
Subject: Re: [PATCH v5 5/6] ui/vnc: Use qcrypto_tls_creds_check_endpoint()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210617121830.2776182-1-philmd@redhat.com>
 <20210617121830.2776182-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <feb572a4-cd96-0b04-1eeb-e2560c342ad0@linaro.org>
Date: Thu, 17 Jun 2021 08:34:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617121830.2776182-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.254,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 5:18 AM, Philippe Mathieu-Daudé wrote:
> Avoid accessing QCryptoTLSCreds internals by using
> the qcrypto_tls_creds_check_endpoint() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   ui/vnc.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

