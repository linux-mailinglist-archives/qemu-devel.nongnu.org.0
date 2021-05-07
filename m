Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647EB3768FE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:44:04 +0200 (CEST)
Received: from localhost ([::1]:56576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3a7-0005wg-5i
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3WD-00049S-0s
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:40:01 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3W6-0003ci-Rk
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:40:00 -0400
Received: by mail-pg1-x52e.google.com with SMTP id i14so7541755pgk.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 09:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lqwOKLBmFa3RDa4NOgvcWKeXyzc3U5hVY37TjGVBDlw=;
 b=TpMUvc6PoyxZXZ7KiJNTST+5H/cAqzDClY+KSpXigiVG/i8bllve+YfClWB3iY63C0
 pgBqNKGXqWiduPCvwTXB9sZ+SH4DWQR4Iaog8ObWUIt6IUV978cECPG8DrZocrkQPVtx
 ZNCFJgCX2M9cjdt+b3BBklXxv8OqTIYhj+0bZxtkyFt5J7uQm8dMwAirXFpkxmNENABH
 TWSptKA/5YfKSqeSwSqadfRE+QIXweRE18a/NFhlmrj0O5LcNaftx6LxFdMda7sOJwV9
 cIaJu7JIf187io4xRF/IVs3IpkvBrVmtA6AdpsTAr4Jkobc8VU0Vkli3jxu5Ij8fGBB+
 3SPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lqwOKLBmFa3RDa4NOgvcWKeXyzc3U5hVY37TjGVBDlw=;
 b=cixMxL8Zv1myvTDgREaXbQnVHehQ/QQ8/7GP7FUHi6s7iEXbnlUfbtuxZCTvsR4S2I
 nU9xlaQabvNg/nMiuoTti5ck9enXl75O2WwjbKceUXT27bXnA+EoJhoBOqsJ7r9WL5R4
 ybwTdP5cwkKEnwEGxuGiUWJ9Vuy1KKxiy6UvGMo/wzWib5HK3LQQR1McxVT8zaMQkSq7
 GwsRFHJxmrJdXduDWgwoYiBYMIWCjLptYmdrvcHKSblkMgMr6r6KhekxUDBdoniaStYU
 NbBZLSGLnpv2ZbXdTSKR2VFXVue3pX1hU3HYhQlwDw9fXgGf0Wx2pWnGFfJ9I4JL6VoU
 X3WA==
X-Gm-Message-State: AOAM530eWK4p1wBChVTLIolfDMiZErD41odc2P9l97J+FRA3usnI7R/M
 qi8w842viPUB69f5zC8jmFhXgg==
X-Google-Smtp-Source: ABdhPJys6y8ejYhqPghwEW60/B4KI9feIMRu7qKQWlylVX0z6HrBptxrOxCBSdUVyjzhSqhk8Me0bg==
X-Received: by 2002:a65:6643:: with SMTP id z3mr10560640pgv.387.1620405593208; 
 Fri, 07 May 2021 09:39:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id r22sm4915554pgr.1.2021.05.07.09.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 09:39:52 -0700 (PDT)
Subject: Re: [PATCH 14/23] hw/usb/hcd-ohci: Use definition to avoid dynamic
 stack allocation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-15-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bbc623bb-86a3-15b1-4a22-fe94a63abe3c@linaro.org>
Date: Fri, 7 May 2021 09:39:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505211047.1496765-15-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 2:10 PM, Philippe Mathieu-Daudé wrote:
> The compiler isn't clever enough to figure 'width' is a constant,
> so help it by using a definitions instead.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   hw/usb/hcd-ohci.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Same comment about the commit message.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

