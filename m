Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C49E4976F5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 02:53:46 +0100 (CET)
Received: from localhost ([::1]:60686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBoYD-0003EH-Ce
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 20:53:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBoWi-0001aP-PQ
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:52:13 -0500
Received: from [2607:f8b0:4864:20::1033] (port=34457
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBoWd-0004nC-LQ
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 20:52:12 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 l24-20020a17090aec1800b001b55738f633so2438080pjy.1
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 17:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tm7mg2C2ayQyC77sAKEanErGclkIEiSUIgdCVsyylWQ=;
 b=CaBn31ukbt4x0YpFGLG616Iwq764H0YyA7rtB2pEl9geBlCy48l1I35oZJNmZkFlEf
 SpsqytA13Ph6dz+f10Cw3CdS6lWsIbzXLEd/Upr2nEUJwTe8m8X6grruKkxbY9aruEZv
 ujxioUe0PaOUz8xPEHoxo4cor6wSN3J1AoOpN5uxVubSxRKyVNIzWuNXbB7FlDvHwGtA
 Q50XLYvJSfuUzE+Vo4u72KsyvM2OZwMTLK4oH8Vilg8o0rNiQxEFKD1Xq87PrTU4kRS4
 emNk8L1ZvJu2YztzjRWwSCvGz/OO/M4sN+5IugXuvr7T80+8/IUwf4ip17w9zaxd+ghT
 I/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tm7mg2C2ayQyC77sAKEanErGclkIEiSUIgdCVsyylWQ=;
 b=d1zKGtPsyjgkQlomIJ3LyKHbEQyJh9LY7Ir0Ke73Dz+rbPmHCPOF6D/EKgDfbzKAAP
 ND8qFoCrrYzIEVh8I5+4mSrkPWhbGZLYnOt7ztoZuv/ayxETCgCU3CfH24oe8Bdb5RXF
 fMsKJpqURWHBt/25umxPDFxS5HVv+BI11n6n8dBVP0P+YGYSP/h272/uT883OwR6KYGt
 pZAmfV4z6Y4KihrtRAdibivAMhOPq1q6o0PouqLKU3fA7pugJICNOu2wMOwswp6tDFKx
 +KO6cAI31sOplJ/eNG5t8skEA/uff1DOihUeOusH/1kkfADJVGCPZ9wPwYyCDozU68ls
 Uf0w==
X-Gm-Message-State: AOAM533tymaLBv7ipiqALzoMITeWcA9gzBw/PotKlXWITeJN2vRWrr81
 HKSKNJWa/7Tz5qs44wLtKDSy9A==
X-Google-Smtp-Source: ABdhPJz7AzHLLkkHL3afBff+pKQvmvceeH+jRCslwkneO93Jf9Zt8RtixJ2Dcar/Kds9cHrOBFhKdw==
X-Received: by 2002:a17:902:db0b:b0:14b:28f9:cb92 with SMTP id
 m11-20020a170902db0b00b0014b28f9cb92mr9173011plx.65.1642989125686; 
 Sun, 23 Jan 2022 17:52:05 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id v4sm13669736pfu.202.2022.01.23.17.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 17:52:05 -0800 (PST)
Subject: Re: [PATCH 13/30] bsd-user/host/x86_64/host-signal.h: Implement
 host_signal_*
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-14-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <73674c2c-98e0-0f2b-17b8-ae59bbfb4aec@linaro.org>
Date: Mon, 24 Jan 2022 12:52:00 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-14-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:19 AM, Warner Losh wrote:
> Implement host_signal_pc, host_signal_set_pc and host_signal_write for
> x86_64.
> 
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/host/x86_64/host-signal.h | 37 ++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 bsd-user/host/x86_64/host-signal.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

