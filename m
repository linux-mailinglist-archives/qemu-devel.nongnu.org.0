Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CF032D54F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:33:17 +0100 (CET)
Received: from localhost ([::1]:41796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHp2S-0001gT-Hg
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:33:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHp1E-00016A-O4
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:32:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHp1A-00009L-04
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614868314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RmuriC3vtlhn+9fLjQ8Dz7VrJSICUQtctbqcs+z3pNM=;
 b=eV3UyT0UrAU8WEkdyg3ZiFKpCJpRxg5PSkC3pJ21poJ3t71EdrPTVShQHIXbAsWIdV7UBX
 GOcz9IOauJ1Ww/KbuzDNIxID5t1sJ163A+RAsPmLUz4lZjkmjuByuTLearQl/28+2B/C4g
 1/neID7VYwISWAjisJ6hdWxs0SDMJpw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-6teXNDiAOsmP-p4kzsmg5Q-1; Thu, 04 Mar 2021 09:31:52 -0500
X-MC-Unique: 6teXNDiAOsmP-p4kzsmg5Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DD0F84BA40;
 Thu,  4 Mar 2021 14:31:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22DAB175BB;
 Thu,  4 Mar 2021 14:31:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 784A218000A7; Thu,  4 Mar 2021 15:31:49 +0100 (CET)
Date: Thu, 4 Mar 2021 15:31:49 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ben Leslie <benno@benno.id.au>
Subject: Re: USB port claiming / set configuration problems
Message-ID: <20210304143149.jc24h6fh35luzhyb@sirius.home.kraxel.org>
References: <CABZ0LtBrGynOoYr=xbT3zNGe3UQg=Dr39_8d9V6+XgGzpnQrsw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABZ0LtBrGynOoYr=xbT3zNGe3UQg=Dr39_8d9V6+XgGzpnQrsw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> To attempt a work-around and validate the theory I change the
> `usb_host_set_config` function (in host-libusb.c) such that it first checks
> if the current active configuration matches the request configuration, and
> if so skips performing the actual SET CONFIGURATION control transfer.

If libusb is able to correctly report what the current configuration is
(i.e. what the kernel has picked at device detection time) then yes, we
can do that.  And it would probably the best way to tackle the problem
as it should not have bad side effects on other devices so we don't need
a config option to enable/disable this.

> USBDEVFS has support for `USBDEVFS_CLAIM_PORT` (and
> `USBDEVFS_RELEASE_PORT`) ioctls. From the definition this seem designed to
> limit the interaction that Linux kernel might have with a device on a
> claimed port, which seems perfect for this use case. This in fact used in
> previous version of qemu if we go back to the host-linux.c days, but with
> the change over to host-libusb.c this functionality was lost.
> 
> Was this intentional?

The switch to libusb sure.  That solves lots of portability issues.  Not
claiming the port was probably lost because libusb doesn't offer
support for that (don't remember all details after years).

> Would adding support to host-libusb to use these
> ioctl to claim the port be beneficial?

I don't feel like side-stepping libusb.  That is asking for trouble
because usbdevfs might behave differently then and confuse libusb.

So, if anything, libusb would need support that, then qemu can use it.

> Based on a simple test program and
> hardware USB traces for a device connected to a 'claimed' port the kernel
> does indeed leave the device in an unconfigured state. (Although it still
> performs some basic control transfers to gather descriptor, and strangely
> seems to in this case make an explicit SET CONFIGURATION transfer, but sets
> configuration to zero, rather than an actual configuration, which, at least
> for the devices I was able to test with, avoided the problems of calling
> SET CONFIGURATION (1) twice).

We could try that too (set config to zero first, then set the config we
actually want) and see if that works better.

Another option could maybe be a device reset + set config.

These two would probably need a config option to enable/disable the
quirk though.

take care,
  Gerd


