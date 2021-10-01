Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1D441EE40
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 15:07:54 +0200 (CEST)
Received: from localhost ([::1]:51852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWIGX-00039P-2E
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 09:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mWIDG-0000IL-T0; Fri, 01 Oct 2021 09:04:32 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:33698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mWIDE-0002rv-HD; Fri, 01 Oct 2021 09:04:30 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 d12-20020a05683025cc00b0054d8486c6b8so11448890otu.0; 
 Fri, 01 Oct 2021 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1pEjhzod8KyDXjZmqcJnYQWCNQss8/wgABk2YIvtLRY=;
 b=QCeo3rzey7an0e625o5biBzt/Dx4XqWT6VX49TWSMyy+cZ/IRx5hsmi3KwrE3ryexg
 RXl4rD5sb+JD/5d6J1dEhS5hgAgtAia9I7TTwLdxMWmCHk6AJKBChHFMlBfGNLfspT4/
 jUAXzLso+xV9kwKPpAtqoV1w2cyQ+Ke1QQZEIbCmDlAKttBjIyUO1JXtOTcFtDB9adhe
 rdxsN0x9a9Swm45XAHbsDOs/KMhJ9UPE2ZNwkZKpkkT/qYVR1BO2LLRMsAZ9bX6e+R7R
 b21oaaEMXsMOjfb6ogtgSlB0VIluLx/hwaXywRrmtgWp3suew/7wX7G3Tk8mW/GkVWVe
 kgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=1pEjhzod8KyDXjZmqcJnYQWCNQss8/wgABk2YIvtLRY=;
 b=I9rRY/Y9T8xWD/OY/fCbC7gN4erH8fGdUgIYXddb00P8Dx3QklNnc6XLzKLZJlK7Ko
 /QFxWidg21eC+mT2zxRaSAOh1xNHWPT8ppx/J5XOaHbK78OLqqewi9wgn4kTy9tE5CB3
 +8SEJSqDAh4EXt/U8C50TqJHc4PbbDGss/TspRrsjR9xNsQyt4PG4Vn+zTYYcN8nagTN
 flBmZAK92lixBmq4Ac4T8AnPkTCTKIakYM6xzU1JL6zPGe0IDsW/uxwZNb4HVf4zVCK3
 jr/KH1YzU2IDRITCBHlaLPe+mbcn/3Nl1QvXs5A/gg81r1T73eIbVodfJaPIMkGpLxlT
 /ztQ==
X-Gm-Message-State: AOAM533AvFmz7CKmtGch6Yj+Ge0tKdwGwU78rpiW7GjcccmLCIiFHbsA
 6YX8a/v3eyc83O8ZkL83xDY=
X-Google-Smtp-Source: ABdhPJxEva5SIHYceATrGNRkkQBkGXBRAxilzFovP24tekb/3hQ/fDYdnlILUxDiZTnnS+RO1PRfUg==
X-Received: by 2002:a9d:67cf:: with SMTP id c15mr10286049otn.232.1633093465962; 
 Fri, 01 Oct 2021 06:04:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 bf15sm1247344oib.4.2021.10.01.06.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 06:04:25 -0700 (PDT)
Date: Fri, 1 Oct 2021 06:04:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
Message-ID: <20211001130423.GA549865@roeck-us.net>
References: <e08467c0-bd69-81d3-93d3-13b8fc812453@roeck-us.net>
 <CAEUhbmX9JxE+VxSL8BWGd_XKD-WJ0r5d5MKsbdVgPiJkZd5Y3w@mail.gmail.com>
 <CAEUhbmVfFRdbtu7yWUauO6sd0QNhoH6tuTAFA2PMxZp5P7+awA@mail.gmail.com>
 <PH0PR11MB5205AE78D6C5DFFFA767183B97D49@PH0PR11MB5205.namprd11.prod.outlook.com>
 <8b86d434-a2e6-8122-0a88-dc9a15fbfe87@roeck-us.net>
 <PH0PR11MB5205684F9CDEC890187D09D997DC9@PH0PR11MB5205.namprd11.prod.outlook.com>
 <20210916142140.GA252836@roeck-us.net>
 <PH0PR11MB52058E0462672E61797758B997DE9@PH0PR11MB5205.namprd11.prod.outlook.com>
 <2cd83a88-952c-6f86-74b2-8c0da3ce4394@roeck-us.net>
 <CAEUhbmVVjXKUxa95+GPPZSU5=isgTs7EMnN7gxgYn9Lkg+a0Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmVVjXKUxa95+GPPZSU5=isgTs7EMnN7gxgYn9Lkg+a0Xg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Cheng,
 Xuzhou" <Xuzhou.Cheng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 26, 2021 at 10:49:53AM +0800, Bin Meng wrote:
> On Sat, Sep 18, 2021 at 12:19 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 9/17/21 8:09 PM, Cheng, Xuzhou wrote:
> > >>> I got some free time in the past days to investigate this issue. Guenter is right, the Linux imx-spi driver does not work on QEMU.
> > >>>
> > >>> The reason is that the state of m25p80 machine loops in STATE_READING_DATA state after receiving RDSR command, the new command is ignored. Before sending a new command, the CS line should be pulled to high, this make the state of m25p80 back to IDLE.
> > >>>
> > >>> I have same point with Guenter, it's that set CS to 1 when burst is zero. But i don't think it is necessary to set CS to 0 in imx_spi_flush_txfifo(). I will send a new patch to fix this issue.
> > >>>
> > >>
> > >> Thanks a lot for looking into this. If you have a better solution than mine, by all means, please go for it. As I mentioned in my patch, I didn't really like it, but I was unable to find a better solution.
> > > I am doing some experiment to verify that the new patch is reasonable, so the new patch will be delayed few days.
> > >
> >
> > No problem. Note that I'll be traveling for the next 2-3 weeks, and I won't be able
> > to test any patches during that time.
> >
> 
> I have some updates to share, as I have been working with Xuzhou
> internally on this issue for the past days:
> 
> Current mods using BURST_LEN to determine the timing to pull up the CS
> line in the SPI controller codes is a workaround. Hardware does not do
> this. To understand what real hardware behavior is, Xuzhou used an
> oscilloscope to verify our guess.
> 
> It turns out the root cause is elsewhere, and a proper fix will be
> sent out soon.
> 

Thanks a lot for tracking this down!

Guenter

