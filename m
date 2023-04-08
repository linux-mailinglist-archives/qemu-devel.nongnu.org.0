Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE446DBC8A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:05:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plDsQ-0001yH-IV; Sat, 08 Apr 2023 15:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDsL-0001o4-Iy
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:05:25 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDsJ-0001Vw-5p
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:05:25 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 nh20-20020a17090b365400b0024496d637e1so6691186pjb.5
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680980722;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gjLVIy6RvdmWH8+9bYJSO8zkUMMcylT9+JAEwNoiT4k=;
 b=CXsJZTf7/QFQUlKed24bbNzRPzsvjS/MJSiasRXmJ0JYoXTEpCVuPQM03/EslOAhPQ
 3vM8VLxcNvLLJhsk7YDPJpgS1g78Jfdf4OnpiqewgHNMCPKvnt01hjFEvyuH6ZjJRLtQ
 R3gic13T09U+8o8u87EJDu9NBdp63j7hMe8owGQb86KPJfxnXcF+xFJng7DhNqXaD+rI
 bDMjG5rls8E3Kp5/iaCpdFbGkqIElcqlGJq4plU0hVTe08r8C1Sn4JylRXuGSetSPSzH
 Eh+Xsttedd+UtK8mF4op+9/yz3vT7xHlHAxtMULYq2ZT8kzDIz3DS2qOVroJ7+lOqsDo
 Xj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680980722;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gjLVIy6RvdmWH8+9bYJSO8zkUMMcylT9+JAEwNoiT4k=;
 b=06V7k+k+BDzidjzIg5GL9sJ4B7PaWtT/c6C12wM6Woy9s2botUX51RBsIRRkVPZc2Y
 ZzGix/0svrV+BpRMZbvn4Vwc2+iY0nTVDIwQ7KM89pYhWN9nmVRh0VtzGBQxWE2IVfV1
 OemY/U72RUG9TtpT80oj1iO8BeTn2Jllni7Ee+6F9XO/i2NWoUjQFmI8H7GokX1LeXgR
 OBpPvunFhiwajRU3W+VCJhVNAyyyvklBV1GfSiYUuEl9kWCJgeVWMfPGpC6lC/sP0BzU
 1acFnQoSyYyX1rtKqXFNLNxh9/IstqNLeLQcnBdQVX3ou5FFPiWqf6PEBiV7wS1K1J+e
 ryNQ==
X-Gm-Message-State: AAQBX9dR9N8Nmgnl6xqztdJM3ANDyZgdB+EvtMcL39K5v9HFHhO5ScMD
 0SEUFgcIJrJK9rwRrPFAaZ/gwQ==
X-Google-Smtp-Source: AKy350ZnC27Qq2kl945F9IAb5DJVOdETu8NQpqvkbl6PfDfurRTnZ/IrMnN4ga3/ym6pJ/eLC51gyg==
X-Received: by 2002:a17:902:b485:b0:19d:553:746b with SMTP id
 y5-20020a170902b48500b0019d0553746bmr6660485plr.66.1680980722428; 
 Sat, 08 Apr 2023 12:05:22 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709027d9200b001a5059861adsm4232329plm.224.2023.04.08.12.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:05:22 -0700 (PDT)
Message-ID: <a02dcfa5-d317-09d2-cf4c-a610c6f2f6c0@linaro.org>
Date: Sat, 8 Apr 2023 12:05:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 06/16] bsd-user: Remove OpenBSD specific syscall printing
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-7-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Nothing calls these routines now. In the bsd-user fork, though, they've
> moved to openbsd/os-syscall.c, but those aren't ready for upstreaming.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h   |  5 -----
>   bsd-user/strace.c | 25 -------------------------
>   2 files changed, 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

