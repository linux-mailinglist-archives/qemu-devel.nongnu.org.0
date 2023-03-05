Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D7D6AB1D6
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 20:15:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYtp0-0005QT-2k; Sun, 05 Mar 2023 14:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYtox-0005PE-4d
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:14:59 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYtov-0008Pb-KV
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:14:58 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso11068124pjr.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 11:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678043696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O/eePS8Ovx/PICTAK0Ax5NUzNrGFUth+TtlbxSwEunA=;
 b=Cti03RFxj2WVdfV+UoVyLo7F/E+BzFYM+KOlNnjtTN1XXvqxZGxS7WahNqilAZkOjV
 1a79CU8gtgVcYqzc/imSNG74niukdaMdZ0dI7bFDvjRlPfaJv8dzCWIxKXqx4sWUYESK
 dMN9T/3n1VAJVCs65my1/kkOclUrOJ2r4bZG+6KUt3z2smTrX8k0X2c9CBoUk5Lqr6xc
 mzk8h9XNYr/VMqtgLVy4hg4Gml6AQ+6NMbh9dnpfp3MPKRu4Ksxieb6DYgHx4bdA10bb
 FHM3MSAxL1howPJd6Xr1cHBJlU+tvFouM2Pqi+VCq3klQImZAoHPm/b3w/fsmknheKrP
 E9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678043696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O/eePS8Ovx/PICTAK0Ax5NUzNrGFUth+TtlbxSwEunA=;
 b=4bT/r8ehHUyDrPvqiooO+O8DcqXN0UtbpGwoURZ97vYQDWmM5f2/R9qT61aBS9U782
 bWxd6PHEg6egGc9G+BHGpq8zaavipb7HegUQEiVp1Tpotl23AW3Z2+JpeQ47aDx49cYi
 ggBRrdXHUxrD1xxRw5Y5kAaKE6mSUmHASzxtacIRhumPyBfWDWyAHflSyV9PtZDwkQ8O
 LusqpDzNECsZ5VPU47J8HXTSdDrgxRaFxHQU/H8NjJ9eae5NrfBOVCZ65xWzujF1hkRG
 skaKWJNBJYQoerfZmjYh0HZ+bf+foWiNG7utssZi/FaL8wFoRdqvn6iHzr8cQLZ+7ejP
 rVOA==
X-Gm-Message-State: AO0yUKXzSl+usm6pbFYN4i8xdGpdz0LtwyuH9PyDDIm9nwJzbsF5YIuE
 oDWrJRtJ4nzBcqlx5P1wpPG4jw==
X-Google-Smtp-Source: AK7set+1V+l6UgqPwI8cR4DAopY1FXVU1/5E03PGYTHY/Djv5PKWg4isTx+eCEGE6xNIb0mwk5erAw==
X-Received: by 2002:a17:90b:1d0f:b0:237:752f:1af0 with SMTP id
 on15-20020a17090b1d0f00b00237752f1af0mr9119088pjb.29.1678043696404; 
 Sun, 05 Mar 2023 11:14:56 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:d15:390f:de71:e264?
 ([2602:ae:154a:9f01:d15:390f:de71:e264])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a17090a284800b00233b1da232csm6356584pjf.41.2023.03.05.11.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 11:14:56 -0800 (PST)
Message-ID: <96c4430f-888e-1dce-edb6-fa18244c9e7b@linaro.org>
Date: Sun, 5 Mar 2023 11:14:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/8] edu: add smp_mb__after_rmw()
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230303171939.237819-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/3/23 09:19, Paolo Bonzini wrote:
> Ensure ordering between clearing the COMPUTING flag and checking
> IRQFACT, and between setting the IRQFACT flag and checking
> COMPUTING.  This ensures that no wakeups are lost.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   hw/misc/edu.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

