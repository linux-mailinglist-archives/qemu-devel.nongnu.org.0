Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA9F65B706
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 20:59:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCQxB-0008JI-Jy; Mon, 02 Jan 2023 14:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>)
 id 1pCQx9-0008IU-9U; Mon, 02 Jan 2023 14:58:35 -0500
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>)
 id 1pCQx6-000823-Ug; Mon, 02 Jan 2023 14:58:34 -0500
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 1F94489;
 Mon,  2 Jan 2023 20:58:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1672689509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFo+n2J/yf5/n49zeU8CYyk44jLKE7tlfwf8LnATnCs=;
 b=SzNb6kF+MmQXbBlvDkFzSZPd5jxarr3g0xop1QvJqtEeIavhsqyUzLDvzOzbitu6Zt1sld
 HzfFUD9K9TJppt7jKwZrgTZwmkPszhu/610JjVAC97w4y/vd4hocwICMrCpaX7HfirhvGW
 GOVbHHDDmf3mGZp9FSULKLYpd0QngtvRlhzvWNl1pLzg0XfBpmZAZM0oCwnqWRih1R4S60
 iGHHYc226lbp6rvZHeCSiK57E+FEeQHg3YmM+8Aj7lvOUTyMBpYC6KYBCfP/LWSqr+EaEj
 Z//ArIeBBSPt06EywzzLB6p5S+zLb4qhVVAXf/QmanYaJ1OWvXg20YIpp3h+ag==
MIME-Version: 1.0
Date: Mon, 02 Jan 2023 20:58:28 +0100
From: Michael Walle <michael@walle.cc>
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Ben Dooks <ben@fluff.org>, Alistair Francis
 <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] m25p80: Add the is25wp256 SFPD table
In-Reply-To: <20230102184943.GA2553640@roeck-us.net>
References: <20221221122213.1458540-1-linux@roeck-us.net>
 <2236d0ee-4fc6-5e2c-95b4-f97639e0955b@kaod.org>
 <20221225121850.4bjnskmlhsot54cf@hetzy.fluff.org>
 <b00bb842-a9e6-fa5c-94d9-876c241be600@linaro.org>
 <c1f5c868-0006-bb28-af88-eddc5543068e@kaod.org>
 <3044e0c174268312d0323d8f9ad43c68@walle.cc>
 <20230102162308.GA1138622@roeck-us.net>
 <50d8282e95bde199ad60411ddfa9b373@walle.cc>
 <20230102184943.GA2553640@roeck-us.net>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <49972ef47855bbffad937f18cfd9c555@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=159.69.201.130; envelope-from=michael@walle.cc;
 helo=mail.3ffe.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 2023-01-02 19:49, schrieb Guenter Roeck:
> On Mon, Jan 02, 2023 at 06:42:03PM +0100, Michael Walle wrote:
>> Am 2023-01-02 17:23, schrieb Guenter Roeck:
>> > On Mon, Jan 02, 2023 at 04:43:49PM +0100, Michael Walle wrote:
>> > > Am 2023-01-02 14:53, schrieb Cédric Le Goater:
>> > > > On 12/27/22 07:31, Tudor Ambarus wrote:
>> > > > >
>> > > > >
>> > > > > On 25.12.2022 14:18, Ben Dooks wrote:
>> > > > > > On Wed, Dec 21, 2022 at 06:36:02PM +0100, Cédric Le Goater wrote:
>> > > > > > > On 12/21/22 13:22, Guenter Roeck wrote:
>> > > > > > > > Generated from hardware using the following command and
>> > > > > > > > then padding
>> > > > > > > > with 0xff to fill out a power-of-2:
>> > > > > > > >     xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> > > > > > > >
>> > > > > > > > Cc: Michael Walle <michael@walle.cc>
>> > > > > > > > Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
>> > > > > > > > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> > > > > > >
>> > > > > > > Reviewed-by: Cédric Le Goater <clg@kaod.org>
>> > > > > >
>> > > > > > If SFDP is a standard, couldn't we have an function to generate
>> > > > > > it from
>> > > > > > the flash parameters?
>> > > > > >
>> > > > >
>> > > > > No, it's not practical as you have to specify all the flash parameters
>> > > > > at flash declaration.
>> > > >
>> > > > Indeed and the definition of flash models in QEMU is far to cover all
>> > > > the SFDP
>> > > > features. The known_devices array of m25p80 would be huge ! However, we
>> > > > could
>> > > > generate some of the SFDP tables if no raw data is provided. It could be
>> > > > useful
>> > > > for testing drivers.
>> > >
>> > > I don't think adding (incomplete) SFDP tables makes sense for any real
>> > > devices. E.g. sometimes our linux driver will look at specific bits in
>> > > SFDP to figure out what particular flash device is attached. For
>> > > example
>> > > when there are different flashes with the same jedec id.
>> > >
>> > > But since the last released kernel, we support a generic SFDP
>> > > driver, which
>> > > is used when there is no matching driver for the flash's jedec id.
>> > > Theoretically, you can build your own flash device (with a unique
>> > > id) and
>> > > generate the sfdp tables for that one.
>> > >
>> > How about older kernels versions ? Would those still support such
>> > (virtual ?)
>> > flash devices ?
>> 
>> No with older kernels you'd be out of luck. They will just print 
>> "unknown
>> flash
>> id" and skip the device.
> 
> That would mean that qemu versions including this change could no 
> longer
> be used to test flash support on older kernel versions. That would be
> extremely undesirable. I'd rather live with the current code and still 
> be
> able to test older kernels.

Your board wouldn't need to use it. I don't think that emulating a real
spi flash device would go away. But it might still make sense to have
such a flash device, one example already mentioned is for testing
drivers.

-michael

