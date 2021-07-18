Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3443CCA37
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 20:04:50 +0200 (CEST)
Received: from localhost ([::1]:42550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5B9l-0000yX-L9
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 14:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1m5B8a-00085g-SG
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 14:03:36 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:45044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1m5B8X-0001Ch-Gr
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 14:03:36 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 59-20020a9d0ac10000b0290462f0ab0800so15767857otq.11
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 11:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=xadwYxR2IePiBRt5JXNPxCw4GSrshhdRqjFf9mNBH1U=;
 b=AoP26fYNWMOBTDH+dXB8Icr4+t48bdqI/LX8RWbyUGgfEkvd0g3rb1GoIE4H1pOHpj
 nLCRqubjaVkAGjV1szQWUz+Wi+eEqySdCZf1JbUzrWI466ZzST+O5OwCufK5enIp98rR
 j/zckWEMGGBXQsy56I4BqOOeiNGX6/cDp4UrxI83PQKshE08n27oOgm3KDCg/xWCsv10
 J/Vc2Zn3heVkolUSDCb3tuyxh5tdt0lTLL5B3XoBVOymVboE6piZpTr2JI33QPjD96BE
 vaLulj9eUWyYUy4MljA7s83wphFzZ48p3jHahA9N23uF4nWXLvmgy3uOR4xYKvgFGz76
 r9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=xadwYxR2IePiBRt5JXNPxCw4GSrshhdRqjFf9mNBH1U=;
 b=kAbSrGbsSARjNf1R6lTIKhB+aRsg+zZhp9bQLpG+FPWbWSh77EhrMxK+UCDVjiPyHf
 q5JLadYoUtIHi9tWzPSEVxRi9Ekx9JrBL6h4Bgj4wdveqLgCFzqVi2wOk+p2HdqcXh8V
 Dmv6QvDa1ufz8TLQej5dLTIksMLs1mUKRpPoVVtdNnB7nriGbC/m6MthL0RvlUA+fVKl
 DPmKWN19WdL4myvIFPcu6zG5Inf3SbOi7HKd5rmwk3PrxTVRdO3mI5brMqMszV+oaNpg
 o9WW8UbPBRfOWjzNJqh7+T2r9z3qu5P6XQmoCEfLzn6M6h+pn6vxEQ4kVoxDLuiXhXFr
 UEvg==
X-Gm-Message-State: AOAM532KdaQ59IaVh5UxJC5AAKpTn6LWOxnwDR9qo/0riyM0PHFF9F80
 7ZXZ6wyzACozO/D5kR+CqUDGcw==
X-Google-Smtp-Source: ABdhPJyfkAcfrCTGjl4Md/5K21ze/pbwBX5ikhUc+h4mgqI4vUPt/KE59bXMrEyo5AOpIhMGiKDUQg==
X-Received: by 2002:a05:6830:2316:: with SMTP id
 u22mr16327895ote.90.1626631411577; 
 Sun, 18 Jul 2021 11:03:31 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:eca1:19bc:6b34:7e36])
 by smtp.gmail.com with ESMTPSA id h15sm2969776ote.39.2021.07.18.11.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 11:03:31 -0700 (PDT)
Date: Sun, 18 Jul 2021 13:03:29 -0500
From: Corey Minyard <cminyard@mvista.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 2/2] i2c/smbus_eeprom: Add feature bit to SPD data
Message-ID: <20210718180329.GM3431@minyard.net>
References: <cover.1626367844.git.balaton@eik.bme.hu>
 <19d42ade295d5297aa624a9eb757b8df18cf64d6.1626367844.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19d42ade295d5297aa624a9eb757b8df18cf64d6.1626367844.git.balaton@eik.bme.hu>
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=cminyard@mvista.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: f4bug@amsat.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 15, 2021 at 06:50:44PM +0200, BALATON Zoltan wrote:
> Add the differential clock input feature bit to the generated SPD
> data. Most guests don't seem to care but pegasos2 firmware version 1.2
> checks for this bit and stops with unsupported module type error if
> it's not present. Since this feature is likely present on real memory
> modules add it in the general code rather than patching the generated
> SPD data in pegasos2 board only.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

I checked this all out and it looks correct to me.  I can take it in my
tree, if necessary.  Feature freeze is in two days, so probably not for
6.1, though it could be pushed into there if its needed in 6.1.

Or:

Acked-by: Corey Minyard <cminyard@mvista.com>

if someone else wants to take it.  This particular code really doesn't
belong in eeprom.c, I don't think, but I'm not sure where else to put
it.  And I can look in the SPD tables as well as anyone :).

corey

> ---
> I've tested it with the firmware of pegasos2, sam460ex, fuloong2e and
> g3beige (latter is not upstream yet) that are the only ones using this
> function currently. Probably this could go in via PPC tree with my
> other pegasos2 fix if respective maitainers ack this patch.
> 
>  hw/i2c/smbus_eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
> index 4d2bf99207..12c5741f38 100644
> --- a/hw/i2c/smbus_eeprom.c
> +++ b/hw/i2c/smbus_eeprom.c
> @@ -276,7 +276,7 @@ uint8_t *spd_data_generate(enum sdram_type type, ram_addr_t ram_size)
>      spd[18] = 12;   /* ~CAS latencies supported */
>      spd[19] = (type == DDR2 ? 0 : 1); /* reserved / ~CS latencies supported */
>      spd[20] = 2;    /* DIMM type / ~WE latencies */
> -                    /* module features */
> +    spd[21] = (type < DDR2 ? 0x20 : 0); /* module features */
>                      /* memory chip features */
>      spd[23] = 0x12; /* clock cycle time @ medium CAS latency */
>                      /* data access time */
> -- 
> 2.21.4
> 

