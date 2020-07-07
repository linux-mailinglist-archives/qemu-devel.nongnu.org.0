Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE90421745A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 18:45:46 +0200 (CEST)
Received: from localhost ([::1]:59124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsqj3-0007oM-Gg
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 12:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jsqYK-0004uq-GN
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:34:40 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jsqYJ-0003lF-02
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:34:40 -0400
Received: by mail-pg1-x541.google.com with SMTP id g67so19354542pgc.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 09:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mjYd0gJz8iVBt1gb6ZA7YIWw+DBjjx2ythRjtbxTICQ=;
 b=xlTHhQygkFuBH5CSinGWJq0b4VD/i9rgcB1Gpvfq/meY7wMkJLrs/kAUT34RfULodD
 JHKnSyvNdm8mEhDlc0jp4UQQmBObbR5QCI1U3e0qRPWYOV03GZTsdPnrQo9LM4AoTvwD
 rVgVvhpF/P7fVAM7UsEryXPLWy7ZfX9l+vVHO3DtDrr8Haouuj70wLpIFIJeunW0Ue6i
 qof/BQLTPFzhf4rDJXdpKLDzKSzxdmyKoW0luNu24kpxMUEvBRDtcVY6GZWyl4H8nwp+
 +bDogXblnDepPdk0gHjuw3DUJ+usRvM6Du/nXMW70vSHsh9pCmampQGw4eECJEeddUdH
 pBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mjYd0gJz8iVBt1gb6ZA7YIWw+DBjjx2ythRjtbxTICQ=;
 b=Skx9ZW277NghRo/JRxlAeao300NtnAdvdc9vHYo055kOVE99HJlB/foPmtdn5vRcyZ
 1SUaFiKJHph6VFLZ/r/B5TGFWFZh3gvk8tdIYrLEELYm6uTdTClGkIJkVNNCIp8hG5je
 gxISSGKAgj6dZRilaD//Eh49kuNs5+gIu8a3zqMchtqRn+oCyOt9q1toSOyPWmqC1QyT
 a1mHvk8pS/qOMG37boBe34QvDq7huSvJKBgTCnQeV4gY65izpHqaFBrVUhyNjOgaGLrU
 d7XiWa/gSZq/ieHLnvG8N/ddg/iZHqU7ai68viss69HTSSKbxFwJkQGYQzEQMgxGIwvY
 t5fQ==
X-Gm-Message-State: AOAM532+nfS078TWFdgsD87RXXha4EoSiylByEDG1yI/JfHS8/iWmkAo
 6A+GXyCbPmEwidCiVJd4VFEaAA==
X-Google-Smtp-Source: ABdhPJwICg4Ips8/L7TqHYx/i415di0iAaId1sDHQbqo4l2xMQJ69iiFKLzz6/BsSG3klkw/lt3lNA==
X-Received: by 2002:a05:6a00:10:: with SMTP id
 h16mr47840935pfk.214.1594139677647; 
 Tue, 07 Jul 2020 09:34:37 -0700 (PDT)
Received: from [192.168.149.206] (097-090-106-114.biz.spectrum.com.
 [97.90.106.114])
 by smtp.gmail.com with ESMTPSA id n7sm2916239pjq.22.2020.07.07.09.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 09:34:36 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] target/avr/cpu: Drop tlb_flush() in avr_cpu_reset()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200707070021.10031-1-f4bug@amsat.org>
 <20200707070021.10031-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <edaa725c-7bf3-cb22-5155-f04afb81f647@linaro.org>
Date: Tue, 7 Jul 2020 09:34:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707070021.10031-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, Michael Rolnik <mrolnik@gmail.com>,
 Sarah Harris <S.E.Harris@kent.ac.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/20 12:00 AM, Philippe Mathieu-Daudé wrote:
> Since commit 1f5c00cfdb tlb_flush() is called from cpu_common_reset().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/avr/cpu.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

