Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C555F4EE2AD
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:33:28 +0200 (CEST)
Received: from localhost ([::1]:44452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na1Tz-0001Ok-F0
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:33:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1na1Sm-0008Gj-2A; Thu, 31 Mar 2022 16:32:12 -0400
Received: from [2607:f8b0:4864:20::834] (port=33373
 helo=mail-qt1-x834.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1na1Sk-0005Aa-74; Thu, 31 Mar 2022 16:32:11 -0400
Received: by mail-qt1-x834.google.com with SMTP id j21so598928qta.0;
 Thu, 31 Mar 2022 13:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nl5e0fxpsL4MTjnT+Zd53YfG71EHDi7SmrUrPKMLhZM=;
 b=hb5voKYF4KMRM0CuO+WxvBvTuDBXfpZCpvaSQqgNeRQJGcU8b3f1oSn7X/JOxMPD18
 XouPpBuc7Jxb2ty+Yafxxx1Ef+xsmROR/PiFkhEvJOT2DW4+lBhIrvknd9gKXMeoB+F9
 FTlhgzMeYPgKCpZtnnrkT0ct76sOptQzXYrYAlX0QUxvU1iwLjjTH0f40xFXTmOh6YwP
 Qn6Ij8N1nYDoaSZMW3raFPIZjvUEMaRuoZpgM1xt0YU65qCHtoQzus8dF7vfEwyBya8B
 j6gkFdltIvdEiAbpWS/FoKT7ImswZ0zFBlOCawsUfjk8CeDtnao8RcBh/MMwyPeVYhEy
 XqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=Nl5e0fxpsL4MTjnT+Zd53YfG71EHDi7SmrUrPKMLhZM=;
 b=ehh5PTtcjl+yZbTKFSrBhVUgSdKlmcLmXogetM8H9nzNraZBp9r/DzJaRGOyibxJDu
 6V/zTipwAboM4nmCXXYPjn9txEizUdh9/mfrgETv3bijrc3W4Kw/Wi7N+CiPqzIIO3K9
 PSyB/1rIAw5Vs5sm/tU2seHzNGbVktYYLG4CLmKiRAelYB5pmo3HeA78SxsdKEiYwelU
 50scEPLrixocBrT/hKGcax+UocpvlRelvY60SwZ8CmvkjWLCnpN9qDC1sWkydGGASlKJ
 t1/bThv1jHEhbkMZGCEAtk/MwJAZT1dfswI7uTYeh+EF3kLoQ92hw1o9aAUQTQTTZBTu
 X85A==
X-Gm-Message-State: AOAM531X43RowaV35CJkQPo491jb5B+FlY+VgMA2bAwyHDBfdK1W5rJj
 I8/bzM2slj8L4JCI/UPQdw==
X-Google-Smtp-Source: ABdhPJxitRfuG77aabKrPP8Y5rDYbINnZUBxiKmAMz0LupvoFuwmEushO+sap0ir2vcra2tN4rwCVQ==
X-Received: by 2002:ac8:7f4d:0:b0:2e1:f94c:32a8 with SMTP id
 g13-20020ac87f4d000000b002e1f94c32a8mr5887035qtk.663.1648758728236; 
 Thu, 31 Mar 2022 13:32:08 -0700 (PDT)
Received: from serve.minyard.net ([47.184.144.75])
 by smtp.gmail.com with ESMTPSA id
 z28-20020a05620a101c00b0067d940a74b2sm190469qkj.39.2022.03.31.13.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 13:32:07 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:98f0:b829:5463:c3ea])
 by serve.minyard.net (Postfix) with ESMTPSA id BDD4A1800BB;
 Thu, 31 Mar 2022 20:32:06 +0000 (UTC)
Date: Thu, 31 Mar 2022 15:32:05 -0500
From: Corey Minyard <minyard@acm.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Message-ID: <20220331203205.GB29333@minyard.net>
References: <20220331165737.1073520-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331165737.1073520-1-its@irrelevant.dk>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::834
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Jeremy Kerr <jk@ozlabs.org>, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 06:57:33PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Hi all,
> 
> This RFC series adds I2C "slave mode" support for the Aspeed I2C
> controller as well as the necessary infrastructure in the i2c core to
> support this.

I've been wondering when this would happen :).  I had put some thought
into how this would work, but hadn't come up with anything good.

The big disadvantage of this is you are adding an interface that is
incompatible with the current masters and slaves.  So you are using the
same I2C bus, but slaves written this way cannot talk to existing
masters, and masters written this way cannot talk to existing slave.
You could adapt the masters to be able to work either way, and I suppose
some slaves that could do it could have both an async send and a normal
send.  But you could not adapt a slave device for the Aspeed to do both.

But that said, I don't know of a better way to handle this.

You don't have the ability to nack a byte in what you have currently.
That's probably something that will be needed.

This is obviously not something useful by itself.  How do you plan to
tie this in to something else that would use it?

-corey

> 
> Background
> ~~~~~~~~~~
> We are working on an emulated NVM Express Management Interface[1] for
> testing and validation purposes. NVMe-MI is based on the MCTP
> protocol[2] which may use a variety of underlying transports. The one we
> are interested in is I2C[3].
> 
> The first general trickery here is that all MCTP transactions are based
> on the SMBus Block Write bus protocol[4]. This means that the slave must
> be able to master the bus to communicate. As you know, hw/i2c/core.c
> currently does not support this use case.
> 
> The second issue is how to interact with these mastering devices. Jeremy
> and Matt (CC'ed) have been working on an MCTP stack for the Linux Kernel
> (already upstream) and an I2C binding driver[5] is currently under
> review. This binding driver relies on I2C slave mode support in the I2C
> controller.
> 
> This series
> ~~~~~~~~~~~
> Patch 1 adds support for multiple masters in the i2c core, allowing
> slaves to master the bus and safely issue i2c_send/recv(). Patch 2 adds
> an asynchronous send i2c_send_async(I2CBus *, uint8) on the bus that
> must be paired with an explicit ack using i2c_ack(I2CBus *).
> 
> Patch 3 adds the slave mode functionality to the emulated Aspeed I2C
> controller. The implementation is probably buggy since I had to rely on
> the implementation of the kernel driver to reverse engineer the behavior
> of the controller slave mode (I do not have access to a spec sheet for
> the Aspeed, but maybe someone can help me out with that?).
> 
> Finally, patch 4 adds an example device using this new API. The device
> is a simple "echo" device that upon being sent a set of bytes uses the
> first byte as the address of the slave to echo to.
> 
> With this combined I am able to boot up Linux on an emulated Aspeed 2600
> evaluation board and have the i2c echo device write into a Linux slave
> EEPROM. Assuming the echo device is on address 0x42:
> 
>   # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device
>   i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64
>   # i2cset -y 15 0x42 0x64 0x00 0xaa i
>   # hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom
>   0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
>   0000010 ffff ffff ffff ffff ffff ffff ffff ffff
>   *
>   0000100
> 
>   [1]: https://nvmexpress.org/developers/nvme-mi-specification/
>   [2]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0236_1.3.1.pdf
>   [3]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0237_1.2.0.pdf
>   [4]: http://www.smbus.org/specs/SMBus_3_1_20180319.pdf
>   [5]: https://lore.kernel.org/linux-i2c/20220218055106.1944485-1-matt@codeconstruct.com.au/
> 
> Klaus Jensen (4):
>   hw/i2c: support multiple masters
>   hw/i2c: add async send
>   hw/i2c: add slave mode for aspeed_i2c
>   hw/misc: add a toy i2c echo device
> 
>  hw/i2c/aspeed_i2c.c         |  95 +++++++++++++++++++++---
>  hw/i2c/core.c               |  57 +++++++++++++-
>  hw/i2c/trace-events         |   2 +-
>  hw/misc/i2c-echo.c          | 144 ++++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build         |   2 +
>  include/hw/i2c/aspeed_i2c.h |   8 ++
>  include/hw/i2c/i2c.h        |  19 +++++
>  7 files changed, 316 insertions(+), 11 deletions(-)
>  create mode 100644 hw/misc/i2c-echo.c
> 
> -- 
> 2.35.1
> 
> 

