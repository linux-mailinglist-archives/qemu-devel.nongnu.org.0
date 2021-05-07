Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999BD3768C9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:29:40 +0200 (CEST)
Received: from localhost ([::1]:40782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3MB-0007IR-LP
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3KS-0006iP-4v
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:27:52 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3KP-0006VU-Pz
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:27:51 -0400
Received: by mail-pf1-x42c.google.com with SMTP id k19so7990554pfu.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 09:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=THFSOnFfkfiLCWh0lsl5vzF7ByYALWOnmVco5icXboo=;
 b=KEi1lPNUxgy5y7CjAM70v7J2rwUqlrtCcHuWGgVMwmse16ks3HiDh0XOHsgHhXxWlf
 gQA/kVEg6piFvZSQv+GvZ+Cd1euCekWDeZOKoGPo3Sg+mrFuoKWZTcTyDWTiqa6EuyvM
 KBRgywOX1O3+QqtyHA2eVnVm3bZldM6eIJzCNiL4OC/FWz0ggezjyfBV+Sk8r69SXVAP
 Ms59lrEKkaD8eD6vhhjjSEIRfegSaPe5SIWcBnWUoOcoHv9qHG9GpuzytWItsNZnTt1M
 QQfBbCSUaUzHVI/VoMQWHWjLQ8OanzOgakBAKZ4HPFFXJEpPHiL7uU5RrT/wY0xYbPKt
 6o7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=THFSOnFfkfiLCWh0lsl5vzF7ByYALWOnmVco5icXboo=;
 b=FMvS6L90b+kBcujHq6BKCC/XN8h/Gos586nCw7IUeMha8d/5PU0sfFJl4cp+5z/OMb
 ktAP8gD8wdjRm35ecQqpfw37S8RXqny+xMfQfU5l1Eb/s69Qt3YqbbrwpDL587qU1Y+k
 oBDkWa9FLRXoFx7GX+xKgANVAZxcjhOiuhcQwtbJUAuYsQ1PKUT08NA/xe6cQkBXPjP4
 P2xTKYVjmGA1V05QYRDZkKkSJKBMoFiFJJUi1aG2XThh29w9lAmxFjtJOfDdlJNxi6H0
 b/XoyFbDgY+3OOge1ySur7xtdvs1tZKl3gMaa2QxjltMv46rVTDWRUwqx+Orb6gsxiae
 GZGA==
X-Gm-Message-State: AOAM530bEsQz8wqbd+6UENxzQmrv2IMQQ9jIBjyzxRZPlgPE0V4GJnSV
 I9MQm2pMJ3cACEkgPPXMsspMZw==
X-Google-Smtp-Source: ABdhPJzB0tzXfhuerAO6T/r0zGbfi2nGrR3h2LNY8UZ2cm0pESUWAm82NxLVd142yzVe0k+eO1SONQ==
X-Received: by 2002:a65:40cc:: with SMTP id u12mr4787776pgp.158.1620404868124; 
 Fri, 07 May 2021 09:27:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 14sm5163140pfj.29.2021.05.07.09.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 09:27:47 -0700 (PDT)
Subject: Re: [PATCH 12/23] hw/i386/multiboot: Avoid dynamic stack allocation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-13-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4908055a-fc2c-f2a8-7d2e-d5539f59d77b@linaro.org>
Date: Fri, 7 May 2021 09:27:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505211047.1496765-13-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 2:10 PM, Philippe Mathieu-Daudé wrote:
> Use autofree heap allocation instead of variable-length array on
> the stack. Replace the snprintf() call by g_strdup_printf().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   hw/i386/multiboot.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

