Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C551C6DBC85
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:02:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plDnk-0006m0-Ql; Sat, 08 Apr 2023 15:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDni-0006ln-1g
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:00:38 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDng-0000XA-JY
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:00:37 -0400
Received: by mail-pj1-x1033.google.com with SMTP id c3so1785343pjg.1
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680980435;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=irpQ2F0rRq3sGxtVU1u4+89ojmVfEQ/CFW0L5/47G1U=;
 b=u5aHHQg0e/fg6afceqHevWQI4WYzA0lLy5/rxX2tLhrIATfOnrPfXesGDO7ZCv5GyC
 NL4Zsu6JSA2ZJg2bbfcRrIsJkAVys2TpFhHIh4Uk3oI/jlgmdUmda+Z3k9cNfD/zCxcI
 QY/PBo3KUH2wL619iboeHmwIe9rZ/NRv/5UoABLxSYkBGlO8wXfJr+iZ5zsC37S29Ikp
 wJekuZZsUq1XMhGAAENsvkFfAFutLNFJuW7VB5GVHEb2DmKMSY7hZjp7oOE+B9tSjBJL
 AjOPMYCXmST2yXH6TWud6Z8UkWG+Pn6Zb7has7nzWrvBZPMUNO/hubgpIIxdg32wfuFp
 x7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680980435;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=irpQ2F0rRq3sGxtVU1u4+89ojmVfEQ/CFW0L5/47G1U=;
 b=k11hUiOk3TSx9gErSx/hc4pJIk0RNFWB2VZLy6GqlcWEt/IWhzaMamD6+q1PI4/2eN
 Ap0vUbHHdJ1KRQjx0OojmIBezEtPmJvb3zn8nl8B4yb4qbZUaulWYriAn0TTLwrSaykj
 173AvhKvYGO4WSgNQDppAMWN3WsjdujE6AO5By9Q4EciwxaMgz9hzKJpL+WR+AJorSVZ
 2NQc4EobD+U40JpkKjVgjQnaK+hjMOydaginWLtPO2ORdq7umBOl3Q3yVD96L5vr+GpJ
 yw5jhrqQb06FJIo2OGkVEzO2rdCQMPOm3j/jXGkbU37lI8TwoBqDKLyo/UsKkfOVP2a8
 4zxw==
X-Gm-Message-State: AAQBX9fee7likePvaCgqg7C8pauRsOCbLgJyZVDDSlMDXiC2sErV4WrC
 HSiz6Si5UwX7gJNnGmxoHxw1Cg==
X-Google-Smtp-Source: AKy350bJhLYav9+vRGPsdcF5o+BfJaKTJxoKVTu5CjvRDmDTUmBdtmN8oXovndjBn0rr6bVngqQfcA==
X-Received: by 2002:a17:902:c406:b0:1a1:e308:a82e with SMTP id
 k6-20020a170902c40600b001a1e308a82emr7754922plk.12.1680980434943; 
 Sat, 08 Apr 2023 12:00:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a1709026b4900b001a1a82fc6d3sm4813769plt.268.2023.04.08.12.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:00:34 -0700 (PDT)
Message-ID: <e121e02b-a626-3e27-290a-6f94d2b65a9f@linaro.org>
Date: Sat, 8 Apr 2023 12:00:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/16] bsd-user: Make print_* public
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-2-imp@bsdimp.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-2-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 4/5/23 14:35, Warner Losh wrote:
> Make these functions public. Due to coming restructuring, we'll need to
> call these from *bsd/os-syscall.c. Add declarations to qemu.h.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h   | 20 ++++++++++++++++++++
>   bsd-user/strace.c | 29 +++++++++++++----------------
>   2 files changed, 33 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

