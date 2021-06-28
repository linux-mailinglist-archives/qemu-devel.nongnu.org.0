Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D733B66A0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:22:32 +0200 (CEST)
Received: from localhost ([::1]:47820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxu1n-0006G1-QR
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtpa-0001EY-Uy
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:55 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxtpY-000252-Ty
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d12so6799909pfj.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7yQHApf48LP1/rHYnUWmrjW6c1HCLt8fufc6eZQxzEQ=;
 b=W16eW3WPD5CSC7AH1VXfYIkT4fHQVJzT9Tw0IaWTozVQ6AJ88HnNSPT8ifduWDo3EN
 q67BlUw9obWLe//T7SvJQRvizRLXP1spDpJCdB0W+W+klwTHFmF6DeOy1OoqTlOR/kmB
 Jo62HyllhC8QgDq7ZfjpRhYz/bh6dgZ4W+u/+5f2+ywYUsZAZeOF+rYyiUexusXWSi45
 y4KlNHKZIVSxxnSvWJVpE3S1D5VtMD9CG4c9UNzagMgM2xO35ATZ617pisTiuADdUHrS
 lAp9lmJ5zNAiES6ICg7gJKrd+cWEf4Iq2FeFWA5+wlCDv2OdOFzTWysEZT4am7qCB+oq
 Y5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7yQHApf48LP1/rHYnUWmrjW6c1HCLt8fufc6eZQxzEQ=;
 b=R76xSPIJTIyPaO2v7MUHFQBx+22UMYPcju6OKR3VPndpbOUe4X1aJpAZwIXXpgRmE8
 imC3s37vRZNzUYvikDMjNr3VVhPOn1asYOiks3GqQ5RrVpSdogk2PXz+BuVHNyN6hiXs
 5W1dfXoB1xInoTPz7xn7hqdJUQ36+AEX10tIqql8b67buVkazHhsvJ7EhuS2y4dLJnOJ
 R+ZHR01yOyp0c0qpp4sRCY/W2jV21lfiBrYYirOulRtUgSE5gSJbuiV0TaduFniU0hGj
 N2QOS186Ra+dV7xBjUG7txjrylv09fvWeLjLcxsBvTfLy1E2C8wbHBK1GP5fdJOG0cGo
 YD3w==
X-Gm-Message-State: AOAM533pYV9lt02w4V+QCmDRzpZpTBflEhAnwplw+Ccd66JIv+SNgw43
 AXGTegUP9H+Ha5lBj83QlqYz2s0AviqH2A==
X-Google-Smtp-Source: ABdhPJwRrXntZIOrLsfUrucEZ7FJ+maUSb2LFNhy1Tj4k58+xadEcF4PvYQCSlAYBdxrQ/HefZUZLQ==
X-Received: by 2002:a63:ce0e:: with SMTP id y14mr18816196pgf.290.1624896590964; 
 Mon, 28 Jun 2021 09:09:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 136sm15236223pge.75.2021.06.28.09.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:09:50 -0700 (PDT)
Subject: Re: [PATCH 08/18] target/arm: Implement MVE vector shift right by
 immediate insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c4f5a608-c5d9-4215-a4df-1eca83d75027@linaro.org>
Date: Mon, 28 Jun 2021 09:09:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE vector shift right by immediate insns VSHRI and
> VRSHRI.  As with Neon, we implement these by using helper functions
> which perform left shifts but allow negative shift counts to indicate
> right shifts.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h     | 12 ++++++++++++
>   target/arm/translate.h      | 20 ++++++++++++++++++++
>   target/arm/mve.decode       | 28 ++++++++++++++++++++++++++++
>   target/arm/mve_helper.c     |  7 +++++++
>   target/arm/translate-mve.c  |  5 +++++
>   target/arm/translate-neon.c | 18 ------------------
>   6 files changed, 72 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

