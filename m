Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0D313A87
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:13:11 +0100 (CET)
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9A61-000495-Tz
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1l8zBc-0004HS-OA; Mon, 08 Feb 2021 00:34:12 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:34267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1l8zBb-0000Ue-3d; Mon, 08 Feb 2021 00:34:12 -0500
Received: by mail-io1-xd2d.google.com with SMTP id f67so11952147ioa.1;
 Sun, 07 Feb 2021 21:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=0Zp9BGGGXruyxeRvmMHs7JPbCXW8UY65W1DhaFEhqdc=;
 b=ItlMcX4WIK6IOZi7GelENDDJ+2AARxDid+F+WYHrWOLjQ5ZC3uO6le13GJmQNgZ0a8
 tqCrz0hhZWf1X4VMVMIJ7HDy/rkLlXL8kuDNwBrTeKn2dvczCzOyW3qnLknpfhOeI4Hx
 DTjGeT4YCKdeoX5TDnpjZ24jV1mIho4tpggDWiQvopnugW7kGlfLevXGp5zBy0j/5Q7D
 y/aDdUA59bp3bNVzN1w0tr7iFPp6GRPHzaXqMyN3PT72UEBlc7zpeblhs+zxdQxBGoBY
 CmcUVc7nNPgM2haVt5FbUaiWLbQWiCPBEbHJFitXSOFwY1lwKjQPEYJ7htgTU5m6IAHn
 IRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=0Zp9BGGGXruyxeRvmMHs7JPbCXW8UY65W1DhaFEhqdc=;
 b=g2H8FnIb5zgfl5F+t5hGPIFchMtWG03WVotlAJJtsmONPn79vQ6tEBqeYOLvYTQSqS
 /xzxpDaSbjlHFjgDva+JHUzgzgwJy9WHxHTIF4mWllSAONOL7PF4Tc68fw7lMe/vtWit
 XG9Hk9LEtqq2mLB0oIKHcguUN/cKtVTjoAcJTKySKdbbmkMdq4/NTEpXo/pzh0LgjpdY
 pq03S6217KqP6Keqw/afMQFBZrHkEAJ0X8XCzDWhNGqX/8kvaQZgNL5+QgV3wporUa9N
 x5bt+5m5Mbd1LEkJdk8T/QQXhtTi5dQr7WRrQ7of4JaI2216XgaSC491CIO8yN5p+nZP
 DwZQ==
X-Gm-Message-State: AOAM532js+vdGAJ4HVvBCc51xEwZzv4vtWwzuzOsYOIhENRfXkBhwKbo
 pFabIaGFyJTEzrTYttjS9Lc=
X-Google-Smtp-Source: ABdhPJxvYxk7XDXP0N8Mq9lfjm4gUW/YF9kG3DQhztqGGJVbEl3UUqJoY7mTOVoT8alliaUbCCcvGw==
X-Received: by 2002:a5d:8e06:: with SMTP id e6mr14249853iod.210.1612762449319; 
 Sun, 07 Feb 2021 21:34:09 -0800 (PST)
Received: from [127.0.0.1] (ec2-3-14-82-192.us-east-2.compute.amazonaws.com.
 [3.14.82.192])
 by smtp.gmail.com with ESMTPSA id b1sm1939234iob.42.2021.02.07.21.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 21:34:08 -0800 (PST)
Message-ID: <0b4b2fcdb148bf35cbffbd9cd40ce1b88f883f0c.camel@gmail.com>
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
From: schspa <schspa@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Laszlo Ersek <lersek@redhat.com>
Date: Mon, 08 Feb 2021 13:34:02 +0800
In-Reply-To: <20210205140807.GH477672@toto>
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
 <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
 <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
 <CAFEAcA9JkTEOhmoFjWYfR5d7ANhKnc9URk89Xe36q7qMVxkMmg@mail.gmail.com>
 <aa8ccb78-c977-20fa-a814-4223b678d9c4@amsat.org>
 <CAFEAcA-+dS5r5LvW5DTEH2vBrm1S2rs7sjjh2V7zjtD6ut0wBw@mail.gmail.com>
 <20210205140807.GH477672@toto>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=schspa@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 08 Feb 2021 09:34:42 -0500
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Kevin Zhao <kevin.zhao@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-02-05 at 15:08 +0100, Edgar E. Iglesias wrote:
> Thanks, that matches how I thought things should work.
> 
> I wonder if virtio_mmio_bus_get_dev_path() really should be peeking
> into
> Sysbus internals mmio[].addr?
> 
I think mmio[].addr needs to be given a meaningful value even if we
don't use it.

> Sysbus mmio[].addr looks like a candidate for removal if we ever get
> rid
> of the default system_memory...
> 
> I don't have any good suggestions how to fix this. I guess we could
> wrap
> memory_region_add_subregion() with a sysbus version of it that sets
> mmio[].addr but that seems like a step backwards to me.
> Perhaps there's a way fix this in virtio_mmio_bus_get_dev_path()?

I think we can change virtio_mmio_bus_get_dev_path() with the following
methods.

1. modify TYPE_VIRTIO_MMIO:
   add a prop to specify a unique device_path for virtio_mmio TypeInfo.
2. modify TYPE_VIRTIO_MMIO_BUS
   add a global static instance count to generate a unique device path.

-- 
schspa <schspa@gmail.com>


