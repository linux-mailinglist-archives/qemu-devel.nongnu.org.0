Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2DC2DB724
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:31:48 +0100 (CET)
Received: from localhost ([::1]:58188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJnG-0007ez-W2
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJSF-0003mX-Oi
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:10:05 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJSD-0005p3-RY
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:10:03 -0500
Received: by mail-oi1-x244.google.com with SMTP id f132so25250373oib.12
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KxqGV+AGNTcfF3zrazYtJ7eYwmIBbvEZbcQH4yg1ucc=;
 b=OMzErqkr+MJ0j1m6BUExYhdT+cWjx8CFEW1l83SZR8FPpCQR91xbKiCwmX+bq6c0a6
 fW18eMVXgMpNdc+EpNnvMQ9OM4Lpc1/FP+b4r5wgvhnQZAL8H4jpDtF5ACe0g7pCsVnY
 KGDkzhugFbOjJSi4c6fRPldO3EUccoxb5pWNkdysZH/WU62MoHUYJq5s2+iSODUqrVDS
 L3UOW2O3bjGRUZjWrlx4+Elit63ZuA1leAIp9IgOAF40A/86aJkbq4DZuCykHxdN3e8O
 w2UjgIG2smmLQH+mnVCU+BtlXgIxSMXEwtCfp02LQoDbQMRHkzHrXJyRiR6WVlra+CQj
 ttig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KxqGV+AGNTcfF3zrazYtJ7eYwmIBbvEZbcQH4yg1ucc=;
 b=LOcV8Y7LdCdBz9mgLQFMO4qUjn9msNlWs165MntIyflYOUaOlgdLcvCec2GRVhfVJM
 /YOzW1HPnbvSdMgJOSAnSVRXcQwjnvJdHYYYiNoXOI3HnT5QX0+tj0gb73Ox+DJb7rXQ
 6ETliuBX1kdkFE6o/8hSBe0vEbdbytD4OfCdULgPbd0KBIgbI4hTyHzo2msS5HffJmoJ
 b7LtDObXRGGc0s+hUgr4U7eWCucrXQuXf7X8hHZ9kodHLxm5iBmuTQQcc3GIv0MVEWqm
 7+j1cxzzKL7dN1H3Ca2gDPbL3zDOTHiroAkEsLi9kbGOp6pO3g4qqKALLZjoZMEANBK/
 Z2AA==
X-Gm-Message-State: AOAM531tjy6c2rUwtFuT0mC0rgl/X0cHi3HpFfT0AFVS2Xuy7y4w/yZJ
 VWKmB2YoJRfk21M8/TUxVt4Fkg==
X-Google-Smtp-Source: ABdhPJznkgL2tgml828BQ50Mi4XLxbwQr1VhGmLLDhS7LgYcUyRlVfJH5Dzer5/2+xH/Aq8fDUH4Jw==
X-Received: by 2002:a54:4413:: with SMTP id k19mr635066oiw.110.1608073798890; 
 Tue, 15 Dec 2020 15:09:58 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y84sm66894oig.36.2020.12.15.15.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:09:58 -0800 (PST)
Subject: Re: [PATCH v2 14/24] target/mips: Move msa_reset() to mod-msa_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b374223-9275-cfcf-6edf-c0c99ae0e971@linaro.org>
Date: Tue, 15 Dec 2020 17:09:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215225757.764263-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:57 PM, Philippe Mathieu-Daudé wrote:
> translate_init.c.inc mostly contains CPU definitions.
> msa_reset() doesn't belong here, move it with the MSA
> helpers.
> 
> One comment style is updated to avoid checkpatch.pl warning.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h       |  2 ++
>  target/mips/cpu.c            |  1 +
>  target/mips/mod-msa_helper.c | 36 ++++++++++++++++++++++++++++++++++++
>  target/mips/cpu-defs.c.inc   | 36 ------------------------------------
>  4 files changed, 39 insertions(+), 36 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

