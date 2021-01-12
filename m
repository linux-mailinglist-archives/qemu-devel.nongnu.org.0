Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D682F35CA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 17:30:29 +0100 (CET)
Received: from localhost ([::1]:43242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzMYu-0006Xk-RG
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 11:30:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kzMXS-0005fq-2c
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:28:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kzMXQ-0004tj-LF
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610468935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o9GpoQowO6JHIejzAlGKrwY/elTVTuK4f+4ngW7ZPG4=;
 b=caz+S6QxRWruC69h/qr+OdTi/ircLC3G3d7GW183RMU4oXNg8kY3YholI79dFyvDkUJHnP
 0NJk/9YnlBxgfxti1pUzSf6KpecGXmpx81OJjq0EIcE+e9aLf5QsO9tmqu34q+sglqPTv6
 PkrsXXHu0rrvZ7QOe2ecMrCMWqLura8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-GH3nz7f1NsS6rX2b6yHiVA-1; Tue, 12 Jan 2021 11:28:51 -0500
X-MC-Unique: GH3nz7f1NsS6rX2b6yHiVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4078A801F9A;
 Tue, 12 Jan 2021 16:28:50 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-115-10.rdu2.redhat.com
 [10.10.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3838260862;
 Tue, 12 Jan 2021 16:28:49 +0000 (UTC)
Date: Tue, 12 Jan 2021 11:28:47 -0500
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
Message-ID: <20210112162847.wik3h24isg4cmgyq@kamzik.brq.redhat.com>
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
 <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
 <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 11:25:30AM -0500, Andrew Jones wrote:
> On Tue, Jan 12, 2021 at 04:00:23PM +0000, Peter Maydell wrote:
> > On Tue, 12 Jan 2021 at 15:35, Andrew Jones <drjones@redhat.com> wrote:
> > >
> > > On Tue, Jan 12, 2021 at 05:30:58PM +0300, Maxim Uvarov wrote:
> > > > Add secure pl061 for reset/power down machine from
> > > > the secure world (Arm Trusted Firmware). Connect it
> > > > with gpio-pwr driver.
> > 
> > > > +    /* connect secure pl061 to gpio-pwr */
> > > > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
> > > > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
> > > > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
> > > > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
> > >
> > > I don't know anything about secure world, but it seems odd that we don't
> > > need to add anything to the DTB.
> > 
> > We should be adding something to the DTB, yes. Look at
> > how create_uart() does this -- you set the 'status' and
> > 'secure-status' properties to indicate that the device is
> > secure-world only.
> > 
> > 
> > 
> > > > +    if (vmc->no_secure_gpio) {
> > > > +        vms->secure_gpio = false;
> > > > +    }  else {
> > > > +        vms->secure_gpio = true;
> > > > +    }
> > >
> > > nit: vms->secure_gpio = !vmc->no_secure_gpio
> > >
> > > But do we even need vms->secure_gpio? Why not just do
> > >
> > >  if (vms->secure && !vmc->no_secure_gpio) {
> > >      create_gpio_secure(vms, secure_sysmem);
> > >  }
> > >
> > > in machvirt_init() ?
> > 
> > We're just following the same pattern as vmc->no_its/vms->its,
> > aren't we ?
> >
> 
> 'its' is a property that can be changed on the command line. Unless
> we want to be able to manage 'secure-gpio' separately from 'secure',
> then I think vmc->its plus 'secure' should be sufficient. We don't

I meant to write 'vmc->no_secure_gpio and vms->secure' here.

Thanks,
drew

> always need both vmc and vms state, see 'no_ged'.
> 
> Thanks,
> drew


