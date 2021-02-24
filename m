Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08732446B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:10:28 +0100 (CET)
Received: from localhost ([::1]:55314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzYJ-0001aN-Ga
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:10:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEzTk-0006ZI-6t
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:05:46 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEzTg-00069c-Dg
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:05:43 -0500
Received: by mail-pg1-x52c.google.com with SMTP id b21so2085789pgk.7
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 11:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PVYwZw+2nDoVAkauNzY63B3tuXg1fnMyLMS37d+6Z00=;
 b=R2z42RXBMFhTcSI+6xhvNxI8B6RUUKZxOwKq8KWqBrCjUMKbRq1kQbAfB6llvrpXRR
 Rls1uRJ5sdY9qFDZz8ohaNgV/inuRErzYGj0Fjwyg6KZAVzcaAuPvMsw3mLy807vg9co
 r/Qbk07OeqreXiPZmEPeDvwJV0nU2/TqtofbJ0LoMuYj61uT4DIriTWJPOxh79c+ThPp
 t6VGxUdz10NHsqFXsyZsxRBOsLKkR0qD6YwcWfbsB/3qGQuv7m/CIAhaG+dzUjx/eGXC
 r0tfuv+PtcomJVxUe+y1wJYx+8ZOMXJBewyQ5zBuBGuY7ZnWoyYCpD7jjH0fX7dj86zj
 mWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PVYwZw+2nDoVAkauNzY63B3tuXg1fnMyLMS37d+6Z00=;
 b=uHIY/e2wCMaG4lds6kB8ViTDoB4iytzCZ+rDBkAT2ce9KUwMcFBU2w1zU/DvtsGZ5r
 yjZysoQIRHs9Jd62hobitb/M0c+guf+eNevDEPkwqJkNnIw+Uq0FjiiMsI77j4pLM9IL
 4geuYfMCc0AQroEJNudqcWT18+pzYTMsjqLP17OXPMmTZhjGZmSD7NQnEzXBcX8Yqqti
 g2ApXI55DXy+hg/en8vNkMVve/Np5sUBQafjJQTPG4kNswsJKAkFnDdQRxAw+C8C1q/I
 hQ/SUS8b7mr+vDOadKC1GFP3z+XTOI3w0yXVFH9hcpmX6xiiJ+zQnGpXniim4w3anzFc
 DpBg==
X-Gm-Message-State: AOAM532Pza/AITXlQlTdLSpiEpHQlW8zJ6nPe5k/9fa/8Ac3PJaRTxIq
 pDF6V3N0LR+GVk3lZR4042wlgA==
X-Google-Smtp-Source: ABdhPJwB7VDymAeG/Xn3uvxUAGMGQMXE6mNpgmSHRFOakJKYiCmzt/GDHSjqTdDaB2QS4V42F+jOgQ==
X-Received: by 2002:a63:c1d:: with SMTP id b29mr30350648pgl.9.1614193538761;
 Wed, 24 Feb 2021 11:05:38 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id v7sm3657057pfv.93.2021.02.24.11.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 11:05:37 -0800 (PST)
Subject: Re: [PATCH v4 01/12] target/mips/meson: Introduce mips_tcg source set
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210224185706.3293058-1-f4bug@amsat.org>
 <20210224185706.3293058-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <076d370f-a3fd-f732-ca68-642bdfc6ea66@linaro.org>
Date: Wed, 24 Feb 2021 11:05:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224185706.3293058-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 10:56 AM, Philippe Mathieu-Daudé wrote:
> Introduce the 'mips_tcg' source set to collect TCG specific files.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/meson.build | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

