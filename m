Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A7443BE4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 04:35:23 +0100 (CET)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi73a-0006sE-LH
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 23:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi718-0004cR-2x
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:32:54 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:43686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi716-00063c-6t
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:32:49 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id j9so1390311qvm.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 20:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gyFhxdmnvIuvu2wL+Cx/zC4iV/6FLmL2SKlKtWx6fww=;
 b=KyebPxcBKMbjWoSQZ11y9gkkiKt/1XJpkWaIVyoHhHokunGvwn9CkNUJO8BYL6e11Y
 1xY9OMYcyDQhmqxyz5JphJBdz1kz+j0yDKeZsgeuPiSvvXivn4w5VFFJE7dZSfICFY1S
 FqzidKLDDxxN2bfnjZmkkBcuvEtPrtgpL55jptyvcrvnfTAdL5GBMWuDzYpf40LsYR4f
 xFFXDluxjP1+X2Aov8wXHwAm232OF4qFGlGam3JMMu5yfHIN5UMmCO2JnhLUPSrfudb3
 bWhtVk+i7kYT60nHzDTDh2o2gh99T4a62F7EPkPo8RBOvDHU/lV/kL7LxthyzXKgX6y4
 jo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gyFhxdmnvIuvu2wL+Cx/zC4iV/6FLmL2SKlKtWx6fww=;
 b=DRv1uK5HKBm3hAwS1KxhVJIaDynJjWosnJUmqfdto8oCTSzJUfnbybZQfQeszi6g54
 c5CMI4c6i+kPzCHezeEEYcEYrTuYZRLcM40tF6mB9T1xQwhMfX+VSqcqsNOTxs9yPAbu
 PaZol2jTvPccusMUc3ATx4BA/VF6SKtWg+Ygjwg2iwYCqmKI5eT4cuJkfDD90ubpq59e
 2n5kh416Jw01Cqp6Ak4tohZC7crK1TpFhck+LVXwr/kKyZoTMLSit6Pjxxape1ZqJR5k
 YGqudWiuLQoX9wZkddKyHcV1tbeuVKmR3i50bCWgBityI7QiPB06ISt2SL/Q0ShBbpNm
 a62Q==
X-Gm-Message-State: AOAM531QWSyMgmz+/7hXMOWUNMIfA25LBcuCIaNs/9JcOBPoNCul1vR+
 V5NfnfngzitvfPQa3hAwDFXi/w==
X-Google-Smtp-Source: ABdhPJyBGcgPwukGkB/upbdDsHEymAsxpUGDnGEPQZN+UVrtTXJuUUjFqowVNYPxTgSGt2jQO6fFpg==
X-Received: by 2002:ac8:7d0f:: with SMTP id g15mr36395330qtb.60.1635910367178; 
 Tue, 02 Nov 2021 20:32:47 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id j13sm681941qkp.111.2021.11.02.20.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:32:46 -0700 (PDT)
Subject: Re: [PATCH v2 18/30] bsd-user/freebsd: Create common
 target_os_ucontext.h file
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-19-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d56f6af4-4739-800e-b7b5-ecb8e4dab293@linaro.org>
Date: Tue, 2 Nov 2021 23:32:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-19-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:52 PM, Warner Losh wrote:
> FreeBSD has a MI ucontext structure that contains the MD mcontext
> machine state and other things that are machine independent. Create an
> include file for all the ucontext stuff. It needs to be included in the
> arch specific files after target_mcontext is defined. This is largely
> copied from sys/_ucontext.h with the comments about layout removed
> because we don't support ancient FreeBSD binaries.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_signal.h   |  3 ---
>   bsd-user/freebsd/target_os_ucontext.h | 26 ++++++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 3 deletions(-)
>   create mode 100644 bsd-user/freebsd/target_os_ucontext.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

