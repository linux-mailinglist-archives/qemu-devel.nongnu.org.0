Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D216625AB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:33:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pErGk-0007xc-3e; Mon, 09 Jan 2023 07:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pErGW-0007w8-B9
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:28:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pErGQ-00073S-Hb
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673267309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yasduuv2cFbuPk4FslttLG9bkqUDLTS4hJAv+oZOVHA=;
 b=WxEUcf3L/nZnBF1mujeijSQe+hsmwhxRKlvWYXFa/4GnqkM0WGKjIA96vYn6b65XgQYc9u
 dzLTZ5Q49rDXoSDhtgyYCZ+OFi4QTPTIxCvdCufpYu0gfoNx2LNx/VboKLDKLbN8pUeGAQ
 3bHf1ZSEpTC0ii2aoO8mrTP20gLTmW4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-LVFixaDgOXCXN2K3_pV-jw-1; Mon, 09 Jan 2023 07:28:28 -0500
X-MC-Unique: LVFixaDgOXCXN2K3_pV-jw-1
Received: by mail-ed1-f72.google.com with SMTP id
 x13-20020a05640226cd00b0047ac11c9774so5157129edd.17
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yasduuv2cFbuPk4FslttLG9bkqUDLTS4hJAv+oZOVHA=;
 b=EbYmKirqynl2M/Bv1u8EG4w9mG7BV2sEs7Ei8t06IiOZQGkDFQGHKiGcS/MM6NXEK6
 rmw8EkTkwa7fAMe8VJeMgV2h9HSGsI7mr4EqdcSPQtAVZzgAZY7H7wiK4ucg+uPc2EeN
 vOgREpoCT0+fpmm6GEeLbxP4Pk9xp/lrRlrwSiT9BWNuLyaFNxu/qJPg0NSPiJMqvD6h
 i1/dGWOUgMsd2NDakNxVOUvKzRxR+w5FGp+pV1PNOLiiXqfnjy8RIYkn4+OjKL5Hwqct
 qne2x9rkgMWJveFwbCAQdrwXHdIMT7w+AFegLdx/zPTAoiGwDDf04zjNRFgBFNnKS9A8
 7bkw==
X-Gm-Message-State: AFqh2kqAs+HrWSHPf0u5DOtqtXd0HFynfupS8N2dSd3GrIaVyDlgF0Fm
 ukKiDSgEq9til/6WrY1mLP7VRmA6Wu0tBmX9QcirSpj+dSIg/aDFe7mfyJtC7BU+PjJCTPVlDRl
 soSyw++3VGngKdbhwnQazzziDW5iSjpc=
X-Received: by 2002:a17:907:1a56:b0:79a:101a:7e57 with SMTP id
 mf22-20020a1709071a5600b0079a101a7e57mr6918761ejc.368.1673267306855; 
 Mon, 09 Jan 2023 04:28:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXse/let7EiVSfVCdBov3xzqgTVS8MchwjQd1SMTI9f5KWAff7v2uJQVAA8qcawM/FTFlToFSickJtI7/h0zCaY=
X-Received: by 2002:a17:907:1a56:b0:79a:101a:7e57 with SMTP id
 mf22-20020a1709071a5600b0079a101a7e57mr6918747ejc.368.1673267306682; Mon, 09
 Jan 2023 04:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
 <20230103110814.3726795-9-marcandre.lureau@redhat.com>
 <Y7wGoMdJpfIkEDwx@redhat.com>
In-Reply-To: <Y7wGoMdJpfIkEDwx@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 9 Jan 2023 16:28:14 +0400
Message-ID: <CAMxuvaw-_OMe_4tWYJHff9F8wjMhQTnLAwJPc6g3hwk7Z+7=bQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] qmp: add 'get-win32-socket'
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006dee9805f1d3e7e2"
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

--0000000000006dee9805f1d3e7e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jan 9, 2023 at 4:21 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Tue, Jan 03, 2023 at 03:08:12PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > A process with enough capabilities can duplicate a socket to QEMU. Add =
a
> > QMP command to import it and add it to the monitor fd list, so it can b=
e
> > later used by other commands.
> >
> > Note that we actually store the SOCKET in the FD list, appropriate care
> > must now be taken to use the correct socket functions (similar approach
> > is taken by our io/ code and in glib, this is internal and shouldn't
> > affect the QEMU/QMP users)
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  qapi/misc.json | 32 ++++++++++++++++++++++
> >  monitor/misc.c | 74 ++++++++++++++++++++++++++++++++++++++++----------
> >  2 files changed, 91 insertions(+), 15 deletions(-)
> >
> > diff --git a/qapi/misc.json b/qapi/misc.json
> > index 27ef5a2b20..a19dd78fab 100644
> > --- a/qapi/misc.json
> > +++ b/qapi/misc.json
> > @@ -272,6 +272,38 @@
> >  ##
> >  { 'command': 'getfd', 'data': {'fdname': 'str'} }
> >
> > +##
> > +# @get-win32-socket:
> > +#
> > +# Add a socket that was duplicated to QEMU process with
> WSADuplicateSocketW()
> > +# via WSASocket() & WSAPROTOCOL_INFOW structure and assign it a name. =
A
> SOCKET
> > +# is considered as a kind of "file descriptor" by QMP clients, for
> historical
> > +# reasons and simplicity, although QEMU takes care to use socket
> functions
> > +# appropriately.
> > +#
> > +# @info: the WSAPROTOCOL_INFOW structure (encoded in base64)
> > +#
> > +# @fdname: file descriptor name
> > +#
> > +# Returns: Nothing on success
> > +#
> > +# Since: 8.0
> > +#
> > +# Notes: If @fdname already exists, the file descriptor assigned to
> > +#        it will be closed and replaced by the received file
> > +#        descriptor.
> > +#
> > +#        The 'closefd' command can be used to explicitly close the
> > +#        file descriptor when it is no longer needed.
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "get-win32-socket", "arguments": { "info":
> "abcd123..", fdname": "skclient" } }
> > +# <- { "return": {} }
> > +#
> > +##
> > +{ 'command': 'get-win32-socket', 'data': {'info': 'str', 'fdname':
> 'str'}, 'if': 'CONFIG_WIN32' }
>
> IIUC, this is needed because  'getfd' doesn't work on Windows ?
>
> Can't we just implement getfd on Windows, using this WSAPROTOCOL_INFOW
> structure passing, or are you anticipating that future Windows make get
> normal 'getfd' support ?
>

Yes, I guess we could reuse 'getfd' somehow, and add an optional argument
'wsaprotocol-info' to import sockets. Other usages would fail atm, since
win32 sockets don't have SCM rights. I have some hope that one day Windows
will support it though, at least for some type of fds (sockets to start
with).

Whether this is preferable to a new command explicitely designed for win32
socket, I am not sure.


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

--0000000000006dee9805f1d3e7e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 9, 2023 at 4:21 PM Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, Jan 03, 2023 at 03:08:12PM +0400, <a href=3D"mailto:marcandr=
e.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrot=
e:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; A process with enough capabilities can duplicate a socket to QEMU. Add=
 a<br>
&gt; QMP command to import it and add it to the monitor fd list, so it can =
be<br>
&gt; later used by other commands.<br>
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
&gt;=C2=A0 qapi/misc.json | 32 ++++++++++++++++++++++<br>
&gt;=C2=A0 monitor/misc.c | 74 ++++++++++++++++++++++++++++++++++++++++----=
------<br>
&gt;=C2=A0 2 files changed, 91 insertions(+), 15 deletions(-)<br>
&gt; <br>
&gt; diff --git a/qapi/misc.json b/qapi/misc.json<br>
&gt; index 27ef5a2b20..a19dd78fab 100644<br>
&gt; --- a/qapi/misc.json<br>
&gt; +++ b/qapi/misc.json<br>
&gt; @@ -272,6 +272,38 @@<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;command&#39;: &#39;getfd&#39;, &#39;data&#39;: {&#39;fdna=
me&#39;: &#39;str&#39;} }<br>
&gt;=C2=A0 <br>
&gt; +##<br>
&gt; +# @get-win32-socket:<br>
&gt; +#<br>
&gt; +# Add a socket that was duplicated to QEMU process with WSADuplicateS=
ocketW()<br>
&gt; +# via WSASocket() &amp; WSAPROTOCOL_INFOW structure and assign it a n=
ame. A SOCKET<br>
&gt; +# is considered as a kind of &quot;file descriptor&quot; by QMP clien=
ts, for historical<br>
&gt; +# reasons and simplicity, although QEMU takes care to use socket func=
tions<br>
&gt; +# appropriately.<br>
&gt; +#<br>
&gt; +# @info: the WSAPROTOCOL_INFOW structure (encoded in base64)<br>
&gt; +#<br>
&gt; +# @fdname: file descriptor name<br>
&gt; +#<br>
&gt; +# Returns: Nothing on success<br>
&gt; +#<br>
&gt; +# Since: 8.0<br>
&gt; +#<br>
&gt; +# Notes: If @fdname already exists, the file descriptor assigned to<b=
r>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 it will be closed and replaced by the re=
ceived file<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 descriptor.<br>
&gt; +#<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 The &#39;closefd&#39; command can be use=
d to explicitly close the<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 file descriptor when it is no longer nee=
ded.<br>
&gt; +#<br>
&gt; +# Example:<br>
&gt; +#<br>
&gt; +# -&gt; { &quot;execute&quot;: &quot;get-win32-socket&quot;, &quot;ar=
guments&quot;: { &quot;info&quot;: &quot;abcd123..&quot;, fdname&quot;: &qu=
ot;skclient&quot; } }<br>
&gt; +# &lt;- { &quot;return&quot;: {} }<br>
&gt; +#<br>
&gt; +##<br>
&gt; +{ &#39;command&#39;: &#39;get-win32-socket&#39;, &#39;data&#39;: {&#3=
9;info&#39;: &#39;str&#39;, &#39;fdname&#39;: &#39;str&#39;}, &#39;if&#39;:=
 &#39;CONFIG_WIN32&#39; }<br>
<br>
IIUC, this is needed because=C2=A0 &#39;getfd&#39; doesn&#39;t work on Wind=
ows ?<br>
<br>
Can&#39;t we just implement getfd on Windows, using this WSAPROTOCOL_INFOW<=
br>
structure passing, or are you anticipating that future Windows make get<br>
normal &#39;getfd&#39; support ?=C2=A0 <br></blockquote><div><br></div><div=
>Yes, I guess we could reuse &#39;getfd&#39; somehow, and add an optional a=
rgument &#39;wsaprotocol-info&#39; to import sockets. Other usages would fa=
il atm, since win32 sockets don&#39;t have SCM rights. I have some hope tha=
t one day Windows will support it though, at least for some type of fds (so=
ckets to start with).<br></div><div><br></div><div>Whether this is preferab=
le to a new command explicitely designed for win32 socket, I am not sure.<b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--0000000000006dee9805f1d3e7e2--


