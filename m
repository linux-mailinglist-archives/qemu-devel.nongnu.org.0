Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561E7471D0F
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 21:54:29 +0100 (CET)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwVrY-0003sd-FA
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 15:54:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVqY-0002xQ-Tm
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:53:28 -0500
Received: from [2607:f8b0:4864:20::436] (port=33453
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVqP-0001iV-6R
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:53:26 -0500
Received: by mail-pf1-x436.google.com with SMTP id x5so13321693pfr.0
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 12:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FXHrD3OSbgYnhX1kzZQAWrHc67U/uVLQ/VR7pMSBCzs=;
 b=UABc/i9Vi8AV77ESBl+GnM7PQFBwPf4PthQ5+mWCn7M8v5x57HFw2mhY/D11pFcm9V
 EteLWvik9L8SeRf4xuIXjGI+T09AXIEc7lIa18+Ccw/QqJmWq0mZBzAi5plsn1WIRA8Z
 ur/j8N7UfeNAX4qKVmQY8VnQY10WH6gf1TGnpU5SacN83/UcwKcAX398/H0bPLNzECIX
 /cqzRoIVGT8PTBZ93+l01GMDhKKac3tKlCFpP8LMpcTshu/Gl01tbi7ziw/up+2lhLdx
 aWQK71M8vU63VF0ZwbUAPE7iypmDFEhtwdpwozZVNHhKtqaTy1+3mBmdfIKkeYGpqnkR
 k/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FXHrD3OSbgYnhX1kzZQAWrHc67U/uVLQ/VR7pMSBCzs=;
 b=sVarKzRUipbtWCFzBkLmH8dtR+VSAONDCrkuNzNFH0/9BUWfpo0cn/gSuRfdNFMXOl
 V7LAU89IX0jVouR7U0B0kGLelk0a5isEPdkfmeQ+YpizowX3IuhDvSZ3WinIfKf86iet
 GW9fe5zluRxzp2+iu/P7aRolX2Do+erccYg+f1RuXlVjD20ZGC4nUlPSIWStJv6xm7/N
 a/HyPFGd+doDSIEzWegHu22tp0pLXE+VydbVP7+yVwHVoVwZifqKPcW8L2b33koW3c+a
 Amxe9wKlUlQYwueu5NaJqslDF9zD6LKuopw5vVtO9VWlZEibiQVmIsepPh+pd0QHISXs
 DJWg==
X-Gm-Message-State: AOAM531CGfabs+6IdU9BXQ8SuwvmM90X90LGoQ5Y+0zUu7bwRTZNayP6
 +3UDsT3cEIT/1nkiR4u+qzvjAQ==
X-Google-Smtp-Source: ABdhPJy1vPxYdEpAD3d+Lb4DaEjQqdsI086UVEirsTQCUl9NQlDSxuDARcwHWoYnRTXE/YLtCEX1Fw==
X-Received: by 2002:a63:1547:: with SMTP id 7mr14104031pgv.488.1639342394630; 
 Sun, 12 Dec 2021 12:53:14 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k2sm10654075pfc.53.2021.12.12.12.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 12:53:14 -0800 (PST)
Subject: Re: [PATCH 18/26] hw/intc/arm_gicv3_its: Fix handling of
 process_its_cmd() return value
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b4e04fb-3e4b-9153-456e-0e7b4b5c8c17@linaro.org>
Date: Sun, 12 Dec 2021 12:53:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> process_its_cmd() returns a bool, like all the other process_ functions.
> However we were putting its return value into 'res', not 'result',
> which meant we would ignore it when deciding whether to continue
> or stall the command queue. Fix the typo.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

