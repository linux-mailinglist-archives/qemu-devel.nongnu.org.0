Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D796390E40
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 04:21:16 +0200 (CEST)
Received: from localhost ([::1]:57762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lljAZ-0001Rj-5P
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 22:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj8b-00079l-6d
 for qemu-devel@nongnu.org; Tue, 25 May 2021 22:19:13 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:47028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj8X-0007oS-Tn
 for qemu-devel@nongnu.org; Tue, 25 May 2021 22:19:12 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y15so13684057pfn.13
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 19:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DPlXrCfHp8pQDQO1jfJmnZott4CioEXbswAa/pX0+o4=;
 b=d5Hr+p16DLEZy2sCrRQrzziwvZuCy3MBa+x2J6r8syyKWddyWVZs6rQB10zHapow5D
 MkqAMh3j8VGGOf+N/G/1OMp9ruGhmCYduomwjPcBGqGvJuUtn88yyntkKSbXG/U3nFke
 m9T4WoK0xIfSrcQrjhQUQcvgt1xnvI5TBgUa+/G2sFixkruIXMOVbbbLCJkr7DQEgMLx
 nSJp9bedkrrqMcBr+sd05mgANOzhsUOB4ikdNa5wL7iGIA67N4u9Qczc0365Yv2mN1hs
 szsqTOfxFkhfYIoDYVsn2Ne+e7MjLw0jTWsoIksNfzdp/+N6DwWllXXURAnqQkACQM5l
 P18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DPlXrCfHp8pQDQO1jfJmnZott4CioEXbswAa/pX0+o4=;
 b=KXmQKWwAHlhF/QF7gd5gBVhRZqztOa+/FXxThoZx4deb3/A0IouT6WiQhf9pTrSgAU
 Z3W8M92Wk/11QeGV5U2oNASdaHCvzkmgl1w+XYIF/ThC0UfvgN+2RzShou9gkyKtP/VG
 GrL1uzyw3g2mvhNQsiIjdi+SbjFwXIJgbdbnzK5/pA2P2tHwF5kPGGi6kW5W6D5BKWZy
 vrzQBLO+XFavOtK80rUAXxaD9BhhBuT56xsgEnEIVEf4mCTVbV4PCXe5A2P8vD7AZuQQ
 8JwwwGafzEoobczaaJuEulQHHuByf3BXitU+I/x+bTCfxLM605x7YoDM2aGaamCLFyBJ
 SiLA==
X-Gm-Message-State: AOAM531Ru5Ij5G1obeUhkE4wDj7qIdtYa3u5fLuuJ3XCnv88fmkARsbF
 ztMc5AUic/izmgahQX6MH+2NCw==
X-Google-Smtp-Source: ABdhPJz0jNf+4EIMC+VtTHanEqDjWzELBBdXI4oYx5POg5w4No/gYbJkESnfg7HSdO1mlcS4wM3/Zg==
X-Received: by 2002:a63:f245:: with SMTP id d5mr22014163pgk.416.1621995548404; 
 Tue, 25 May 2021 19:19:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t1sm15296771pgl.40.2021.05.25.19.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 19:19:08 -0700 (PDT)
Subject: Re: [PATCH v7 13/23] cpu: Move AVR target vmsd field from CPUClass to
 DeviceClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517105140.1062037-1-f4bug@amsat.org>
 <20210517105140.1062037-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c96e1c3-85d8-6d1b-8f9f-0b6a1bc5486c@linaro.org>
Date: Tue, 25 May 2021 19:19:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517105140.1062037-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 3:51 AM, Philippe Mathieu-Daudé wrote:
> See rationale in previous commit. Targets should use the vmsd field
> of DeviceClass, not CPUClass. As migration is not important on the
> AVR target, break the migration compatibility and set the DeviceClass
> vmsd field. To feel safer, increment the vmstate version.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v7: Increment vmstate version (Richard)
> ---
>   target/avr/cpu.c     | 2 +-
>   target/avr/machine.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

