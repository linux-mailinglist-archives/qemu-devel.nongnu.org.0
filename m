Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079024CC0E6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:14:10 +0100 (CET)
Received: from localhost ([::1]:47010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPn9d-0000Ys-14
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:14:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nPn3L-0002hH-Fb; Thu, 03 Mar 2022 10:07:39 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nPn3J-0002ce-0e; Thu, 03 Mar 2022 10:07:39 -0500
Received: from fraeml743-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4K8Z7N3ZVvz67x9g;
 Thu,  3 Mar 2022 23:06:08 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml743-chm.china.huawei.com (10.206.15.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 16:07:22 +0100
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Thu, 3 Mar
 2022 15:07:22 +0000
Date: Thu, 3 Mar 2022 15:07:20 +0000
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <theobf@usp.br>
Subject: Re: SPI support for the virt platform
Message-ID: <20220303150720.00000f8b@Huawei.com>
In-Reply-To: <Yh2EPSvM0xLUYW45@marsc.168.1.7>
References: <Yh2EPSvM0xLUYW45@marsc.168.1.7>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml741-chm.china.huawei.com (10.201.108.191) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Mon, 28 Feb 2022 23:26:05 -0300
Marcelo Schmitt <marcelo.schmitt1@gmail.com> wrote:

> Hi,
> 
> I'd like to know the opinion of the QEMU community on some topics.
> 
> In 2021, a pair of patch sets for drivers of the Linux IIO subsystem was
> proposed based on some QEMU hacks that added virtual devices with which
> it was possible to test the proposed modifications to the Linux kernel
> [1, 2, 3].
> 
> Most Linux IIO drivers connect to the system through either SPI or I2C.
> So, it ends up that these buses are needed to do some tests on IIO
> drivers. Because of that, those QEMU changes included hacks to the virt
> platform to add SPI or I2C buses.
> 
> The documentation says that virt is a generic virtual platform [4]. In
> this regard, adding more buses to virt could turn the platform into
> something less generic. However, if support for SPI/I2C were added, then
> it would reduce the effort needed to develop virtual devices to aid
> driver testing. Before putting effort to develop something concrete, I'd
> like to ask just to make sure:
> Would SPI/I2C support be a good addition to QEMU virt?

Hi Marcelo,

With my IIO kernel maintainer hat on, I'm keen to have a better platform
for this than my various hacks so very happy to see this topic raised!

The advantage of arm-virt is the setup code and dt/acpi table generation
is all more or less in one place which makes things nice and flexible
for configuration.

It might be possible to do something that is well isolated in separate file
optionally built/runtime enabled so as to not bloat arm-virt for other
usecases.

Trying to enable generic configuration for i2c and spi devices is via
-device looks hard to me as there are normally gpio/irq type
requirements but perhaps it can be done and that would make things
more flexible.  Mind you for a test platform I have no problem with
having a 'board' that has lots of i2c and SPI devices always configured. 

> 
> Another possibility would be to add support for SPI and I2C buses on
> Raspberry Pi boards emulation [5]. Would this be a better idea?

It would be an option though maybe not so easy to mess around with and
extending those with devices not commonly seen might also be controversial.

Thinking out of the box, we could emulate a PCI card and put everything on
that but we'd probably be inventing hardware to emulate as I don't know
of a suitable device. There are real usb-i2c/spi devices but those aren't
entirely trivial to use and you still need to describe non discoverable
buses somehow.

> 
> Also, the QEMU devices developed could be upstreamed. At first, I
> thought that developing virtual devices would be a win-win situation in
> which we could extend Linux's test coverage and add support for new QEMU
> devices. However, as these would be dummy devices, I'm not sure how QEMU
> would benefit from them. Anyhow, I'd appreciate it if anyone could give
> a word about that.

Needs someone to commit to maintaining the code + tests etc.

Whilst I don't mind helping, I don't have the bandwidth to do too much
on this in Qemu, but sounds like you might be the perfect person Marcelo :)

Jonathan

> 
> 
> Thanks,
> Marcelo
> 
> [1] https://lore.kernel.org/linux-iio/20210314181511.531414-1-jic23@kernel.org/
> [2] https://lore.kernel.org/linux-iio/20210614113507.897732-1-jic23@kernel.org/
> [3] https://github.com/jic23/qemu
> [4] https://qemu-project.gitlab.io/qemu/system/arm/virt.html
> [5] https://qemu-project.gitlab.io/qemu/system/arm/raspi.html
> 


