Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26362497721
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 02:57:57 +0100 (CET)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBocF-0005Qt-SX
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 20:57:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBobQ-0004kK-Cf
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:57:04 -0500
Received: from [2607:f8b0:4864:20::62d] (port=46846
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBobO-0005XS-Oi
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:57:04 -0500
Received: by mail-pl1-x62d.google.com with SMTP id u11so14073269plh.13
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 17:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pkjd2g4kYLR5icJwea75EM+rvAx96C6iB7OJQagx05I=;
 b=LfKnneRsZOWnurjkwewIwgzPr/w8lDGuiG98SGJqMa5Rdh0r4ymUAWWEDj671H+bKI
 Obgj7kqGfL+rSEGrHMhjOdAo2dfJ5Ep6BmuHIjIqqSGHkL+w7CjYG7C8dKMRdxjn0+R7
 juqfEK++zoO3fqOMWvBas+Zv9DliasEf/oDxeKz/mr2crYVQDO7kbBdiuDmkAbequG+5
 MaVU3cvkGW2MqVAMbtA9NtOS3yR3lj1VPLC9oGW6IKckakML/QZlX3CwlY+cnBiL7D/n
 2zWEsNXW45wWoWZauc9hTDdJTp5uK+O+yJYkBp6s0XNwj1ETf0/+vpqHpzs7TIj3pCYu
 YAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pkjd2g4kYLR5icJwea75EM+rvAx96C6iB7OJQagx05I=;
 b=IIbuYofIm7HHpRg+uRGtA4xy5/IWliFWvHu1NAz8Orps4DGrNYpeMkT9SKn/cPqK3W
 3o1FyhTDy//Cs7BUtNtRod/AdmJgBvKPsq0MsXOefdQ0PEOFTYgyuqz+fiiV3cMvZKw5
 3yx1om4qCywxjrBV2SGNahlHK7Pt05aw/TQWjFn9awvevOxUqvWcugdGg7Wol8YgiGdD
 Yb/PTv5wuusBKBGqtZmWz1y/IemVdWcLZ/3FV1xyq6kccm2A4Jqofye7lCiGWCsf2MoM
 cy+Hp1JekTOpYvWwELVDVGceoAPmTSDpwjj3+DaEqAXGCW6pjGCj+58Aro9wM1zmxt2G
 nsiA==
X-Gm-Message-State: AOAM5323JLyKMYjCQtElOnuAsXO/Tkjfszb1uorQktIxT6MBslSiMxSs
 t/2wJt4Wg1KPUJdH94sf6OX6WA==
X-Google-Smtp-Source: ABdhPJwYUO1aY/dCNHrEMuNOPrtUL9RnbgHMHBUoUe+LjOzneR6kc93XjxaGFmHHfZhOMu9tVcDQNg==
X-Received: by 2002:a17:90b:3503:: with SMTP id
 ls3mr9462202pjb.127.1642989421246; 
 Sun, 23 Jan 2022 17:57:01 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id pg2sm6449568pjb.54.2022.01.23.17.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 17:57:00 -0800 (PST)
Subject: Re: [PATCH 14/30] bsd-user: Add host signals to the build
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-15-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a52db98d-ceeb-2348-f619-6f35a5c9a473@linaro.org>
Date: Mon, 24 Jan 2022 12:56:56 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-15-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:19 AM, Warner Losh wrote:
> Start to add the host signal functionality to the build.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/meson.build | 1 +
>   bsd-user/signal.c    | 1 +
>   meson.build          | 1 +
>   3 files changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

