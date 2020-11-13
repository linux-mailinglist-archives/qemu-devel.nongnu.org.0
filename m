Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570142B26AA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 22:28:08 +0100 (CET)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdgc3-0001Nr-DY
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 16:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgaE-0000K3-OM
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:26:14 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdgaD-0006jX-63
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:26:14 -0500
Received: by mail-pf1-x442.google.com with SMTP id c20so8699667pfr.8
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 13:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iL0uRLI+yG9JxO21dMlu+eUszT9UXMWWrIEir3O7G28=;
 b=bOJYfXvGhivmabXxnuAaFlOILafCilhicL0NbYd1KvhTrg83h1Xen4BNtifCkN7G9J
 AxZXLVZpuRWFsZLOVGG8WwjCAp5okDzAuUbgDH62TJzjlElkBlFPxzsxlY9iU+h6/2Lb
 VWTrfklzoEjOPn125FMucybd76QHW+DxU4F1Sfb1zr+OcO5At3WC0JYqwFclzfb38XZh
 9wZzuej8gw6FYUl6HEVED0SEYlFBh+OcELxmNGcprJ3veUW6DcY/fKri4URXKlvGedYI
 bMUAvGOKrzIvVE/VcdjRb8A0lGrOTK/qjII8iCO/DgJWNM6lThhz2+vQ/QQkO1+pDq9o
 ZZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iL0uRLI+yG9JxO21dMlu+eUszT9UXMWWrIEir3O7G28=;
 b=R2jiCPT15Mbqrz8wmIdM2PaqccwQgAAFXQjSQfw71VCFhnJWCffMtpYrr3rreYgEmg
 mIw/Flik16YvyzDdQuOWgruXHBW0o6gjIuQxLYmdN57Q3p54j5UTKGjO4Q150EalUvSr
 /LO59m9PAyTJWc9MhVwScIpGsIa39IW/T1nTUmNaTJ/wHjW0rd2vhG5IAG9XNVFcv6Mj
 eWuJBbjxLm5ue1PDeX3aY8RiOC7zlLFLBlyp18tqKD4a2JJTh8gk9OYVlOoQn9ZWxrZT
 W0e5H1AQDeC+K1Wx+j0AqVeeAOB4cU1QEmE3CL7nQxY82OdnQbA7myPbZUKnov1vlzUy
 wWkA==
X-Gm-Message-State: AOAM532N+Pk5K5juLufcLCG2Ip/chzyqryzBs2f+CpCmGiGYPlbyPtmy
 fFDKL9Vf216gQjgTe2wJEQWTeDVpvnmCbg==
X-Google-Smtp-Source: ABdhPJwmv/vQvFGph5qxjwXPAFxz/AdCrkr5o/XN+zymVIIJiX2QRrnpRnc9Gc3AJJiThJQc3EzYmw==
X-Received: by 2002:a17:90a:4881:: with SMTP id
 b1mr5038256pjh.32.1605302771268; 
 Fri, 13 Nov 2020 13:26:11 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j19sm11536828pfd.189.2020.11.13.13.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 13:26:10 -0800 (PST)
Subject: Re: [PATCH 09/17] target/arm: add MMU stage 1 for Secure EL2
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
 <20201109141020.27234-9-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6aaa5ef-bf43-4d95-3ce5-850dc888eefa@linaro.org>
Date: Fri, 13 Nov 2020 13:26:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109141020.27234-9-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 6:10 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This adds the MMU indices for EL2 stage 1 in secure mode.
> 
> To keep code contained, which is largelly identical between secure and
> non-secure modes, the MMU indices are reassigned. The new assignments
> provide a systematic pattern with a non-secure bit.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu-param.h     |   2 +-
>  target/arm/cpu.h           |  37 +++++++----
>  target/arm/helper.c        | 127 ++++++++++++++++++++++++-------------
>  target/arm/internals.h     |  12 ++++
>  target/arm/translate-a64.c |   4 ++
>  5 files changed, 124 insertions(+), 58 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

