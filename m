Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960CF541F73
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:22:28 +0200 (CEST)
Received: from localhost ([::1]:55942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyiWp-0004sU-Kq
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyh2F-0007zb-PO
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:46:48 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyh2E-0002Fh-7I
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:46:47 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 15so16658547pfy.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 14:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vF8j44l1ndF6rXWr2yb+hfJNBjG5+VgEp2Koyrw6uz0=;
 b=RriMkzlVNy2fRcIa4yNa2ANqtIISfiNwItjDWqRKuxg+hshnZq/GNMnc2a3s51obfk
 fRvusNyDvBPzk7FJ+8G2hRMA8HegxLX0GcYTtHwvCxouXnXD+I7zQ+tng1JpTFgnmJs1
 nLpw69+ME+L/EyZrzkbcaqo9/oymkcU9dOC/9an4K3Hp14xBc67n/7BfprlPwWz7elHN
 0PxbK59pIKENVvrBf/BcW0eYT2WKV1BBaD3CvQ0BRH7d6IzUhnqxHDAJnDN51hfXbLiz
 jSO0gp6bwSrSo4Jp8IyjBamrK4Rr0eaqqtGXWCGs82wPt9WdhXsn0G/kSLlMLQfQXcrm
 fIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vF8j44l1ndF6rXWr2yb+hfJNBjG5+VgEp2Koyrw6uz0=;
 b=vdfwkfduvN0M8Hcq/Gyzp4bV5W0/y3hMkG0+AfTvTmgZd7uyPBy/JavYLIjFYNHevk
 SCpbgbUKFwiURbQaIbnj7Mg95L5WloxAbvJb7/F5mWpZ7Gl6QpW8L5gtM+grpciG6I1N
 r+mGIk5cwBvmCh4skHlbQRY86a8eSpcQ1HvjcXNi4SBXJJaUxdL4yHRD8MLJSExGz+To
 NwrexEgPLjwRXf8s9VwX747P4p1VacfpAN+mfdl9RUumogd74CXTCmb319hn9bLWE9rm
 Ie2O35oj8uYl97wuugGkGT2Ds8ARL6jbYKb0zlUu+sLd2Cwq4r6E27ijgWhrLIoAzDX1
 NNzQ==
X-Gm-Message-State: AOAM5314d00KWFMwfuNJt/FhlIfe/GlOMt9Ifp9tM2gX19YGLR1CIGxJ
 42SUxRqTHAumriOpsdhMFqfLtg==
X-Google-Smtp-Source: ABdhPJyn8W1Edz1AYz4DvWZKkojSgqdDoTtNYbZyVSYI2MFOVHpLLQVqbZvwzvLe6uUm18os2UNF/Q==
X-Received: by 2002:a63:4387:0:b0:3c6:9490:4e4b with SMTP id
 q129-20020a634387000000b003c694904e4bmr27064412pga.438.1654638404883; 
 Tue, 07 Jun 2022 14:46:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 y189-20020a6264c6000000b0050dc762814asm13347386pfb.36.2022.06.07.14.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 14:46:44 -0700 (PDT)
Message-ID: <3ec7acce-2162-a0b4-0112-b649cfe1e760@linaro.org>
Date: Tue, 7 Jun 2022 14:46:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/6] bsd-user/bsd-file.h: Meat of the write system calls
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: arrowd@freebsd.org, def@freebsd.org, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220607201440.41464-1-imp@bsdimp.com>
 <20220607201440.41464-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220607201440.41464-6-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/7/22 13:14, Warner Losh wrote:
> +/* write(2) */
> +static inline abi_long do_bsd_write(abi_long arg1, abi_long arg2, abi_long arg3)

Likewise drop the inline markers.


r~

