Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D752530E284
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:30:10 +0100 (CET)
Received: from localhost ([::1]:53392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Mun-0001P2-Sy
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7MtF-0000LJ-Oy
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:28:33 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7MtE-00040E-2r
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:28:33 -0500
Received: by mail-pj1-x1032.google.com with SMTP id cl8so187443pjb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 10:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a3tu9XUt/J0ThZrC67TWP1h0eqMB27MzYZPXTgo1riE=;
 b=q81vj3bTXl9tlkyM3InBQ3vvBK7j0oQ25paD4svfw0gINeyXpwiapc9KeS/6JwSC4I
 PtTAaQmpgw2vtlm8r88OFQPgKvZUnke2LRor5KN/nQdMyMOmACvS8I9SfvTr7E7ATK4t
 mOwai52+dihF4WwU9kRQCEdfrdyAnwb3x9WoqL9NEc5Tlsm7PFMiAMUS+pEoxY2+NFYt
 DZs4TrWlnivyDma8jAecGj1noQ740FHo0iszJO7hZg/oAqFheyEemyNkB0MhUq7UyYg/
 +D9XvOPfhKcsN4/EysaxzsalJsvi0y4zySUHrFRosHZmC7jPSdidsOPIj83A7muZSG/I
 yb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a3tu9XUt/J0ThZrC67TWP1h0eqMB27MzYZPXTgo1riE=;
 b=dWb/0DYw+gaFbqwZ8f7vQ0QZU6TiCvzHzQqfweCqF7vYKfHXiTfv5Q5srD6bLi+txc
 QqvQWhmG3QaBgjyc98Nk2BnRfTtlmk/3QyZnO1jLGUhfy/swVJNPnPpdXpieVfrZTdaW
 9gOgCXlXFcbYwaBDBXBuhjBodb+MlLOJuG92fMQLjeFab+NFQdxKEHZqMc0NXVSsPWNC
 20C0yq3HwoouF3qBEBLdJDj+PS3rzOUsmF6evFLJpLZc2Db0jxVh7Hsk1/nioQeartO3
 BXxnoyFACWudS+3TuYbPLm2LQsLZCdzZrd2jhyBwEBeIwUfNFDeE/xttO8IsopuJuAPC
 fN5A==
X-Gm-Message-State: AOAM533onv2ARlJyUKaaHUaisVCRGS9MaVFCCL/UCr6jqZlTx/MvbIOX
 F2ty1umJoJiIBrN4dJJvUOgyIthqCOhH07Np
X-Google-Smtp-Source: ABdhPJxQxlxdGHfh5VtdwXL3eIeeMsPWgkE4ousXcQeCKjOTclhbL5QK6zmRQqnaobydyUhJUXnLeQ==
X-Received: by 2002:a17:90b:1088:: with SMTP id
 gj8mr4443909pjb.35.1612376910521; 
 Wed, 03 Feb 2021 10:28:30 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id bo1sm1611325pjb.7.2021.02.03.10.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 10:28:29 -0800 (PST)
Subject: Re: [PATCH v2 1/1] target/arm: Fix SCR RES1 handling
To: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>, qemu-arm@nongnu.org
References: <20210203165552.16306-1-michael.nawrocki@gtri.gatech.edu>
 <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2858ca66-8abb-f90c-7af3-0a21801e6002@linaro.org>
Date: Wed, 3 Feb 2021 08:28:26 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210203165552.16306-2-michael.nawrocki@gtri.gatech.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 6:55 AM, michael.nawrocki--- via wrote:
> The FW and AW bits of SCR_EL3 are RES1 only in some contexts. Force them
> to 1 only when there is no support for AArch32 at EL1 or above.
> 
> The reset value will be 0x30 only if the CPU is AArch64-only; if there
> is support for AArch32 at EL1 or above, it will be reset to 0.
> 
> Also adds helper function isar_feature_aa64_aa32_el1 to check if AArch32
> is supported at EL1 or above.
> 
> Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
> ---
>  target/arm/cpu.h    |  5 +++++
>  target/arm/helper.c | 16 ++++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

