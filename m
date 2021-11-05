Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D60446721
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:39:58 +0100 (CET)
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2Fw-0003Ck-6W
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj2Cn-0000un-9c
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:36:42 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:38530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj2Ck-0003S5-2f
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:36:39 -0400
Received: by mail-qv1-xf34.google.com with SMTP id a24so7668662qvb.5
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Qam+7JXlOsa+PO4v8HKHgYfyuF0Upm4o5LqGhrPgHY=;
 b=eOD9zGSN/x89meWZkqt+DVuZi6je3zjj8sFdLm+rk8YopTkTLru6vIW5Cbh+tt6toA
 Q77Ki8JjvmC1l+tUnx7iluiLEfCQsQTkKqwarPkJndlNuoxFsz3eU3O4UTEKzwLCW2bh
 LSM9QpYUsBhgGYoPxgau7SRRfL9vh+ca5TsnHRhotVwZhLxoPy4ZQE45q2btdDarCkEB
 Nw2r2XFDOuaV7NvSPT74Mnh8F7CAi7ITT39gYXnoOae/xG2OOF2YSdgCD/ky4KdPQ+YG
 W3iHK4JYD6wCqABa9KvUWimZT8h5hNVSNwJ+6mbhHpjSoiUT/uor5X1d2yVEVHgnfIWV
 F8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Qam+7JXlOsa+PO4v8HKHgYfyuF0Upm4o5LqGhrPgHY=;
 b=EIqAJN44IeUbTuUhJB0ZK7dL3yPnJomVVlWv+X7RIwGdbddl7vRSXjqjR/V1QSj3Ol
 Te9435SX2q/22lQQBEYLnq5wv3JWL4C/2M3cZe3Fv6KiT8oQaooLYz7ypWqAAjaUa36d
 FpnrVJNbXUILWEeYUxuiGzP5rVwgVSrrsmNxpUwFS1ETkCQR9WnHyXEiFxUb8sCgNOEM
 nKYireouOFsOLFnKZEAkHtcwtZfFOmBEPzQeMNqgbeBQhtpSN5eDeXGbtDGPIhUfQCdD
 F3A3jGK8z3ZiRgUZb+ExpnH9tuwYBQoQ1qMcpsusYg7Q50nStRiCaNaMTcx7Yce1sDwh
 wSGQ==
X-Gm-Message-State: AOAM531ZsJmNHOOrjKU0dYnyDxbHS1sU2pVVk1COqRbd0dXA1LUwI3KC
 qLulpbnh2cPbc1CqUudRpxq7ng==
X-Google-Smtp-Source: ABdhPJz08vapQGMESoIZ5eRnDdEU3VAFcAJSK+Q1VL2IDB+YEZHO7THBxnu3I93eA8CSObrRjCdNcg==
X-Received: by 2002:a05:6214:cc7:: with SMTP id
 7mr48904045qvx.55.1636130197119; 
 Fri, 05 Nov 2021 09:36:37 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id w11sm6617113qta.50.2021.11.05.09.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:36:36 -0700 (PDT)
Subject: Re: [PATCH v4 32/36] bsd-user/arm/target_arch_signal.c: arm
 get_mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-33-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf75d119-8239-40df-3010-14a3a71bf569@linaro.org>
Date: Fri, 5 Nov 2021 12:36:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-33-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 11:19 PM, Warner Losh wrote:
> Get the machine context from the CPU state.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/signal.c             | 51 +++++++++++++++++++++++++++++++
>   bsd-user/arm/target_arch_signal.h |  1 +
>   2 files changed, 52 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

