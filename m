Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AEE3F27A4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 09:29:37 +0200 (CEST)
Received: from localhost ([::1]:38020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGyy8-0008Vg-64
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 03:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGyxK-0007f9-3d; Fri, 20 Aug 2021 03:28:46 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGyxI-0001Ig-Iy; Fri, 20 Aug 2021 03:28:45 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso5465022wms.2; 
 Fri, 20 Aug 2021 00:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lug1M/grON218hbYjGNPH3zNQCPUIKS7vf+GlBmNk5I=;
 b=JbB/e6E+3igeE23Fc1A3ZbBllfrLIALtTYWYM94styQnZXUS1tL/Ownsvdi5A+Pt8C
 ubEatINMmiT8uYW+8YdDuxzh6v3bcmJrl4rk9yNcFxMWGJ+Lr3iA606ajUg5FmZU8zNj
 94TxI065id3EnM3QVPORQr+RB4pd7I35a7MMlFie6AT3D4CyaaJBRgx01ABH/ImmkkHX
 xkyC6peTRr+PQ+AsECPp3wHitluhS3T3ynBW342+priQ9pAE2v90odA50NGI8rCww6eE
 7pGsAagMHNBnhyadA4n8h71Nv5sg5nUPWpZQoTlGpVOfWMTE8jHOpwUQbR+hM7L8wMjn
 dpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lug1M/grON218hbYjGNPH3zNQCPUIKS7vf+GlBmNk5I=;
 b=VOJOF6xVfYYobELkPSHsFiKOH3L8W/+LXikAE3vPZylEQZP4Iq+PDJKAJo/EeH0Iut
 C38AAga0U/bgERmPqtQ8EMPyxDJhuF4ktS5mmrDp8Pa7SRNyqp6z2ZyEgZpz6Vu9hWwd
 6D3wnmo6LUgRaJkXiHvzw5VP7181p/HbPxZ+lsqqqMCAO6tK6oPa6cdiTe97ytupmx2r
 VdDe1p/+Hoztv1WluGw0whD6tT8aftMT2yzq6iiKkUJVt8kXu3s22IW3XWQzqYNoYYKf
 7/OC8X49blNnzqeWp8DihbA+8KkY/EZF5JAWxXDW82cv9g+ZsKQrX0dpuDAfjr/+oomC
 BaeA==
X-Gm-Message-State: AOAM531rFAzwiPvVhhjoYkP1ne3mwRqRw40+628cGNoc4CkVbMbu4ZMD
 7PiMh5pwJTysL/CfOVmZvck=
X-Google-Smtp-Source: ABdhPJy3SMbBtSLTDBBUr9jACyTVQHwsp8wvK1qLSqY1ErVbLRjZcC4KmaEhO3zTCXySgyPL2ltHWA==
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr2433810wmq.47.1629444522284; 
 Fri, 20 Aug 2021 00:28:42 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l18sm11223119wmc.30.2021.08.20.00.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 00:28:40 -0700 (PDT)
Subject: Re: [PATCH 4/7] hw/adc: Make adci[*] R/W in NPCM7XX ADC
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org,
 Thomas Huth <thuth@redhat.com>
References: <20210813233353.2099459-1-wuhaotsh@google.com>
 <20210813233353.2099459-5-wuhaotsh@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6c188624-ea14-b85c-65af-83a36e2f83d7@amsat.org>
Date: Fri, 20 Aug 2021 09:28:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813233353.2099459-5-wuhaotsh@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.591,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: minyard@acm.org, titusr@google.com, venture@google.com,
 qemu-devel@nongnu.org, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/14/21 1:33 AM, Hao Wu wrote:
> Our sensor test requires both reading and writing from a sensor's
> QOM property. So we need to make the input of ADC module R/W instead
> of read only for that to work.
> 
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>
> ---
>  hw/adc/npcm7xx_adc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
> index 47fb9e5f74..bc6f3f55e6 100644
> --- a/hw/adc/npcm7xx_adc.c
> +++ b/hw/adc/npcm7xx_adc.c
> @@ -242,7 +242,7 @@ static void npcm7xx_adc_init(Object *obj)
>  
>      for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
>          object_property_add_uint32_ptr(obj, "adci[*]",
> -                &s->adci[i], OBJ_PROP_FLAG_WRITE);
> +                &s->adci[i], OBJ_PROP_FLAG_READWRITE);

What about:

  qtest_enabled() ? OBJ_PROP_FLAG_READWRITE : OBJ_PROP_FLAG_WRITE

>      }
>      object_property_add_uint32_ptr(obj, "vref",
>              &s->vref, OBJ_PROP_FLAG_WRITE);
> 


