Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2DD68E8E8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 08:31:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPetX-0001Hf-O6; Wed, 08 Feb 2023 02:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pPetN-0001Fp-J0
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 02:29:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pPetI-00066b-NG
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 02:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675841354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3abdPSz0m23x23JBMnjmM2iuKOEDvFUzq1LlDVmxiTk=;
 b=d3K0M3NPB/qWksVJia62aGCt1pgcDmlhmJl3F8ibRsIpz1hqglQkPBBgSIuVuYDOfF/WrK
 CKkE214IxJ5klVc+jmh8geDfbyEef1FE8cjcfPAsfR4POhDtIVnDMIC9daAQE8mNz9k+QX
 JDNqDAxMXIthDh6bRJwY2MRFnzXIPPM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-TOvZt51kNia1ZPbsVnF4Fw-1; Wed, 08 Feb 2023 02:29:08 -0500
X-MC-Unique: TOvZt51kNia1ZPbsVnF4Fw-1
Received: by mail-ej1-f70.google.com with SMTP id
 hp2-20020a1709073e0200b0084d47e3fe82so12491177ejc.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 23:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3abdPSz0m23x23JBMnjmM2iuKOEDvFUzq1LlDVmxiTk=;
 b=eDMhajLVqRWlq4IfoZ5ZLcPQhzwGkHGY+jdWNrBoRqtWtlpSaekSAiI6palqdUPC2B
 GFRfqEr/k2jNp37AT+Gsa2wXc59kQdqLAxI4gXByE2It1nLxnwreIeXWLZZJMBwuXVpU
 nnr3VI8WvhFy5sDXzpa/WwMZ6Ha0TIgw3889DMtfqcur9uQ5mG+uoIs7hVhAGv7rn5GI
 Q7b+tAE5AVsjxBm7SXpr6eSO65jXnVCFAxAMZk1VQV9Td50dKrrbo2VWwQWgpNpKQ6yv
 XA9H+vCSkrMW0jfBHohZvU59mE+WfK91MlJ9jPWI6epZP2EMkbcnwm5XeAnArj+0J+JT
 aq0Q==
X-Gm-Message-State: AO0yUKV+8rEzRB6TT0PULZwl7xKblZA0As5Ht9wOpmPWVXVheyANf42Y
 Pt99QuykhI470yltxLkijIKUvBcEhO+DY9lIVoGQ0lon14NUJuMtkUctRhM/HeWdol35IK44Jb6
 6ViSK34WBkZg27LN3bhjBaNqboipvMI8=
X-Received: by 2002:a17:906:9386:b0:8aa:1801:32bc with SMTP id
 l6-20020a170906938600b008aa180132bcmr1122668ejx.125.1675841346954; 
 Tue, 07 Feb 2023 23:29:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9Xe3W+u0HY8OeI/+9OVGd8lWJwJreNW3VZ7LvP1jxUOCAJJ9hfhXbpJG7af2LT2xHW+0XDhSB7sf/IndP0IhA=
X-Received: by 2002:a17:906:9386:b0:8aa:1801:32bc with SMTP id
 l6-20020a170906938600b008aa180132bcmr1122656ejx.125.1675841346603; Tue, 07
 Feb 2023 23:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-9-marcandre.lureau@redhat.com>
 <Y+JmJQEhAejYwS/T@redhat.com>
In-Reply-To: <Y+JmJQEhAejYwS/T@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 8 Feb 2023 11:28:55 +0400
Message-ID: <CAMxuvaw4TKheJbwKtdP8Q97ZYKYmO1c6Z6qmjh+AqR9tsYeaoQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] qmp: teach 'getfd' to import sockets on win32
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002a1dba05f42b3851"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000002a1dba05f42b3851
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Feb 7, 2023 at 6:54 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Tue, Feb 07, 2023 at 06:25:33PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > A process with enough capabilities can duplicate a socket to QEMU.
> > Modify 'getfd' to import it and add it to the monitor fd list, so it ca=
n
> > be later used by other commands.
> >
> > Note that we actually store the SOCKET in the FD list, appropriate care
> > must now be taken to use the correct socket functions (similar approach
> > is taken by our io/ code and in glib, this is internal and shouldn't
> > affect the QEMU/QMP users)
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  qapi/misc.json     | 16 ++++++++--
> >  monitor/fds.c      | 79 ++++++++++++++++++++++++++++++++++++----------
> >  monitor/hmp-cmds.c |  6 +++-
> >  3 files changed, 81 insertions(+), 20 deletions(-)
> >
> > diff --git a/qapi/misc.json b/qapi/misc.json
> > index 27ef5a2b20..cd36d8befb 100644
> > --- a/qapi/misc.json
> > +++ b/qapi/misc.json
> > @@ -249,10 +249,18 @@
> >  ##
> >  # @getfd:
> >  #
> > -# Receive a file descriptor via SCM rights and assign it a name
> > +# On UNIX, receive a file descriptor via SCM rights and assign it a
> name.
> > +#
> > +# On Windows, (where ancillary socket fd-passing isn't an option yet),
> add a
> > +# socket that was duplicated to QEMU process with WSADuplicateSocketW(=
)
> via
> > +# WSASocket() & WSAPROTOCOL_INFOW structure and assign it a name. A
> SOCKET is
> > +# considered as a kind of "file descriptor" in QMP context, for
> historical
> > +# reasons and simplicity. QEMU takes care to use socket functions
> appropriately.
> >  #
> >  # @fdname: file descriptor name
> >  #
> > +# @wsa-info: a WSAPROTOCOL_INFOW structure (encoded in base64). Since
> 8.0.
>
> This is a clever trick, but it also feels pretty gross from
> POV of QMP design normal practice, which would be to define
> a struct in QAPI to represent the WSAPROTOCOL_INFOW contents.
>
> The main downside would be that its more verbose to convert
> between the windows and QAPI structs.


WSAPROTOCOL_INFOW is a fairly big structure, with private/reserved files,
it contains another structure (WSAPROTOCOLCHAIN), has fixed-length arrays,
GUID, and utf16 string. QAPI-fying is going to be painful for no real gain.
It is opaque and simply given back to WSASocketW.

Markus, did you have a chance to look at the series? Can you review/comment
before I do further work?

thanks


> > @@ -270,7 +278,11 @@
> >  # <- { "return": {} }
> >  #
> >  ##
> > -{ 'command': 'getfd', 'data': {'fdname': 'str'} }
> > +{ 'command': 'getfd', 'data': {
> > +    'fdname': 'str',
> > +    '*wsa-info': {'type': 'str', 'if': 'CONFIG_WIN32'}
> > +  }
> > +}
>
> snip
>
> > +void qmp_getfd(const char *fdname,
> > +#ifdef WIN32
> > +               const char *wsa_info,
> > +#endif
> > +               Error **errp)
> > +{
> > +    Monitor *cur_mon =3D monitor_cur();
> > +    int fd;
> > +
> > +#ifdef WIN32
> > +    if (wsa_info) {
> > +        g_autofree WSAPROTOCOL_INFOW *info =3D NULL;
> > +        gsize len;
> > +        SOCKET sk;
> > +
> > +        info =3D (void *)g_base64_decode(wsa_info, &len);
> > +        if (len !=3D sizeof(*info)) {
> > +            error_setg(errp, "Invalid WSAPROTOCOL_INFOW value");
> > +            return;
> > +        }
>
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

--0000000000002a1dba05f42b3851
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 7, 2023 at 6:54 PM Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, Feb 07, 2023 at 06:25:33PM +0400, <a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrot=
e:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; A process with enough capabilities can duplicate a socket to QEMU.<br>
&gt; Modify &#39;getfd&#39; to import it and add it to the monitor fd list,=
 so it can<br>
&gt; be later used by other commands.<br>
&gt; <br>
&gt; Note that we actually store the SOCKET in the FD list, appropriate car=
e<br>
&gt; must now be taken to use the correct socket functions (similar approac=
h<br>
&gt; is taken by our io/ code and in glib, this is internal and shouldn&#39=
;t<br>
&gt; affect the QEMU/QMP users)<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 qapi/misc.json=C2=A0 =C2=A0 =C2=A0| 16 ++++++++--<br>
&gt;=C2=A0 monitor/fds.c=C2=A0 =C2=A0 =C2=A0 | 79 +++++++++++++++++++++++++=
+++++++++++----------<br>
&gt;=C2=A0 monitor/hmp-cmds.c |=C2=A0 6 +++-<br>
&gt;=C2=A0 3 files changed, 81 insertions(+), 20 deletions(-)<br>
&gt; <br>
&gt; diff --git a/qapi/misc.json b/qapi/misc.json<br>
&gt; index 27ef5a2b20..cd36d8befb 100644<br>
&gt; --- a/qapi/misc.json<br>
&gt; +++ b/qapi/misc.json<br>
&gt; @@ -249,10 +249,18 @@<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @getfd:<br>
&gt;=C2=A0 #<br>
&gt; -# Receive a file descriptor via SCM rights and assign it a name<br>
&gt; +# On UNIX, receive a file descriptor via SCM rights and assign it a n=
ame.<br>
&gt; +#<br>
&gt; +# On Windows, (where ancillary socket fd-passing isn&#39;t an option =
yet), add a<br>
&gt; +# socket that was duplicated to QEMU process with WSADuplicateSocketW=
() via<br>
&gt; +# WSASocket() &amp; WSAPROTOCOL_INFOW structure and assign it a name.=
 A SOCKET is<br>
&gt; +# considered as a kind of &quot;file descriptor&quot; in QMP context,=
 for historical<br>
&gt; +# reasons and simplicity. QEMU takes care to use socket functions app=
ropriately.<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # @fdname: file descriptor name<br>
&gt;=C2=A0 #<br>
&gt; +# @wsa-info: a WSAPROTOCOL_INFOW structure (encoded in base64). Since=
 8.0.<br>
<br>
This is a clever trick, but it also feels pretty gross from<br>
POV of QMP design normal practice, which would be to define<br>
a struct in QAPI to represent the WSAPROTOCOL_INFOW contents.<br>
<br>
The main downside would be that its more verbose to convert<br>
between the windows and QAPI structs.</blockquote><div><br></div><div>WSAPR=
OTOCOL_INFOW is a fairly big structure, with private/reserved files, it con=
tains another structure (WSAPROTOCOLCHAIN), has fixed-length arrays, GUID, =
and utf16 string. QAPI-fying is going to be painful for no real gain. It is=
 opaque and simply given back to WSASocketW.<br></div><div>=C2=A0</div><div=
>Markus, did you have a chance to look at the series? Can you review/commen=
t before I do further work?</div><div><br></div><div>thanks<br></div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; @@ -270,7 +278,11 @@<br>
&gt;=C2=A0 # &lt;- { &quot;return&quot;: {} }<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ##<br>
&gt; -{ &#39;command&#39;: &#39;getfd&#39;, &#39;data&#39;: {&#39;fdname&#3=
9;: &#39;str&#39;} }<br>
&gt; +{ &#39;command&#39;: &#39;getfd&#39;, &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;fdname&#39;: &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*wsa-info&#39;: {&#39;type&#39;: &#39;str&#39;, &#=
39;if&#39;: &#39;CONFIG_WIN32&#39;}<br>
&gt; +=C2=A0 }<br>
&gt; +}<br>
<br>
snip<br>
<br>
&gt; +void qmp_getfd(const char *fdname,<br>
&gt; +#ifdef WIN32<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ws=
a_info,<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 Monitor *cur_mon =3D monitor_cur();<br>
&gt; +=C2=A0 =C2=A0 int fd;<br>
&gt; +<br>
&gt; +#ifdef WIN32<br>
&gt; +=C2=A0 =C2=A0 if (wsa_info) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree WSAPROTOCOL_INFOW *info =3D NU=
LL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gsize len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOCKET sk;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 info =3D (void *)g_base64_decode(wsa_info=
, &amp;len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len !=3D sizeof(*info)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Inva=
lid WSAPROTOCOL_INFOW value&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--0000000000002a1dba05f42b3851--


