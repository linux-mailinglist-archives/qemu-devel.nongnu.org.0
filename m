Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE635FE11B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:25:59 +0200 (CEST)
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj2u6-0006f0-6B
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2qF-0004NW-7Y
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:22:03 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2q0-0007C9-Gp
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:21:57 -0400
Received: by mail-pl1-x633.google.com with SMTP id 10so2606595pli.0
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 11:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7qKSItQ7OMy/H/rkhi4hojobWsqH/rquoGPR3v//2rw=;
 b=tVf4TT0ubfbcYxkbbqzNAYqrgXz7zI8B9JfGbYsSF784Qd1miLNtreeS1S8k7L4yPO
 +DFninwLngE10yBqHsZ4qbNlyO5dOYobilmC29zKTCYiHt3VNx5Zck53lj9eyfuZoP+6
 2eqcg/ErjqPo7N3BunHsnYRiUnc++w3GhKA4JWZbKHQx4N6d6fEt4plZzgouRuRy0xJK
 C01hkBA3COlCCYHMTUGglvszbiIvOAHoS7MJw7dMyO5E6lcLp4mhj9EOdloWWog2kglt
 vOqZdlDbIkTt736A//bU4Da8v2mvVKjO33iG1l5Pch5EIaP6oLVZEEvkpV153jX063FY
 9BWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7qKSItQ7OMy/H/rkhi4hojobWsqH/rquoGPR3v//2rw=;
 b=AgcTn6m1nZ6BT2ZrVqUsnbvp4TLH288cO75/lsmqm46w3eO+CXujs24f/Kgj03oSib
 NtnTJcba9ag01s1VC/wrnzTPxTE0ZB3Zdy7tfEacWx2AMssEnkcMMc9sDEhlSnZiONaa
 02GZpfkL6OEe+sdIoa/TkY6XaG8ewB1J1s/fpRrSp3Xo1iYqU5VZhd+aMJxihWKFGZ1H
 GBrUihgg9kRvYGq7Rt+5sN+5CX3aL7QK6J+EnHX4rJYttSFkHvzOjTdtatfntWQoyVYU
 dvYuHemzks+rxckXKEKVBcBSr7gPwVrK7cGberD3dRCTAxJNiHI2YRa1NTTiayOoRawf
 LPFw==
X-Gm-Message-State: ACrzQf0Oir/9yx9n7VH9mNYwRPLISV2zmBG3rbpuZArK0u5Jd4jMJ3WX
 zOSrpPsZYRvXppq7IAKRwK0/Lg==
X-Google-Smtp-Source: AMsMyM470nYkMOa8/+fae16fwx6qXUZK8csTz3mzZ0YRnbkq5on7yaOWgIA80pR8Ec9D8FlFG+k6Vg==
X-Received: by 2002:a17:90b:2643:b0:205:bd0d:bdff with SMTP id
 pa3-20020a17090b264300b00205bd0dbdffmr1124231pjb.99.1665685302703; 
 Thu, 13 Oct 2022 11:21:42 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 e15-20020a170902784f00b00178b9c997e5sm165795pln.138.2022.10.13.11.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:21:42 -0700 (PDT)
Message-ID: <554944f8-f3a7-1899-1694-10b096b3b629@linaro.org>
Date: Fri, 14 Oct 2022 05:21:36 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] bsd-user: Catch up with sys/param.h requirement for
 machine/pmap.h
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: John Baldwin <jhb@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Muhammad Moinur Rahman <bofh@freebsd.org>
References: <20221012185631.89617-1-imp@bsdimp.com>
 <CANCZdfpUVhe3i97bZ6VPqnsGQrRxq3jqpt3ufX7T2pOQSiYi=A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfpUVhe3i97bZ6VPqnsGQrRxq3jqpt3ufX7T2pOQSiYi=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/13/22 11:57, Warner Losh wrote:
> Note: This is my first patch that someone else wrote that I'm trying to accept
> and land as the bsd-user maintainer unrelated to the other upstreaming work.
> Please be let me know if I'm doing something wrong. I'll queue it to this month's
> bsd-user pull request (which likely will only include this patch).
> 
> Thanks!
> 
> On Wed, Oct 12, 2022 at 12:54 PM Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>> wrote:
> 
>     From: Muhammad Moinur Rahman <bofh@FreeBSD.org>
> 
>     Some versions of FreeBSD now require sys/param.h for machine/pmap.h on
>     x86. Include them here to meet that requirement. It does no harm on
>     older versions, so there's no need to #ifdef it.
> 
>     Signed-off-by:  Muhammad Moinur Rahman <bofh@FreeBSD.org>
>     Reviewed-by:    John Baldwin <jhb@FreeBSD.org>
>     Signed-off-by:  Warner Losh <imp@bsdimp.com>

This is exactly correct for a maintainer accepting work into a branch for a PR.


r~


