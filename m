Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90C01CB8EC
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 22:27:05 +0200 (CEST)
Received: from localhost ([::1]:44002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX9aK-00082F-Ao
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 16:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX9YQ-0006RZ-Mw
 for qemu-devel@nongnu.org; Fri, 08 May 2020 16:25:06 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX9YP-0004Mt-D4
 for qemu-devel@nongnu.org; Fri, 08 May 2020 16:25:06 -0400
Received: by mail-pg1-x542.google.com with SMTP id l25so1371470pgc.5
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 13:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/JjaXfjZLIJZVgP+MJvT40fapG8SLn1Q5hObEAcBG5s=;
 b=hX+eDGTHoNLoQ35wKoTi4kuGvt9k1UmbKRivmBcuGOc6tPTehaG97iTscGqTU4TiKy
 uzLOrHjhn5KSqYM3GoyaeknshjNytC2RLrCmOO8kJZ6hDRDCTIb/PfCkU0ZTBlr3kj97
 pc0t3C2jZXEBZW5HrUnOuteQgp8PRlKGcLi7JM+sWAF1dB2HSlAq13hHE+Im3I2/4C5y
 RTS+arLwU79urgMQKL6Q/A9Wy8XSB5U3MK3jPNNYNg84Jo2FEdY3x8bfzxuHtGVx8mTz
 OoD8s4vfFCX8jy5/EQhB4peF1VrWJhJX/JRbvV+Jx772+RXC3ZTr59G8LcekWikfxefL
 pRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/JjaXfjZLIJZVgP+MJvT40fapG8SLn1Q5hObEAcBG5s=;
 b=jOD/CQFGMlcyrCoZs34jGePgBlCHr4HvChf2/aLtfQ7IihfMU/T+umIUF0iHuoEQLW
 KVdeSsIOrhyZjs8+ghwXuWeR0h6wRaLW0HizlZfBZwiY+6rOV1eiy+VBcJb43BX/ORhn
 DoTSS2UzXvZeE/BO2AVfyB0meMHDjamY0dT645F686bJZFAW0VgYuw5ER0gyG7mcq7+Y
 yQVUxM03BZK3bfcDtbhmbtTO9gHPD9kNxHTsrz98vvTjWu265yPW+OGiYq1vxvF4PtD5
 HkDw8YL7pFcZL5HOxCWNiHvM86L1LKFNLrSBW/J0U8/IkgRlAPXMxC3sh81Gc5DQvrhP
 DXfQ==
X-Gm-Message-State: AGi0PuZOR1JXKzcR4uP7ZFZcLxLvwfXDvqKYpHsraMn0bXIz74MAv7sH
 biRLhzUjMZWLPgvu9XPJba8N0Q==
X-Google-Smtp-Source: APiQypI55wI5S9o5zoNdeGpmjih71vA/JdbE1Bq1A3D/f+q6xOp+em1mzFMwojgDmcw2silFcJM0XQ==
X-Received: by 2002:a63:ce53:: with SMTP id r19mr3441389pgi.395.1588969503543; 
 Fri, 08 May 2020 13:25:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id ie17sm3134874pjb.19.2020.05.08.13.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 13:25:02 -0700 (PDT)
Subject: Re: [PATCH 3/4] hw/block: Let the NVMe emulated device be
 target-agnostic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200508062456.23344-1-philmd@redhat.com>
 <20200508062456.23344-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <066465fd-c2ef-57b0-dc66-fbac38ec612f@linaro.org>
Date: Fri, 8 May 2020 13:25:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508062456.23344-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/20 11:24 PM, Philippe Mathieu-Daudé wrote:
> Now than the non-target specific memory_region_msync() function
> is available, use it to make this device target-agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/block/nvme.c        | 6 ++----
>  hw/block/Makefile.objs | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

