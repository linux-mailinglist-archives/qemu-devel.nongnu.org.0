Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DD136FCAA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:44:48 +0200 (CEST)
Received: from localhost ([::1]:38770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcUNq-0003gr-R3
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1lcUKs-0000I1-G0; Fri, 30 Apr 2021 10:41:42 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:46679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1lcUKq-0003yf-LO; Fri, 30 Apr 2021 10:41:42 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 k26-20020a4adfba0000b02901f992c7ec7bso2091312ook.13; 
 Fri, 30 Apr 2021 07:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eNTH4I8qBqt/u90sZvzopafrVlOwn/Hw03R4BYUX65g=;
 b=UNjAC56RqHknwaMiQn4m6Yeb9lwxSWZdKrX2NMq7LHCQppaZI9T3vQSIcbDHOp2/vA
 xLXPSFoILyGEckEvJcQEkXsRmy1Hvvc794yx+fjXDTTuMLu2PE+e1CU6ZmF+w3wbzIcS
 d16CFvaDEQV/WOqgOOTCnM6zbvQEFI0dRXoYE8UYuURaA1rHxIbjF4wN8RLRNvm3yHgC
 mE1DVhZ4FNtT30QymLYrsQqfrHPBfQtRkC4CVcjwUqnjHNhV7Q7fDa8cBG2vGzIicGAq
 BokO8QZ1MhnO5QifVx3KTpHfcEPEkRBTcLmKTHCyG0mnkRh2ZYYOQAz4cl8Ibg/OWh3q
 bZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=eNTH4I8qBqt/u90sZvzopafrVlOwn/Hw03R4BYUX65g=;
 b=gqPhF6l/aqSX0vv3lDS86F2j7Ys15oGgR2noXPO+MhpzgUhNf4eBsF8tDnhQnJnK6u
 sYxDu6CsRteU/6FZpdKyzGE1++Xcm+A/MN/tNHzNXc+OTLzubdVvZOEEU4i2WAJwdPQx
 zD4LeJFnWdxr+Qnc9LH7RzRs7Km0w6GN8TfvWEx5EG82P0gdKxIHBs2pxyoSTrTikJu0
 2zSQ+k6jw0vE9OpTgahddVV5ZPLtKXGE3f1dKTs+udTJ0BHIZ5Ev4lqJcHQ0iQUPK02F
 Vx1Nj1Kj2HlWw5tAm8nK6TL1pQMiJFjObPQEHPBxHeggZZKWuMMjtju4Q2TuI51p9WUZ
 xoJw==
X-Gm-Message-State: AOAM531KHN46XeEdUHnbN7fbzyhaYXUoS4xz8duorQD4jT55FyS5ow7g
 4AevrYtDbAD0Pcx0QTTx85w=
X-Google-Smtp-Source: ABdhPJwrEf8Nq0QpfOz4T+zwemm1nmqwlkx/yzLtEeklQLs/6Wl1ZfRX0X9nKGNb1mdPIOB4zlIFfQ==
X-Received: by 2002:a4a:9706:: with SMTP id u6mr4725656ooi.84.1619793698214;
 Fri, 30 Apr 2021 07:41:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id a11sm819550oif.52.2021.04.30.07.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 07:41:37 -0700 (PDT)
Date: Fri, 30 Apr 2021 07:41:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
Message-ID: <20210430144136.GA2880420@roeck-us.net>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
 <20210106063504.10841-4-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106063504.10841-4-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=groeck7@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org, Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present, when booting U-Boot on QEMU sabrelite, we see:
> 
>   Net:   Board Net Initialization Failed
>   No ethernet found.
> 
> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
> board, the Ethernet PHY is at address 6. Adjust this by updating the
> "fec-phy-num" property of the fsl_imx6 SoC object.
> 
> With this change, U-Boot sees the PHY but complains MAC address:
> 
>   Net:   using phy at 6
>   FEC [PRIME]
>   Error: FEC address not set.
> 
> This is due to U-Boot tries to read the MAC address from the fuse,
> which QEMU does not have any valid content filled in. However this
> does not prevent the Ethernet from working in QEMU. We just need to
> set up the MAC address later in the U-Boot command shell, by:
> 
>   => setenv ethaddr 00:11:22:33:44:55
> 

With this patch in place, the standard Ethernet interface no longer works when
booting sabrelite Linux images directly (without u-boot) using the following
qemu command.
	qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
	...

The Ethernet interface still instantiates, but packet transfer to the host
no longer works. Reverting this patch fixes the problem for me.

Is there a qemu command line parameter that is now necessary to instantiate
the Ethernet interface when booting Linux ?

Thanks,
Guenter

