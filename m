Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B8F702CA3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 14:27:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXHI-0004yd-AJ; Mon, 15 May 2023 08:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXHG-0004yG-3u
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXHC-0001jH-NS
 for qemu-devel@nongnu.org; Mon, 15 May 2023 08:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684153565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dM+wg6p77Yxz3R2Ditqe0poJzVkNzEQ2vag2kZ/rpSo=;
 b=PSNr5O+SnmKJNh81tpnAwCIiiXOvcnvXv6+dmu3Q4sQ2xLFuXO/C+WTuKMTrltanKLXIK5
 GxNDpYJT6lV3KoBALyT7fnjejPAwoCVBO64rNSPQx3azAwLH5HbcQjIJFc5QaqYpg0NFy/
 LNpDT2XJlBEH3wkpv+usCugCiT5n+MU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-wiBNtzw0PSGXQPoZ4wPQHg-1; Mon, 15 May 2023 08:26:02 -0400
X-MC-Unique: wiBNtzw0PSGXQPoZ4wPQHg-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-24df9b0ed7aso12479381a91.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 05:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684153561; x=1686745561;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dM+wg6p77Yxz3R2Ditqe0poJzVkNzEQ2vag2kZ/rpSo=;
 b=DzDizHkTnuzoA/m8AyA4UBL97wdXkvH9h/9M2FPTccMKsGTrHMOgNFKopFfpYYgWHu
 0S6lceY1jDG1BfUh/LXU4Q7nWUIV2Panv+HjQ51BIRxM9WvPMJQkRQuVcqgz17h9W4ZZ
 RPKg9YPICrw0t1hAslZrl8cAmBYwGQmpktE2yuL5PqYcarQARi+bIIvirxQe1CMpmhTr
 4UnxbkCUXaz7VPz32GlfEOBicm52vRBYkuCaJz7HMRgihbDHHn5DA8avdUTJnrx+hm2K
 YHkt99oh0B5iKw2v8zMBwN+K8pdm3/Olv2+JkvGzOAOwo63GZaSe4muq5vmbDLFCqCNT
 2/3g==
X-Gm-Message-State: AC+VfDy7dFpE+Gjy/Z1Rh7lRpnMsVFcrTsUxqFiHCRBXPQR7aXu6Xsfe
 SYNKd6/8GN9mkYIlLnWxIjTrSMivfDxFBq7By80oxRrclB5cXZ0TohzHRrNhlDoWNmZaEYUac0O
 q5+donLXnIvaQF+YDJjs8WmD8O6Ux3g0=
X-Received: by 2002:a17:902:8691:b0:1a5:150f:8558 with SMTP id
 g17-20020a170902869100b001a5150f8558mr29750489plo.17.1684153561039; 
 Mon, 15 May 2023 05:26:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7rDbm2+zdEmA56L3ugnir4hjSmBjthlBWV+g9LIzBwglAYptkuzCTgKBckUEhs/2aCLXb//hBlv+Fdfa70TH4=
X-Received: by 2002:a17:902:8691:b0:1a5:150f:8558 with SMTP id
 g17-20020a170902869100b001a5150f8558mr29750471plo.17.1684153560725; Mon, 15
 May 2023 05:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-3-het.gala@nutanix.com>
 <ZGIFmofD8CPJVM/g@redhat.com>
 <5351a3e1-e2e5-9c30-431c-0ce6fff4c0c7@nutanix.com>
 <87ttwdzu40.fsf@secure.mitica> <ZGIizZKhraDNNtak@redhat.com>
In-Reply-To: <ZGIizZKhraDNNtak@redhat.com>
From: Juan Quintela <quintela@redhat.com>
Date: Mon, 15 May 2023 14:25:49 +0200
Message-ID: <CAGiv1-VvwNPutD3Y0ToJStGP9Fe98gQX8w420hu+qwLa4pVJxw@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] migration: Converts uri parameter into
 'MigrateAddress' struct
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Het Gala <het.gala@nutanix.com>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Prerna Saxena <prerna.saxena@nutanix.com>, dgilbert@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Manish Mishra <manish.mishra@nutanix.com>, 
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Content-Type: multipart/alternative; boundary="000000000000bc12d505fbba8e59"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000bc12d505fbba8e59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks!

Didn't know that trick.

On Mon, May 15, 2023, 14:17 Daniel P. Berrang=C3=A9 <berrange@redhat.com> w=
rote:

> On Mon, May 15, 2023 at 01:55:59PM +0200, Juan Quintela wrote:
> > Het Gala <het.gala@nutanix.com> wrote:
> > v> Just so that, there is a wider attention, I will try to address and
> > > discuss the comments from Daniel and Juan both here, as many of them
> > > seems to be overlapping. I hope that is fine with the maintainers.
> > >
> > > On 15/05/23 3:42 pm, Daniel P. Berrang=C3=A9 wrote:
> > >> On Fri, May 12, 2023 at 02:32:34PM +0000, Het Gala wrote:
> > >>> This patch introduces code that can parse 'uri' string parameter an=
d
> > >>> spit out 'MigrateAddress' struct. All the required migration
> parameters
> > >>> are stored in the struct.
> > >>>
> > >>> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> > >>> Signed-off-by: Het Gala <het.gala@nutanix.com>
> > >>> ---
> > >>>   migration/migration.c | 63
> +++++++++++++++++++++++++++++++++++++++++--
> > >>>   1 file changed, 61 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/migration/migration.c b/migration/migration.c
> > >>> index 0ee07802a5..a7e4e286aa 100644
> > >>> --- a/migration/migration.c
> > >>> +++ b/migration/migration.c
> > >>> @@ -64,6 +64,7 @@
> > >>>   #include "yank_functions.h"
> > >>>   #include "sysemu/qtest.h"
> > >>>   #include "options.h"
> > >>> +#include "qemu/sockets.h"
> > >>>     static NotifierList migration_state_notifiers =3D
> > >>>       NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
> > >>> @@ -408,13 +409,58 @@ void migrate_add_address(SocketAddress
> *address)
> > >>>                         QAPI_CLONE(SocketAddress, address));
> > >>>   }
> > >>>   +static bool migrate_uri_parse(const char *uri,
> > >>> +                              MigrateAddress **channel,
> > >>> +                              Error **errp)
> > >>> +{
> > >>> +    Error *local_err =3D NULL;
> > >>> +    MigrateAddress *addrs =3D g_new0(MigrateAddress, 1);
> > >>> +    SocketAddress *saddr;
> > >>> +    InetSocketAddress *isock =3D &addrs->u.rdma;
> > >>> +    strList **tail =3D &addrs->u.exec.args;
> > >>> +
> > >>> +    if (strstart(uri, "exec:", NULL)) {
> > >>> +        addrs->transport =3D MIGRATE_TRANSPORT_EXEC;
> > >>> +        QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
> > >>> +        QAPI_LIST_APPEND(tail, g_strdup("-c"));
> > >>> +        QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));
> > >>> +    } else if (strstart(uri, "rdma:", NULL) &&
> > >>> +               !inet_parse(isock, uri + strlen("rdma:"), errp)) {
> > >>> +        addrs->transport =3D MIGRATE_TRANSPORT_RDMA;
> > >> I would have this as
> > >>
> > >>      } else if (strstart(uri, "rdma:", NULL)) {
> > >>          if (inet_parse(isock, uri + strlen("rdma:"), errp)) {
> > >>              addrs->transport =3D MIGRATE_TRANSPORT_RDMA;
> > >>    }
> > >>
> > >> as IMHO it is bad practice to have control pass to the next
> > >> else if clause when inet_parse() fails, as we know this is
> > >> only an RDMA addr
> > > Ack. I will change in the next patch.
> > >> Also you need to use '&local_err' not 'errp' in the inet_parse
> > >> call, otherwise the later code block for cleanup won't run.
> > >
> > > Yes, thanks for pointing it out Daniel. Will modify that.
> > >
> > > Also, Juan is of the opinion that we could omit 'local_error' variabl=
e
> > > and try to address and free the memory there itself. For ex:
> > >
> > > if (saddr =3D=3D NULL) {
> > >     qapi_free_MigrateAddress(addrs);
> > >     return false;
> > > }
> > >
> > > Or, Daniel, can I also define here the variables like you suggested
> > > down in the patch ? or is it used in some special case or I am missin=
g
> > > something ?
> > >
> > > g_autoptr(MigrateAddress) addrs =3D g_new0(MigrateAddress, 1);
> > >
> > > So we would not have to worry to free MigrateAddress struct.
> >
> > https://blogs.gnome.org/desrt/2015/01/30/g_autoptr/
> >
> > Yes, but that only happens for the cases where you want to always remov=
e
> > them.
> >
> > >>> +    } else if (strstart(uri, "tcp:", NULL) ||
> > >>> +                strstart(uri, "unix:", NULL) ||
> > >>> +                strstart(uri, "vsock:", NULL) ||
> > >>> +                strstart(uri, "fd:", NULL)) {
> > >>> +        addrs->transport =3D MIGRATE_TRANSPORT_SOCKET;
> > >>> +        saddr =3D socket_parse(uri, &local_err);
> > >>> +        addrs->u.socket =3D *saddr;
> > >> Protect with
> > >>
> > >>     if (saddr !=3D NULL) {
> > >>         addrs->u.socket =3D *saddr;
> > >>     }
> > >>
> > >>> +    }
> > >>> +
> > >>> +    if (local_err) {
> > >>> +        qapi_free_MigrateAddress(addrs);
> > >>> +        qapi_free_SocketAddress(saddr);
> > >>> +        qapi_free_InetSocketAddress(isock);
> > >>> +        error_propagate(errp, local_err);
> > >>> +        return false;
> > >>> +    }
> > >>> +
> > >>> +    *channel =3D addrs;
> > >>> +    return true;
> > >>> +}
> > >>> +
> > >>>   static void qemu_start_incoming_migration(const char *uri, Error
> **errp)
> > >>>   {
> > >>>       const char *p =3D NULL;
> > >>> +    MigrateAddress *channel =3D g_new0(MigrateAddress, 1);
> > >> Avoid the later 'out:' cleanup block by using:
> > >>
> > >>    g_autoptr(MigrateAddress) channel =3D g_new0(MigrateAddress, 1);
> > > Ack. I think this also solves the doubt raised by Juan "I wish, I
> > > really wish, that there was a way to free things on error". Am I righ=
t
> > > ?
> >
> > No, that was the case where we have something like:
> >
> > Thing *foo(void)
> > {
> >     OtherThing *bar =3D g_new0(OtherThing, 1)
> >
> >     if (whatever) {
> >         goto error;
> >     }
> >     if (whatever_else) {
> >         goto error;
> >     }
> >     return bar;
> > error:
> >     g_free(bad);
> >     return NULL;
> > }
> [>
> > See, we have to put the goto because we have to free it in all error
> > paths.  Not in the non-error path.
> >
> > If it is a pure local variable, i.e. never used after the function
> > finishes, then g_autoptr is the right thing to do.
>
> It is still better to use g_autoptr even in that case. You just need
> to add in a call to g_steal_pointer in the success path. eg
>
>  Thing *foo(void)
>  {
>      g_autoptr(OtherThing) bar =3D g_new0(OtherThing, 1)
>
>      if (whatever) {
>          return NULL;
>      }
>      if (whatever_else) {
>          return NULL;
>      }
>      return g_steal_pointer(&bar);
>  }
>
>
> g_steal_pointer(&bar) is the equivalent of doing
>
>
>     OtherThing *tmp =3D bar;
>     bar =3D NULL;
>     return tmp;
>
> thus avoiding free'ing the pointer you're returning
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--000000000000bc12d505fbba8e59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok, thanks!=C2=A0<div dir=3D"auto"><br></div><div dir=3D"=
auto">Didn&#39;t know that trick.</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 15, 2023, 14:17 Daniel P=
. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, May 15, =
2023 at 01:55:59PM +0200, Juan Quintela wrote:<br>
&gt; Het Gala &lt;<a href=3D"mailto:het.gala@nutanix.com" target=3D"_blank"=
 rel=3D"noreferrer">het.gala@nutanix.com</a>&gt; wrote:<br>
&gt; v&gt; Just so that, there is a wider attention, I will try to address =
and<br>
&gt; &gt; discuss the comments from Daniel and Juan both here, as many of t=
hem<br>
&gt; &gt; seems to be overlapping. I hope that is fine with the maintainers=
.<br>
&gt; &gt;<br>
&gt; &gt; On 15/05/23 3:42 pm, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; &gt;&gt; On Fri, May 12, 2023 at 02:32:34PM +0000, Het Gala wrote:<br>
&gt; &gt;&gt;&gt; This patch introduces code that can parse &#39;uri&#39; s=
tring parameter and<br>
&gt; &gt;&gt;&gt; spit out &#39;MigrateAddress&#39; struct. All the require=
d migration parameters<br>
&gt; &gt;&gt;&gt; are stored in the struct.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Suggested-by: Aravind Retnakaran &lt;<a href=3D"mailto:ar=
avind.retnakaran@nutanix.com" target=3D"_blank" rel=3D"noreferrer">aravind.=
retnakaran@nutanix.com</a>&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Het Gala &lt;<a href=3D"mailto:het.gala@nu=
tanix.com" target=3D"_blank" rel=3D"noreferrer">het.gala@nutanix.com</a>&gt=
;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0migration/migration.c | 63 ++++++++++++++++++=
+++++++++++++++++++++++--<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 61 insertions(+), 2 deletions=
(-)<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git a/migration/migration.c b/migration/migration.=
c<br>
&gt; &gt;&gt;&gt; index 0ee07802a5..a7e4e286aa 100644<br>
&gt; &gt;&gt;&gt; --- a/migration/migration.c<br>
&gt; &gt;&gt;&gt; +++ b/migration/migration.c<br>
&gt; &gt;&gt;&gt; @@ -64,6 +64,7 @@<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0#include &quot;yank_functions.h&quot;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0#include &quot;sysemu/qtest.h&quot;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0#include &quot;options.h&quot;<br>
&gt; &gt;&gt;&gt; +#include &quot;qemu/sockets.h&quot;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0static NotifierList migration_state_no=
tifiers =3D<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NOTIFIER_LIST_INITIALIZER(migra=
tion_state_notifiers);<br>
&gt; &gt;&gt;&gt; @@ -408,13 +409,58 @@ void migrate_add_address(SocketAddr=
ess *address)<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QAPI_CLONE(SocketAddress, address));<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0}<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0+static bool migrate_uri_parse(const char *ur=
i,<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MigrateAddress **channel,<=
br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
&gt; &gt;&gt;&gt; +{<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 MigrateAddress *addrs =3D g_new0(MigrateAd=
dress, 1);<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 SocketAddress *saddr;<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 InetSocketAddress *isock =3D &amp;addrs-&g=
t;u.rdma;<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 strList **tail =3D &amp;addrs-&gt;u.exec.a=
rgs;<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 if (strstart(uri, &quot;exec:&quot;, NULL)=
) {<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addrs-&gt;transport =3D MIGR=
ATE_TRANSPORT_EXEC;<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, g_str=
dup(&quot;/bin/sh&quot;));<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, g_str=
dup(&quot;-c&quot;));<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, g_str=
dup(uri + strlen(&quot;exec:&quot;)));<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 } else if (strstart(uri, &quot;rdma:&quot;=
, NULL) &amp;&amp;<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!=
inet_parse(isock, uri + strlen(&quot;rdma:&quot;), errp)) {<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addrs-&gt;transport =3D MIGR=
ATE_TRANSPORT_RDMA;<br>
&gt; &gt;&gt; I would have this as<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 } else if (strstart(uri, &quot;rdma:&quot=
;, NULL)) {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (inet_parse(isock, uri +=
 strlen(&quot;rdma:&quot;), errp)) {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addrs-&gt;tra=
nsport =3D MIGRATE_TRANSPORT_RDMA;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; as IMHO it is bad practice to have control pass to the next<b=
r>
&gt; &gt;&gt; else if clause when inet_parse() fails, as we know this is<br=
>
&gt; &gt;&gt; only an RDMA addr<br>
&gt; &gt; Ack. I will change in the next patch.<br>
&gt; &gt;&gt; Also you need to use &#39;&amp;local_err&#39; not &#39;errp&#=
39; in the inet_parse<br>
&gt; &gt;&gt; call, otherwise the later code block for cleanup won&#39;t ru=
n.<br>
&gt; &gt;<br>
&gt; &gt; Yes, thanks for pointing it out Daniel. Will modify that.<br>
&gt; &gt;<br>
&gt; &gt; Also, Juan is of the opinion that we could omit &#39;local_error&=
#39; variable<br>
&gt; &gt; and try to address and free the memory there itself. For ex:<br>
&gt; &gt;<br>
&gt; &gt; if (saddr =3D=3D NULL) {<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 qapi_free_MigrateAddress(addrs);<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0 return false;<br>
&gt; &gt; }<br>
&gt; &gt;<br>
&gt; &gt; Or, Daniel, can I also define here the variables like you suggest=
ed<br>
&gt; &gt; down in the patch ? or is it used in some special case or I am mi=
ssing<br>
&gt; &gt; something ?<br>
&gt; &gt;<br>
&gt; &gt; g_autoptr(MigrateAddress) addrs =3D g_new0(MigrateAddress, 1);<br=
>
&gt; &gt;<br>
&gt; &gt; So we would not have to worry to free MigrateAddress struct.<br>
&gt; <br>
&gt; <a href=3D"https://blogs.gnome.org/desrt/2015/01/30/g_autoptr/" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://blogs.gnome.org/desrt/201=
5/01/30/g_autoptr/</a><br>
&gt; <br>
&gt; Yes, but that only happens for the cases where you want to always remo=
ve<br>
&gt; them.<br>
&gt; <br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 } else if (strstart(uri, &quot;tcp:&quot;,=
 NULL) ||<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
strstart(uri, &quot;unix:&quot;, NULL) ||<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
strstart(uri, &quot;vsock:&quot;, NULL) ||<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
strstart(uri, &quot;fd:&quot;, NULL)) {<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addrs-&gt;transport =3D MIGR=
ATE_TRANSPORT_SOCKET;<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 saddr =3D socket_parse(uri, =
&amp;local_err);<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addrs-&gt;u.socket =3D *sadd=
r;<br>
&gt; &gt;&gt; Protect with<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0if (saddr !=3D NULL) {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addrs-&gt;u.socket =3D *sadd=
r;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 if (local_err) {<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_free_MigrateAddress(add=
rs);<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_free_SocketAddress(sadd=
r);<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_free_InetSocketAddress(=
isock);<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_=
err);<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 *channel =3D addrs;<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; &gt;&gt;&gt; +}<br>
&gt; &gt;&gt;&gt; +<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0static void qemu_start_incoming_migration(con=
st char *uri, Error **errp)<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0{<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *p =3D NULL;<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 MigrateAddress *channel =3D g_new0(Migrate=
Address, 1);<br>
&gt; &gt;&gt; Avoid the later &#39;out:&#39; cleanup block by using:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 g_autoptr(MigrateAddress) channel =3D g_new0(Mig=
rateAddress, 1);<br>
&gt; &gt; Ack. I think this also solves the doubt raised by Juan &quot;I wi=
sh, I<br>
&gt; &gt; really wish, that there was a way to free things on error&quot;. =
Am I right<br>
&gt; &gt; ?<br>
&gt; <br>
&gt; No, that was the case where we have something like:<br>
&gt; <br>
&gt; Thing *foo(void)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0OtherThing *bar =3D g_new0(OtherThing, 1)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0if (whatever) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (whatever_else) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0return bar;<br>
&gt; error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0g_free(bad);<br>
&gt;=C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; }<br>
[&gt; <br>
&gt; See, we have to put the goto because we have to free it in all error<b=
r>
&gt; paths.=C2=A0 Not in the non-error path.<br>
&gt; <br>
&gt; If it is a pure local variable, i.e. never used after the function<br>
&gt; finishes, then g_autoptr is the right thing to do.<br>
<br>
It is still better to use g_autoptr even in that case. You just need<br>
to add in a call to g_steal_pointer in the success path. eg<br>
<br>
=C2=A0Thing *foo(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_autoptr(OtherThing) bar =3D g_new0(OtherThing, 1)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (whatever) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (whatever_else) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return g_steal_pointer(&amp;bar);<br>
=C2=A0}<br>
<br>
<br>
g_steal_pointer(&amp;bar) is the equivalent of doing<br>
<br>
<br>
=C2=A0 =C2=A0 OtherThing *tmp =3D bar;<br>
=C2=A0 =C2=A0 bar =3D NULL;<br>
=C2=A0 =C2=A0 return tmp;<br>
<br>
thus avoiding free&#39;ing the pointer you&#39;re returning<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div>

--000000000000bc12d505fbba8e59--


