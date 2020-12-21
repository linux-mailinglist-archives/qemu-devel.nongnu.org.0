Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FBF2E01B5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:55:35 +0100 (CET)
Received: from localhost ([::1]:46504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krSDL-0005w7-Cy
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:55:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krSC6-0005Jp-FD
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:54:14 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krSC5-0001Mn-1L
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 15:54:14 -0500
Received: by mail-pl1-x632.google.com with SMTP id r4so6216231pls.11
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 12:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9+d1D6p6q9nnQAVg/smpfSaauZMJ89vyaM+obT51kOg=;
 b=qeD7VgYuDG3nkOgv5uDP+T+0RQdQayvDvUdDlrGGJ8sPZlKn3NTgaRjtv1POI+qE16
 EcwM/PCfL0qBiE/WlsTfhxQRNcDQQ4dRN/BpMb4xT3vdfDoS11eRNfgKn9aYtxRu+JwL
 Z/z0ZGf8YJQO4T0yk12jmN8o5vSHClXmL3fzmzcS60Be0qLeHgHZC/wgPZT3EbQYAQvR
 ZCYW651tnlrDaSLx3rIooo/qUBHrMi4ChIO2Dm6pY4346lKeaOKcgmya9/ovyowGz2Jy
 zZZINOd02NaVRM3VMQMjhhUTUxMlpXN7d5tNe9H+mURj8m6e//Zil+esga/g15nhjQb+
 LVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9+d1D6p6q9nnQAVg/smpfSaauZMJ89vyaM+obT51kOg=;
 b=DNGHDAfaIpeP9NVOfuvLjHyjiUtoysKHXXFq3GHDhs7+wZ88ywEzkmm+OaSRxV64wb
 Ut+F56H0lbpzMsagqBIhc+gs4DMegwJfZazIzNi+jj3JqbXyyjPx44S35N2ERsWqh/Mj
 ZGoJNFJEv3lB/LM5O/7JPaU4llo6+0I7L5/09maRInKo/cFj0/gS1Gjm9D2o/aN86LzA
 sN6EmShEStxpkQ2WflI4d8JKw7iEt05yp8fFryzXxk7eZAR63Uyv9Qzj3/BhD0VhXJdv
 Man2yQZL8N0uTUdfPSuwBciXvIUw5jdM4oMii6BptczlLphq7uG0PtHAuYIVi9xrYZeR
 IU4A==
X-Gm-Message-State: AOAM5306jQAQTwW7hCFnFqnPlDi2n2LFHdupn60Ur8EZfQkB37ZOiNCv
 uPJhWDcWYqUWtu01JSvFYmfAkG/fIq1/Gg==
X-Google-Smtp-Source: ABdhPJzy5Nt76ZeCPiJenT//naR6Fsx5cel9KZZi6wRaxS4iTh0K32SIwNG/X816RX9F2cyuBg9uRw==
X-Received: by 2002:a17:90b:350a:: with SMTP id
 ls10mr19090844pjb.192.1608584051294; 
 Mon, 21 Dec 2020 12:54:11 -0800 (PST)
Received: from [192.168.1.11] (174-21-139-177.tukw.qwest.net. [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id w9sm16988655pfj.128.2020.12.21.12.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 12:54:10 -0800 (PST)
Subject: Re: [PATCH 03/18] target/arm: use arm_is_el2_enabled() where
 applicable
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-3-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6f114b65-e6e8-e9a2-41f0-c3fda14680d0@linaro.org>
Date: Mon, 21 Dec 2020 12:54:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-3-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.233,
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

On 12/18/20 2:37 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Do not assume that EL2 is available in non-secure context.

Just noticed this wording is off.  Should be
"Do not assume that EL2 is unavailable in a secure context"


> That equivalence is broken by ARMv8.4-SEL2.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h        |  4 ++--
>  target/arm/helper-a64.c |  8 +-------
>  target/arm/helper.c     | 33 +++++++++++++--------------------
>  3 files changed, 16 insertions(+), 29 deletions(-)


