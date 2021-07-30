Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B343DC005
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:49:12 +0200 (CEST)
Received: from localhost ([::1]:46996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ZRO-0006Xk-I6
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9ZQJ-0005f8-PO
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:48:03 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9ZQI-0003GF-2t
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:48:03 -0400
Received: by mail-pl1-x631.google.com with SMTP id q2so12485820plr.11
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yz5OLg5pGlrSKGa0UcEVeZkxigk9Rt5OTZ6QsYt5eIk=;
 b=iLYMKzQn9T0OCKJAjDV798lG1O0IHSOJ/y8mRFSwYx3J7YH4jrqU6U1x1BnurttKln
 wocX/VyulevDa95XE9PGMf7KxH+pWbHbGmptn6oId/AXB1E/NFAaie2/IMYLSttJjq2u
 4sIYJrEsTUN38PIC13U896UclN1iWVpknaOxTQtdZF0th3SbbShPyj+j9FqMQzd6BpwF
 0/ieK82Ex5jMQAm1oAOwyYybr+61+S6vZkWPr9+qedtLh3f48ueu6iistDPOZophXi/9
 KPDUbIfQpcSK1AkJnq2rCGFmAgvXTodAWtF37RLs3IH713uqOTYCdvKDDDSfjcI+k4HG
 Po7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yz5OLg5pGlrSKGa0UcEVeZkxigk9Rt5OTZ6QsYt5eIk=;
 b=aunQqokjuGwCBaQrIXx5DxdD7FHcAYOwLO52BZMP9pUwZvgcSMy2lSU+9XTe3ju5D/
 ucuzEEn2lvvTissd0bp55RO/JXGIhmBe40FazhYpN+Jqie/cAn2WvVumbA5TOs0R0lzp
 ZiHIWLf0NyWFnAixDiaAqnXCnjEkhN5RZw2keOYrxInFuuFDHFH4HTbKgeazy+ApHJLh
 Rcvvdz1tUAOx1Z3s0n8UJz5SB7vtQ59nULWEQfo64r05uqNjJNabcZvY0fQoc8RCNpts
 JXXPc4Vm/C8mBJVR4SCnok9HSY/D5WS52jkX4LqYqJvUGjgXlAgu5NbM1Wl0Z46wNq67
 /XLQ==
X-Gm-Message-State: AOAM531aVuIte+1mmbO/J81xKJEJtk3OwLqp2wB9cbgqLDVyw4puNio9
 Nti2TbBxEjY0GACfXS93B0eIJwU1JE9KXQ==
X-Google-Smtp-Source: ABdhPJwv9yea6rGX76YMJDwIBBaMyJEgIwzEhngzPfCmn1R+9VGDQUZmqiPD8zXACiZiizx+32/KZg==
X-Received: by 2002:a63:f961:: with SMTP id q33mr2407142pgk.82.1627678080348; 
 Fri, 30 Jul 2021 13:48:00 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id x26sm3370055pfm.77.2021.07.30.13.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:48:00 -0700 (PDT)
Subject: Re: [PATCH for-6.2 52/53] target/arm: Implement MVE VRINT insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-53-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56cb11e6-d169-1139-3450-b0be815d01db@linaro.org>
Date: Fri, 30 Jul 2021 10:47:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-53-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE VRINT insns, which round floating point inputs
> to integer values, leaving them in floating point format.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  6 +++++
>   target/arm/mve.decode      |  7 ++++++
>   target/arm/mve_helper.c    | 35 +++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 45 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 93 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

