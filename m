Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D9F3DBE8E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:53:10 +0200 (CEST)
Received: from localhost ([::1]:55460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Xd7-000259-3A
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XWl-0002Vz-CP
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:46:36 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XWj-000673-7r
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:46:35 -0400
Received: by mail-pl1-x62b.google.com with SMTP id t21so12099804plr.13
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VdV8k7NKvU9clSscdKoeMJh9wcYzd07tPnWpxNYoXPg=;
 b=GpbBbZCw0vuvOW2zinC/1XeWTqXn6aEWip4/6sMZi14bD11z0uUzr6gpSalX4oE1AS
 MfLzNNoAXnnPRK4Sz6q5aOPTwkE5tEweU9+Cm7S4MfIeCKkgBqxQjyffaH0w18QMmP7M
 pAYMEfh/LBmn+809StQorCoUHif4yrH87aIQVdS1+PyVbZ2OJYfYXHfpNi5hG3d6kwNK
 1xlVJiHynZM1ywX5uIASMMYFuQcy43i5ggiJhbqjyi9at9O7SDdAeH3PhCc55x26ZGki
 vbBnWV6lWfR1MuiJ5omILJ893JYjkf9PipZtpMcFCNrwK8kuzSXW26A1ah2ihCBF7PpC
 Wx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VdV8k7NKvU9clSscdKoeMJh9wcYzd07tPnWpxNYoXPg=;
 b=KbjNpY4+Niy3vm3lnNTJuDgobfM+tqemljQrENTk1pIkgiVsGVRT5yfxKoLOnbuXc0
 35UFDzprsA6LpnQZlm91TZp/UtOLNUEg9TGYLfe46CeZq05dKckIASIMs7ylVVMNDVAw
 5wJx3wkglFEXY2ogNoOrBBT9ylYuvzN056wprdaZz9y3u6QsBhUpVr9H9E+OQoY7+Ok1
 9UBTTeJhb15T3xc36HFhWwfroYcr0reYWFguJ7nrGT0vgJWbBJi/sCVcobT0cIw/UDn5
 czNarMJcM+arkKhiUbvAnrvVyZIlDAC44fIRmMhAHdrF4fK86OBDjJrvz0Qxh1ocb0E7
 c62Q==
X-Gm-Message-State: AOAM531x5r1wR8Ly4/I8/Pv5IiB7m2nR5UgSMYgOaYOxVDJ9ApBRDw7E
 Qsni2D5/uGaahDXHt2vFWEUkxQ==
X-Google-Smtp-Source: ABdhPJy5okNZvY0VQh5ZU/IpQdKFa6yu+gaHlWsQJZSVz2LoackNvmqry/iyFDKaS34vtYgdZfGPog==
X-Received: by 2002:a62:8013:0:b029:328:68bb:fa7c with SMTP id
 j19-20020a6280130000b029032868bbfa7cmr4262408pfd.80.1627670791438; 
 Fri, 30 Jul 2021 11:46:31 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id q18sm3290763pfj.178.2021.07.30.11.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 11:46:31 -0700 (PDT)
Subject: Re: [PATCH for-6.2 6/8] arch_init.h: Move QEMU_ARCH_VIRTIO_* to
 qdev-monitor.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b79082d1-d041-b17e-f0b3-a11749446b89@linaro.org>
Date: Fri, 30 Jul 2021 08:46:28 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730105947.28215-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 12:59 AM, Peter Maydell wrote:
> The QEMU_ARCH_VIRTIO_* defines are used only in one file,
> qdev-monitor.c. Move them to that file.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/sysemu/arch_init.h | 9 ---------
>   softmmu/qdev-monitor.c     | 9 +++++++++
>   2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

