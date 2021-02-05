Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C99311236
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 21:20:56 +0100 (CET)
Received: from localhost ([::1]:60426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l87b5-0002Mc-BB
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 15:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l87XX-00083s-0z
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:17:15 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l87XV-0004qn-Gi
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 15:17:14 -0500
Received: by mail-pl1-x634.google.com with SMTP id j11so4128362plt.11
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 12:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jImc9saQs8GKussqqpnBMY5yMjSWr0H8uzXtcOJCAaM=;
 b=HzDeJZenqzqyXqbzyeG9xZ6qAtW5HCNTIlC9v82orHOTrJ7MOX027GJSMwoq/6sIXd
 n8sYDTVfIROEJBqFQsVyZid+DkwQ1zpf5Xgw0CfZq98JP0bW4kX1Td9tKqLyGjKntFrc
 rkjKs2MY7BA3DUJipzFLakK+NqeaBcovh4K7N8P035oRc7uYfuKCIVIGaxRmpDPZg1t7
 OZO1EiOGQXyUEQ4Hv5v0ktgRnH9tirsbWPPgGNMBMDF0EJGwg1WYXqKqBvSvE9jf9ZtO
 HV17YabzaJtISO4hSzQo6EGPHSVjGB5QmvGPqEXNgZc6/Xu0XR4760+KwykjG9TnJuB3
 WSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jImc9saQs8GKussqqpnBMY5yMjSWr0H8uzXtcOJCAaM=;
 b=WZSAuFN/2OzkWgDFTMe8S4UNJkSMlXELCURCGFBGCgdTzK3SsbhB76y/wJ64IdWvKx
 xpaElUYUIutFaWplHVdBoWp9s3Za/Im1RKdRE59R2avp65xITXDi9zC5urvuyFP7VhnU
 NJZpciynV3XRjTaKJrwdajL4+Fzc+ObbwqBuI2Xymo2EbCpUcVO/731mQZLjkflr41Mt
 DIrGiBNlH6oIwWpfUmWn0AKfJc/c4Kf/ZGLcGgZ9/mPAmYqcedGP6JqTo250SvxDL0CA
 buYGisfy788UL2KBkY3EOqfGuWkLve4ZX2HeQRhdci6nSkBZArKRo5qN0RwU9/EnwqdE
 6MnA==
X-Gm-Message-State: AOAM530pkR53CeiFiBI7jM8OmaqTv2D06gDBtZw1/I7cltefgZAWJVaM
 ECRAuawttmuIjQjUjVEsdQAP3vwvVCu1TmXo
X-Google-Smtp-Source: ABdhPJwbyeUfZ0pjCkYwHTqn8v2qVyGT5CO67R3FgIbh2HC1YRT7o86gNNpYiMsmsbfiUdrPw7vbCQ==
X-Received: by 2002:a17:902:e8cb:b029:e2:9906:45a6 with SMTP id
 v11-20020a170902e8cbb02900e2990645a6mr5599327plg.41.1612556231907; 
 Fri, 05 Feb 2021 12:17:11 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x186sm10415904pfd.57.2021.02.05.12.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 12:17:11 -0800 (PST)
Subject: Re: [PATCH v16 23/23] accel-cpu: make cpu_realizefn return a bool
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204163931.7358-1-cfontana@suse.de>
 <20210204163931.7358-24-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1031be6f-c47b-f308-cc6d-8992b5ad1f99@linaro.org>
Date: Fri, 5 Feb 2021 10:17:07 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204163931.7358-24-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.33,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 6:39 AM, Claudio Fontana wrote:
> overall, all devices' realize functions take an Error **errp, but return void.
> 
> hw/core/qdev.c code, which realizes devices, therefore does:
> 
> local_err = NULL;
> dc->realize(dev, &local_err);
> if (local_err != NULL) {
>     goto fail;
> }
> 
> However, we can improve at least accel_cpu to return a meaningful bool value.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/core/accel-cpu.h | 2 +-
>  include/qemu/accel.h        | 2 +-
>  target/i386/host-cpu.h      | 2 +-
>  accel/accel-common.c        | 6 +++---
>  cpu.c                       | 5 +++--
>  target/i386/host-cpu.c      | 5 +++--
>  target/i386/kvm/kvm-cpu.c   | 4 ++--
>  target/i386/tcg/tcg-cpu.c   | 6 ++++--
>  8 files changed, 18 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


