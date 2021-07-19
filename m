Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029953CEB16
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 20:42:59 +0200 (CEST)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5YEE-0004Es-2o
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 14:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5YD4-0003W0-NR
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:41:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5YD0-0003Hm-NK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626720100;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXvehFCqG+9uAalMX376MQfGHVhheW2MavS5I2n6ZZ8=;
 b=cZoRmkLXxIDRiZ03a/ecGs/zUFuz2Q3eeYUiB+hoFxRMLLm6diP0JuB7/JDYEPyq7V5wbG
 fulUoOa4BCV5U1RC41TWTT2Cct0KSP+JEyOjJntz3YYd/y8EJvqh8jZU3ZEKM3Ho8P+YZM
 y3ngg6924ngBvAcp3/ERcomdxzKWwhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-zKqouPK2OwunuJWUEClV0Q-1; Mon, 19 Jul 2021 14:41:35 -0400
X-MC-Unique: zKqouPK2OwunuJWUEClV0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC359101F7A1;
 Mon, 19 Jul 2021 18:41:33 +0000 (UTC)
Received: from redhat.com (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED150385;
 Mon, 19 Jul 2021 18:41:28 +0000 (UTC)
Date: Mon, 19 Jul 2021 19:41:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for 6.1 1/2] ui/gtk: add a keyboard fifo to the VTE
 consoles
Message-ID: <YPXHOLJ9Qzvk000W@redhat.com>
References: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
 <20210718074757.22489-1-vr_qemu@t-online.de>
 <CAFEAcA9hzbs71s4aeLgwGsepwU9DgZrxcY16hr4EX9tDeeJv3Q@mail.gmail.com>
 <e4f3d659-aa3d-68ab-4762-ac3239c9c2ab@t-online.de>
 <CAFEAcA_MKOtquC2rRKtVJEn-Etrrjg9KEL4VaH+_2Ehz2-uPjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_MKOtquC2rRKtVJEn-Etrrjg9KEL4VaH+_2Ehz2-uPjA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Zack Marvel <zpmarvel@gmail.com>,
 Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 07:37:23PM +0100, Peter Maydell wrote:
> On Mon, 19 Jul 2021 at 19:22, Volker Rümelin <vr_qemu@t-online.de> wrote:
> >
> > Am 18.07.21 um 15:00 schrieb Peter Maydell:
> >
> > > On Sun, 18 Jul 2021 at 08:50, Volker Rümelin <vr_qemu@t-online.de> wrote:
> > >> Since commit 8eb13bbbac ("ui/gtk: vte: fix sending multiple
> > >> characeters") it's very easy to lock up QEMU with the gtk ui.
> > >> If you configure a guest with a serial device and the guest
> > >> doesn't listen on this device, QEMU will lock up after
> > >> entering two characters in the serial console.
> > >>
> > >> To fix this problem copy the function kbd_send_chars() and
> > >> related code from ui/console.c to ui/gtk.c. kbd_send_chars()
> > >> doesn't lock up because it uses a timer instead of a busy loop
> > >> for the write retries.
> > >>
> > >> Fixes: 8eb13bbbac ("ui/gtk: vte: fix sending multiple characeters")
> > >> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> > >> ---
> > >>   include/ui/gtk.h |  5 +++++
> > >>   ui/gtk.c         | 53 ++++++++++++++++++++++++++++++++++++++++--------
> > >>   2 files changed, 50 insertions(+), 8 deletions(-)
> > > This feels like maybe it's the kind of thing that should be handled
> > > more generically rather than in one particular UI frontend ?
> 
> > All other UI frontends (except Spice) use the correct code in
> > kbd_send_chars(). I think only the GTK UI code is wrong.
> 
> Why isn't GTK able to do things the same way all the other UI
> frontends do, then ?

In the other frontends the text consoles are not directly exposed, you
just switch into them using QEMU's console switching shortcuts.

In the GTK frontend, each text console is exposed directly as a notebook
tab in the UI, so you don't need to use QEMU's console switching.

IOW, the GTK frontend is more feature rich than the other frontends and
causes it to hit this mistake.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


