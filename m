Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E74005B7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:17:51 +0200 (CEST)
Received: from localhost ([::1]:50256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEhC-0000PU-6T
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEeG-0005oG-Bp
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:14:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEeE-00063d-8M
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:14:48 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso213957wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dg8HkpdwLeKcvVG3M58Ji+NHM2VNBBFpJqZ0b6oGKN0=;
 b=bp0Ute3bImYhhwtKi8LIgn7UWdbhIKHNKs2z90DSiqInEMnmcFH1EGjE9HbPMbHCTb
 CrlKjI+PNMgRaifubdvrpr8obCdIV/rTnBD3tDQBhnnb+5eWxFJ+n98isIeeacfGz+I7
 jYsEwu0XEE5tu1PsF3FjveN1F8YdwwGWnZiOCVfI2s+UXqTuW7v6T0U+UWVoX24hXMXX
 lI6aXFCQjqowhUgg1INUrcGjm83vJPvJqXfvVOs8J0ZpEkHSGrfOzu8bRJW103/wW4RI
 FSI2GlXh7WYK0LAjJPQdi7OYHlxCG3DsChSH1nv+dNkPvvFeA6rRZ7QWVk9zCvW7FyuC
 RStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dg8HkpdwLeKcvVG3M58Ji+NHM2VNBBFpJqZ0b6oGKN0=;
 b=C8Ug6DAgSNmWueD3Asyh2V0uTjadh+5I9du1poKx9syQWKiDcLid3zuSO4EpDhtJgf
 1PGfmaIJUdcSmX1mCZbE7QvBSkTtRAQwmzGOGVtXz62Sf0eEth6T+Pzn6QI91AZUNSv6
 mcalw8iONQPwcmzySvUZht2Z32rUD22JZsK8MjtpKmy3di2NiHnryv7Bv2Osc3lughsy
 EPRu7P9L3fBXtRsmJrYfQeQrXZOxNUKBhfDbj+vNErBdiy56VlOCM8nHcggtSTbfuPMS
 oCcOu2D3Rue4onsKzdNoNOR9AnvRHTCtzZUXtpZQlM4++gjjqHnmBRB+qg1zd35e6842
 MS/A==
X-Gm-Message-State: AOAM531GALO/pH9DtVjWRVIv3QYssQrzLKT1xd2vmblq8iPQySLEqjum
 ITss9Rh6kIxCJnuVOwnJeq730Q==
X-Google-Smtp-Source: ABdhPJzul1U5CAmoJJRwL6XDng0Lj4P4+aKBvt5lZqBPspLbKnaDqjdDirsRcL30gXNafaDuKzYdwg==
X-Received: by 2002:a05:600c:294:: with SMTP id
 20mr311263wmk.180.1630696484044; 
 Fri, 03 Sep 2021 12:14:44 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id v62sm235661wme.21.2021.09.03.12.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:14:43 -0700 (PDT)
Subject: Re: [PATCH 10/24] target/hppa: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac9efb05-d686-176b-3dec-994d7eef8da8@linaro.org>
Date: Fri, 3 Sep 2021 21:14:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/hppa/cpu.h        | 4 ++--
>   target/hppa/cpu.c        | 2 +-
>   target/hppa/int_helper.c | 7 ++-----
>   3 files changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

