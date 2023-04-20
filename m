Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5D36E8E08
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:26:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQYR-00047G-Bb; Thu, 20 Apr 2023 05:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQYK-00043S-Mg
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:26:09 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQYH-000073-HY
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:26:07 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 bi21-20020a05600c3d9500b003f17a8eaedbso2747964wmb.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681982764; x=1684574764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6R3NUXQNloEfrtxFmSaTQ/yBgTC87AnGkpaRDr3/Tlc=;
 b=mtXKjUH6MTTWHEhAdgjegcW/ynESuQnH7acjEWXhyOrcjoMbPN5RtkRwjV7NZi4O3f
 lMuLpkE99zDdTWHs0sNlCGDFX3dY8vGIKRFVkhzoTEmWK5z6x2is1YaiNV2B8Vkx+cto
 2mhZViS3jqaybiSkqzSK+jAY++YGn/lnd2l+8gCjom2w1Fckf/FDO0ZYngZuLNMXs4gX
 n/q4H01FmKLrdIGdr7RKtLjddyuIYtH14Ya618l+XIV5O+wHxPGhN8PGcrimvVDqif2i
 aOxhNWjAGnY7jl1XDQMr9E6qfD1f0qYHMx+IpW/E5JU+0N7giPZeBtl7/T8EG7fFKIoU
 BeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982764; x=1684574764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6R3NUXQNloEfrtxFmSaTQ/yBgTC87AnGkpaRDr3/Tlc=;
 b=Ray7DqeqFXgoHrAqOh10wzHwN/Dv0vXjZ+2NZ6kvAWCiisJ3MrI1hpajMH2l2s6eRB
 D9BkXn9RTL6MxMHKCr8wu4VVf11IHWzDIfOWG5EVTvHrJxMlvDyGADax8HSeW+8NCiim
 sNYdpuzuuSKFE52sp7qo/JQVhRWd/xGVb1FTrofopsybPIAsp4ikir8JVOT9HK0LaC70
 R2vUsNFzcjgCn4Br2GjU5c/W1ira0xWeCIEqFl+3czb2LENahVwa6JH64pQ8Eua8F844
 ArcXrDsXNMjFteziYZ8Fl5mfBVni1c8i4JxAomFa3mxHVFVDQqXSNN7Rk44tt/mhrXg7
 fTUA==
X-Gm-Message-State: AAQBX9cD3JIkmxk4yi3BAqydQlZsNkOqel+w+231KlkQpoT6idJ9EtRf
 70CHA+ilsyUZfbgUXgSQNzVwuw==
X-Google-Smtp-Source: AKy350bWDKsTYcsKCThGLld9EfZFdXWATOTEzEIzqRjVhFMWdSFx7mMEoc5gzejmN/J8xF8x9GlpxA==
X-Received: by 2002:a05:600c:2212:b0:3f0:7eda:c19f with SMTP id
 z18-20020a05600c221200b003f07edac19fmr784404wml.11.1681982763983; 
 Thu, 20 Apr 2023 02:26:03 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q17-20020a1cf311000000b003eeb1d6a470sm1493645wmq.13.2023.04.20.02.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:26:03 -0700 (PDT)
Message-ID: <84c043bf-1b29-e62e-f86d-52236a2c733d@linaro.org>
Date: Thu, 20 Apr 2023 11:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] meson_options.txt: Enable qom-cast-debug by default
 again
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Fan Ni <fan.ni@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230417130037.236747-1-thuth@redhat.com>
 <20230417130037.236747-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417130037.236747-3-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/4/23 15:00, Thomas Huth wrote:
> This switch had been disabled by default by accident in commit
> c55cf6ab03f. But we should enable it by default instead to avoid
> regressions in the QOM device hierarchy.
> 
> Fixes: c55cf6ab03 ("configure, meson: move some default-disabled options to meson_options.txt")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson_options.txt             | 2 +-
>   scripts/meson-buildoptions.sh | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


