Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7FD6065EF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:37:37 +0200 (CEST)
Received: from localhost ([::1]:49894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYY4-0006CP-5B
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:37:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYLM-0006PU-Ub
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olWuq-0004VZ-Ct
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 10:53:09 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olWuo-0007FL-VL
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 10:53:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id y10so62930wma.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BVuri5dUPyyfvXksScc1dGkVrPPXzR9ZCoPxR1LDGXQ=;
 b=Bpb+Ft63QftjrTuceIRyXruCOZuC5+f/YMgf4RCko/RSqET+YeieBFsrGitsuE0pYn
 QALTaw2NZ++KbgVsj+jZsbxxLBZpGFp6e5jtu6W00eq/6+f1cZgHYiiBEP7q/P2IOuAg
 9iO943Iy8B4NtY026a4IpraVn5cGnEEJwmPD0bXUu3aVZa/9uw306ZCYINxp5iChWHG8
 T+V5QA2z0FZr3ZCDwrbAIKNk1t27OQhG2sbX6YP5vrzPzLTOoym7PuQNQbti1ePH67gU
 NmJrWXgPccDMTNdATgMYwyvHorj8CEvK3cl63W6QMNJ9hlcqJMNPVxIHVVf/76eyRUSH
 se2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BVuri5dUPyyfvXksScc1dGkVrPPXzR9ZCoPxR1LDGXQ=;
 b=0necSc+793Ffh3Yh0HxvXJwhY4wi9AV9Ukrs+KMDffMx807wM+42kdbhGCm6llnwhz
 SWZncI3wiPAyrxvG2Yy1MrmW/G1VAzGeMy4ZKki1QCFvbAbfcq37sDuqXX0ofPPgiR4g
 euHqhFL+/2qQV+DDqArzwzTIewJ5TXjP6ZX7jHpTjy4O+TvcQ+ssrOnBCa+P23L6PX2C
 008QXY3kDgVHvv2tqhzi6f18xAMrtUFf3Hw3DPKK4TybYLQybcRDXfyfYKorcvPHMgF1
 dO05FySwzqrKeA/TIJKu1dVVCHAPiCqQbVwwdTPC3GhxfUnjvrMWV1gKHxe1BAPfvRnt
 agQQ==
X-Gm-Message-State: ACrzQf2ghzMplqScZXhojYvUPvp7OmV9nZhsHwGoxngRtioGezfAxxh0
 LN3GB7r6Bulpb0qh/vMr2beUTA==
X-Google-Smtp-Source: AMsMyM6cGidoGLk9WVA19uXb4Y3U7HszUafng6ujLujlYUkwvqbWdgTlHSjC6gAbyFhvbaDpRWd63w==
X-Received: by 2002:a05:600c:1e88:b0:3c3:ecf:ce3e with SMTP id
 be8-20020a05600c1e8800b003c30ecfce3emr30399311wmb.15.1666277577093; 
 Thu, 20 Oct 2022 07:52:57 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 123-20020a1c1981000000b003a6125562e1sm2941615wmz.46.2022.10.20.07.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 07:52:56 -0700 (PDT)
Message-ID: <40f90271-989c-f72d-7e8e-5dbdb5d9b816@linaro.org>
Date: Thu, 20 Oct 2022 16:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 09/31] tcg: Move TCG_{LOW,HIGH} to tcg-internal.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
 <20221020115242.2301066-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115242.2301066-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/10/22 13:52, Richard Henderson wrote:
> Move the error-generating fallback from tcg-op.c, and
> replace "_link_error" with modern QEMU_ERROR markup.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h  | 12 ------------
>   tcg/tcg-internal.h | 14 ++++++++++++++
>   tcg/tcg-op.c       | 10 +---------
>   3 files changed, 15 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


