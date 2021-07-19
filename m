Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F013CD087
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:21:59 +0200 (CEST)
Received: from localhost ([::1]:45812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PTK-0003tv-6w
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5PS7-0002Vk-Jb
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:20:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5PS5-0003fw-Ou
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626686439;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hocKKUSRkaLwaq4b2vraKQAGDwUmQq390uN7XuOZ+Rk=;
 b=BXMUWc2g6H7wyluUYGMuSQFUYTZ2Nrtt3YoJ3eLJpgPFwuf29CVXZiGxXHNy2FBInej3ce
 mPl9vCNuJn4MbTQajWIhi4NEkYi94isS0pJwl/VPBQ69s0RNEwXgq+6C7YTM4/SDhvGxAq
 dXFZMB5LoA7o1RUYnK5IGEvxWaXe1lY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-PwwUKTNbNquCZ_CC8GQDSA-1; Mon, 19 Jul 2021 05:20:35 -0400
X-MC-Unique: PwwUKTNbNquCZ_CC8GQDSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4625802C80;
 Mon, 19 Jul 2021 09:20:33 +0000 (UTC)
Received: from redhat.com (ovpn-112-193.ams2.redhat.com [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBE91100EB3E;
 Mon, 19 Jul 2021 09:20:28 +0000 (UTC)
Date: Mon, 19 Jul 2021 10:20:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for 6.1 1/2] ui/gtk: add a keyboard fifo to the VTE
 consoles
Message-ID: <YPVD2RUFEizWsKq8@redhat.com>
References: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
 <20210718074757.22489-1-vr_qemu@t-online.de>
 <CAFEAcA9hzbs71s4aeLgwGsepwU9DgZrxcY16hr4EX9tDeeJv3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9hzbs71s4aeLgwGsepwU9DgZrxcY16hr4EX9tDeeJv3Q@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Zack Marvel <zpmarvel@gmail.com>,
 Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 18, 2021 at 02:00:03PM +0100, Peter Maydell wrote:
> On Sun, 18 Jul 2021 at 08:50, Volker Rümelin <vr_qemu@t-online.de> wrote:
> >
> > Since commit 8eb13bbbac ("ui/gtk: vte: fix sending multiple
> > characeters") it's very easy to lock up QEMU with the gtk ui.
> > If you configure a guest with a serial device and the guest
> > doesn't listen on this device, QEMU will lock up after
> > entering two characters in the serial console.
> >
> > To fix this problem copy the function kbd_send_chars() and
> > related code from ui/console.c to ui/gtk.c. kbd_send_chars()
> > doesn't lock up because it uses a timer instead of a busy loop
> > for the write retries.
> >
> > Fixes: 8eb13bbbac ("ui/gtk: vte: fix sending multiple characeters")
> > Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> > ---
> >  include/ui/gtk.h |  5 +++++
> >  ui/gtk.c         | 53 ++++++++++++++++++++++++++++++++++++++++--------
> >  2 files changed, 50 insertions(+), 8 deletions(-)
> 
> This feels like maybe it's the kind of thing that should be handled
> more generically rather than in one particular UI frontend ?

IIUC none of the other frontends directly talk to the chardevs for the
serial ports. Instead they communicate via the text console interfaces.
So GTK is a bit special already here.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


