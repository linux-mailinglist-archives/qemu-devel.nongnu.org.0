Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12434975CB
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 22:46:40 +0100 (CET)
Received: from localhost ([::1]:36358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBkh5-0004hH-FN
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 16:46:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBkdn-0002eF-7X
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 16:43:15 -0500
Received: from [2607:f8b0:4864:20::102e] (port=40833
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBkdl-0001DP-GW
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 16:43:14 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so10166067pjt.5
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 13:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wwqMazUeowcZ8Wein1p8Y8b56eD1h/rcbQjsrLmUmNo=;
 b=MpyHkKCXG57dAFOJ4JVCNYuvNcXeTHyGzha2FjZiRDqeREQkwO8iZHAP8rQvbvZr66
 QCwFFyA7OYn2HvnlO0tsCaHoD7RqB2xOIA2WW5N2dHCkHZYONNYdR1oWwIGI2MqHRA+U
 HfjPgqqxY0IwX/5eha91H7JqGr3Xx2DqiTr9hRt5tRDjKecLnZuW5J+FRffv3c69/tse
 5qfHHNSRa6F/a18/SFrwv+79UhJPHJ7Mei9NuILpp1qYZd+/bNdSNy4lS7ETD2qFfr25
 T2MC2eRLghfVmBwr/aPyAFaYFrMPb3N6EoM6+Wcfd9wNWxodDn3idnfYw0addqAjuPm5
 tbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wwqMazUeowcZ8Wein1p8Y8b56eD1h/rcbQjsrLmUmNo=;
 b=XPyatIUX7nLwGfikUVVqKcoY4Cc96M5FRP+TD4fwicQP/Em8GSn/oMlXKp3TYooua8
 4hp5bVo+mcvAThrsMyC+OgatUNbZ6Z0vxeKl7bjmr5yp2zTnzxjl1kVliGTxwtSr76qc
 U4nSwI3sfakZuU0xGTx4xbf9ZnBz1y2ybaoue6oOzumSN7tv01xPqeZZdQFJS+hFdTSj
 RVFNRpmuzYgJRr3o81YXvsDanyzZHcLNDotVwXBI44eLA8FIER64YHR0ofG0YMIEuQr9
 LAFUX+3e2J864L9j41Z760yon1kyoaFdG77iEEe5VI1835MPInkVRoNpFUlmzk36ieep
 KbSA==
X-Gm-Message-State: AOAM530ErCfhaTtGsFHuo6QG0c5/ITzn3b57jf2hnYb49jTdndPkOebQ
 JimIBTOxyBaT4qLaYsrk/GC/9XxWHRBBCrH4
X-Google-Smtp-Source: ABdhPJzIWSJWYbS2OFkgfZvKvkjSL7VTTz0m9LqOq5rmwu+9E4sDdfm9RA36Tl6eVH8ExWRU7mpv2A==
X-Received: by 2002:a17:902:f681:b0:14a:2a1e:4692 with SMTP id
 l1-20020a170902f68100b0014a2a1e4692mr11816794plg.99.1642974190713; 
 Sun, 23 Jan 2022 13:43:10 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id q12sm4001484pfk.199.2022.01.23.13.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 13:43:10 -0800 (PST)
Subject: Re: [PATCH 06/30] bsd-user/arm/target_arch_cpu.h: Correct code pointer
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a5a450a-7e42-4cc7-fd49-ed8ba0b24edd@linaro.org>
Date: Mon, 24 Jan 2022 08:43:06 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-7-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 1/10/22 3:18 AM, Warner Losh wrote:
> The code has moved in FreeBSD since the emulator was started, update the
> comment to reflect that change. Remove now-redundant comment saying the
> same thing (but incorrectly).
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

With commit message updated, as discussed upthread,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

