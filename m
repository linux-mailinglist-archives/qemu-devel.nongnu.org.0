Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2447138FBFC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 09:50:55 +0200 (CEST)
Received: from localhost ([::1]:48878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llRq2-0006Z3-7F
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 03:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llRne-0004f8-Vu; Tue, 25 May 2021 03:48:26 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llRnd-0000GO-HT; Tue, 25 May 2021 03:48:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id p7so27354116wru.10;
 Tue, 25 May 2021 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FBHjsXO0z1azVZ65FN6XntwbN3YERIwZumL7PVTmfYI=;
 b=NMxqDHolf867IutGuUI/NHMsHStEqwRuGtBcWcXs6jkT37vDipA69apjQtnasx7lIr
 0WkUBtq9OmrJ6SW/0vgdgq5ghFd6LQaV30A2kE1iAQLNVWiK0vlZu2dzBaWVjT2Cp/tY
 WhmVdzU47hwaqi5vehbzTN/CPf0VZ+KMes1xv8hd0aOzQJs/jqnYkqP1SF4WdtRULCNj
 6qb1ytJ7HjiiJ2W1PpXiINjDrNhwJ0UvDLSQz6/L5DTfC6SmEoBjvXVdbxK4Y5Vd2yG8
 biz0JTG4yrG2WgElJRoq51gF9Z/g2BUcPQJpLU1yJDAE3rMLiqMw2gb281GjXqh6LpW8
 BEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FBHjsXO0z1azVZ65FN6XntwbN3YERIwZumL7PVTmfYI=;
 b=YjkEirIp3/m25BrY4CLdZ8d55d9SxEg49X7eu9FU2B4SbH3F3SV3PcG3llIA/+rkaj
 sCBXLiRpypK3slA71wDrd/m0jLCu3tPChR7+h2k5zB2ELjPGUgah4w/JoK3v13mmKH9D
 CE8G5vhB9B6/gaVuNXnsGyKdHU5mi0yYnpCFQCzJT/MYsymRVtb8r463R/bLi2Vi/bZb
 a1UVlDXYKef7WubMvixSJRlV/5sE/8uW2ZibalBO2BOr19gb7jqQl+Efp/SWw7XdFHrF
 RX8pnqu26/9g6bfxUgV060t22dxQGRYU+xISAxALffyyFU8QMf4stUo6SOsKsuwIA/WT
 wW1w==
X-Gm-Message-State: AOAM532S3gBS99igLfpsjVr2ZbYoMK591jcFAqEYMjg9dbF9TZ6rW79a
 Ouy9CPYPShn/8JIyeUd+eDSTtRAjebTYxA==
X-Google-Smtp-Source: ABdhPJwSEO5dSuoECN66mDHjng3XK98bFpjGw8dUGCp7VU/pLpmWKTIapBU/9DV1Jj9fpiDKtodMAw==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr25690808wrr.214.1621928903856; 
 Tue, 25 May 2021 00:48:23 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id w12sm14453683wrt.16.2021.05.25.00.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 00:48:23 -0700 (PDT)
Subject: Re: [PATCH] hw/input/ps2: Use ps2_raise_irq() instead of open coding
 it
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20210513171244.3940519-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5ee136e9-3d4b-058d-fcc4-cb56023ee230@amsat.org>
Date: Tue, 25 May 2021 09:48:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513171244.3940519-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping? (patch reviewed)

On 5/13/21 7:12 PM, Philippe Mathieu-Daudé wrote:
> Inspired-by: Volker Rümelin <vr_qemu@t-online.de>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/input/ps2.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> index 72cdb80ae1c..02d7e5da723 100644
> --- a/hw/input/ps2.c
> +++ b/hw/input/ps2.c
> @@ -213,7 +213,7 @@ void ps2_raise_irq(PS2State *s)
>  void ps2_queue(PS2State *s, int b)
>  {
>      ps2_queue_noirq(s, b);
> -    s->update_irq(s->update_arg, 1);
> +    ps2_raise_irq(s);
>  }
>  
>  void ps2_queue_2(PS2State *s, int b1, int b2)
> @@ -224,7 +224,7 @@ void ps2_queue_2(PS2State *s, int b1, int b2)
>  
>      ps2_queue_noirq(s, b1);
>      ps2_queue_noirq(s, b2);
> -    s->update_irq(s->update_arg, 1);
> +    ps2_raise_irq(s);
>  }
>  
>  void ps2_queue_3(PS2State *s, int b1, int b2, int b3)
> @@ -236,7 +236,7 @@ void ps2_queue_3(PS2State *s, int b1, int b2, int b3)
>      ps2_queue_noirq(s, b1);
>      ps2_queue_noirq(s, b2);
>      ps2_queue_noirq(s, b3);
> -    s->update_irq(s->update_arg, 1);
> +    ps2_raise_irq(s);
>  }
>  
>  void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)
> @@ -249,7 +249,7 @@ void ps2_queue_4(PS2State *s, int b1, int b2, int b3, int b4)
>      ps2_queue_noirq(s, b2);
>      ps2_queue_noirq(s, b3);
>      ps2_queue_noirq(s, b4);
> -    s->update_irq(s->update_arg, 1);
> +    ps2_raise_irq(s);
>  }
>  
>  /* keycode is the untranslated scancode in the current scancode set. */
> 

