Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE60C4D471
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 19:01:32 +0200 (CEST)
Received: from localhost ([::1]:50456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he0RH-0001gf-UH
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 13:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40273)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1he0Gj-0004wr-BF
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 12:50:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1he0Gg-0006Ri-BB
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 12:50:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45994)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1he0Gf-0006QJ-TX
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 12:50:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 080983086262
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 16:50:28 +0000 (UTC)
Received: from work-vm (ovpn-117-203.ams2.redhat.com [10.36.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82D9D5D71C;
 Thu, 20 Jun 2019 16:50:24 +0000 (UTC)
Date: Thu, 20 Jun 2019 17:50:22 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Message-ID: <20190620165021.GL2907@work-vm>
References: <20190613095924.21908-1-dgilbert@redhat.com>
 <20190613095924.21908-4-dgilbert@redhat.com>
 <e2369f5c-5d68-ff3c-1f09-81646eb86279@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e2369f5c-5d68-ff3c-1f09-81646eb86279@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 20 Jun 2019 16:50:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 3/5] net/announce: Add optional ID
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
Cc: qemu-devel@nongnu.org, laine@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jason Wang (jasowang@redhat.com) wrote:
>=20
> On 2019/6/13 =E4=B8=8B=E5=8D=885:59, Dr. David Alan Gilbert (git) wrote=
:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >=20
> > Previously there was a single instance of the timer used by
> > monitor triggered announces, that's OK, but when combined with the
> > previous change that lets you have announces for subsets of interface=
s
> > it's a bit restrictive if you want to do different things to differen=
t
> > interfaces.
> >=20
> > Add an 'id' field to the announce, and maintain a list of the
> > timers based on id.
> >=20
> > This allows you to for example:
> >      a) Start an announce going on interface eth0 for a long time
> >      b) Start an announce going on interface eth1 for a long time
> >      c) Kill the announce on eth0 while leaving eth1 going.
> >=20
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >   hw/net/virtio-net.c    |  4 ++--
> >   include/net/announce.h |  8 ++++++--
> >   net/announce.c         | 46 +++++++++++++++++++++++++++++++++++----=
---
> >   net/trace-events       |  3 ++-
> >   qapi/net.json          |  9 +++++++--
> >   5 files changed, 56 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index c3f5fccfd1..b9e1cd71cf 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -2360,7 +2360,7 @@ static int virtio_net_post_load_device(void *op=
aque, int version_id)
> >               timer_mod(n->announce_timer.tm,
> >                         qemu_clock_get_ms(n->announce_timer.type));
> >           } else {
> > -            qemu_announce_timer_del(&n->announce_timer);
> > +            qemu_announce_timer_del(&n->announce_timer, false);
> >           }
> >       }
> > @@ -2784,7 +2784,7 @@ static void virtio_net_device_unrealize(DeviceS=
tate *dev, Error **errp)
> >           virtio_net_del_queue(n, i);
> >       }
> > -    qemu_announce_timer_del(&n->announce_timer);
> > +    qemu_announce_timer_del(&n->announce_timer, false);
> >       g_free(n->vqs);
> >       qemu_del_nic(n->nic);
> >       virtio_net_rsc_cleanup(n);
> > diff --git a/include/net/announce.h b/include/net/announce.h
> > index 773470428b..3d90c83c23 100644
> > --- a/include/net/announce.h
> > +++ b/include/net/announce.h
> > @@ -22,8 +22,12 @@ struct AnnounceTimer {
> >   /* Returns: update the timer to the next time point */
> >   int64_t qemu_announce_timer_step(AnnounceTimer *timer);
> > -/* Delete the underlying timer and other data */
> > -void qemu_announce_timer_del(AnnounceTimer *timer);
> > +/*
> > + * Delete the underlying timer and other data
> > + * If 'free_named' true and the timer is a named timer, then remove
> > + * it from the list of named timers and free the AnnounceTimer itsel=
f.
> > + */
> > +void qemu_announce_timer_del(AnnounceTimer *timer, bool free_named);
> >   /*
> >    * Under BQL/main thread
> > diff --git a/net/announce.c b/net/announce.c
> > index 1ce42b571d..4d4e2c22a1 100644
> > --- a/net/announce.c
> > +++ b/net/announce.c
> > @@ -15,6 +15,8 @@
> >   #include "qapi/qapi-commands-net.h"
> >   #include "trace.h"
> > +static GData *named_timers;
> > +
> >   int64_t qemu_announce_timer_step(AnnounceTimer *timer)
> >   {
> >       int64_t step;
> > @@ -31,8 +33,13 @@ int64_t qemu_announce_timer_step(AnnounceTimer *ti=
mer)
> >       return step;
> >   }
> > -void qemu_announce_timer_del(AnnounceTimer *timer)
> > +/*
> > + * If 'free_named' is true, then remove the timer from the list
> > + * and free the timer itself.
> > + */
> > +void qemu_announce_timer_del(AnnounceTimer *timer, bool free_named)
> >   {
> > +    bool free_timer =3D false;
> >       if (timer->tm) {
> >           timer_del(timer->tm);
> >           timer_free(timer->tm);
> > @@ -40,6 +47,18 @@ void qemu_announce_timer_del(AnnounceTimer *timer)
> >       }
> >       qapi_free_strList(timer->params.interfaces);
> >       timer->params.interfaces =3D NULL;
> > +    if (free_named && timer->params.has_id) {
> > +        free_timer =3D timer =3D=3D
> > +                     g_datalist_get_data(&named_timers, timer->param=
s.id);
>=20
>=20
> Any chance that the timer get from datalist is different from the one t=
hat
> caller passed to us?

No, I've replaced this with:
+    if (free_named && timer->params.has_id) {
+        AnnounceTimer *listTimer;
+        /*
+         * Sanity check: There should only be one timer on the list with
+         * the id.
+         */
+        list_timer =3D g_datalist_get_data(&named_timers, timer->params.=
id);
+        assert(timer =3D=3D list_timer);
+        free_timer =3D true;
+        g_datalist_remove_data(&named_timers, timer->params.id);
+    }


> Thanks
>=20
>=20
> > +        g_datalist_remove_data(&named_timers, timer->params.id);
> > +    }
> > +    trace_qemu_announce_timer_del(free_named, free_timer, timer->par=
ams.id);
> > +    g_free(timer->params.id);
> > +    timer->params.id =3D NULL;
> > +
> > +    if (free_timer) {
> > +        g_free(timer);
> > +    }
> >   }
> >   /*
> > @@ -56,7 +75,7 @@ void qemu_announce_timer_reset(AnnounceTimer *timer=
,
> >        * We're under the BQL, so the current timer can't
> >        * be firing, so we should be able to delete it.
> >        */
> > -    qemu_announce_timer_del(timer);
> > +    qemu_announce_timer_del(timer, false);
> >       QAPI_CLONE_MEMBERS(AnnounceParameters, &timer->params, params);
> >       timer->round =3D params->rounds;
> > @@ -120,7 +139,8 @@ static void qemu_announce_self_iter(NICState *nic=
, void *opaque)
> >           skip =3D false;
> >       }
> > -    trace_qemu_announce_self_iter(nic->ncs->name,
> > +    trace_qemu_announce_self_iter(timer->params.has_id ? timer->para=
ms.id : "_",
> > +                                  nic->ncs->name,
> >                                     qemu_ether_ntoa(&nic->conf->macad=
dr), skip);
> >       if (!skip) {
> > @@ -143,7 +163,7 @@ static void qemu_announce_self_once(void *opaque)
> >       if (--timer->round) {
> >           qemu_announce_timer_step(timer);
> >       } else {
> > -        qemu_announce_timer_del(timer);
> > +        qemu_announce_timer_del(timer, true);
> >       }
> >   }
> > @@ -154,12 +174,24 @@ void qemu_announce_self(AnnounceTimer *timer, A=
nnounceParameters *params)
> >       if (params->rounds) {
> >           qemu_announce_self_once(timer);
> >       } else {
> > -        qemu_announce_timer_del(timer);
> > +        qemu_announce_timer_del(timer, true);
> >       }
> >   }
> >   void qmp_announce_self(AnnounceParameters *params, Error **errp)
> >   {
> > -    static AnnounceTimer announce_timer;
> > -    qemu_announce_self(&announce_timer, params);
> > +    AnnounceTimer *named_timer;
> > +    if (!params->has_id) {
> > +        params->id =3D g_strdup("");
> > +        params->has_id =3D true;
> > +    }
> > +
> > +    named_timer =3D g_datalist_get_data(&named_timers, params->id);
> > +
> > +    if (!named_timer) {
> > +        named_timer =3D g_new0(AnnounceTimer, 1);
> > +        g_datalist_set_data(&named_timers, params->id, named_timer);
> > +    }
> > +
> > +    qemu_announce_self(named_timer, params);
> >   }
> > diff --git a/net/trace-events b/net/trace-events
> > index 875ef2a0f3..ac57056497 100644
> > --- a/net/trace-events
> > +++ b/net/trace-events
> > @@ -1,7 +1,8 @@
> >   # See docs/devel/tracing.txt for syntax documentation.
> >   # announce.c
> > -qemu_announce_self_iter(const char *name, const char *mac, int skip)=
 "%s:%s skip: %d"
> > +qemu_announce_self_iter(const char *id, const char *name, const char=
 *mac, int skip) "%s:%s:%s skip: %d"
> > +qemu_announce_timer_del(bool free_named, bool free_timer, char *id) =
"free named: %d free timer: %d id: %s"
> >   # vhost-user.c
> >   vhost_user_event(const char *chr, int event) "chr: %s got event: %d=
"
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 6f2cd4f530..728990f4fb 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -702,6 +702,10 @@
> >   # @interfaces: An optional list of interface names, which restricts=
 the
> >   #        announcement to the listed interfaces. (Since 4.1)
> >   #
> > +# @id: A name to be used to identify an instance of announce-timers
> > +#        and to allow it to modified later.  Not for use as
> > +#        part of the migration parameters. (Since 4.1)
> > +#
> >   # Since: 4.0
> >   ##
> > @@ -710,7 +714,8 @@
> >               'max': 'int',
> >               'rounds': 'int',
> >               'step': 'int',
> > -            '*interfaces': ['str'] } }
> > +            '*interfaces': ['str'],
> > +            '*id' : 'str' } }
> >   ##
> >   # @announce-self:
> > @@ -725,7 +730,7 @@
> >   # -> { "execute": "announce-self",
> >   #      "arguments": {
> >   #          "initial": 50, "max": 550, "rounds": 10, "step": 50,
> > -#          "interfaces": ["vn2", "vn3"] } }
> > +#          "interfaces": ["vn2", "vn3"], "id": "bob" } }
> >   # <- { "return": {} }
> >   #
> >   # Since: 4.0
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

