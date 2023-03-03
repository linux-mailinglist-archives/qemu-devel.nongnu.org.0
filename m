Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA89A6A9517
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:22:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2Y4-0004zG-1F; Fri, 03 Mar 2023 05:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2Y2-0004z0-8D
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:21:58 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2Y0-0002Qj-Ml
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:21:57 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so3568708wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677838915;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mzlTP7R7zKCP7RJ8UiVzNpPB9G68mLprKPS65LltYYQ=;
 b=ngRXPhil7bj3ycpjZ2nfojxKpA1sozPlWMzoi6tz5m+9ydiiaE9GrSxvNVUUgb22uU
 PSrwz6wkEnyslNL8Bn/sp4HB6BbfQN9DbGBqk4wljP5Y6aN5uuHixDU93FiGsAsKVxoW
 vlaVAltrwSf8bUTl5MbjF01UqOit1HYpD3DiuIAq5nPkcwEZ8eXP4CSk+7s7SycANOCq
 wD8BQ3KrQmP3R7ypZ3j/cr8zCEmC4HeLpWPKL/ftjh4vOMHbIlOhmj7Hm5H4yQDdyBHl
 pOaKVylMGdrEmDIVLvkshVsT0aQVjEmLim6y79vWd+UnSrgf5LZiED14limOAuU/S/q6
 cFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677838915;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mzlTP7R7zKCP7RJ8UiVzNpPB9G68mLprKPS65LltYYQ=;
 b=WVqg42/GTq+aGQ3B4mm7H7yRbqVZNumuIRaiBuQZ/GPjCshi90UgPb8vWaALsnbHqD
 lgha4dWqkQm/n9lPB9TtRbr/B1aQjq8pgKKoRvazuplPzaRxTFAZeI5Mqtawxg2dxGsU
 mkSRUYRCta/uc2ZeC83EyrC6O8y0HLJNDlLlAT4EUXVVj/lWU5r0T6tiO4Tozn2f3YYu
 RS6cdtokLKvVOpp/F5k1B9g1YoMQNHx3P7Xf1XTndTpB3M3AeOdZovx4g7i+USmQx+00
 mI4bBV9dvKNQdEKrzDo9qbkwGZTAklvU0BFdGFhAVJ7BFUma8rDprEW1cvfQpOIPTOuY
 LfCQ==
X-Gm-Message-State: AO0yUKXijSodD2pIgv2LJCOaOCOiU5NVVhEulFYzTWoIeoZUTLFK8y3p
 1AUjWaB8rZYo8HeGXZtLQ8Z/Jw==
X-Google-Smtp-Source: AK7set/y4nBoHbF+MCdO2IUmaX6TdF9cDnDQW+P6n0jDIjBG5I8GF1PCA2fXKcwrdTiiqAq5Gr/d1w==
X-Received: by 2002:a05:600c:548b:b0:3eb:39e7:3607 with SMTP id
 iv11-20020a05600c548b00b003eb39e73607mr1254174wmb.4.1677838915005; 
 Fri, 03 Mar 2023 02:21:55 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 v38-20020a05600c4da600b003eb68bb61c8sm1678065wmp.3.2023.03.03.02.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:21:54 -0800 (PST)
Message-ID: <0ffef565-0332-43c3-2786-9fb0a8c356bf@linaro.org>
Date: Fri, 3 Mar 2023 11:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/6] gitlab-ci.d/crossbuilds: Drop the i386 jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
References: <20230303101452.769367-1-thuth@redhat.com>
 <20230303101452.769367-4-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303101452.769367-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/3/23 11:14, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 environments for running QEMU,
> so let's stop wasting our scarce CI minutes with these jobs.
> 
> (There are still the 32-bit MinGW and TCI jobs around for having
> some compile test coverage on 32-bit, and the dockerfile can stay
> in case someone wants to reproduce a flaw locally)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 20 --------------------
>   1 file changed, 20 deletions(-)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index d3a31a2112..b96439146f 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -43,26 +43,6 @@ cross-arm64-user:
>     variables:
>       IMAGE: debian-arm64-cross
>   
> -cross-i386-system:
> -  extends:
> -    - .cross_system_build_job
> -    - .cross_test_artifacts
> -  needs:
> -    job: i386-fedora-cross-container
> -  variables:
> -    IMAGE: fedora-i386-cross
> -    MAKE_CHECK_ARGS: check-qtest
> -
> -cross-i386-user:
> -  extends:
> -    - .cross_user_build_job
> -    - .cross_test_artifacts
> -  needs:
> -    job: i386-fedora-cross-container
> -  variables:
> -    IMAGE: fedora-i386-cross
> -    MAKE_CHECK_ARGS: check

The cross-i386-user job might require an Ack from Laurent,
so cc'ing him.

