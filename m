Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F38B052F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 23:25:29 +0200 (CEST)
Received: from localhost ([::1]:56260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8A7E-0006uL-O0
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 17:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8A5v-0005u9-HI
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 17:24:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8A5u-0006MM-L0
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 17:24:07 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:42430)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8A5u-0006M1-Hb
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 17:24:06 -0400
Received: by mail-qk1-x743.google.com with SMTP id f13so22332983qkm.9
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 14:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bdVWKn053llBYtFfB6TsPdnMO+1HuN9iFst4OesvIS8=;
 b=raVGiK2/L1+5I0XuOMo7SXPQgcVWGxdq6qF0Up5bIaChUF9L2HhyFoEa90VjdFVAfc
 NClmTTLLGoYNe4ynW8QXTS7UTrnviReujeJ9B7RbLiPGzi4tC3GP/GA3ONHYLmFQXnP2
 zsQ9aaNn0gfdXqAmFeEo1YcZxv9yckT4pMCpcT7laL9dEmLXffL2bssqMSGhApi/sJJ6
 d8LJQdTNyxLCODEdHQRLl3polPNdhaIxJBpH4rdZh9r+PURuEFk+Z3MCvKblvXPR3HqC
 4/yeTTogsw+JjiNWTsV9FUCi2nHyEEuFZQklOA3LPE0uCGPci0qHMFhR8OqlB9NCb6U5
 DrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bdVWKn053llBYtFfB6TsPdnMO+1HuN9iFst4OesvIS8=;
 b=fcgOmAnWDML/NUyNZjKS+oCe9/XTqIrshof/Mvdgcm5NrgBEeaYBrWeXZcc2K4d6vl
 2B70mCHEm/IJnDep3RrPXPBuW+2AWx2KwjJOi/w2rRNxlE3biqW/gfrOSyjI+TvCV7h8
 dJxAOJUFIOo6xxnDxSP7o1XCZhqX2dyWsLTYDY4bNftIWzJRcT0HhxpBbJF98itM/Rgh
 DKv1y29sGb7jTVFFSFyxr2J3ZBMbKHnzW+YBIvnvk7/f7TgUpCEz0+PIRcWpuT1cQ/SQ
 T1VLR3wbu3t0C1egoFC+mpTXvz0ReYkmZ4zMnH1KonXPwv3JRSQ4i5jTpaVkO2AIXSw6
 ae4A==
X-Gm-Message-State: APjAAAVkJT00/ZB2T2QQ731PPnZVhRYY03vZ6nLT+kT2BXPaLLLPjWKq
 OhmoBjXN293IL+X6QXV6F/4C0Q==
X-Google-Smtp-Source: APXvYqzh7RcL5ibPp5vbKYAnyCnnKS1uYl39VSB19hnsW3o3194lYWRlvo2eg+NJzURaSyxJ8C3tog==
X-Received: by 2002:a37:af87:: with SMTP id y129mr19263425qke.98.1568237045884; 
 Wed, 11 Sep 2019 14:24:05 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id j80sm10650556qke.94.2019.09.11.14.24.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 14:24:05 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190906075750.14791-1-david@redhat.com>
 <20190906075750.14791-20-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3f050538-f068-fcb7-607c-997e2b2ec2c6@linaro.org>
Date: Wed, 11 Sep 2019 17:24:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906075750.14791-20-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
Subject: Re: [Qemu-devel] [PATCH v2 19/28] s390x/tcg: MVCLU: Fault-safe
 handling
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/19 3:57 AM, David Hildenbrand wrote:
> The last remaining bit is padding with two bytes.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/mem_helper.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

