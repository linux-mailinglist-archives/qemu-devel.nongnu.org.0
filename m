Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B55D337182
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:39:17 +0100 (CET)
Received: from localhost ([::1]:52370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJet-0001u9-P7
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKJdT-0001QI-PU
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:37:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKJdR-0004YT-9x
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615462663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jpwvnRPseKnU4bLpKxONKqVa/a3e42Z21IppKJmjDI4=;
 b=aCg5grxgHL2eFypbyXeWFp+0Ln+eEc8gTz3yHIzqkiUYYpXwVX8+KEfoUaQN/3Wja4bsKw
 vhh7WyqVPUyZrAUQTDT2fhSqM7H8WTy56A9Is6T+MmXCttXgZRx7QC8B2eVIjxKKtqRp6J
 Du6qJZAWHGxw8eP2i+gsjXMD8ob2Zd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-9396zUjsOkCpHhMMcnZTDA-1; Thu, 11 Mar 2021 06:37:41 -0500
X-MC-Unique: 9396zUjsOkCpHhMMcnZTDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9217A363AB;
 Thu, 11 Mar 2021 11:37:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26E841346F;
 Thu, 11 Mar 2021 11:37:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 433D5180087E; Thu, 11 Mar 2021 12:37:38 +0100 (CET)
Date: Thu, 11 Mar 2021 12:37:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/4] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
Message-ID: <20210311113738.exhvhskqnpguafyz@sirius.home.kraxel.org>
References: <20210310173323.1422754-1-thuth@redhat.com>
 <20210310173323.1422754-4-thuth@redhat.com>
 <87y2euqe4j.fsf@dusky.pond.sub.org>
 <1f5ff060-5ec6-22bb-8b23-a558d6520894@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1f5ff060-5ec6-22bb-8b23-a558d6520894@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC5CZXJyYW5nw6k=?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> >  It is arguably the case for disk,
> > serial, net, and host, yet we removed those anyway, to make the regular
> > and more expressive interface the only one.
> 
> The problem with those devices was that they used their own parameter
> parsing code,

Yes, that was IMHO the most important issue.  Two ways to configure
devices, the usual properties and the hand-crafted and often buggy
device-specific parsers.

Now we are down to simple aliasing without parameter support, except
for braille which has the special chardev handling.  Given we keep
braille support anyway there is little reason to drop the aliasing
support for the other devices which don't require parameters.  It's
literally a single line of code per device, hardly a big maintainance
burden.  The benefit is we don't invalidate tons of webpages which
document "-usbdevice tablet" and the like.

> We didn't make up our minds for three years now. In my eyes that's a
> decision for keeping -usbdevice braille around.

Another option could be to integrate the braille bits into the
usb-braille device, then kill the separate chardev.  Which would
also drop support for serial braille devices.  Not sure how much
of a problem that would be these days.  But that likewise needs
someone to step up doing the work ...

take care,
  Gerd


