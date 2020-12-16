Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1BB2DC32B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:34:28 +0100 (CET)
Received: from localhost ([::1]:33244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYor-0003SF-Gz
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYUm-0008Lt-N9
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:13:40 -0500
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33]:41641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYUj-0002w5-VA
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:13:40 -0500
Received: by mail-oo1-xc33.google.com with SMTP id q6so4996796ooo.8
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3e9O7LHJD0QCSoYeC6tCv3gYuQ08GRPrRc3S8govPDw=;
 b=GGEcRM/pUA6wouVRqgk4Vfn2JZqyPpiOSHk6qSltfbmlH09WjzpSz1c7BmwK/Q3fyI
 VMQToOHa2b5fQ1bjAuqgTn6upoglNuyrr6HXGfXw7GqEBZkqKs/d9SCQHxZAUOkvp1Tu
 +U8/KRhS1iGX0vpQGvMipABiYtEKQB/Bsy+j35Ym0R9e4ZGYdiysG+Vgx3hoN7WiUOFO
 1IESOEqZ+w2Awo7H3b0lvEZYQlEs0AXEQxPe7KFzgDKsNRVLJM8dDb6afcRoWBU3u73Q
 22SSBAr6ezfDty0Wb8MM6onTldp6hb/e/KGB/hyX1aGA3BpJH4ypBT+8TBERNuCwxghz
 jiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3e9O7LHJD0QCSoYeC6tCv3gYuQ08GRPrRc3S8govPDw=;
 b=nzjroKjgNkAYTUdjQysuvUUfZRrab+u6Ev++xwLtLeVY2NEyNh7ujRuTzdXRgEcBMX
 QhMHi3rGrziePjZRDCndGe12aaJEvzRUeRvqOV5EWVL1k69aiov64W4TpQKQtuLoHLFD
 qzsXuDAdl1zhC7o/KDu8250kjy5W+7IrbMO2LTcTvWlMM7IQ9TZ6BiT9KEEt5tra4OG0
 xRgnJmqe4vhSm7qJSpuqxPHIhkTQs8fcEs4mkM4Qq7vJy8pUO7z4VyyOFIZU4hs9/AkO
 sJC+R4O7mZ4KMjFMzIYKmuBeyx8QJufh7gGHnB9MaKF0F7omkaDf5CcP1T6WiSJIFXua
 Ve+w==
X-Gm-Message-State: AOAM533YofAie4ofFjWQUc4HTBbbnVATP4bKHwz95m07R5MbZ7TwMFap
 s62oDqU7GU6MTwXThDIHP7jIOQ==
X-Google-Smtp-Source: ABdhPJx3iqfOw9Q8YPdt+GfNM4FR3tUm9fwihYSn/n6fkXsuGxeY/XEWZ7zYY1Jh/5+bj+1QBDGRPw==
X-Received: by 2002:a4a:920b:: with SMTP id f11mr25920934ooh.46.1608131615732; 
 Wed, 16 Dec 2020 07:13:35 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i24sm505358oot.42.2020.12.16.07.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:13:34 -0800 (PST)
Subject: Re: [PATCH 3/3] trace: do not include TCG helper tracepoints in
 no-TCG builds
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201216135529.265165-1-pbonzini@redhat.com>
 <20201216135529.265165-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98e787e4-884b-61c5-bf52-b041f57747c3@linaro.org>
Date: Wed, 16 Dec 2020 09:13:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216135529.265165-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc33.google.com
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 7:55 AM, Paolo Bonzini wrote:
> diff --git a/trace/meson.build b/trace/meson.build
> index 3fa760f568..012d0dbceb 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -71,7 +71,7 @@ foreach d : [
>                  input: meson.project_source_root() / 'trace-events',
>                  command: [ tracetool, '--group=root', '--format=@0@'.format(d[1]), '@INPUT@' ],
>                  capture: true)
> -  specific_ss.add(gen)
> +  specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
>  endforeach

Sure, unless it makes more sense to conditionalize the entire loop, so that
those targets aren't even created?

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

