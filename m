Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F283CBED1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 23:59:27 +0200 (CEST)
Received: from localhost ([::1]:49652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Vri-0000FZ-MG
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 17:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Vqs-0007gi-Kg
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 17:58:34 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:47013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Vqr-0002bf-7E
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 17:58:34 -0400
Received: by mail-pg1-x530.google.com with SMTP id w15so11255919pgk.13
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 14:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pKVt/19Sp1WURlcJwS87C9OlCzRfTI+/yVvdh41Hhs0=;
 b=vYReVIMsolgPRpp5dslIM4v9rJNJ929uRETpayclUErfPheJfmCiDpvSvecZUgsFH1
 T2iRrYMY5kFa/c2CBFhdQCwSVIdyCZ0AnVm4kzQv24vu4PYqlflqOOqQo+HhGK7SLzt1
 3FTtXZKgQTV+SzhyGNmoy2yXuXfXX5elh0lhd3c3a7mfrIAXe836eoAPalYJIvZYY1b9
 brnOzs1zDf5fbyWnV2abJQZsDv2zhwFmqwIeCRdjZBoWK68RB6yqhG+UNrFr/PFg/VwP
 HtQNSTE/E4koNVPDq2fzkYF2w9Z3L0Fy81jb51Gdvx8mCa9+OQRKBjU/k70T6YPUZwnc
 iF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pKVt/19Sp1WURlcJwS87C9OlCzRfTI+/yVvdh41Hhs0=;
 b=YGHSY4kiyvm4l/8RDRXxQejBRFlzejcEobNpB/aAkhBY7iE772ZeGI18MIkezdeNuo
 URSXQywVMkTFz1QQYgnCn97plHImBkj+N1huoqdyHI/nqUkmZ9RXDR0TGJCQ2wWDGEHn
 ej/VE6HXWYg2RvOoi7L2YiOoLl9sLhG8gHtNuzUtGQ/NJ1a6bOxOJBvzEKyR70Qy9xll
 0z4Xu2XoadgyEBMdo30Ov09aLYKLN3rO5uvNY7Jfs3xR/xCxHAlMTipBdIAoBRyaeVYl
 BWbz7VyB72r3BuaUh19EpXn1f7CXLsqUaqDPJduKudihGYJpLP5w6gx7utqF82Gr8NRP
 pSag==
X-Gm-Message-State: AOAM533u/tB2m3W90cipb6XXQPoCKyM276Q3rXlsIEPmngaWt4Wz7Mi1
 ICMgcWUOqORjflQxxK6gdl21PZ78Pvr9GA==
X-Google-Smtp-Source: ABdhPJxwECTFQWXi7oiAMaO5yCbqlXLIrp3Ad0maYaYMfVAsfqxbXMLSzh4RoQptyIGhQnpjmvqOTA==
X-Received: by 2002:a63:1448:: with SMTP id 8mr11825962pgu.324.1626472711590; 
 Fri, 16 Jul 2021 14:58:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id a22sm11191559pfv.113.2021.07.16.14.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 14:58:31 -0700 (PDT)
Subject: Re: [PATCH for-6.2 15/34] target/arm: Implement MVE integer
 vector-vs-scalar comparisons
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ddeb48a2-7409-b328-94ac-65c6e281e7dc@linaro.org>
Date: Fri, 16 Jul 2021 14:58:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

On 7/13/21 6:37 AM, Peter Maydell wrote:
> Implement the MVE integer vector comparison instructions that compare
> each element against a scalar from a general purpose register.  These
> are "VCMP (vector)" encodings T4, T5 and T6 and "VPT (vector)"
> encodings T4, T5 and T6.
> 
> We have to move the decodetree pattern for VPST, because it
> overlaps with VCMP T4 with size = 0b11.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 32 +++++++++++++++++++++++++++
>   target/arm/mve.decode      | 18 +++++++++++++---
>   target/arm/mve_helper.c    | 44 +++++++++++++++++++++++++++++++-------
>   target/arm/translate-mve.c | 43 +++++++++++++++++++++++++++++++++++++
>   4 files changed, 126 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

