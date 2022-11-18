Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C362EE4A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:28:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovvmK-0006Nq-1q; Fri, 18 Nov 2022 02:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvmF-0006Lm-1i
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:27:08 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvmC-0005mQ-Po
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:27:06 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so3403918wmi.3
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y8VxI/FeZX1GuWTy5qPSIruGSqKBdAvmq4FR+uC27pg=;
 b=ZCFI9XGrK08bj87ZsnZZU5KvKbZtvwmcxqBFpKvBSXiSNJUGTIy84ZDPZFXP4rG3Zk
 B6rwBsQJjSWg1PceXd538e7wRqmWKE5k0bfxFY1onQf16/5kueqU90y8Wn/GcXcAVIx9
 wTKwewnVGhP8QJJZeqhEayAj3f6/A2BeZlpBkE3BAXHOHOoEwyY3PrJEqIxRf0zoAb53
 lglWErpLEPnudbRMmtVCBNwj51GgVfMNrn4J8O2kAcoJIx30lCfS2/BgWa04ni83hiPH
 meNXF4BI6FTyzjJd+nn2UrxJ7Haodbjx6j5g1UhErsXXHtNjDRAO2jzwbUS8i3O6Ff4I
 s2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8VxI/FeZX1GuWTy5qPSIruGSqKBdAvmq4FR+uC27pg=;
 b=K44W/pw3npWW5BxtxIphiguv/LbLtZtulUgD3Qo+ugxxUKJlInVXjKKMbvCBBK9css
 ZDcdeclLYmu+6lsS0xPSzd+BVf6ybxZCLzit80osF5x/yrMXZWBG+emfYs9gdNF03MCj
 Xt9LTMlm26GCc/u7PTrxzNu4XnTTCnWM2XQ1KHegKz5vTRXvVdlmTHvDtGQOOAU0gMA8
 EvTM6aZW9p8vphTycl6N9jNnXPbdykGl0iS1JOtjjxnznLdbr7vgkWLoXTD/Y//5SR/C
 B5ChVP2YWws9eNzrr+nzDZukR5/+Ls0gm1bpjv6BAVGjYIzaG20HFrLXq3Gmexv9CLjK
 t3lw==
X-Gm-Message-State: ANoB5plPHwOAoY89naSfH5nnTB8isZJWsCGlsOVmRWV64+YamgHQ9v9y
 93sDWam033AmXiGfxYHlOaXJkyK4bfX7pQ==
X-Google-Smtp-Source: AA0mqf6LfvIFxemsR1oVlTA63MvjKQC0gveJ8M+LvFkAQKpwVxC8DxatZuf9VNAl9H+wDxAZd7VIEw==
X-Received: by 2002:a05:600c:1c9d:b0:3cf:69ec:9628 with SMTP id
 k29-20020a05600c1c9d00b003cf69ec9628mr4005731wms.79.1668756423303; 
 Thu, 17 Nov 2022 23:27:03 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 v4-20020a7bcb44000000b003c6c4639ac6sm3601960wmj.34.2022.11.17.23.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:27:02 -0800 (PST)
Message-ID: <50436f00-524d-700e-c3d2-78e5ac0fe5a1@linaro.org>
Date: Fri, 18 Nov 2022 08:27:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-7.2 v3 0/3] rtl8139: honor large send MSS value
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Tobias Fiebig <tobias+git@fiebig.nl>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org
References: <20221117165554.1773409-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117165554.1773409-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 17/11/22 17:55, Stefan Hajnoczi wrote:
> v3:
> - Add Patch 1 to avoid clobbering tx descriptor bits
> - Add Patch 2 to avoid confusing tx command modes
> - Exclude IP and TCP headers from large send MSS value

> Stefan Hajnoczi (3):
>    rtl8139: avoid clobbering tx descriptor bits
>    rtl8139: keep Tx command mode 0 and 1 separate
>    rtl8139: honor large send MSS value
> 
>   hw/net/rtl8139.c | 47 ++++++++++++++++++++++++-----------------------
>   1 file changed, 24 insertions(+), 23 deletions(-)
> 

Per 
https://lore.kernel.org/qemu-devel/014101d8fac5$2cad8420$86088c60$@fiebig.nl/:

Tested-by: Tobias Fiebig <tobias@fiebig.nl>


