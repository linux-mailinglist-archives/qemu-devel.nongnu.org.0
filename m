Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7F457DD9
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 13:27:06 +0100 (CET)
Received: from localhost ([::1]:60190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moPST-0004bp-4w
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 07:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moPQd-000379-K7
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 07:25:11 -0500
Received: from [2a00:1450:4864:20::334] (port=35707
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moPQb-0007NV-BA
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 07:25:11 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so12625855wme.0
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 04:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sexaYSWcq+Iewpxc48rCT2F/BZDRO922RUe1JoJEfO8=;
 b=bnCutNqAtPTWPggFWaOAuTNKK2YC2kWV+kiNuJdPYR80Ea1DdUGQ1rSx88ckThKw7Y
 pt/Sjq75pXlAtUoA95dGVcAUmQzcof2QT+aT7zbAaNPyFSv3+ucRMcmTSctSR4WNxaXZ
 gsR7SU/GekuFE7ZkauA+6mcgKp1/F+J/ORpMwICdbj/zv+fYSrDnOG4osUs+ThuITz3h
 HFB6uWjiNBzqO1X6UwnaUPqk2qRwjqlHRjrB2kWY9zA83UBFy8f8IVm5BeMsYb652qHu
 qMPaZyU/dL7TK5GRhcW5CE0sRlPdufSo1E5rskeVL/wLZZIO16qc/LWfdZI6sPx5FV6v
 JfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sexaYSWcq+Iewpxc48rCT2F/BZDRO922RUe1JoJEfO8=;
 b=VSeeDS4Uv7fbZeqjin5n5DJReGVUv2WBs1wetpwfm8HLu1zXD8cuzjHMGrxZ/9lIoM
 XC5gBpSUAZ8yfz7wsLLaq/gCk5BAbH9Bx1z1n0rO0wzIUMQvMYeL1W+2vK6e28NGLv8w
 +V6e5YxpgNAoBku7FLxQir9Vr74+x7a03DlQKqS+3/VPsH+c+GEhvdrl5kppRTvND3Y/
 LumzMXyHiDdrXy7FUfdP3vxckcKpboSWvc7aU4jO3Fa3NZqeOYdsKOjuu14IJk8ca8Ph
 EtUvLQ1RoRAs3TvkPorWw80xmxxlGNxyt2SA85AQpx6sagxYrAEXzmirULb4mxBhWVSv
 jDvQ==
X-Gm-Message-State: AOAM533RjJj4RGI4cha0QGhhQqx4g6/F7zolcqQVNmdBt6ejLsaQKu0c
 gMqy/dvqrw8AWqc4FoP/P4pjAg==
X-Google-Smtp-Source: ABdhPJyQUW6q86WaI1mfDMGrmmiiiDKGULohwyvHVfbK1o53rjz2VWMIDeDn3bUJiAoOkyuPV1rpKg==
X-Received: by 2002:a1c:2397:: with SMTP id j145mr9790444wmj.113.1637411107844; 
 Sat, 20 Nov 2021 04:25:07 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id az4sm15474602wmb.20.2021.11.20.04.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 04:25:07 -0800 (PST)
Subject: Re: [PATCH 02/11] dump: Remove is_zero_page()
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211119165903.18813-1-quintela@redhat.com>
 <20211119165903.18813-3-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec069196-229d-bb90-e31e-ff60fe970ada@linaro.org>
Date: Sat, 20 Nov 2021 13:25:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119165903.18813-3-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 5:58 PM, Juan Quintela wrote:
> It just calls buffer_is_zero().  Just change the callers.
> 
> Signed-off-by: Juan Quintela<quintela@redhat.com>
> ---
>   dump/dump.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

