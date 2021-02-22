Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93C53210BF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:16:26 +0100 (CET)
Received: from localhost ([::1]:46978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4W9-0005jM-NC
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4UL-00051c-EY
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:14:33 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:52684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4UJ-0003wl-M6
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:14:33 -0500
Received: by mail-pj1-x1029.google.com with SMTP id kr16so7801465pjb.2
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 22:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5gwiWMFofRD3oPyjdb1nw1votS5bkVkJBfbOcr9qAs0=;
 b=YBPLn0ZJNSmHll5Y2kvK/q6rsOB5FuN9lN8l10eiYkr9MbrAcCaQJcqJrR2Q5utudH
 Z2xxWVsd8sRWsfQgNYrAUITh6B+YF73fIXPI1Fx4VTXahzkMTz6L86fTOLQI70D7h/cJ
 lfrjpgTnedExpseRCHTi3omPkpIDg24RxFVzelB67p3ukcROR8ilm33tWpO9BePHIsGR
 RWiZ/7NSkJa5J8YGdqKuY2/khxCZAZDscaypolVmgKIRYnUsi9pQzXrGzTDap3fiCyF2
 ubMQl1AlBiAFVkNFKnBuexgXq5D8tXeb+a9Z99ke4iC3ql9nbHiqf6wkzlu2IJ/xD6th
 4HdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5gwiWMFofRD3oPyjdb1nw1votS5bkVkJBfbOcr9qAs0=;
 b=L3wU+mVXIolQin9VFU/4N5DtXsonV+QlUVu2ia61uQFvnLjIdBd5ZjTdGfuFSQG9fg
 U/wyVX/bAgjIO8jvFM5PjFsd93+XXQGzH1oyJ2K7pM7ddPNjiqO6arGG+EHgV4vHkIwx
 WyxWs0QTFXt2e5BpVrazyo9ZvsciFhQTGyCa17yyqV3Bxs9bLKjiF1dYBkbEyJZ+rMkG
 CusRPq/NRMG1uNs5ac8q0Ii/WlNBkKycm/X3ncoONw2XbAr8sUxSydvHahCrIMU68jk4
 zAto32a9G9lL8FXEvc+Ko2HTpiB6dVSUv31rlKdfTCh0UraLbOZoDWstwXbujogO75Uu
 EKJg==
X-Gm-Message-State: AOAM53310zbTfTu0/yJ5qZPqyZlyIj6YH9rAyv7PNPqObw5UObIz3htJ
 90yx9Ew/RJKEI9F1FR46F4lia1uBIK2/+g==
X-Google-Smtp-Source: ABdhPJxj+PkhMV3/0nYHvefQ9XLsTzBWUvYtDrQGdAYAXK2URk5B2r6/dhUpz+HtKkU/4TrO2JfSMQ==
X-Received: by 2002:a17:90a:b944:: with SMTP id
 f4mr14180256pjw.40.1613974470083; 
 Sun, 21 Feb 2021 22:14:30 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b14sm17131045pfi.74.2021.02.21.22.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 22:14:29 -0800 (PST)
Subject: Re: [RFC v1 01/38] target/arm: move translate modules to tcg/
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-2-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7040d1da-f480-6d68-c813-fef2dea84cfd@linaro.org>
Date: Sun, 21 Feb 2021 22:14:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-2-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:24 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/{ => tcg}/translate-a64.h      |  0
>  target/arm/{ => tcg}/translate.h          |  0
>  target/arm/{ => tcg}/a32-uncond.decode    |  0
>  target/arm/{ => tcg}/a32.decode           |  0
>  target/arm/{ => tcg}/m-nocp.decode        |  0
>  target/arm/{ => tcg}/neon-dp.decode       |  0
>  target/arm/{ => tcg}/neon-ls.decode       |  0
>  target/arm/{ => tcg}/neon-shared.decode   |  0
>  target/arm/{ => tcg}/sve.decode           |  0
>  target/arm/{ => tcg}/t16.decode           |  0
>  target/arm/{ => tcg}/t32.decode           |  0
>  target/arm/{ => tcg}/vfp-uncond.decode    |  0
>  target/arm/{ => tcg}/vfp.decode           |  0
>  target/arm/{ => tcg}/translate-a64.c      |  0
>  target/arm/{ => tcg}/translate-sve.c      |  0
>  target/arm/{ => tcg}/translate.c          |  0
>  target/arm/{ => tcg}/translate-neon.c.inc |  0
>  target/arm/{ => tcg}/translate-vfp.c.inc  |  0
>  target/arm/meson.build                    | 20 ++-----------------
>  target/arm/tcg/meson.build                | 24 +++++++++++++++++++++++
>  20 files changed, 26 insertions(+), 18 deletions(-)
>  rename target/arm/{ => tcg}/translate-a64.h (100%)
>  rename target/arm/{ => tcg}/translate.h (100%)
>  rename target/arm/{ => tcg}/a32-uncond.decode (100%)
>  rename target/arm/{ => tcg}/a32.decode (100%)
>  rename target/arm/{ => tcg}/m-nocp.decode (100%)
>  rename target/arm/{ => tcg}/neon-dp.decode (100%)
>  rename target/arm/{ => tcg}/neon-ls.decode (100%)
>  rename target/arm/{ => tcg}/neon-shared.decode (100%)
>  rename target/arm/{ => tcg}/sve.decode (100%)
>  rename target/arm/{ => tcg}/t16.decode (100%)
>  rename target/arm/{ => tcg}/t32.decode (100%)
>  rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
>  rename target/arm/{ => tcg}/vfp.decode (100%)
>  rename target/arm/{ => tcg}/translate-a64.c (100%)
>  rename target/arm/{ => tcg}/translate-sve.c (100%)
>  rename target/arm/{ => tcg}/translate.c (100%)
>  rename target/arm/{ => tcg}/translate-neon.c.inc (100%)
>  rename target/arm/{ => tcg}/translate-vfp.c.inc (100%)
>  create mode 100644 target/arm/tcg/meson.build

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

