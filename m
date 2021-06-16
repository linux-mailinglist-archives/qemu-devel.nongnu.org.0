Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22A73AA38C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:50:07 +0200 (CEST)
Received: from localhost ([::1]:47618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltabx-0000Fq-JW
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaTq-0002n8-6Q
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:41:38 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaTn-0003WJ-6g
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:41:37 -0400
Received: by mail-pl1-x635.google.com with SMTP id o21so1567565pll.6
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fWkoyrK4CXu0aepe8nYrhP8lrISgrviKpdrNqt4ahLs=;
 b=yQX0wq6VuRtyvApcGv52l6HsMqucpUCO3vTUofowaF8tcq3JBNt+wCDxtk+q8YdMmM
 g22fukt/sko8LIrwjlw5/12RDrSUKrTxFI/eUalmXBiUzeEsua5J5dUIAMUneCOiR9Dh
 ucPV+jMOrnW2REk33Q7NrCDXxDGxzynlZHeph1gb3d1x2YL1HjgE7eNbl10jO14Ac7s4
 Okxrjs6AxXee/frz5Ip3nGRzq+wc7atZRQTpUqqVJDQV/YPuwzXXAo8hjrhewroojKkp
 8gyKwS8e/JFnYR1umx9Z/GtMCm3Visl70f9hvbUScSNktCY31ch60X72NFWu2ieUYHDi
 f8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fWkoyrK4CXu0aepe8nYrhP8lrISgrviKpdrNqt4ahLs=;
 b=aDFrksj8zjKMkrf92ZLO01TJnAGTsOFTxOU52mz+1kmuCqKcEAErCCJ563oEZdx2Ty
 tSG9Hmq5TbM6iqYgDPK1+YEnu2WupuKGw1ar5lv2naZMcYBiESIFUcvbwEjil4I8GDCa
 kt/jwGoZuBHgToaysGRTPWRY6qgxhOU2vVS0p9mAJO3q5Sh+OwW/zp0fCbbmaaGkKFXz
 fPEZzIw1vP9sp/rPlZhSph0KPOtOk0NT1Tkj9Do4VPDQWUdIDohfyFGTQExoziD2fBrq
 UaIcyenWHJh14L4fNMrau8/2Byhq8G+yby2z2e3YCRaXHt/TuftNkiYtW2+vnFfBJvYM
 sJAw==
X-Gm-Message-State: AOAM533kxiCltBbBdB1dLsQAdKhhdsw/l9KBpSbW/oNauNka55prkzWR
 V3O+xgoFcT/3N5fUjj0uWs9Ky0ylem37vQ==
X-Google-Smtp-Source: ABdhPJwHebkaS96RQ5Q5F2Pg0WIRcLOmOGPEzj8BVkWlSdesYw5eVxx6UAwuSCv4tVxhAQlHP1DE2w==
X-Received: by 2002:a17:90b:f84:: with SMTP id
 ft4mr12630257pjb.104.1623868893767; 
 Wed, 16 Jun 2021 11:41:33 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c207sm2788547pfb.86.2021.06.16.11.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:41:33 -0700 (PDT)
Subject: Re: [PATCH v3 07/13] hw/misc/auxbus: Fix MOT/classic I2C mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdae4eb4-d6b0-0d09-a0c2-08875952601c@linaro.org>
Date: Wed, 16 Jun 2021 11:41:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> Since its introduction in commit 6fc7f77fd2 i2c_start_transfer()
> uses incorrectly the direction of the transfer (the last argument
> is called 'is_recv'). Fix by inverting the argument, we now have
> is_recv = !is_write.
> 
> Fixes: 6fc7f77fd2 ("introduce aux-bus")
> Reported-by: BALATON Zoltan<balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/misc/auxbus.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

