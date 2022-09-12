Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C795B5973
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:41:53 +0200 (CEST)
Received: from localhost ([::1]:44616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhp2-0007sA-DK
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhTD-0006QO-HE
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:19:25 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:42740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhTB-0008Qx-Mv
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:19:19 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-127d10b4f19so22381964fac.9
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Q9pGEgP3imALdWdCPbY0BAKouWUSMVCjfsRv0yXg9Ss=;
 b=L8w9jWNFT+3o0jFs0YZBgAJB/7Uff4SCO5NEK5BaTxQucZC+IrPotZ7e9gv2sRgtlm
 yEKHI82HgDGDDxHmvi0BFaYSmuuHYHFpYKgSgok0FO7koxcuJc13aziR8dHXkAlNxCoj
 9DbBarkssmN5tDCayyD1r3nR46EXfZ+JORu2E3T+ICe3MbW+6h5t/5gxY9QGauYAkymU
 gsr+qyoY7YHj0pCrh5xGXpv762yrXR9i9vUt4aL/6+KpDshfFB3BVJ6ayrLc48FgXIdG
 ay3PfkUm9qlhVqACZLBhWr3OJymD2EdX3j6eyU67YshQxWpD5ZuawIQ04qKSje3msYcR
 dHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Q9pGEgP3imALdWdCPbY0BAKouWUSMVCjfsRv0yXg9Ss=;
 b=naMgFzU4FRgA0wJWZfbMKer85PM+b53AQs4oQFllY3T9+gWbSuKvJOpSWqMgNpJwXK
 3KXzitKYDw5dJZX94L/mcmsnVW/zET5sOzyVFKW9FP5tr4gO/B12mbAgYrHad5IgM7OF
 dpJPz5rJRnzzSOBw29sfgEOA/7strNcLKTckxsxJfXXyHK5rmoBmQlIwgN/hbFw0+DP9
 cldZ8Oo+/5nJvop0yJXCxd/rRa9kn5OvUt/f+LH29t80dSSxMB+dLhAbDx0rVf9CD5eM
 BXoWXEcDnNmS45bDaZ4VxpF7dgK4N3siBQKMPaaolG1FSS+Vdy2/E27zEZq5s+lnPS1x
 8W+w==
X-Gm-Message-State: ACgBeo1gxn8mAob3oVUwADEOqv5XJyJF3hcObnu1Tw2owA4Hh4Qmfw2h
 nCjk5JHLwCIQ6xkcXY4ottuErg==
X-Google-Smtp-Source: AA6agR4Ag7n7slN4xbdGlv3dPH68Bn2Jn1aWZGpAPoQ8sXVNjYeTIATmZAKOuXcD0sOSPJnhftV9wg==
X-Received: by 2002:a05:6870:ec91:b0:127:6c6d:bc68 with SMTP id
 eo17-20020a056870ec9100b001276c6dbc68mr11299536oab.131.1662981556413; 
 Mon, 12 Sep 2022 04:19:16 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.47])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a4ae586000000b0044afc1ba91asm3905439oov.44.2022.09.12.04.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 04:19:16 -0700 (PDT)
Message-ID: <736dca68-1393-f669-5f6c-967cbd0dadf3@linaro.org>
Date: Mon, 12 Sep 2022 12:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 18/37] target/i386: implement additional AVX comparison
 operators
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-19-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-19-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 00:03, Paolo Bonzini wrote:
> The new implementation of SSE will cover AVX from the get go, so include
> the 24 extra comparison operators that are only available with the VEX
> prefix.
> 
> Based on a patch by Paul Brook<paul@nowt.org>.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h        | 38 ++++++++++++++++++++++++++++++++++++
>   target/i386/ops_sse_header.h | 27 +++++++++++++++++++++++++
>   2 files changed, 65 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

