Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A1B427BD9
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 18:17:35 +0200 (CEST)
Received: from localhost ([::1]:56708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZF2U-0004pF-6O
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 12:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZF0U-00041o-JM
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 12:15:30 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZF0S-0004KM-Tr
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 12:15:30 -0400
Received: by mail-pl1-x633.google.com with SMTP id a11so8245424plm.0
 for <qemu-devel@nongnu.org>; Sat, 09 Oct 2021 09:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LbIItyNMfmfFOSwO17ZIKfEKiBdA9BymBH2/5g7yHkQ=;
 b=bGhuxo470sgdilRlppBbWqpw5MQfaNIDrV9Z/2ngfJ2W/KC8IRJkm4qVU+uKE15CnF
 DZiJWt/FyiZmhOqnrVYN7jbB/dLVntAIhHHorMbIqfQxStURk6741pWYO3iPWnd8Y4nh
 9F6TH0hvpUVct1nv1lqYgfdQBnC8ZCfppe8FtTpZczdvFUwEsBGVaid7jxDmQLRy3nPr
 dSh6hC4BELaxO7TeRIsZf2kqbJDblUedUgnxsVvtLiJOx4BfMYxY/O4cIAlvoLBiVDxN
 Cf13SUWwKAgN+PUNKDmm6SJ/UnVYgw7XISf/hSZ1A472vkK5S6xH0NjGgCQDIWrKX/hK
 CKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LbIItyNMfmfFOSwO17ZIKfEKiBdA9BymBH2/5g7yHkQ=;
 b=2DRw+WcuKA/f6mDOdqBa6P27ZYJvxDZZcOqwbU1oeF69qGFakZySBJ1VsziVoS9yPx
 Y4sCYoPQy6fMgUwi6qSzbb3xEdCczhSNMBuxyfCfMDGTs6M+bBzB57wHCtIf0+FuDe2z
 9+z3bFSjZ1Q+7UheDxXEiR5rd2nbY/NU6TulcFacJw1ljWxXrP34aljZQqWB3Jg5JQ77
 AJV7JpAwV2UUi1wkpYUFHL3ytAyjDN1Y5s+YDgxa7AVJv0AVdpewlvigD4cXbnCkKqyF
 1sriV4xqxD1B23oUhuNeeHSQ/VDG0pyt/2P+njPqkme4fnBVSXvPKEFAHhpmlMjmF4ns
 nxTg==
X-Gm-Message-State: AOAM531t+RdM/tzLTaXXzHAw67naMRC04mgcifh01RHSi4ndbWpws1gs
 3gH4WUu5N2aZTvkx12xT7EossA==
X-Google-Smtp-Source: ABdhPJxp6g2xVe7DL88TFermIijLsLBcsXg0X3u161nC8e7kDKiq1TnXsG9RGd2LnIkn1SJPx77idQ==
X-Received: by 2002:a17:90a:4fc5:: with SMTP id
 q63mr15074323pjh.148.1633796127044; 
 Sat, 09 Oct 2021 09:15:27 -0700 (PDT)
Received: from [172.16.83.58] (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id z65sm2608764pfc.30.2021.10.09.09.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Oct 2021 09:15:26 -0700 (PDT)
Subject: Re: [PATCH v2 15/15] bsd-user/signal: Create a dummy signal queueing
 function
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-16-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d87ededf-76ca-e72b-1dac-09e21024e870@linaro.org>
Date: Sat, 9 Oct 2021 09:15:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008231506.17471-16-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Laurent Vivier <laurent@vivier.eu>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/21 4:15 PM, Warner Losh wrote:
> Create dummy signal queueing function so we can start to integrate other
> architectures (at the cost of signals remaining broken) to tame the
> dependency graph a bit and to bring in signals in a more controlled
> fashion. Log unimplemented events to it in the mean time.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h   |  2 +-
>   bsd-user/signal.c | 11 ++++++++++-
>   2 files changed, 11 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

