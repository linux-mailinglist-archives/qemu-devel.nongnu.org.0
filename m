Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02130BD2F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:33:24 +0100 (CET)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6tvv-0000qT-Jm
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l6tuW-0008AX-6R
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:31:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l6tuS-0007sr-Ao
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612265510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ihIpHBQwIH9qwB4QMlOKf0/dQYQBj607f9V+jaI4rZ8=;
 b=DRIAOVxWIRqA+6rkY4k3mSCgGjFgBDpCYTUm90gxTa8DXmzdOFAnFylnnB3f5KFZd/8x0Y
 VzeRT/k7AQWmj+DKUYI/o5v+GSNwvkG7IE8LOr3wLgYkQnI/r9gS8QtBF/sxt665vLXwuX
 PrqLu6cIyRrgkyXMg+u84JOvnK/lKlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-mdSAUgkoM0KoaF6wSBttiw-1; Tue, 02 Feb 2021 06:31:48 -0500
X-MC-Unique: mdSAUgkoM0KoaF6wSBttiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDBFC425CB;
 Tue,  2 Feb 2021 11:31:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C0251002393;
 Tue,  2 Feb 2021 11:31:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8F25B18000A7; Tue,  2 Feb 2021 12:31:44 +0100 (CET)
Date: Tue, 2 Feb 2021 12:31:44 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: vnc clipboard support
Message-ID: <20210202113144.jrmqtgllpgd2nw2h@sirius.home.kraxel.org>
References: <20210129110814.GF4001740@redhat.com>
 <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
 <20210129143252.GE4008275@redhat.com>
 <05C58667-D9BA-49E2-897D-2286B243E802@redhat.com>
 <20210201155116.GL4131462@redhat.com>
 <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
 <20210201165634.GM4131462@redhat.com>
 <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
 <20210201174018.GP4131462@redhat.com>
 <8456ae54-b737-fa7d-cac8-75cd701f9ef5@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <8456ae54-b737-fa7d-cac8-75cd701f9ef5@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > My preferred solution is to have QEMU leverage the existing SPICE
> > guest agent if at all possible, because that's already widely
> > available in existing guest OS.
> 
> I think spice is not as widely available as VNC (or even Synergy) so the
> idea to strip one of those down to just a guest clipboard agent would help
> to get support to the most guests.

Well, we can use the spice agent as-is, then just let it talk to qemu
instead of spice client.  No need to code anything on the guest side,
and the (guest) code packaged up in distros will just work.

> QEMU already knows about VNC so might be the simplest way and you
> could reuse all kinds of VNC client and server code for the guest
> agent and also make it easy for others to add support for their
> guests.

Something vnc-ish doesn't look like a good plan to me.  When coding up
something new I'd go model the protocol after something more modern like
wayland.  When reusing something existing the spice-agent protocol looks
best as most existing linux guests already support it.

Also note that we can hook up clipboard support for the other UIs too
once we have the infrastructure in qemu, so even though there is "vnc"
in the subject line this isn't about vnc only.

> Using spice may not be that easi as it's less widespread so probably
> only works on the guests that already have support for it. And then
> why not just use spice instead of VNC on those guests and then you
> don't have the clipboard problem either.

The guest side is easy.  The spice-vdagent package is small, and the
dependencies it needs are most likely present anyway in a guest with
a graphical desktop installed.

The host side is a bit more tricky.  spice-server has a relatively long
list of dependencies not needed otherwise on a virtualization host.

> > We need something to be running in the guest, and that should be
> > agnostic of whatever other software the guest chooses to use for
> > remote desktop, and should not assume the guest even has remote
> > desktop setup.
> 
> As I understood, the idea is not to run a full VNC server on the guest OS
> but to make it easy to write the guest agent that you'll need to run is to
> reuse parts of a VNC server which is already available on almost all
> platforms.

spice guest agent is already available for linux and windows.  Not fully
sure how the state is on other unix-ish platforms like *bsd is.  In any
case it should not be that hard to port the linux version over.

take care,
  Gerd


