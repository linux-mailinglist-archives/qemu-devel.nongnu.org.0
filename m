Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5082C36CA15
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:09:55 +0200 (CEST)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRDe-0001pI-Ao
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRAU-0000Om-Kb
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:06:38 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRAS-0004gb-PD
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:06:38 -0400
Received: by mail-pl1-x632.google.com with SMTP id t21so147988plo.2
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zzmyKW1k0ayANrIw7lzrief/gCdwmp8lceTL0V6I3gU=;
 b=LJwpaZcJx2O34HrlGgzB4SA0qRzAzdzP6q1b+rsRbb6uk86NNxeLrZyG/kECLfAQDo
 ekI/Q8tWON3RLGR6Z+qI2NjWpGHVPPCr/DwYHnGsEVbsMqqWjCAEd0dzG8nezYirS6dK
 spmbIglGbAeon0DpH4FvhoV9qMMntTw8OUS6aC1LEllSK8uJNogu93uYOOnch0hVEKyI
 MGUnSPIr44wIu3eiw/AecgnH2Vfk5wbp5KAaJeOyxBmxFA/R4c/S5y1LfXv/Kep4VeNn
 I3kGhqJnxnyot7F2hkJI2Tua/toTckBizFGK+gY0w2EPMVi+Nzs/l4IGKEBGLbGUQNNY
 xxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zzmyKW1k0ayANrIw7lzrief/gCdwmp8lceTL0V6I3gU=;
 b=dLVKREviW4auxL35CKrQffGBYNayZQLsV82jaeAJIqFboILVhNp13MimoV3oH9VqeC
 5/FrKK+NgjoP0w6ut48QUuUnP1AKEFFkofh82ndiw/46cdDS0+fhNmrZtJB9ZykUcczZ
 nxMDaNG4B8uCm7Hnu3dQF50ZYVKYoa3ID/m6g2+elmxJ8QqeCAVqy9es9sczcLYY8BR9
 vF51SEGrvSstEtAYJzi9fG+jO89ipiWjHkIanL04lObgVXCCWR/w+7f9Il2g1U2k6Y9L
 QLO/YmfNDwTsJhTLM7L62wae3rFtF6GVMM6lD+bbobFD0yI97vCZv0j5YsNrLU5l2qFl
 7zDw==
X-Gm-Message-State: AOAM533/kvcjHRCWWYL7ELpGjMFDi+eEzvZJEh4S6wXJ34dUPlVI1hVL
 Bv41Ulcbl8zjCy9F29AIA08Sqo+xxiy8BA==
X-Google-Smtp-Source: ABdhPJzSQTyQ7Yk7zhQX5T5C9Th3Y5oin+NwIS+vqZTOzLXEIaVD2wFhJcpqCUz+yWq/FHnek+GsyA==
X-Received: by 2002:a17:902:6b05:b029:e9:2810:7e59 with SMTP id
 o5-20020a1709026b05b02900e928107e59mr26007466plk.76.1619543195157; 
 Tue, 27 Apr 2021 10:06:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id j12sm3595507pfc.17.2021.04.27.10.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:06:34 -0700 (PDT)
Subject: Re: [PATCH 08/13] target/arm: Make translate-vfp.c.inc its own
 compilation unit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <afcda2a6-f0ac-c654-ee92-701810f522f9@linaro.org>
Date: Tue, 27 Apr 2021 10:06:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 9:07 AM, Peter Maydell wrote:
> Switch translate-vfp.c.inc from being #included into translate.c
> to being its own compilation unit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h                          |  2 ++
>   target/arm/{translate-vfp.c.inc => translate-vfp.c} | 12 +++++++-----
>   target/arm/translate.c                              |  3 +--
>   target/arm/meson.build                              |  5 +++--
>   4 files changed, 13 insertions(+), 9 deletions(-)
>   rename target/arm/{translate-vfp.c.inc => translate-vfp.c} (99%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

