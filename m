Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B6A397B35
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 22:25:45 +0200 (CEST)
Received: from localhost ([::1]:55000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loAxM-0007n2-0o
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 16:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1loAvb-0006an-4J; Tue, 01 Jun 2021 16:23:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:34706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1loAvZ-0007q4-7H; Tue, 01 Jun 2021 16:23:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C3D8610A8;
 Tue,  1 Jun 2021 20:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622579031;
 bh=AJPrXfQbP6PQuIlAbIIEJRSFLnjUR4tLOyee55HR5Bk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tFHjh3uS93Ugb4jWeMfKawTGAqbU92zvL1b+zLrtUgr9C82b/M35ykZ/1HoPbYyWM
 E+zDKflyaof7KYFQXx74mFYbBWJ4tXMac5FMRrwgh/PvO2umiUPWzNl8Z1fYY1/WxO
 r50zhtCaUFvkjiF3jjNhYXSC594G0okDfbtnV6LYJSMESfl7qBL96HMhtYcYeqhCde
 C8JGnIAQ+RuCrXRU1XB0/8zJrrGjq0PmcsE7DBM4AgsYzBg6i4I2DkMc9KLKq9sVHb
 LzKrUJBH0Bp/Mgu26q/XqTYeLItsTIp+fv7hS699hXFktiDTnS5hyuU3z5X4jcPkXA
 GNVo0vpk97YFQ==
Date: Tue, 1 Jun 2021 13:23:48 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 1/2] hw/nvme: add support for boot partiotions
Message-ID: <20210601202348.GB4527@dhcp-10-100-145-180.wdc.com>
References: <20210601143749.1669-1-anaidu.gollu@samsung.com>
 <CGME20210601144234epcas5p153e855ad673876cf67e57d4b539dc274@epcas5p1.samsung.com>
 <20210601143749.1669-2-anaidu.gollu@samsung.com>
 <20210601171936.GB4506@dhcp-10-100-145-180.wdc.com>
 <YLZxTlikAcJD98Ut@apples.localdomain>
 <20210601180724.GA4527@dhcp-10-100-145-180.wdc.com>
 <YLaFjPPj4Bq+a0m7@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLaFjPPj4Bq+a0m7@apples.localdomain>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 09:07:56PM +0200, Klaus Jensen wrote:
> On Jun  1 11:07, Keith Busch wrote:
> > On Tue, Jun 01, 2021 at 07:41:34PM +0200, Klaus Jensen wrote:
> > > On Jun  1 10:19, Keith Busch wrote:
> > > > On Tue, Jun 01, 2021 at 08:07:48PM +0530, Gollu Appalanaidu wrote:
> > > > > NVMe Boot Partitions provides an area that may be read by the host
> > > > > without initializing queues or even enabling the controller. This
> > > > > allows various platform initialization code to be stored on the NVMe
> > > > > device instead of some separete medium.
> > > > >
> > > > > This patch adds the read support for such an area, as well as support
> > > > > for updating the boot partition contents from the host through the
> > > > > FW Download and Commit commands.
> > > >
> > > > Please provide some details on what platform initilization sequence
> > > > running on QEMU is going to make use of this feature.
> > > >
> > > 
> > > I totally get your reluctance to accept useless features like device
> > > self-test and ill-supported ones like write uncorrectable.
> > > 
> > > But I think this feature qualifies just fine for the device. It is useful
> > > for embedded development and while there might not be any qemu boards that
> > > wants to use this *right now*, it allows for experimentation. And this is a
> > > feature that actually *is* implemented by real products for embedded
> > > systems.
> > 
> > That wasn't my request, though. I am well aware of the feature and also
> > have hardware that implements it. It just sounds like you haven't
> > actually tested this feature under the protocol's intended use cases
> > inside this environment. I think that type of testing and a high level
> > description of it in the changelog ought to be part of acceptance
> > criteria.
> > 
> 
> Alright, I see.
> 
> You'd like to see this tested by defining a new board that loads firmware
> over PCIe from the device?

Yes, something like that.

When the feature was initially published, I took a very brief look at
how qemu could use it and concluded this wasn't very practical here. I
would be happy to know if there's any example platform that can use it,
though. That, to me, demostrates sufficient value.

