Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250EA308709
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:30:17 +0100 (CET)
Received: from localhost ([::1]:60984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PAW-00042J-7C
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5P8g-0003ZV-Lq
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:28:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5P8f-0000AY-6Q
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:28:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611908900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DenMBv8Jyc6rsPTLWorjVfD+Jjy8a2nzsWcQ6rN1YYc=;
 b=a5i58Ey4XZUW5+o/gWRX/TaPyMBl0TBPvDit5hTJkgR7OZVotNOrmuatVxls7NVvNjGFcG
 RO5qUWiuNY3JigNJ/J4Kn+5cxv+OaEqv8fM7zhLZjDgGYJiD4hcJ3WaAEtiGi9RRLzQknE
 0RcJQ1jPi8p00oapKNEvsMwkmx2m/C0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-uG1Ql4W-Oae6kM6sft_a7w-1; Fri, 29 Jan 2021 03:28:18 -0500
X-MC-Unique: uG1Ql4W-Oae6kM6sft_a7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9CE6910E3;
 Fri, 29 Jan 2021 08:28:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A7B77771D;
 Fri, 29 Jan 2021 08:28:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 99A6618000A2; Fri, 29 Jan 2021 09:27:58 +0100 (CET)
Date: Fri, 29 Jan 2021 09:27:58 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: vnc clipboard support
Message-ID: <20210129082758.vx6ebmqhk7e332g4@sirius.home.kraxel.org>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Some things I keep in mind:
> - the spice protocol had a number of iterations to fix some races. It would
> be great not to repeat the same mistakes, and I don't know if VNC have the
> same flaws or not.

Sure.  One of the reasons I've started this discussion ;)

> - the GNOME desktop is working on remoting using RDP, and they are
> implementing a DBus interface for it (
> https://gitlab.gnome.org/jadahl/mutter/-/commits/wip/remote-desktop-clipboard
> )
> - it's not just about clipboard. We would also want to have some kind of
> drag and drop (even if limited to files like Spice atm). We may want some
> windowing integration. We may also want to have access to some desktop
> services: apps, documents etc.. And what's not.

Well.  That is a completely different level of desktop integration.
It surely makes sense to have that, and dbus-over-vsock looks like
a reasonable choice.

But I'm more after a solution for the "paste that long link into the
guest firefox" problem, without putting everything upside-down 😊

take care,
  Gerd


