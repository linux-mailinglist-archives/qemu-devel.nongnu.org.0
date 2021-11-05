Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD44E446714
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:34:04 +0100 (CET)
Received: from localhost ([::1]:42344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2AF-0003sb-PN
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj27f-0008T8-KH
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:31:23 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:46813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj27d-0002IT-4o
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:31:23 -0400
Received: by mail-qv1-xf34.google.com with SMTP id g25so7639585qvf.13
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8CoqERSKzunmWaUsUoIedJVpbx12YKHOSh0DYQKVSxE=;
 b=VRYn7L81oIZi1DV8mrHit/Gq1WTylF4W3afc+i07ARnWZU+wOc9KiBogGoFz33FoRB
 CQ9/rFDHJtbMizYobNn3bzEgA1n8ygE+SSYFYCycc0fcZrn3LwzYSwsQfOwFT6xqM7aL
 hT1TiVsHRnU7vL0rQ997fTYZigYI6JPxB8H+PBAom8tNuiukw5j4QflfjKPdfruz0cqZ
 Vo8gbe/XF8i/jNf2qlXYD+/XEe+bVo4Dzq+813uUFKWQcQTfChJptg+twd0McDYhY1ip
 MZPoCDqF4ca6QA2rn9fLr/kt00Q6SOZCbYc96z52kE78omzt7EYngHDalnaMkWOfa+xn
 yGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8CoqERSKzunmWaUsUoIedJVpbx12YKHOSh0DYQKVSxE=;
 b=792KSG+QwijMrfhsj6DIXOLx//YGXl3LM++3BAIn7qwI6bf8l5U632RUGUEHntB8/O
 CHeSUi/kAwfBpdkjmu5a0JFh0NmvJNM05YFq+MRF/BUFJo6dwVwOmOo6jFmP3DTzEd4Q
 O46l/Qykd91nPS6C3S//ixBSIwSXEWiYp7HZwaA9dFmIx64tdqBrBZpvnYBeIII7xQYD
 w40kUJb7ugmnRmhVTOREblqfnHkpVME9vsFfRkYwMuFY74N81tdrX9ib06i6s3oN//Ti
 BR0vRBEbM5Kejt2D6SfKAP10p2OnxjUZwSaaX6AEUiATYu/yhzKeqTN1SutexKReaKRM
 UnEw==
X-Gm-Message-State: AOAM531sbe8tuTZIhkUfED3jAEFaV0mcutlX5FR7lCXqI1vCYeu3aPd7
 QPBE0YCxip5CU4VW/t0++3NFEQ==
X-Google-Smtp-Source: ABdhPJy6v9z48eOGHDhaWuZDCSlA3M3Fym41/9b1RtibAdFwQ0T6TocdXcFs1SoOZMTVjiIrWXNmgw==
X-Received: by 2002:a05:6214:2428:: with SMTP id
 gy8mr234026qvb.18.1636129878914; 
 Fri, 05 Nov 2021 09:31:18 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id u185sm5564071qkd.48.2021.11.05.09.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:31:18 -0700 (PDT)
Subject: Re: [PATCH v4 29/36] bsd-user/arm/target_arch_signal.h: arm machine
 context and trapframe for signals
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-30-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3438e62e-9ef3-f3fd-a979-e889c05459c9@linaro.org>
Date: Fri, 5 Nov 2021 12:31:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-30-imp@bsdimp.com>
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
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_signal.h | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

