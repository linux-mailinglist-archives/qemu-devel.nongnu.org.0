Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6F73D9F3A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:12:18 +0200 (CEST)
Received: from localhost ([::1]:51058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m919N-00019R-9f
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m917y-00005O-7p
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:10:50 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m917w-0007n5-LV
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:10:49 -0400
Received: by mail-wr1-x436.google.com with SMTP id q3so5836016wrx.0
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 01:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OIVAfUpdSGNtT58LWEhY2ChpPA+Uygr5Po8OI7Rvoog=;
 b=K1jj+Bk4uMcmuPrWk5i4xZ11pm+pfRf/zL9KtPI6FqcE7fd2sRINV4mIDpO4ikCvJt
 MteD82iY+4M1KU1NIzSkffAfzUOCbEG0rToJI+OAE2su5UuFIkJN9gubSGX9Wq7ftWhD
 v7hVuWt4XcUpbXayMUT8sUi7L6zTX6qZeSHYRNTGC5ejZj9yc6GskF7JhCpDi2jvTHJE
 a98kSsrtLiJf5eHPV79Q3VfggBVeGUjApyLPDLEV4YEL6cKxUhD3aLfCkuw6aO5Kpmhy
 4OCAPF/sRORds6+RIyizXS0f0ONF+g6VDFFnfwxCxqA7DYZlSsTXp1TyJorfNn6Q1kUP
 FVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OIVAfUpdSGNtT58LWEhY2ChpPA+Uygr5Po8OI7Rvoog=;
 b=JzFrWos+4+wRC5bsMOW8oooZTi9HvsQiBgJOkokXkLpog73yP7Iw/gPf0aRsrYiJbm
 1R7QeYbLmgJiMQPDrzP97ZzoTgLF4A7EsV9At336i0Xjrmk2/C1df0EY6kg30BLJjWQX
 F3Dyb5ISF8U9JuU6kL2dduWWYtO2ruYyVyty7eSLGSyjaTrzIAoM3RZuhtyhan8o1Ek+
 fRKbAAMewmOTnibzlGnLlI3nzcMn5zF+BjrPBGzbYCQuGcAKIxNfHlivQWOL6TpXPhVg
 hLBxTKyjyxEsZ5WZcT8z3LUEDy+FeLOFAmnddvGxLVBjY5dLbIMTy0f/ZugILKsL3Lar
 Ekqg==
X-Gm-Message-State: AOAM530lmn9EB4o0mBZwBQPT9uiKzprn4rqMjzzVFXP17GfZwiki1oxN
 cAMg8VRZsZOWM66MyhzuLm0=
X-Google-Smtp-Source: ABdhPJxPaUZoNwe8Qpma4dl187J2L1Z9v9MxdeQ2zy4R8IYDNJAciv0+biJdDkhPP6cvPMW0H3jL4g==
X-Received: by 2002:adf:f046:: with SMTP id t6mr3531412wro.266.1627546247164; 
 Thu, 29 Jul 2021 01:10:47 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id p11sm2491305wro.78.2021.07.29.01.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 01:10:46 -0700 (PDT)
Subject: Re: [PATCH for-6.2 16/43] target/xtensa: Implement
 do_unaligned_access for user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2490cc85-672c-fc05-4b81-c1a6a6be478d@amsat.org>
Date: Thu, 29 Jul 2021 10:10:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/cpu.c    |  2 +-
>  target/xtensa/helper.c | 30 +++++++++++++++---------------
>  2 files changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

