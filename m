Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565462D79D5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:50:09 +0100 (CET)
Received: from localhost ([::1]:45132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkgK-0004pu-C7
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knkc2-0001Dt-6u
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:45:42 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knkbz-0004be-1d
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:45:41 -0500
Received: by mail-ot1-x343.google.com with SMTP id f16so8555912otl.11
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q9wD72eSFKjZSiS33UhIZ8+G867ZGk6kYMlL/As49q4=;
 b=Yd5KmsTA2RLHTrTucdPdwcizOVIPuP2laoQ+zYb9YNwugtw+DsWXcR1FkJoC2usLqJ
 DhfW3YMFm1H7pZ/x5K0xTd6DqfX4cnJxPGLlEA90h/3DSqmQ3F6A+AXn+TL9Ros5XT1A
 JGQgWwsqdIGsUIi81lt+w0VI0nFF80TEMC7U7pi6Uir1q9oVmxPEw3Ks1TIMckWK6W+v
 YBBnK/cFNxj6DjJM6cNMGE33gBJaBi//yL3BymUoolXtMNbp+L0nA8UAVkVo6Amx0OSr
 c3tEWDY/vKOP4rvBh17fQlmcoxeUc2AXMOK8pvbeAL7AXK55b3eO71Ke+CWaNK+ST4r7
 bLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q9wD72eSFKjZSiS33UhIZ8+G867ZGk6kYMlL/As49q4=;
 b=V+QXCHZr9z0Y0SGmLbl+ui8ZWuF82Lr/+JT++cnVghdwZfMJASgGJ7vwY1NL9Tz85n
 wWpxllVstNlQ3d4L5fmJfFdr9fDrCt6ia8vcqaKDwyXnVNLUo3lr6kyfUBklHntOp9T0
 j4E8OS5mQZlWt4kNGDnUi7GFllZ6TWrZ+bHjJI/gEU7gofJW0AP/nVEXNbCCCz4dN6fh
 vR0fi6bEOFdJM6OBku43aSpw2xIhqX6uqpY35jr7506rvHNNHF/qTC8MytS3VOi9Tqvg
 TzIJnswxZT3ERd8qF0KPv/LuE1Eb/8cR/1iiEco2kbENMpim9wWyQ/NovaYMNHLbfPhB
 LZZA==
X-Gm-Message-State: AOAM530LuJwtpFPOgBP3tO6CbYUR9ZdrfbbCRtRL3bYW5Cwz2oNtZxmV
 e5ECNR1MGlLAlMsnDb4gzpXQaw==
X-Google-Smtp-Source: ABdhPJyM/ZmEPrRqA89MjibyHPNKOuAP3E3T7XAjq3NEZIXa1eXS2oYp4rbmS9pdtqcP6t7+l0gCVQ==
X-Received: by 2002:a9d:d8a:: with SMTP id 10mr10111890ots.11.1607701537767;
 Fri, 11 Dec 2020 07:45:37 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h93sm1893496otb.29.2020.12.11.07.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 07:45:37 -0800 (PST)
Subject: Re: [PATCH 10/12] tcg/optimize: Add fallthrough annotations
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org
References: <20201211152426.350966-1-thuth@redhat.com>
 <20201211152426.350966-11-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e1c121d-b61d-3ebe-2555-5c886458cb36@linaro.org>
Date: Fri, 11 Dec 2020 09:45:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211152426.350966-11-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 9:24 AM, Thomas Huth wrote:
> To be able to compile this file with -Werror=implicit-fallthrough,
> we need to add some fallthrough annotations to the case statements
> that might fall through. Unfortunately, the typical "/* fallthrough */"
> comments do not work here as expected since some case labels are
> wrapped in macros and the compiler fails to match the comments in
> this case. But using __attribute__((fallthrough)) seems to work fine,
> so let's use that instead (by introducing a new QEMU_FALLTHROUGH
> macro in our compiler.h header file).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/qemu/compiler.h | 11 +++++++++++
>  tcg/optimize.c          |  4 ++++
>  2 files changed, 15 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

