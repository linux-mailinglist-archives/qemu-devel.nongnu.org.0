Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D6F50E23E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:47:13 +0200 (CEST)
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niz3Y-0000Pv-73
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niywK-0007fT-FA
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niywG-0005bk-BL
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650893978;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TQoCylF0Ad3tiAM4lojALsXfcEcinNPyvl4hVXYTfgc=;
 b=LHMhBk5hz3QUV71r7/8QqWFkPkcyOoHfXGI7dD1WQgDkeCptKqKstPOq6605Jd3vH+AGWz
 Kz0V/4leGxWqiMEATZXO8tWbH9nZ8pXYwBAiB61w5koX00fU4/VLh3rVjR/j1dqchL5b+r
 pHy12hbW+4c5IAGMJHiYOn9rYyV5E48=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-JoJDgq__OYC42fRm3e5X7g-1; Mon, 25 Apr 2022 09:39:35 -0400
X-MC-Unique: JoJDgq__OYC42fRm3e5X7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5319780352D;
 Mon, 25 Apr 2022 13:39:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E139D40CF910;
 Mon, 25 Apr 2022 13:39:29 +0000 (UTC)
Date: Mon, 25 Apr 2022 14:39:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 13/18] audio: Make AUD_register_card fallible and require
 audiodev=
Message-ID: <Ymakj30ufqLPkVUg@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <92b31c6af268b8f2a4cc4ed5b20ee8d0e19f614d.1650874791.git.mkletzan@redhat.com>
 <YmajUERGbzh4rj9C@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmajUERGbzh4rj9C@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 02:34:08PM +0100, Daniel P. Berrangé wrote:
> On Mon, Apr 25, 2022 at 10:21:56AM +0200, Martin Kletzander wrote:
> > Now that all callers support error reporting with errp and all machine-default
> > devices use an explicit audiodev, this can be changed.  To make the detection
> > easier make AUD_register_card() return false on error.
> > 
> > Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> > ---
> >  audio/audio.c        | 7 +++++--
> >  audio/audio.h        | 2 +-
> >  hw/arm/omap2.c       | 3 ++-
> >  hw/audio/ac97.c      | 6 +++++-
> >  hw/audio/adlib.c     | 7 +++++--
> >  hw/audio/cs4231a.c   | 6 ++++--
> >  hw/audio/es1370.c    | 5 ++++-
> >  hw/audio/gus.c       | 4 +++-
> >  hw/audio/hda-codec.c | 5 ++++-
> >  hw/audio/lm4549.c    | 4 +++-
> >  hw/audio/pcspk.c     | 4 +++-
> >  hw/audio/sb16.c      | 6 ++++--
> >  hw/audio/wm8750.c    | 5 ++++-
> >  hw/display/xlnx_dp.c | 6 ++++--
> >  hw/input/tsc210x.c   | 3 ++-
> >  hw/usb/dev-audio.c   | 5 ++++-
> >  16 files changed, 57 insertions(+), 21 deletions(-)
> > 
> > diff --git a/audio/audio.c b/audio/audio.c
> > index 671845c65d18..b95aca444382 100644
> > --- a/audio/audio.c
> > +++ b/audio/audio.c
> > @@ -1822,15 +1822,18 @@ void audio_free_audiodev_list(AudiodevListHead *head)
> >      }
> >  }
> >  
> > -void AUD_register_card (const char *name, QEMUSoundCard *card)
> > +bool AUD_register_card (const char *name, QEMUSoundCard *card, Error **errp)
> >  {
> >      if (!card->state) {
> > -        card->state = audio_init(NULL, name);
> > +        error_setg(errp, "No audiodev specified for %s", name);
> > +        return false;
> >      }
> 
> This is a significant change in semantics.
> 
>   qemu-system-x86_64 -device ac97
> 
> will currently automatically create a default audio backend for the
> user, but now it just reports an error. I don't think we want todo
> this, as allowing 'audiodev' to be optional was an intentionale
> thing to be more user friendly to casual userss. It lets command
> line args they use "just work" regardless of which audio subsystem
> their host OS happens to be using, which wouldn't be the case if we
> force them to use -audiodev every time.

Oh, I missed that we had already deprecated the omission of audiodev
with the intent to make it mandatory (having previously tried to
make it mandatory earlier)

commit 4b3b7793e18e1e3edb90bbc21112e875f9ff826d
Author: Kővágó, Zoltán <dirty.ice.hu@gmail.com>
Date:   Mon Aug 26 21:59:02 2019 +0200

    audio: omitting audiodev= parameter is only deprecated

> 
> >  
> >      card->name = g_strdup (name);
> >      memset (&card->entries, 0, sizeof (card->entries));
> >      QLIST_INSERT_HEAD(&card->state->card_head, card, entries);
> > +
> > +    return true;
> >  }
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


