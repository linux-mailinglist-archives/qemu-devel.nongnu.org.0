Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4C943E54A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:36:41 +0200 (CEST)
Received: from localhost ([::1]:53974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7SL-0002pd-1m
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7Qp-0001jd-Aq
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:35:07 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7Qm-00038D-F5
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:35:07 -0400
Received: by mail-pf1-x436.google.com with SMTP id b1so2810107pfm.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pbzpAyqEqEU6lw6rIowAcMbDEVJa5p6g6GIFcPtXGaA=;
 b=dgWmsMbsyBLQyzI8UV9kx5CsBqHi5a6Fz9817M78IshB9z6WF4N3z9dJzI8hWiyo6h
 FSK17bzVGt/mjovhqe9V6+Hw5hQTwxulC9Wd2wZ4vdEaozT0GZv9z9HKr+NL1s1NLZCk
 zcDMzFwSa2sASciFlCusSER1rVXgSX8Rpx0LzsrcJY7ie4cpvU+4fn7mXVwCxzdCpjfw
 NTplsDOx8siZYC+eikoobOfc4Q0m2PJk9PBI/BSCCwLpjgJUHOc4DEXbCQYnm5jKGncb
 jmiFqCIp9QzN9fJ1dVrhbQsdwq/T74s5cnV/84jSWSwoST57fn23Pc96J4/Hj6PW6wI4
 fTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pbzpAyqEqEU6lw6rIowAcMbDEVJa5p6g6GIFcPtXGaA=;
 b=B1NH91WIEn+Sk2Sbc72UmeL573PxIr+otm/KGqVjFGEj4fpAxQIgrFXK2E7wTjXAA5
 BLdNP2AIMGA0LxQRT+ZbgnPUDFAM2U0QtYrq6nSN7+8qt+A1Y1+iIiMCeecSdY6dd6nZ
 i/kxX1PZa7G5zXxSNXkkEsHPxGf0LNdoAaziM+uliJfcaVWv4xDaFZtAF2bgGYFuu2Oq
 dUiubDJv4e5VvJj8VbKaJJfyc4dNzuDwJmf26nzgI0ku54dJqdkpXI1MzmPhJvmk/kOi
 V6HTv5/e5v/UCd/0rp3G0qUK2UOpxWe5p6ZrdwrJIZ+gY9hhfBN5N8ht9CgzI4jQoUYt
 Xmtw==
X-Gm-Message-State: AOAM5322D8Zw6MumnRboxo5FaBCUNR7fOSTM/2IibaLdoqNgVmgrK0mL
 OK2++7xgJ49ERawjd68Rkxkpag==
X-Google-Smtp-Source: ABdhPJxOSidAlZcNsZKd/WBmWQkO0KzO53yqevLujbsPpjJVW2xcmor85xl6Y8ykj2Rx2+D+m5rOpw==
X-Received: by 2002:a63:fe03:: with SMTP id p3mr3737262pgh.289.1635435302710; 
 Thu, 28 Oct 2021 08:35:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id d12sm2704229pfl.141.2021.10.28.08.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:35:02 -0700 (PDT)
Subject: Re: [PATCH 09/24] bsd-user/arm/target_arch_cpu.h: Implement system
 call dispatch
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-10-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <152e8afa-fc89-5666-e234-a2af6bca6acb@linaro.org>
Date: Thu, 28 Oct 2021 08:35:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-10-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: qemu-trivial@nongnu.org, Klye Evans <kevans@FreeBSD.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> +                env->eabi = 1; /* FreeBSD is eabi only now */

Surely this should be set target_cpu_init.  Even then it'd be just for completeness.  This 
is the kind of thing that shouldn't have escaped linux-user, as it's otherwise unused.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

