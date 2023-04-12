Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0499A6DF1B7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:11:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXRL-0000lK-4S; Wed, 12 Apr 2023 06:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXRG-0000gL-4C
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:10:54 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXRE-0007Fn-Ba
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:10:53 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v27so1094624wra.13
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 03:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681294249; x=1683886249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HoI/T9YOCONB0inQJgIIIOHcUp1NPXHuCzIoHyrjQ9w=;
 b=ILAz5YzWqGk7mKsU+JmOWvGSBjwizfPmICj8GQzVzRq1aHDGzF5OkAqdrYdB4vk4iF
 2MEAj/YvIBHMLLHjmjPs3wJvLaSY+iQHqQJq28zimdfEUMIoNpenPQAav+a6FGQ+huec
 JsqGTy32k0ba1+bi9fobK3ZgoAr+rv4w4OV9K+2iSC7yEOlFq87WHRYZ5iVFdSIwCVwG
 N/a6/BlzTuQPbhFINscdgwJErS/PAJvqUnt/6ZJKGijyyyYNrmVhMsUC8ZG0sk9B2SqA
 Q/o6GS5q/QQ/v3MhOA3xIg65r7LJu0z53rP5uCxsaeKDOjL2Hyv2NRWdwdR39aXgYe0M
 +qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681294249; x=1683886249;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HoI/T9YOCONB0inQJgIIIOHcUp1NPXHuCzIoHyrjQ9w=;
 b=Dvozw8sS1XVsovgBjFH+urIoJQb+GWBcgjYdjJOtVRAZ/dq3xsAj+Qx/TtT/StkbuY
 O0IpG4rDVrg6lyTE90rMZMzxmYE0fimjCFELCMgR6inpxV7A91Nffu0oP8HrAqx6E4FY
 UFgAH8WTi43iyxSf+1i68JgN6ZWhGf33edK/YWMsV18DEDNhcfD/7AbE4cFOdVQlAY7m
 50IBWCWyUoUTw3js0plq2HfrWrBt1fMQ0XNZmD2dIW94hpZF57FsPSJokjwENuNnnkPl
 /ehJE0j260Q2GHbo+VvvbbvSdPc7rLdPYr5NaAOEDMscE4eU6GfjG13R7KxN+QNYZ8Nn
 wgmw==
X-Gm-Message-State: AAQBX9cdccPaqhLbSms3S930YzvMHXmydv8ywWg8eHzROVnBV31JZW0d
 CK9rzBpE5OSEtoEj+f42ugeEyy9rad/ZUf93Y0ahHqyj
X-Google-Smtp-Source: AKy350ZmGORnmOLhuq/rSVeUTNt37pBkpue/Ec/b4iylD1k2FROUyn3TeSNxInnFk7rf2OVOy9Q+pw==
X-Received: by 2002:a5d:458e:0:b0:2f4:a552:b411 with SMTP id
 p14-20020a5d458e000000b002f4a552b411mr958807wrq.46.1681294249315; 
 Wed, 12 Apr 2023 03:10:49 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 f2-20020a5d5682000000b002f459afc809sm1444010wrv.72.2023.04.12.03.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:10:49 -0700 (PDT)
Message-ID: <7f006fb2-d88c-61e2-d536-ba6369107972@linaro.org>
Date: Wed, 12 Apr 2023 12:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 18/20] bsd-user: Automatically generate syscall_nr.h
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
 <20230411170955.17358-19-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230411170955.17358-19-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 4/11/23 19:09, Warner Losh wrote:
> +++ b/bsd-user/syscallhdr.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +in="$1"
> +out="$2"
> +bsd="$3"
> +
> +awk -v bsd="$3" '{sub("SYS_", "TARGET_" bsd "_NR_", $0); print;}' < $in > $out

If the host/guest syscall numbers always match, there's no point in using 
TARGET_freebsd_NR_foo at all -- just use the original SYS_foo symbol from <sys/syscall.h>.


r~

