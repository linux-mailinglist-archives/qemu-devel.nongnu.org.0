Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA0135473F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 21:59:56 +0200 (CEST)
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTVO6-0006if-QJ
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 15:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lTVMy-00064k-UD
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 15:58:44 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:33440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1lTVMs-0004X3-L6
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 15:58:44 -0400
Received: by mail-oi1-x229.google.com with SMTP id w70so12786102oie.0
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=/IugjbICpfQcKtT7503fgZpKtCUS1q/Qdia330voPx4=;
 b=Pq3soCOhVWbhdHZ208e7Tv7wVA11dd1yYMqV8cYJSbAAIhN8DrI/kvj5uqDNn9/AXM
 Kdf8Ya2THYcQsIhI5YRBm4ge0Rgg56MpYnArqEtelhHtpi1mU/b1W04UyUSs2GS23L1e
 Mmxwdrgt6QFKitGooH33n+SrSmVEjVL6ZEHIjn/hIjsIBmw5/3cJ8QwRbCsaXUlkN0nm
 +/dMSZM5+OQo2tlUnovlrLaIVYFif8+jFdb/LCdB3N3xnxFZq9QC/eOVxEYCSyjVZwoY
 J3GJ2EkinpDEmgiM7ABKaTcmpJR3HgsiaU1ZEQns0P7JxOizxdMnP+w2lBC+37j5JIAn
 P44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=/IugjbICpfQcKtT7503fgZpKtCUS1q/Qdia330voPx4=;
 b=jv6y/OCRb1D7WTTLnkVDamnZKS5GJ1cuLZc7pbS3jy1mg1A8XXqGLUPPR19mHY16Wr
 548zApNmBvRfKG3XyQGwa+PB+wY+CCg7tLnYTPmdVlq6V0/eCGhVoNj8ehUalxHts50F
 E+Xs81Zia6M9BlurKm8IJ86Nre4bZUeJ4c5G2mYETfTMo9LtQPfPAVrlKKvQxC9tbWOA
 KDF6KCQRTPd4bPS2Ei5wF18VGR5L4HI9zTQYM+iDf+2DEv++LuFSnKWODNtjvjyhwHM9
 UwxGIMNqxM2paUNx07Gg4BlGAdqXIPKmMRVAZ6/L3hdjsC1lO2e3pVnahZsP9r95vsI1
 rQ3w==
X-Gm-Message-State: AOAM5320FVS0EFHwXRzK+hDncUSWSaTNrfZPCl9gYcUK86WK+9vC6H6n
 3kdUKkRLFRgK3wwNXTzYIrGUHw==
X-Google-Smtp-Source: ABdhPJx57AJX8TfuTOjOmJ6PKbNJDV8UKo0ROFyDHUv7h8lIRXvVmI33eGPH02pqVGUUFWEtRxRIZg==
X-Received: by 2002:aca:d4d1:: with SMTP id l200mr552925oig.119.1617652716565; 
 Mon, 05 Apr 2021 12:58:36 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:8492:1f61:a64c:bf6d])
 by smtp.gmail.com with ESMTPSA id p22sm4322446otf.25.2021.04.05.12.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 12:58:36 -0700 (PDT)
Date: Mon, 5 Apr 2021 14:58:34 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH 0/2] hw/i2c: Adds pca954x i2c mux switch device
Message-ID: <20210405195834.GF7167@minyard.net>
References: <20210403222810.3481372-1-venture@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210403222810.3481372-1-venture@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=cminyard@mvista.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: wuhaotsh@google.com, qemu-arm@nongnu.org, hskinnemoen@google.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 03, 2021 at 03:28:08PM -0700, Patrick Venture wrote:
> The i2c mux device pca954x implements two devices:
>  - the pca9546 and pca9548.
> 
> Patrick Venture (2):
>   hw/i2c/core: add reachable state boolean
>   hw/i2c: add pca954x i2c-mux switch

Looking this over, the code looks good, but I have a few general
questions:

* Can you register the same slave address on different channels?  That's
  something you could do with real hardware and might be required at
  some time.  It looks like to me that you can't with this patch set,
  but maybe I'm missing something.

* Can you add devices to the secondary I2C busses on the mux using the
  standard QEMU device model, or is the function call required?

I ask because I did a pca9540 and pca9541 device, but I've never
submitted it because I didn't think it would ever be needed.  It takes a
different tack on the problem; it creates the secondary busses as
standard QEMU I2C busses and bridges them.  You can see it at

   github.com:cminyard/qemu.git master-i2c-rebase

If you design can do the things I ask, then it's better.  If not, then
I'm not sure.

-corey

> 
>  MAINTAINERS                      |   6 +
>  hw/i2c/Kconfig                   |   4 +
>  hw/i2c/core.c                    |   6 +
>  hw/i2c/i2c_mux_pca954x.c         | 182 +++++++++++++++++++++++++++++++
>  hw/i2c/meson.build               |   1 +
>  hw/i2c/trace-events              |   5 +
>  include/hw/i2c/i2c.h             |   3 +
>  include/hw/i2c/i2c_mux_pca954x.h |  60 ++++++++++
>  8 files changed, 267 insertions(+)
>  create mode 100644 hw/i2c/i2c_mux_pca954x.c
>  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> 
> -- 
> 2.31.0.208.g409f899ff0-goog
> 

