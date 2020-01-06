Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E49130C3D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 03:58:56 +0100 (CET)
Received: from localhost ([::1]:47454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioIbX-00051b-Dt
	for lists+qemu-devel@lfdr.de; Sun, 05 Jan 2020 21:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50491)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ioIaR-0004TV-7Z
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 21:57:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ioIaP-0006Hz-Py
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 21:57:46 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39630)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ioIaP-0006Hk-JK
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 21:57:45 -0500
Received: by mail-pf1-x442.google.com with SMTP id q10so26267821pfs.6
 for <qemu-devel@nongnu.org>; Sun, 05 Jan 2020 18:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jn+6Q4Qf+qtVEZsaLigxe3eDU+fqsJ+e495sb7bNOKU=;
 b=FkApA+xqINhPl0+fj8pcuf0+soghNqUSuFlnwKWKbwfiVRvHpNYrQWZgOpHpqjtX9s
 1WOlisPU0onbvnK9zVY2YBMUP+Qmot+3nzT+3zJ4Sw/voLkCV89UFFmHbMTLkMNlVIXS
 ryFPcLfydJmXhbQuGlZuMjGK+2+UxM2TQqF60lypkpGtYNPA3jEKBIZOLfRuDXmkrmI2
 f2DekQj+dIhVCYIKNY3VOEDKcKmyPpzIrUrEYlx1sYptTMYTLQ6ECbgDy63E6fKNkrmz
 4EbNul0fx+i4glx/fbR/JPSAVyVJ9qIH8+0kuakBpP8Hw7dQVodN4UaCBUl8wDCTz2Iw
 XmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jn+6Q4Qf+qtVEZsaLigxe3eDU+fqsJ+e495sb7bNOKU=;
 b=Lki69ZPfv0pCuEqKGpyVbKqO6XW2dvd0kf20o1LLo2+71ffc1ie+sMSSxXCWt7veqw
 /3rfJQpLw0arRq2vVqCSqziIhE7gwwV1INfoN5awvLsZOfin+yybGYMKlGE3mZeEXdBX
 bNsG3J6D69sY7r4CTexYn/jSocNJpTrJqyjr+d8ox4eoGr2qstiQ2PBiI9UcZmG0A25f
 oOyL94kW/tZqab6PTp9f0JrfCgrDYpd8eIFGSM8jRsQiiseG7xy9dUwbA9+cxIKQWYKG
 uLJcuXx8jcFKiNdD+aDkkKQGRbvNLx2QyFVFHDxNcXuzslXpBmJB4K5nN43XcP/LwSIQ
 MytQ==
X-Gm-Message-State: APjAAAWCA+yQ+wKKfdIYqXY49tvS9+GLwqzr8WuMvUhKqrCo6fnvtf6j
 4tVh98gwmDcwZV62qtCfU851wQ==
X-Google-Smtp-Source: APXvYqzH3/03ocFuWDh6ZNtEBTgkQUUlE44rFIuSznTJeYavZS7VN+Lkin7DvJhNXQFn8l6dyb6nKA==
X-Received: by 2002:aa7:95a9:: with SMTP id a9mr105141178pfk.15.1578279464410; 
 Sun, 05 Jan 2020 18:57:44 -0800 (PST)
Received: from ?IPv6:2001:44b8:2176:c800:f1c3:9f9c:2e9f:1ebd?
 (2001-44b8-2176-c800-f1c3-9f9c-2e9f-1ebd.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:f1c3:9f9c:2e9f:1ebd])
 by smtp.gmail.com with ESMTPSA id m15sm69579852pgi.91.2020.01.05.18.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jan 2020 18:57:43 -0800 (PST)
Subject: Re: [PATCH v2 0/7] configure: Improve PIE and other linkage
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20191218223441.23852-1-richard.henderson@linaro.org>
Message-ID: <81a243a2-3bf5-a6b0-e6b0-e941d29c8d10@linaro.org>
Date: Mon, 6 Jan 2020 12:57:38 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218223441.23852-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: philmd@redhat.com, i@maskray.me, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/19 8:34 AM, Richard Henderson wrote:
> This begins by dropping the -Ttext-segment stuff, which Fangrui Song
> correctly points out does not work with lld.  But it's also obsolete,
> so instead of adding support for lld's --image-base, remove it all.
> 
> Then, remove some other legacy random addresses that were supposed
> to apply to softmmu, but didn't really make any sense, and aren't
> used anyway when PIE is used, which is the default with a modern
> linux distribution.
> 
> Then, clean up some of the configure logic surrounding PIE, and its
> current non-application to non-x86.
> 
> Finally, add support for static-pie linking.
> 
> Changes in v2:
>  - Remove mention of config-host.ld from make distclean
>  - Do not split -z,rodata/-z,now into two tests
>  - Fix --disable-pie --static
> 
> Tested in conjunction with AJB's 
>   configure: allow disable of cross compilation container
>   https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg02943.html
> 
> as otherwise check-tcg simply doesn't work on aarch64 if you happen
> to have docker installed.

Ping.  Patches 3 and 7 still unreviewed.


r~

