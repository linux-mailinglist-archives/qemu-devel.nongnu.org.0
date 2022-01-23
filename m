Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D24975C4
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 22:43:26 +0100 (CET)
Received: from localhost ([::1]:59954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBkdx-0001YH-1p
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 16:43:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBkZh-0007uY-L1
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 16:39:01 -0500
Received: from [2607:f8b0:4864:20::530] (port=46911
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBkZg-0000Dq-7C
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 16:39:01 -0500
Received: by mail-pg1-x530.google.com with SMTP id i8so13365505pgt.13
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 13:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bzl24zzKrRutlPWm83eEKO8USxN5Vpd254h61hEH7hA=;
 b=Fog6qdTe9g/Dxzs2Z3F0dTFXhqzIWrR5Hcm2I9k3/sUHG7jroQ8Mwrz4TeHg7N/4O2
 jnOg7BUfcmn69pRD5yTbeBhiwluRSgToyfESozJwZWQmApVGxw0iCk2AZGhDvhdedZ7/
 eQ255q2fDKoF7lJln3tF8Xhdhe6+sfctRPivWSjNLYcQjQCYfhuUuh77RDxstkGxn4xf
 V9JxNbBVjeA3yPa+ipHI9nu00ePxXOT1Sqs8wczDOTwYvt1JuBNNmrOA7VNb68UVuhzD
 7vLEn3yRzaNDT4MOhysg5N3UvdtJM9hhmYTrL9k1fFHzLp6ICvR77q3PlX11we8Chd91
 HLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bzl24zzKrRutlPWm83eEKO8USxN5Vpd254h61hEH7hA=;
 b=fa/z5KFWQLCo2pPQA83s5n0wZ4aCXW1XdxqEyBM2ljUwQ26aH3dPTCkjIP02wnekUK
 DO+AW7zdMLWqwSqzqzdREQInSQ8WpiWBFsh6A64MAdqheSnTiPOyPuWt8VmLj4DcCIpI
 6a/fKKbKT1Wu5aHUuNqeYglQORYMeI0M8M9OVc9QT1gFNnJZFG18HoErr0OMc52BEJVY
 aC6K5Yp7H9goM7pRIxK1TK/cm00h4UgGwgKD1VdP0nNesfTF+A9xbFGasiMj7iMKf6tA
 ku3IhJUhTA5FBsQ28OXuNnOcJNvQ4UAPBKxIVq/Ru4/18PUJFWFiCYX5kzoID2VgWi6X
 hW4A==
X-Gm-Message-State: AOAM5309qdD0dtu2hwvMrGbra/lvnRzwPscJC49Dyp9Cka6Doym7+9Nr
 pr/C9KvkDQ0tyXyPku7BPX3Acw==
X-Google-Smtp-Source: ABdhPJwVuFHZQrFjiEHLjOZvRSspk6C/2ifz762Mo9O7viC0GJ00CShBW2My2IgDYxTu9Kp+ch1rsA==
X-Received: by 2002:a63:90c1:: with SMTP id a184mr9799267pge.372.1642973938945; 
 Sun, 23 Jan 2022 13:38:58 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id b21sm9605549pgi.51.2022.01.23.13.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 13:38:58 -0800 (PST)
Subject: Re: [PATCH 04/30] bsd-user/signal.c: implement cpu_loop_exit_sigbus
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f086962f-1c2d-dede-f098-1992de8faea0@linaro.org>
Date: Mon, 24 Jan 2022 08:38:53 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-5-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:18 AM, Warner Losh wrote:
> First attempt at implementing cpu_loop_exit_sigbus, mostly copied from
> linux-user version of this function.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

