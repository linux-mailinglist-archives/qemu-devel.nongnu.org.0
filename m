Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7FE6DBC92
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:13:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plDzX-0006Lq-H6; Sat, 08 Apr 2023 15:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDzT-0006LD-Vc
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:12:48 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDzL-00046E-6q
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:12:47 -0400
Received: by mail-pj1-x102f.google.com with SMTP id g3so2098719pja.2
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680981157;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fk2WzCYEkrwXSICdaPYqBSrHkOVjlcdiY/EumFY3tTM=;
 b=kBU038D6rUbFDVzAbcswcLqMnffD+zISn92TIJb00M0HbrWNpPZslkYX2C0rqv+n6y
 dBaZL6rUJZji/XroJ9x9OFuRt9k9+lhc13V409d7ddHeidqmxDi6hPKmqdLnreF/98hg
 vEjG8gABTDi2YCeS7Sl825xRQMKAWpGyHRH+bWhjJGXxvyXZGVqGrjy06Bfnlb1EOt+w
 U2TabFmIfzVGm3lty5hHyyaP6ja/kMABXnBpXCjmqCfvfAvViQZSZa4fWdKOAQFgPSZB
 SXpIgvw6JAWPYA6YaKzP6QoCFaPWVYpUAyApCNIQWi6/5kdthtE54gEiJUn8pmsAh6PO
 9dLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680981157;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fk2WzCYEkrwXSICdaPYqBSrHkOVjlcdiY/EumFY3tTM=;
 b=d4YRh4k1GxaOIKbzQZIeGPpuZnKOsPsyt7XkUQovGDd9rbUDZNjZO4ldGDuVdMj7uf
 v5gjJDw3OrRm1059IL+9GrrAi7VhsYCJmbsdtsAZqpHggGVTLsUHn1rRBbOUp0jXR73I
 g5xGZuelbEMW+ofosYG8w/pUGguO71YXE+IX9PcR3GjGDBHQRVgbIZYe4QG1/8dupH6r
 rNLCnz3Mole8EUm0eYWgyMhl7dHPShGVqbMmHPC20TkhgPU3yhdUGIOUgHIlxnIqinqP
 enjd+YXd0Hg+ioXHPrC9+WcSn+4fTTsg1tA50TN79REkyLvwylvWLHQp+gIIopZ0X2dB
 THhw==
X-Gm-Message-State: AAQBX9da7xMoICtRwSOOPMgX8UmX5Rskdi1rIknIp4EQkSUUGwIh7kQW
 2VcXOpmHVP7WZctyfYBoos7CsA==
X-Google-Smtp-Source: AKy350YAqgmBoDZsCMHvkKiIr4nBLTKyGpE5niuWWpvz0qi43bOBFPXWVJmzXZDDcSzDatn+TTbWXA==
X-Received: by 2002:a17:90b:3144:b0:234:4187:1acc with SMTP id
 ip4-20020a17090b314400b0023441871accmr6395399pjb.19.1680981157049; 
 Sat, 08 Apr 2023 12:12:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a17090b078500b002369a14d6b1sm545105pjz.31.2023.04.08.12.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:12:36 -0700 (PDT)
Message-ID: <f0bf897d-d198-d1ed-1ff3-4a4360539a4c@linaro.org>
Date: Sat, 8 Apr 2023 12:12:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 12/16] bsd-user: Implement do_sysctl_kern_proc_vmmap
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>,
 Stacey Son <sson@FreeBSD.org>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-13-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-13-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/5/23 14:36, Warner Losh wrote:
> From: Stacey Son<sson@FreeBSD.org>
> 
> Implement do_sysctl_kern_proc_vmmap. This pulls kern.proc.vmmap out of
> the host kernel and converts it to the guest's format.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-sys.c | 115 ++++++++++++++++++++++++++++++++++++++
>   bsd-user/qemu.h           |   3 +
>   2 files changed, 118 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

