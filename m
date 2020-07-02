Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B5211ACD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 06:07:10 +0200 (CEST)
Received: from localhost ([::1]:49102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqqVB-0001fV-Ed
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 00:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqqUP-0001DH-UK
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 00:06:21 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqqUN-0001Mr-Vx
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 00:06:21 -0400
Received: by mail-pl1-x643.google.com with SMTP id g17so10754578plq.12
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 21:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MWM3UCucWsUVD+Mol9yvgxVXlWoclJrv3UEPBUttlH0=;
 b=PAYWhPZ9gCbJCtVM6xiUXdSZ5BLDNJLEiNAcFBRV/rTm3dFh+Ylc3mY1EPS1uu449+
 bhnAjeYtNMXJx2Tz0GNWBPaowigJngksGamNDnCyhNT0pLo/5uHq6RxeU3CDKYiH8eEt
 3fGlEVfAgSkMxF77VFWnMEISO4U9zFjOPEA70+iBWmjjWyTASur4abOwSpAarJju5+M7
 rwj7nxKFdTmEy+hjsGgFP90Qg4im8FSH+VLpTKxtH752P0nJEYzxZVrZF4EDoQIwJdw5
 XPiTJA6QuCWmDNA79jy/bo1HYLxNg0jUotGwKnztxlL5NH3y2U8GvXIYG2tdyXN4aTBJ
 Nm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MWM3UCucWsUVD+Mol9yvgxVXlWoclJrv3UEPBUttlH0=;
 b=rUOa9jQw4W9RI0zeqf/rP/0bXm09RGXheVh2L+6bxFi1FKbBjG7pjpnxMgRnI3POAG
 v0htyVeawUs9KG/t/2S+KApEy+za2bS2N8vf8pT5MP1CYOwzsqJjqbcj1/Z3zj3Z3Iw4
 gglF7kftGH6Sqt242BPDO67PT4eJQr8j60Vu6OtWvQEcaPXW34j0isqjZX0UXUXy3Y4G
 GAg3K1XMXf56SvH7JUusQgSVfuJ1j8mE+dPFR29es4LfPEYdR9p1E6cXtdbT7F+66t5S
 OMM6oQYcuGG5HGYKF5YDjvFGmy83E4zEoppRDYuW1gcewruDCXH3HnEf4WQ4QaPlKPih
 6Sxw==
X-Gm-Message-State: AOAM533hejveIhcOZ/XjLlLv8rD28yHOtXJOhdN/F/vrg1fgnKKok0w9
 PM4B/vtxnYrAVlbw2dwe87yA+g==
X-Google-Smtp-Source: ABdhPJz2OXgGbo4JQZ7SoaqUC9PWXxMcFrAM18l4AAVThzUFtvSBbm90movdUXclBeOF8rCkx3+v9g==
X-Received: by 2002:a17:902:c206:: with SMTP id 6mr2041915pll.30.1593662778146; 
 Wed, 01 Jul 2020 21:06:18 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id m92sm6601405pje.13.2020.07.01.21.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 21:06:17 -0700 (PDT)
Subject: Re: [PATCH] cpus: Move CPU code from exec.c to cpus.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200701175432.18892-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <277ea576-39a0-4550-5ddc-846c3184b18b@linaro.org>
Date: Wed, 1 Jul 2020 21:06:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701175432.18892-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/20 10:54 AM, Philippe Mathieu-Daudé wrote:
> This code was introduced with SMP support in commit 6a00d60127,
> later commit 296af7c952 moved CPU parts to cpus.c but forgot this
> code. Move now and simplify ifdef'ry.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  cpus.c | 18 ++++++++++++++++++
>  exec.c | 22 ----------------------
>  2 files changed, 18 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

