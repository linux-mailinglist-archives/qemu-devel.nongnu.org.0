Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C551C3D9DA3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:28:46 +0200 (CEST)
Received: from localhost ([::1]:50484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zXB-0006DW-PX
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zVw-0004fv-Vi
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:27:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zVv-000319-M6
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:27:28 -0400
Received: by mail-wr1-x430.google.com with SMTP id q3so5475884wrx.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=21rbBM2OfdEHNNnwMUPrhW3NfK8KpaZXgf1MrgYtzRU=;
 b=eFsIHFnxu5UvDeOr17Mkjd608uX8oRImKC4RnARq6nns5SqrJs/vew/Y0kLI9AINUU
 ihQqJ9/NSOv6Xp1W8CleC1VpvwqXPnQGpubhX0t+v4GV5O/QSImnGkPIl6mXbUXa7GnR
 CMvwIHK125KQNWmmI955bKIASgyJtylYaNf84m/GtKRrSTTroivgFCwu9ePaRRTwcEjZ
 oR+6EeEsOiRSFMsbHx6sBtyJDyWwNcEkzmcHXoFgXShlq/IXPm5mF7DVLLfmnta+Uc49
 FqniCq6cIIgWgRC/0Wpw1ZICHuOfQ8O3DhjxhzUTJFJ5oVReMZ0dmwNhegvic7pShshS
 CFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=21rbBM2OfdEHNNnwMUPrhW3NfK8KpaZXgf1MrgYtzRU=;
 b=GyiUCUsBj/zSOp7xAtAyGPYJYfhy1x/Jlnk1X8WKr658PD3aVERi5+rsLwdVepym/3
 aLV0X0e/QBdCyA4D88ta+nG2049meH0ApubE4HFuEL9U0xq9g/truqQzKqlPja3ZVgw9
 MklgoATqCvM0NnEJiysuO7fG0Lbv9QG41Y4HcD2+EoSjbMfihaH9t3AHpuMiUWY3KlKJ
 xNWR0db0+Zdc4FewZVtoZdI2m54buX+cuEARxBcwCPBPoa50QcmoAOH41izboppty1sT
 rwd4/KNfYyVtEOKwMHxG+rYVF6rxc1csWHIr2VzE5kjid6zkwOVyCWZX+ceHcKAHOmc5
 9QVw==
X-Gm-Message-State: AOAM533qUQK+tWIGPS3YZGtqoJ7KccXIVFADuaJGYsdUJHcZKuEKOxcM
 SRnDesDus2MGN/XCzG8dZ67UtLcMiDql/g==
X-Google-Smtp-Source: ABdhPJx9gZpyaXzETc30W+OSzwB4lq6DMpXIBPrXkgNcPJNS4DONbVFBBGHP4LLpG2n86Hf35lfbgQ==
X-Received: by 2002:a05:6000:54c:: with SMTP id
 b12mr450284wrf.319.1627540046049; 
 Wed, 28 Jul 2021 23:27:26 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id x19sm2042524wmi.10.2021.07.28.23.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:27:25 -0700 (PDT)
Subject: Re: [PATCH for-6.2 21/43] tcg: Split out MemOpIdx to exec/memopidx.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a3185422-0a96-78c8-adb0-42ef41002d2d@amsat.org>
Date: Thu, 29 Jul 2021 08:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> Move this code from tcg/tcg.h to its own header.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/memopidx.h | 55 +++++++++++++++++++++++++++++++++++++++++
>  include/tcg/tcg.h       | 39 +----------------------------
>  2 files changed, 56 insertions(+), 38 deletions(-)
>  create mode 100644 include/exec/memopidx.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

