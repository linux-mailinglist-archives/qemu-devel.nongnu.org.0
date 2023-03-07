Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDC66AF6D4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 21:39:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZe5W-0003vm-MP; Tue, 07 Mar 2023 15:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZe5U-0003vM-UF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:39:08 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZe5T-0004ZQ-D2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:39:08 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso8023731wmo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 12:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678221546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a/rqsVMNuJupCpEyswfSq/qV9BebDB5LoWl72JHZFyk=;
 b=at7n2+dUMczbyJaPjqYxSwcOqXVhpCU1/Q+PTucoqTl4QoYzxHgLBXxflJnOuUclYk
 7F3HCu47aP8DvDzA1f49D86pljvfc9Vh7nK0MFjOEv04QfPZvb1WKFjPBDWFJ1DdG/hs
 MqC/Ekgt2pHMHCePBYw99PB2VWOJhl29ZfdPoSqBcyCNetctsw3CiOA0SJbPpq1HedJI
 TIqmFUTEJ9V+FNNnQgXwkaiGhuGz7gFXEVQ9eFYJzl2TLaf5vnfWXecYP1CegTmj8xlr
 fB6q2hp30KIx8/98H0ZXXpN1TLI6b3Jt909X+1HjR4vb39JuPDdTadZOBgY2TgPoMYSH
 VqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678221546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a/rqsVMNuJupCpEyswfSq/qV9BebDB5LoWl72JHZFyk=;
 b=HsWmBSdxII2wpPLXrGtGs6Fk6hhXJO2WSI0BWM5kdDn+E8XlN3Wvt61IJku4b+9SUG
 4uqYoCp1y/JRZDLwbdbnZYqWtImsRRPdxB+ycBh27yYUIrUeSS5Lko1+L3rQdK6rGlr0
 48fZak2DPsBYRswnl2iZZhhctcIr74lF7/zYR2c3zkdKijBwgFeNgdds8Xi/RT4zt+rn
 8w2tmZBSFRTkTDAOozf3Jd6io/i7nZY5gmFLkUqPN4n8O8m11qwB0gzU2rGgaHke28bQ
 0stYAfUlmmG8yK/yoMEyruAe9Qj2NIYcFBEqJX66Rv8uuGGHA2SIc2Jv72eyxno+bGEo
 6SvA==
X-Gm-Message-State: AO0yUKVfWSRLroS8nYag/Qeo/tZusq5SCnHLtHXbHpt9PHzB3PUTx5dY
 MCWTMBIq5zzg4PeqJlJ6dhzmSg==
X-Google-Smtp-Source: AK7set+mN12nK9BsCVmaJszp7DjSQDPhXcpRGPzY3pHlpK5BZUjB10ilG4HBqmkTZJJ2TRLc0Njftg==
X-Received: by 2002:a05:600c:45d2:b0:3eb:42fa:39d5 with SMTP id
 s18-20020a05600c45d200b003eb42fa39d5mr14542416wmo.29.1678221546131; 
 Tue, 07 Mar 2023 12:39:06 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003dc49e0132asm19592851wmo.1.2023.03.07.12.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 12:39:05 -0800 (PST)
Message-ID: <297beda7-cc88-778f-1ccd-5725501a7cf3@linaro.org>
Date: Tue, 7 Mar 2023 21:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 5/6] hmp: convert handle_hmp_command() to
 AIO_WAIT_WHILE_UNLOCKED()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-6-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230301205801.2453491-6-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 1/3/23 21:58, Stefan Hajnoczi wrote:
> The HMP monitor runs in the main loop thread. Calling
> AIO_WAIT_WHILE(qemu_get_aio_context(), ...) from the main loop thread is
> equivalent to AIO_WAIT_WHILE_UNLOCKED(NULL, ...) because neither unlocks
> the AioContext and the latter's assertion that we're in the main loop
> succeeds.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   monitor/hmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

