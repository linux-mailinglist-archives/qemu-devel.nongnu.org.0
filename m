Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAA7256350
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 01:08:25 +0200 (CEST)
Received: from localhost ([::1]:36798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBnTs-0000xo-F0
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 19:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnTA-0000NE-9R
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 19:07:40 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnT8-0004R4-OE
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 19:07:39 -0400
Received: by mail-pl1-x642.google.com with SMTP id p15so346112pli.6
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 16:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=j61PhrfnrWXNyX5zCR9qZ/KYaECfYcFgLt+I/N7a9QE=;
 b=HH07PlXbdlAwhwOrXUlj6GM9YfVZXemh3O1wOcKaCDq9DgSWcg/trmqrejeXELdSTs
 A0WSt8KhsUYElZ7UN1FQzSCos61KLbBtdd9LWiVZr1z9/pW4yg+BhHHIWMtRK85BSHz8
 9bU6vqlaY+x0mRg4I/yKfA1ZkxBGqOOqWDF7+QGYXJ7sbfbylTjWxUx8qveHBrxkz3wI
 8Xf+vHF4tfNLjzM+lnRcP3JnMZxfjJATkCypIpxB7iXo/k3yCUi21WMj4uMmUiUtNzvV
 OJyTKVnJDZOq49iCkmnDkCktiGABxVRPlcyXacqWkIc48gx3/r9yzSf52CmGxYeG9AHb
 K6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j61PhrfnrWXNyX5zCR9qZ/KYaECfYcFgLt+I/N7a9QE=;
 b=cXyis4enapSNZfiinIxJVEuk+fg/G354q9dmSCU8oQZV9AadtCTC+nPwxzEiWKaejS
 ssoAjf5RIvJtTM6z2Yy2jUYuoFz8EKuLloU029LyTNQLmyTbe+QTg5/WoKtpOVoC7Rtn
 YYZXFfW0zWMRIaxwDl3/HaEA9TbQp4mQiby2Q4A15glwTjMdDjYo9kKN3PZTGjNQH5SU
 qLLzb69pCmMmJsY9njK+AVrKxwYE6XH+M1vIkjJein2uez5oRkKnN7ySvahYpn0U8DTf
 kPAfkgue4b9TT7lRIp3IdYaKRXEob1eu1JiSVOTM77Uqb27VXFuvTz8+AnI5ioQVBebi
 Iqew==
X-Gm-Message-State: AOAM530mUzjQMT8XH10jEoxlEKkCOGM7vb1tdM8eBTQBfXqCHFlJ8jCJ
 HnpOJaztRXZUUq3eOCZVAF5D8xL1JRK3EQ==
X-Google-Smtp-Source: ABdhPJwVbONON97CbKw3OMvJRvGuwy36bkq8G6KKPNMrhUWvJkVDRvAE37ELaoHinKteGINJB8YZMA==
X-Received: by 2002:a17:90b:238d:: with SMTP id
 mr13mr974530pjb.132.1598656057117; 
 Fri, 28 Aug 2020 16:07:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id k1sm486146pfp.86.2020.08.28.16.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:07:36 -0700 (PDT)
Subject: Re: [PATCH v2 36/45] target/arm: Implement fp16 for Neon
 float-integer VCVT
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-37-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51f87f58-ce26-a989-71a1-7de5158ab35d@linaro.org>
Date: Fri, 28 Aug 2020 16:07:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-37-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon float-integer VCVT insns to gvec, and use this
> to implement fp16 support for them.
> 
> Note that unlike the VFP int<->fp16 VCVT insns we converted
> earlier and which convert to/from a 32-bit integer, these
> Neon insns convert to/from 16-bit integers. So we can use
> the existing vfp conversion helpers for the f32<->u32/i32
> case but need to provide our own for f16<->u16/i16.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  9 +++++++++
>  target/arm/vec_helper.c         | 29 +++++++++++++++++++++++++++++
>  target/arm/translate-neon.c.inc | 15 ++++-----------
>  3 files changed, 42 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


