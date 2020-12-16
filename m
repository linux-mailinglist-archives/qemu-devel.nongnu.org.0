Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D962DC27D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:53:30 +0100 (CET)
Received: from localhost ([::1]:43838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYBF-0004wO-77
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpY9z-0004Lc-5y
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:52:11 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:34679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpY9w-00040N-Rh
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:52:10 -0500
Received: by mail-oi1-x22a.google.com with SMTP id s75so27756307oih.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 06:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Q9ozGtjMkkD4A246h409EB6uUjrUW5VNExcutgn7bc=;
 b=K3/jL5ejPM0Z6iXxHVaXOLfqkfzzRMnW4imv6gOoHAQKxB2dV/QZ8zh4iQtg63H4Sj
 01/oVnlplaX03q7FQyckDsQqtWu/Pgxy90+9+XToi1Onx6ByiU70RocAG2/EAxrinUvn
 u8mpHQa4xxw6jRWWYH1kYHxIESOyLCAU4zNiJkslCaGILQRc7oz2MsIP8Yw/cy6CogWN
 4jaIVOECHZk0ZSGaWBlY5SxMt2Bw3HhNWcpkB4XT/YXkwXJOYtk/HS5rUqEn3M1skKC4
 jfwns08V0Z7D1kB4/JMngJb1Ll9tsekcwQp9G7DDYRRstV/EPwVsnfgD6EyId7styBlK
 JGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Q9ozGtjMkkD4A246h409EB6uUjrUW5VNExcutgn7bc=;
 b=FbXPWHRxhXYpR64CO33bMVUarC9kWETrBlmrpnnQ+DRne8zokYa8qxaFaaukYs0NVM
 j+wZJN4WYopZNFcFjvGkfJUz341tFjgx5X5TyMzOShH8PQqY+MrcIdp0aFBkG5vkfVWM
 JtlSaVP9cQvy5F913uQRJ9A3VWMkrndFtffzJns1YobL+p9Vfe5m4oRznYZ5KaQen2KP
 xEAgTyo6oH/wzMOVS4htK83QVqFRhd8UGBVLNjPRcgc9Rt7+D/C1hNvomWc0yJGUJBoe
 jxtimquvq/fimhYrrQ0TsQu6xsBRYMdZZh1gBJD/Uz3wgniU2IWsJqH5AwSSpAs1RF7X
 Ok9w==
X-Gm-Message-State: AOAM53050nSuoH5+ZPiKhM3RvXlRdtHQxjLwCQmIl8R6QGpVxANrDZhB
 EZDZPV8hBhWCWiWRttqbDlL34g==
X-Google-Smtp-Source: ABdhPJyMjJOsQCcvD962G+i5mpTu20oyTimtLhrLVuRW08PLKHHbi04NDNaTKOCH5kPbVYipChHrXQ==
X-Received: by 2002:aca:bd45:: with SMTP id n66mr2209868oif.132.1608130326823; 
 Wed, 16 Dec 2020 06:52:06 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a15sm435592oii.50.2020.12.16.06.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 06:52:06 -0800 (PST)
Subject: Re: [PATCH 2/3] move icache flush out of tcg.h
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201216135529.265165-1-pbonzini@redhat.com>
 <20201216135529.265165-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81af6c34-3ede-0a5e-ae3a-4f9f2cf205a3@linaro.org>
Date: Wed, 16 Dec 2020 08:52:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216135529.265165-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 7:55 AM, Paolo Bonzini wrote:
> icache flush is also used by non-TCG accelerators.  Do not require users
> such as physmem.c to include tcg/tcg.h.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

See also

https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg03623.html

I moved it to a new file, rather than into cacheinfo.c.


r~

