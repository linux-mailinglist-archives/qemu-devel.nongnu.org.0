Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6872497729
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 03:11:20 +0100 (CET)
Received: from localhost ([::1]:43720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBopD-00035l-SS
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 21:11:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBonb-0002PM-Mi
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 21:09:39 -0500
Received: from [2607:f8b0:4864:20::42d] (port=46054
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBona-0007xf-58
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 21:09:39 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 128so14410074pfe.12
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 18:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tv7a/EDnbqHzBXDs3vNkHauY3pURSFTsbe99KT/+pHI=;
 b=ewq9y3bwegXvZEm9Wtjpsip12qVv+RuVzEy6PjFVpNc7hozPNiP41ODzCTAAtK9hyE
 LOu4zruROW3kw+FBVQjabnRXCSWUK5d6PRYTmeiWfX0T+X9xPa3DRwiNlEiURPf3zstk
 LSBfgJUyUtgkXZrojfNptkq3zz9o15V9jdDItzWxPd1g6/Vh7x7ncZlsgxwXy2uiRqw1
 KH4yTOzNWlsMa3O346J+oZGD/jY9pIf4SG1j52+Hl3HNsnyLXbzZRNvmAQHTOIenhUeq
 RRlgm1tvBocfuorSz2fPX2ex+zEjLZC5leJRVuOZa/bI7D80NPrCAsrmwCu98q9nqD7S
 Gu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tv7a/EDnbqHzBXDs3vNkHauY3pURSFTsbe99KT/+pHI=;
 b=B0oeWmCVWg5C5851AEBSJ/QcK1zxn1bis+H91YLg465JI2yFtG9bHwv2IXEi33JaXo
 NWqDjbXS4i7n3U5mVbVFQhnYjOo7nxwyHpMMee8koTYDUAstEq9NFJoReB7CVxJW3m/h
 RYU1j7EY1shAem+6mxYbXC4qHfViXX1cdFCFfnXVRSvzd3xiJQPN+PvooueKSPBxhXNr
 JrtUNcMiAiLLbt0KomVZOC9IE7EpozTTfZnrwp8BSMGnZECk8T/qASI6oS1dyP1UtwzM
 3/eD4KmSyybW5+t3Z657pb/frB94VRn1ezSqpz/aIE9u4x9LEg+ZKiWAkejx2WvaB13f
 wqSw==
X-Gm-Message-State: AOAM532unIWW0zjCk7r7JrF1SdtsVCAkP49yGdg48cGppcj8gZox9iKy
 KmSZTse5tHnsl5y0TVpu5N6xTA==
X-Google-Smtp-Source: ABdhPJzSOLt0hjD54/h+biFYqsOWBqnGmIjzHhslSqvvPkEU2WDZQgSgB3yk/o9JOx0oPpqJws3yAA==
X-Received: by 2002:a65:63c2:: with SMTP id n2mr10102279pgv.609.1642990176756; 
 Sun, 23 Jan 2022 18:09:36 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id nu7sm12614770pjb.30.2022.01.23.18.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 18:09:36 -0800 (PST)
Subject: Re: [PATCH 17/30] bsd-user/signal.c: Implement
 rewind_if_in_safe_syscall
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-18-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10196f6a-6ed9-4d39-6f9e-90a0adeb754e@linaro.org>
Date: Mon, 24 Jan 2022 13:09:32 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-18-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h   |  2 ++
>   bsd-user/signal.c | 12 ++++++++++++
>   2 files changed, 14 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

